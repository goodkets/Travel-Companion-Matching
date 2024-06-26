<template>
	<view>
		<!-- 注意，如果需要兼容微信小程序，最好通过setRules方法设置rules规则 -->
		<u--form labelPosition="left" :model="model1" :rules="rules" ref="uForm">
			<u-form-item label="性别" prop="userInfo.sex" borderBottom @click="showSex = true; " ref="item1">
				<u--input v-model="model1.userInfo.sex" disabled disabledColor="#ffffff" placeholder="请选择性别"
					border="none"></u--input>
				<u-icon slot="right" name="arrow-right"></u-icon>
			</u-form-item>
			<u-form-item label="性格" prop="userInfo.characters" borderBottom @click="characterStatus = true; "
				ref="item1">
				<u--input v-model="model1.userInfo.characters" disabled disabledColor="#ffffff" placeholder="请选择性格"
					border="none"></u--input>
				<u-icon slot="right" name="arrow-right"></u-icon>
			</u-form-item>
			<u-form-item label="爱好" prop="userInfo.hobby" borderBottom @click="hobbystatus = true" ref="item1">
				<u--input v-model="model1.userInfo.hobby" disabled disabledColor="#ffffff" placeholder="请选择爱好"
					border="none"></u--input>
				<u-icon slot="right" name="arrow-right"></u-icon>
			</u-form-item>
			<u-form-item label="年龄段" prop="userInfo.years" borderBottom @click="yearsStatus = true" ref="item1">
				<u--input v-model="model1.userInfo.years" disabled disabledColor="#ffffff" placeholder="请选择年龄"
					border="none"></u--input>
				<u-icon slot="right" name="arrow-right"></u-icon>
			</u-form-item>
			<!-- 			<u-form-item label="城市" prop="userInfo.city" borderBottom @click="cityStatus = true" ref="item1">
				<u--input v-model="model1.userInfo.city" disabled disabledColor="#ffffff" placeholder="请选择城市"
					border="none"></u--input>
				<u-icon slot="right" name="arrow-right"></u-icon>
			</u-form-item> -->

		</u--form>
		<div class="submit">
			<u-button class="u-button" type="success" size="" icon="checkbox-mark" text="完成" @click="submit"></u-button>
			<u-button class="u-button" type="error" size="" text="取消" @click="noSubmit"></u-button>
		</div>
		<u-picker :show="showSex" :columns="actions" title="请选择性别" description="如果选择保密会报错" @cancel="showSex = false"
			@confirm="sexSelect">
		</u-picker>
		<u-picker :show="hobbystatus" :columns="actionsCharacter" title="请选择爱好" description="如果选择保密会报错"
			@cancel="hobbystatus = false" @confirm="hobbySelect">
		</u-picker>
		<u-picker :show="characterStatus" :columns="actionsHobby" title="请选择喜欢的性格" description="如果选择保密会报错"
			@cancel="characterStatus = false" @confirm="characterSelect">
		</u-picker>
		<u-picker :show="yearsStatus" :columns="yearsHobby" title="请选择年龄段" description="如果选择保密会报错"
			@cancel="yearsStatus = false" @confirm="yearsSelect">
		</u-picker>
		<u-picker :show="cityStatus" :columns="cityHobby" title="请选择想要去的城市" @cancel="cityStatus = false"
			@confirm="citySelect">
		</u-picker>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				showSex: false, //性别
				hobbystatus: false, //爱好
				characterStatus: false, //性格
				yearsStatus: false, //年龄段
				cityStatus: false, //城市
				model1: {
					userInfo: {
						name: '',
						sex: '',
						hobby: "",
						characters: "",
						years: "",
						city: ""
					},
				},
				actions: [
					['男',

						'女',
					]

				],
				actionsHobby: [
					["开放", "直觉", "外向", "宜人", "神经"]

				],
				actionsCharacter: [
					["运动", "阅读", "旅游", "美食", "音乐", "艺术", ]
				],
				yearsHobby: [
					["00后",

						"90后",

						"80后",

						"10后",
					]
				],
				cityHobby: [
					[
						"北京",
						"上海",
						"广州",
						"深圳",
						"天津",
						"南京",
						"杭州",
						"成都",
						"重庆",
						"武汉",
						"西安",
						"青岛",
						"大连",
						"厦门",
						"哈尔滨"
					]

				],
				radio: '',
				switchVal: false
			};
		},

		methods: {
			sexSelect(e) {
				this.model1.userInfo.sex = e.value[0]
				this.showSex = false
				// this.$refs.uForm.validateField('userInfo.sex')
			},
			hobbySelect(e) {
				this.model1.userInfo.hobby = e.value[0]
				this.hobbystatus = false
				// this.$refs.uForm.validateField('userInfo.hobby')
			},
			characterSelect(e) {
				this.model1.userInfo.characters = e.value[0]
				// this.$refs.uForm.validateField('userInfo.characters')
				this.characterStatus = false
			},
			yearsSelect(e) {
				this.model1.userInfo.years = e.value[0]
				this.yearsStatus = false
				// this.$refs.uForm.validateField('userInfo.years')
			},
			citySelect(e) {
				this.model1.userInfo.city = e.value[0]
				this.cityStatus = false
			},
			submit() {
				this.$emit('userInfo', this.model1.userInfo)
				this.model1.userInfo = {}

			},
			noSubmit() {
				this.$emit('userInfo', this.model1.userInfo)
				this.model1.userInfo = {}
			}

		},
		onReady() {

			//如果需要兼容微信小程序，并且校验规则中含有方法等，只能通过setRules方法设置规则。
			this.$refs.uForm.setRules(this.rules)
		},
	};
</script>
<style>
	.u-picker {
		height: 400px !important;
		overflow: scroll !important;
	}

	.submit {
		width: 60%;
		margin: 0 auto;
	}
</style>