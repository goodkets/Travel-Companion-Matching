<template>
	<view class="wrap">
		<view class="top"></view>
		<view class="content">
			<view class="title">欢迎加入</view>
			<div class="input">
				<u-input prefixIcon="man-add" prefixIconStyle="font-size: 22px;color: #909399" border="bottom" clearable
					type="text" :required="true" v-model="username" maxlength='12' placeholder="请输入用户名(1~12位数,必填)" />
			</div>
			<div class="input">
				<u-input prefixIcon="account" prefixIconStyle="font-size: 22px;color: #909399" border="bottom" clearable
					type="text" v-model="nickname" maxlength='12' placeholder="请输入昵称(1~12位数,允许为空)" />
			</div>
			<div class="input">
				<u-input prefixIcon="lock" maxlength='16' prefixIconStyle="font-size: 22px;color: #909399"
					suffixIcon="eye-off" suffixIconStyle="color: #909399" :type="firstPasswordType" clearable
					v-model="firstPassword" border="bottom" placeholder="请输入密码(1~16位),必填">
					<template #suffix>
						<u-icon :name="suffixIconFirst" @click="handleSuffixIconClick1"></u-icon>
					</template>
				</u-input>
			</div>
			<div class="input">
				<u-input prefixIcon="lock" maxlength='16' clearable prefixIconStyle="font-size: 22px;color: #909399"
					suffixIcon="eye-off" suffixIconStyle="color: #909399" :type="secondPasswordType" border="bottom"
					v-model="secondPassword" placeholder="请确认密码(1~16位),必填">
					<template #suffix>
						<u-icon :name="suffixIconSecond" @click="handleSuffixIconClick2"></u-icon>
					</template>
				</u-input>
			</div>
			<button @tap="submit" :style="[inputStyle]" class="getCaptcha">注册</button>
		</view>
		<view>
			<u-modal class="center-text-modal" :show="show" :title="title" :content='content'
				@confirm="successJoin"></u-modal>
		</view>
	</view>
</template>

<script setup>
	import {
		ref,
		computed,
		reactive
	} from 'vue'
	import {
		userStoreInfo
	} from "@/store/user/user.js"
	const show = ref(false)
	const title = ref()
	const content = ref('已成功加入！')
	const userStore = userStoreInfo()
	const registerStatus = ref(false)
	const username = ref('')
	const nickname = ref('')
	const firstPassword = ref('')
	const secondPassword = ref('')
	const suffixIconFirst = ref('eye-off')
	const suffixIconSecond = ref('eye-off')
	const firstPasswordType = ref('password') //第一个密码状态
	const secondPasswordType = ref('password') //第二个密码状态
	const handleSuffixIconClick1 = () => { //第一次秘密状态切换
		if (suffixIconFirst.value == 'eye-off') {
			suffixIconFirst.value = 'eye-fill'
			firstPasswordType.value = 'text'
		} else {
			suffixIconFirst.value = 'eye-off'
			firstPasswordType.value = 'password'
		}
	}
	const handleSuffixIconClick2 = () => { //第一次秘密状态切换
		if (suffixIconSecond.value == 'eye-off') {
			suffixIconSecond.value = 'eye-fill'
			secondPasswordType.value = 'text'
		} else {
			suffixIconSecond.value = 'eye-off'
			secondPasswordType.value = 'password'
		}
	}
	const inputStyle = computed(() => { //注册点击监听
		let style = {};
		if (username.value && firstPassword.value && secondPassword.value) {
			style.color = "#fff";
			style.backgroundColor = 'green';
		}
		return style;
	})
	const submit = async () => {
		if (!username.value || !firstPassword.value || !secondPassword.value) {
			show.value = true
			content.value = '请按照要求输入完整'

		} else {
			if (username.value && firstPassword.value == secondPassword.value) {
				const res = await userStore.regUser(username.value, secondPassword.value, nickname.value)
				if (res.status === 0) {
					show.value = true
					content.value = res.message
					registerStatus.value = true
				} else {
					show.value = true
					content.value = res.message
				}
			}
		}
	}
	const successJoin = (e) => {
		show.value = false
		if (registerStatus.value) {
			uni.switchTab({

				url: '../../index'

			})
			registerStatus.value = false
		}

	}
</script>

<style lang="scss">
	.wrap {
		font-size: 28rpx;

		.content {
			width: 600rpx;
			margin: 80rpx auto 0;

			.title {
				text-align: center;
				font-size: 60rpx;
				font-weight: 500;
				margin-bottom: 100rpx;
			}

			.input {
				margin-bottom: 30px;
			}

			.tips {
				color: $u-info;
				margin-bottom: 60rpx;
				margin-top: 8rpx;
				font-size: 12px;
			}

			.getCaptcha {
				background-color: rgb(253, 243, 208);
				color: $u-tips-color;
				border: none;
				font-size: 30rpx;
				padding: 12rpx 0;

				&::after {
					border: none;
				}
			}

			.alternative {
				color: $u-tips-color;
				display: flex;
				justify-content: space-between;
				margin-top: 30rpx;
			}
		}

		.buttom {
			.loginType {
				display: flex;
				padding: 350rpx 150rpx 150rpx 150rpx;
				justify-content: space-between;

				.item {
					display: flex;
					flex-direction: column;
					align-items: center;
					color: $u-content-color;
					font-size: 28rpx;
				}
			}

			.hint {
				padding: 20rpx 40rpx;
				font-size: 20rpx;
				color: $u-tips-color;

				.link {
					color: $u-warning;
				}
			}
		}


		.getCaptcha {
			margin-top: 30px;
		}
	}


	.u-modal__content__text {
		text-align: center;
	}
</style>