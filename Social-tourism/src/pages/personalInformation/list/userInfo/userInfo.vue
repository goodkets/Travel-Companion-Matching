<template>
	<view class="userInfo">
		<div class="avatar">
			<div class="title">
				<h3 class="h3">我的头像</h3>
				<span class="span">(点击头像修改)</span>
			</div>
			<div class="upLoad">
				<u-upload :fileList="fileList1" @afterRead="afterRead" @delete="deletePic" name="1" multiple
					:maxCount="1"></u-upload>
			</div>
		</div>
		<div class="aboultMe avatar">
			<div class="h3">
				关于我
			</div>
			<div class="oblut">
				<u-textarea v-model="model1.userInfo.myTextarea" placeholder="自我介绍一下吧!"></u-textarea>
			</div>
		</div>
		<div class="aboultMe avatar">
			<div class="h3">
				喜欢去哪里玩
			</div>
			<div class="oblut">
				<u-textarea v-model="model1.userInfo.textareaHobby" placeholder="分项一下吧!"></u-textarea>
			</div>
		</div>
		<div class="aboultMe avatar">
			<div class="h3">
				基本资料
			</div>
			<div class="oblut">
				<!-- 注意，如果需要兼容微信小程序，最好通过setRules方法设置rules规则 -->
				<u-form labelPosition="left" :model="model1">
					<u-form-item label="昵称" prop="userInfo.nickname" borderBottom ref="item1">
						<u-input v-model="model1.userInfo.nickname" border="none" placeholder="张三"></u-input>
					</u-form-item>
					<u-form-item label="性别" prop="userInfo.sex" borderBottom @click="showSex = true">
						<u-input v-model="model1.userInfo.sex" disabled disabledColor="#ffffff" placeholder="请选择性别"
							border="none"></u-input>
						<template #right>
							<u-icon name="arrow-right"></u-icon>
						</template>
					</u-form-item>
					<u-form-item label="出生日期" prop="userInfo.born" borderBottom @click="showborn = true">
						<u-input v-model="model1.userInfo.born" disabled disabledColor="#ffffff" placeholder="请选择日期"
							border="none"></u-input>
						<template #right>
							<u-icon name="arrow-right"></u-icon>
						</template>
					</u-form-item>
					<u-form-item label="学历" prop="userInfo.eduction" borderBottom @click="showEdu = true">
						<u-input v-model="model1.userInfo.eduction" disabled disabledColor="#ffffff" placeholder="请选择学历"
							border="none"></u-input>
						<template #right>
							<u-icon name="arrow-right"></u-icon>
						</template>
					</u-form-item>
					<u-form-item label="身高(cm)" prop="userInfo.tall" borderBottom ref="item1">
						<u-input v-model="model1.userInfo.tall" border="none" placeholder="175cm"></u-input>
					</u-form-item>

				</u-form>
				<u-action-sheet :show="showSex" :actions="actions" title="请选择性别" @close="showSex = false"
					@select="sexSelect">
				</u-action-sheet>
				<!-- 生日选择的弹出框 -->
				<u-popup :show="showborn" @close="showborn = false">
					<u-datetime-picker :show="showborn" v-model="bornTime" mode="date" @confirm="onConfirmborn"
						@cancel="onCancelborn"></u-datetime-picker>
				</u-popup>
				<u-action-sheet :show="showEdu" :actions="actionsEdu" title="请选择学历" @close="showSex = false"
					@select="eduSelect">
				</u-action-sheet>
			</div>
		</div>
		<div class="aboultMe avatar submit">
			<u-button type="success" text="保存" @click="submit"></u-button>
		</div>
		<view>
			<u-modal class="center-text-modal" :show="show" :title="title" :content='content'
				@confirm="successJoin"></u-modal>
		</view>
	</view>
</template>

<script setup>
	import {
		ref,
		reactive,
		onMounted
	} from "vue"
	import {
		formatDate
	} from "../../../../utils/times.js"
	import {
		userInfo,
		updateUserInfo
	} from "../../../../api/user.js"
	import {
		userStoreInfo
	} from "@/store/user/user.js"
	const userStore = userStoreInfo()
	const textarea = ref()
	const textareaHobby = ref()
	const showSex = ref(false)
	const showborn = ref(false);
	const showEdu = ref(false)
	const show = ref(false)
	const content = ref('已成功加入！')
	let model1 = reactive({
		userInfo: {
			id: 0,
			nickname: '',
			sex: '',
			born: formatDate(new Date()),
			eduction: '',
			tall: '',
			textareaHobby: '',
			myTextarea: '',
			user_pic: {}
		},
	})
	const bornTime = ref(new Date()) //时间选择器-born
	const actions = reactive([{
			name: '男',
		},
		{
			name: '女',
		},
		{
			name: '保密',
		},
	])
	const actionsEdu = reactive(([{
		name: "小学",

	}, {
		name: "初中",
	}, {
		name: "高中"
	}, {
		name: '大学'
	}]))
	const sexSelect = (e) => {
		model1.userInfo.sex = e.name
	}
	const onConfirmborn = (e) => {
		// 处理确认逻辑
		model1.userInfo.born = formatDate(e.value)
		showborn.value = false;
	};

	const onCancelborn = () => {
		// 处理取消逻辑
		console.log("Cancelled");
		showborn.value = false;
	};
	const eduSelect = (e) => {
		model1.userInfo.eduction = e.name
		showEdu.value = false
		console.log(model1.userInfo, e)
	}
	const radio = ref()
	const fileList1 = ref([]);

	// 删除图片
	const deletePic = (event) => {
		fileList1.value.splice(event.index, 1);
		model1.userInfo.user_pic = null
	};

	// 新增图片
	const afterRead = async (event) => {
		console.log(event)
		fileList1.value = []
		// 当设置 mutiple 为 true 时, file 为数组格式，否则为对象格式
		let lists = [].concat(event.file);
		let fileListLen = fileList1.value.length;
		lists.map((item) => {
			fileList1.value.push({
				...item,
				status: 'uploading',
				message: '上传中',
			});
		});
		setTimeout(() => {
			fileList1.value[0].message = '上传成功！'
			fileList1.value[0].status = 'success'
			model1.userInfo.user_pic = fileList1.value[0]
		}, 1200)
	};
	const submit = async () => {
		const res = await userStore.updateUserInfoPost(model1.userInfo)
		if (res.status === 0) {
			show.value = true
			content.value = res.message
		}
	}
	const successJoin = (e) => {
		show.value = false
	}
	onMounted(async () => {
		const user = await userInfo(userStore.userID)
		model1.userInfo = user.data
		model1.userInfo.id = userStore.userID
		//console.log(user.data.user_pic, JSON.parse(user.data.user_pic))
		if (user.data.user_pic) {
			fileList1.value[0] = JSON.parse(user.data.user_pic)
		}
	})
</script>

<style lang="scss">
	.userInfo {
		width: 100%;
		background-color: #f7f7f7;
		position: absolute;

		.avatar {
			position: relative;
			width: 85%;
			margin: 0 auto;
			background-color: #fff;
			border-radius: 5px;
			margin-top: 30px;

			.title {
				display: flex;
				padding: 20px;
			}

			.h3 {
				font-size: 16px;
				font-weight: 700;
			}

			.span {
				font-size: 14px;

			}

			.upLoad {
				margin-left: 20px;
			}
		}

		.aboultMe {

			.h3,
			.oblut {
				padding: 20px 20px 0;
			}

			.oblut {
				padding-bottom: 20px;
			}
		}

		.submit {
			margin-bottom: 20px;
		}
	}
</style>