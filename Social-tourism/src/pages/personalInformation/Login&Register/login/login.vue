<template>
	<view class="wrap">
		<view class="top"></view>
		<view class="content">
			<view class="title">欢迎登录</view>
			<div class="input">
				<u-input prefixIcon="account-fill" prefixIconStyle="font-size: 22px;color: #909399" border="bottom"
					clearable type="text" v-model="username" maxlength='12' placeholder="请输入用户名(1~12位)" />
			</div>
			<div class="input">
				<u-input prefixIcon="lock" maxlength='16' prefixIconStyle="font-size: 22px;color: #909399"
					suffixIconStyle="color: #909399" :type="passwordType" clearable v-model="password" border="bottom"
					placeholder="请输入密码(1~16位)">
					<template #suffix>
						<u-icon :name="suffixIcon" @click="handleSuffixIconClick"></u-icon>
					</template>
				</u-input>
			</div>
			<button @tap="submit" :style="[inputStyle]" class="getCaptcha">登录</button>
			<view class="alternative">
				<view class="issue">
					<navigator url="../register/register">还未注册？点击注册一下吧！</navigator>

				</view>
			</view>
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
		reactive,
		onMounted
	} from 'vue'
	import {
		userStoreInfo
	} from "@/store/user/user.js"
	const userStore = ref(userStoreInfo())
	const username = ref()
	const show = ref(false)
	const title = ref()
	const content = ref('已成功加入！')
	const loginStauts = ref(false)
	const password = ref()
	const passwordType = ref('password')
	const suffixIcon = ref('eye-off')
	const handleSuffixIconClick = () => {
		if (suffixIcon.value == 'eye-off') {
			suffixIcon.value = 'eye-fill'
			passwordType.value = 'text'
		} else {
			suffixIcon.value = 'eye-off'
			passwordType.value = 'password'
		}
	}
	const inputStyle = computed(() => { //监听登录style
		let style = {};
		if (username.value && password.value) {
			style.color = "#fff";
			style.backgroundColor = 'green';
		}
		return style;
	})
	const submit = async () => {
		try {
			if (!username.value || !password.value) {
				show.value = true
				content.value = '请按照要求输入完整'

			} else if (username.value && password.value) {
				const res = await userStore.value.login(username.value, password.value)
				if (res.status === 0) {
					loginStauts.value = true
				}
				show.value = true
				content.value = res.message
			}
		} catch {
			show.value = true
			content.value = '登录失败！'
		}
	}
	const successJoin = (e) => {
		show.value = false
		if (content.value === '用户不存在') {
			uni.navigateTo({
				url: "../register/register"
			})
		}
		if (loginStauts.value) {
			setTimeout(() => {
				uni.switchTab({
					url: '../../index'
				});
			}, 0);
		}

	}
</script>

<style lang="scss" scoped>
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
				margin-top: 30px;

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
	}
</style>