<template>
	<div class="homeContainer">
		<div class="tip">
			<u-notice-bar :text="textTip"></u-notice-bar>
		</div>
		<div class="gaVue"> <bg-vue></bg-vue></div>
		<div class="mate">
			<div class="donghua" v-if="!loading">
				<div class="TheCircle">
					<div class="Water"></div>
				</div>
				<div class="text" @click="matchType">
					{{changeType}}
				</div>
			</div>
			<div class="donghua" v-else>
				<loading-vue></loading-vue>
			</div>

		</div>
		<div class="pipei">
			<div class="center">
				<u-button :disabled="disabled" type="success" size="large" icon="heart-fill" iconColor="#ff0000"
					shape="circle" :text="mateStatue" @click="beginMate"></u-button>
			</div>
		</div>
		<div class="loading">
			<u-loading-icon timing-function="linear" size="30" :show="loadingStatus"></u-loading-icon>
		</div>
		<div class="popup" v-if="popupStatus">
			<u-alert type="success" showIcon='true' center fontSize="20" description="匹配成功,跳转中.."></u-alert>
		</div>
		<u-overlay :show="matechType" @close="close" @open="open">
			<view class="matechType">
				<form-vue @userInfo='getUserInfo'></form-vue>
			</view>
		</u-overlay>
		<u-modal :show="noInfo" title="提示" @confirm="confirm" @cancel='cancel' ref="uModal" :asyncClose="true"
			showCancelButton='true' content='确认获取所有城市吗？'></u-modal>
	</div>
	<goLoginVue v-if="loginShow" @loginStatus='goLogin'></goLoginVue>
</template>

<script setup>
	import {
		onLoad,
		onShow
	} from "@dcloudio/uni-app"
	import {
		ref,
		onMounted
	} from "vue"
	import goLoginVue from "../../components/goLogin.vue"
	import bgVue from "../../components/bg/bg.vue"
	import formVue from "../../components/homeForm/homeForm.vue"
	import loadingVue from "../../pages/homePage/loading/loading.vue"
	import {

		isObjectEmpty
	} from "../../utils/objectValue.js"
	import {
		userStoreInfo
	} from "../../store/user/user.js"
	const storeInfo = userStoreInfo()
	const loginShow = ref(false)
	const textTip = ref('快来匹配你想去的地方吧！')
	const mateStatue = ref('开始匹配')
	const changeType = ref('请选择匹配类型')
	const disabled = ref(false)
	const loadingStatus = ref(false)
	const show = ref(true)
	const tipStatus = ref(true)
	const popupStatus = ref(false)
	const loading = ref(false)
	const matechType = ref(false)
	const userInfo = ref({}) //匹配项
	const noInfo = ref(false)
	const goLogin = (e) => {
		loginShow.value = e
		if (!loginShow.value) {
			uni.navigateTo({
				url: "../personalInformation/Login&Register/login/login"
			})
		}
	}
	const beginMate = () => {
		if (!storeInfo.token) {
			loginShow.value = true
			return
		}
		if (isObjectEmpty(userInfo.value)) {
			noInfo.value = true
			return
		}
		Mate()
	}
	const Mate = () => {
		disabled.value = true
		mateStatue.value = '正在匹配中....'
		loading.value = true
		loadingStatus.value = true
		setTimeout(() => {
			loadingStatus.value = false
		}, 1000)
		setTimeout(() => {
			mateStatue.value = '开始匹配'
			disabled.value = false
			popupStatus.value = true
			loading.value = false
		}, 3000)
		setTimeout(() => {
			popupStatus.value = false
			uni.navigateTo({
				url: `./LUG/LUG?userInfo=${JSON.stringify(userInfo.value)}`
			});
		}, 4500)
		setTimeout(() => {
			changeType.value = '请选择匹配类型！'
		}, 5000)
	}
	const matchType = () => {
		matechType.value = true
	}
	const getUserInfo = (e) => {
		userInfo.value = e
		if (!isObjectEmpty(e)) {
			changeType.value = '已选择，点击匹配！'
		} else {
			changeType.value = '请选择匹配类型'
		}
		matechType.value = false
	}
	const confirm = () => {
		setTimeout(() => {
			// 3秒后自动关闭
			noInfo.value = false;
			Mate()
		}, 1000)
	}
	const cancel = () => {
		noInfo.value = false
	}
	onShow(() => {
		userInfo.value = {}
	})
</script>

<style lang="scss">
	.homeContainer {
		width: 100%;
		height: 100vh;
	}

	.tip {
		width: 100%;
		position: fixed
	}

	.gaVue {
		width: 100%;
		height: 100vh;
		overflow: hidden;
		position: absolute;
	}

	.pipei {
		width: 100%;
		position: absolute;
		top: 80vh;
		z-index: 99;

		.center {
			width: 50%;
			height: 50px;
			border-radius: 20px;
			margin: 0 auto;
		}
	}

	.mate {
		position: absolute;
		z-index: 999;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);

		.text {
			width: fit-content;
			position: absolute;
			top: 35%;
			left: 50%;
			transform: translate(-50%, -50%);
			color: #000;
			font-size: 18px;
			font-weight: 700;
		}

		.TheCircle {
			position: relative;
			width: 180px;
			height: 180px;
			border-radius: 50%;
			opacity: 0.5;
			border: 3px solid rgb(246, 247, 248);
			box-shadow: 0 0 0 3px rgb(41, 134, 196);
		}

		.Water {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgb(23, 106, 201);
			border-radius: 50%;
			overflow: hidden;
		}

		.Water::after {
			content: '';
			position: absolute;
			top: 0;
			left: 50%;
			width: 150%;
			height: 150%;
			border-radius: 40%;
			background-color: rgb(240, 228, 228);
			animation: real 5s linear infinite;
		}

		@keyframes real {
			0% {
				transform: translate(-50%, -65%) rotate(0deg);
			}

			100% {
				transform: translate(-50%, -65%) rotate(360deg);
			}
		}

		.Water::before {
			content: '';
			position: absolute;
			top: 0;
			left: 50%;
			width: 150%;
			height: 150%;
			border-radius: 42%;
			background-color: rgb(240, 228, 228, 0.2);
			animation: virtual 7s linear infinite;
		}

		@keyframes virtual {
			0% {
				transform: translate(-50%, -60%) rotate(0deg);
			}

			100% {
				transform: translate(-50%, -60%) rotate(360deg);
			}
		}
	}

	.loading {
		position: absolute;
		z-index: 999;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		width: 50px;
		height: 50px;
	}

	.popup {
		position: absolute;
		z-index: 999;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}

	.matechType {
		width: 80%;
		position: relative;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: rgba(255, 255, 255);
		z-index: 9999;
		border-radius: 20px;
		padding: 0 30px;
	}

	.u-button {
		margin: 30px 0;
	}
</style>