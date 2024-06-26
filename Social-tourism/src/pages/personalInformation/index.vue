<template>
	<div id="container-person">
		<div class="info">
			<div class="userinfo" v-if="userStore.token">
				<div class="sculpture">
					<user-img-vue v-if="fileList1.length > 0" :img="fileList1" :width="imgWidth"
						:height="imgHeight"></user-img-vue>
					<image v-else src="../../images/home/bigUserHeader.png" mode="" style="width: 50px;height: 50px;">
					</image>
				</div>
				<div class="nickname">
					<span class="userName">昵称：{{userStore.nickname || '无'}}</span>
					<span class="userID">用户ID: <span class="id">{{userStore.userID}}</span></span>
				</div>
			</div>
			<div class="login" v-else>
				<div>
					<navigator url="./Login&Register/login/login">登录/注册</navigator>
				</div>
			</div>
		</div>
		<div class="navigation">
			<div class="list" v-for="(item,index) in list" key="index" @click="navigateToPage(item)">
				<div class="left">
					<u-icon :name="item.icon" :color="item.color" size="28"></u-icon>
					<span class="myInfo">{{item.name}}</span>
				</div>
				<div class="right">
					<u-icon name="arrow-right" color="#88959e" size="28"></u-icon>
				</div>
			</div>
		</div>
		<div class="loginOut" v-if="userStore.token">
			<u-button type="error" text="退出" @click="loginOut"></u-button>
		</div>
		<view>
			<u-modal class="center-text-modal" :show="show" :title="title" :content='content'
				@confirm="successJoin"></u-modal>
		</view>
	</div>
</template>

<script setup>
	import {
		ref,
		reactive,
		computed,
		watch,
		onMounted
	} from 'vue'
	import {
		userStoreInfo
	} from "@/store/user/user.js"
	import {
		userInfo
	} from "../../api/user.js"
	import userImgVue from "../../components/userImg.vue"
	import {
		onShow
	} from '@dcloudio/uni-app';
	const userStore = userStoreInfo()
	const fileList1 = ref([]);
	const imgWidth = ref('50px')
	const imgHeight = ref('50px')
	const list = ref([{
			name: '我的信息',
			icon: 'info-circle',
			color: '#000',
			url: "./list/userInfo/userInfo"
		},
		// {
		// 	name: '我的收藏',
		// 	icon: 'tags-fill',
		// 	color: "#000",
		// 	url: "./list/myFriend/myFriend"
		// },
		{
			name: '旅游进程',
			icon: 'moments',
			color: "#000",
			url: "./list/Space/Space"
		},
	])
	const show = ref(false)
	const content = ref('已成功加入！')
	const successJoin = (e) => {
		show.value = false
		uni.navigateTo({
			url: "./Login&Register/login/login"
		})
	}
	const navigateToPage = (item) => {
		if (userStore.token) {
			uni.navigateTo({
				url: item.url,
			})
		} else {
			show.value = true
			content.value = '请先登录！'
		}

	}
	const loginOut = () => {
		userStore.loginOut()
	}
	onShow(async () => {
		const user = await userInfo(userStore.userID)
		if (user.status == 0) {
			//console.log(user.data.user_pic, JSON.parse(user.data.user_pic))
			if (user.data.user_pic) {
				fileList1.value[0] = JSON.parse(user.data.user_pic)
			}
		}
	})
</script>
<style lang="scss">
	#container-person {
		width: 100%;
		height: 100vh;
		background-color: #f7f7f7;
		position: absolute;

		.info {
			position: relative;
			width: 85%;
			height: 60px;
			margin: 0 auto;
			margin-top: 30px;
			background-color: #fff;
			display: flex;
			border-radius: 20px;

			.login {
				line-height: 60px;
				margin: 0 auto;
			}

			.userinfo {
				display: flex;


				.sculpture {
					margin-left: 20px;
					margin-top: 5px;
				}

				.nickname {
					display: flex;
					flex-direction: column;
					font-size: 20px;
					margin-top: 6px;
					margin-left: 20px;

					.userID {
						font-size: 12px;

						.id {
							padding-left: 5px;
						}
					}
				}
			}
		}

		.navigation {
			margin-top: 30px;

			.list {
				width: 76%;
				height: 60px;
				line-height: 60px;
				display: flex;
				background-color: #fff;
				justify-content: space-between;
				margin: 0 auto;
				padding: 0 20px;
				border-bottom: 2px solid #f7f7f7;

				.left {
					display: flex;

					.myInfo {
						margin-left: 10px;
					}
				}

				.right {
					display: flex;
				}
			}

			.list:nth-child(1) {
				border-radius: 20px 20px 0 0;
			}

			.list:last-child {
				border-radius: 0 0 20px 20px;
			}
		}

		.loginOut {
			width: 50%;
			margin: 0 auto;
			border-radius: 20px;
			margin-top: 30px;
		}
	}

	.u-upload__deletable {
		display: none !important;
	}

	.u-upload__success {
		display: none !important;
	}
</style>