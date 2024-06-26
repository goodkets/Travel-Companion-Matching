<template>
	<div class="Route">
		<h3 class="h3">旅游路线推荐</h3>
		<div class="title" v-if="stepsLits.length == 0">{{prop.name}}暂时没有推荐路线</div>
		<div class="jindu" v-if="lineStatus == 0 ">
			<div class="group">
				<u-radio-group v-model="radiovalue1" placement="row" size='25'>

					<u-radio :customStyle="{ margin: '0 20px 8px 0 ' }" v-for="(item, index) in radiolist1" :key="index"
						style="margin:0 10px" :label="item.name" :name="item.name" @change="radioChange(item,index)">

					</u-radio>
				</u-radio-group>
			</div>
			<div class="data">
				<u-steps :current="-1" activeIcon="checkbox-mark" inactiveIcon="clock"
					:last="index === stepsList.length-1">
					<u-steps-item v-for="(item, index) in stepsList" :title="item.title" :desc="item.desc"
						:key="item.title+item.desc">
					</u-steps-item>
				</u-steps>

			</div>
			<div class="tuijian" @click="submit(0)">
				<div class="button">
					<u-button type="success" :text='tuijianText'></u-button>
				</div>
			</div>
		</div>
		<div class="line" v-if="lineStatus == 1">
			<h3 class="h3">路线</h3>
			<div class="data">
				<u-steps :current="currentIndex">
					<u-steps-item v-for="(item, index) in stepsList" :key="item.title+ index" :title="item.title"
						:desc="item.desc" :index="index">
					</u-steps-item>
				</u-steps>
			</div>
			<h3 class="h3">旅游进度</h3>
			<u-line-progress :percentage="percentageLang" activeColor="green" showText='true' height="40px"
				v-if="percentageLang>0"></u-line-progress>
			<div style="text-align: center;" v-else>进度为：0%</div>
			<div class="clock">
				<u-button v-if="percentageLang < 100 || !percentageLang" type="primary" text="打卡"
					@click="clockSubmit"></u-button>
				<div style="text-align: center;font-weight: 700;font-size: 18px;display: block;margin: 0 auto;" v-else>
					<span>{{detailInfo.name}}已旅游完成,是否推荐？</span>
					<div style="margin-top: 30px;" v-if="stauts == 1">已推荐过啦！</div>
					<div class="submit" v-else>
						<div class="button" @click="addlickSum">
							<u-button text="是" type="success"></u-button>
						</div>
						<div class="error">
							<u-button text="否" type="error"></u-button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</template>

<script setup>
	import steps from 'uview-plus/libs/config/props/steps';
	import {
		ref,
		reactive,
		defineProps,
		onMounted,
		watch
	} from 'vue';
	import goLoginVue from "../../../../../components/goLogin.vue"
	import {
		userStoreInfo
	} from "../../../../../store/user/user.js"
	import {
		getDetailInfo,
		postDetailStatus,
		listPost,
		getList
	} from "../../../../../api/list.js"
	import {
		toChineseNumber
	} from "../../../../../utils/digitalConversion.js"
	import {
		storeToRefs
	} from 'pinia';
	const loginShwo = ref(false)
	const storeInfo = userStoreInfo()
	const prop = defineProps(['recommendation', 'name'])
	// 基本案列数据
	const radiolist1 = reactive([]);
	// u-radio-group的v-model绑定的值如果设置为某个radio的name，就会被默认选中
	const radiovalue1 = ref('推荐一'); //默认选中的
	const tuijianText = ref('使用推荐方案一') //提交的默认值
	const stepsList = ref([]) //具体路线
	const stepsLits = JSON.parse(prop.recommendation) //存储所有的路线
	//路线选择
	const detailInfo = ref([]) //路线信息
	const detailMessage = ref('') //城市信息状态
	const lineStatus = ref(0) //路线展示状态--是否正在旅行
	const article = ref(0) //选择的路线第几条
	const percentageLang = ref(0) //进度
	const clockText = ref() //打卡文字
	const currentIndex = ref(0) //进度位置
	const count = ref(5) //星评价
	const rateValue = ref(3)
	const sum = ref(0) //推荐人数
	const stauts = ref(false) //推荐状态
	const cityImg = ref('')
	const detailID = ref(0)
	const radioChange = (item, index) => {
		article.value = index;
		tuijianText.value = `使用方案${item.name}`;
		//radiolist1.forEach((radio) => {
		//radio.showSteps = false;
		//});
		//item.showSteps = true;
		stepsList.value = stepsLits[index];
		//stepsList.value.forEach((step, stepIndex) => {
		//step.index = -1; // 先设为初始值
		//});
		//if (stepsList.value.length) {
		//stepsList.value[index].index = index; // 再将当前选中的单选框对应的元素的 index 设为选中的索引
		//}
		//currentIndex.value = 0; // 重置步骤索引为 0
		//currentIndex.value = changeTitle(stepsList.value, res.data.title);
	};
	//路线提交
	const submit = async (detailSchedule) => {
		try {
			const res = await postDetailStatus({
				uid: storeInfo.userID,
				status: 1,
				id: detailInfo.value.id,
				detailSchedule: percentageLang.value || 0,
				route: stepsList.value,
				name: prop.name,
				title: stepsList.value[0].title,
				article: article.value,
				langs: currentIndex.value,
				img: cityImg.value
			})
			if (res.status == 0) {
				lineStatus.value = 1
			}
		} catch (e) {
			currentIndex.value--
		}
	}
	const changeDetailStatus = (indexLang) => {

		//let indexLang = 0
		for (let a = 0; a < stepsList.value.length; a++) {
			if (stepsList.value[a].title === detailInfo.value.name) {
				indexLang = a
				break
			}
		}
		if (indexLang >= 0) {
			const percent = ((indexLang + 1) / stepsList.value.length) * 100;
			percentageLang.value = percent.toFixed(2)
			console.log(`匹配对象在数组中的位置为：${indexLang}，百分比为：${percent}%`);
		} else {
			console.log("没有找到匹配的对象");
		}
	}
	const clockSubmit = () => {
		currentIndex.value = Number(currentIndex.value) + 1
		changeDetailStatus(Number(currentIndex.value))
		submit()
	}
	//进度城市-0,1,2
	const changeTitle = (data, title) => {
		let index = null;

		for (let i = 0; i < data.length; i++) {
			if (data[i].title === title) {
				index = i;
				break;
			}
		}
		return index
	}
	const getDetail = async () => {
		try {
			const res = await getDetailInfo({
				name: prop.name,
				uid: storeInfo.userID,
			})
			console.log(res.data.route)
			if (res.status == 0) {
				detailInfo.value = res.data || []
				stepsList.value = stepsLits[res.data.article] || stepsLits[0]
				currentIndex.value = res.data.langs || 0
				//currentIndex.value = stepsList.value.findIndex(item => item.title === res.data.title) 
				//console.log(currentIndex.value)
				lineStatus.value = res.data.status || 0
				percentageLang.value = res.data.detailSchedule || 0
				if (detailInfo.value.length === 0) {
					lineStatus.value = 0
				}
				if (percentageLang.value == 100) {
					currentIndex.value = stepsList.value.length
				}
			}
		} catch (e) {
			console.error(e)
		}
		//currentIndex.value = changeTitle(stepsList.value, res.data.title)
	}
	//推荐+1
	const addlickSum = async () => {
		const res = await listPost({
			likeSum: Number(sum.value) + 1,
			id: detailID.value,
			userId: storeInfo.userID
			//city: prop.name,
			//status: 1
		})
		console.log(res)
		if (res.status == 0) {
			stauts.value = true
		}

	}
	onMounted(async () => {
		//stepsList.value = stepsLits[0]
		for (let i = 0; i < stepsLits.length; i++) {
			radiolist1.push({
				name: `推荐${toChineseNumber(i+1)}`,
				disabled: false,
				showSteps: false
			})
		}
		getDetail()
		const res = await getList({
			//uid: storeInfo.userID,
			city: prop.name
		})
		//主要是喜欢的人数以及是否是推荐状态
		if (res.status == 0) {
			sum.value = res.data[0].likeSum
			//stauts.value = res.data[0].status
			cityImg.value = res.data[0].img
			detailID.value = res.data[0].id
			if (res.data[0].status.includes(storeInfo.userID)) {
				stauts.value = true
			}
			//console.log(res.data[0].status, )

		}
	})
</script>
<style lang="scss">
	.Route {
		width: 80%;
		display: flex;
		flex-direction: column;
		margin: auto;

		.jindu {
			margin-bottom: 100px;
		}

		.group {
			margin: 0 auto;
			display: flex;
			justify-content: flex-end;
			width: fit-content;
			margin-bottom: 30px;
		}

		.tuijian {
			text-align: center;
			margin: 15px 10px;
			display: flex;
			justify-content: center;
			margin-top: 30px;

			.button {
				width: 240px;
			}
		}

		.line {
			margin-bottom: 100px;

			.h3 {
				text-align: center;
				font-size: 20px;
			}
		}
	}

	.h3 {
		font-weight: 700;
	}

	.title {
		text-align: center;
	}

	.clock {
		margin: 20px 40px;
	}

	@keyframes zoomInOut {
		0% {
			transform: scale(1);
		}

		50% {
			transform: scale(1.1);
		}

		100% {
			transform: scale(1);
		}
	}

	.submit {
		display: flex;
		justify-content: center;
		margin-top: 20px;

		.error {
			margin-left: 30px;
		}
	}

	.submit .button {
		animation: zoomInOut 2s infinite;
		/* 使用定义好的关键帧动画，并设置为无限循环 */
		display: inline-block;
		margin-right: 30px;
		/* 让按钮变成块级元素以便应用动画效果 */
	}
</style>