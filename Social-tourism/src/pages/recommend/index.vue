<template>
	<view>
		<div class="list">
			<div class="image" v-for="(item,index) in list" :key="index" @click="goInDetail(item)">
				<u-image :src=" item.img" :fade="true" duration="450" width="100%">
					<template v-slot:loading>
						<u-loading-icon color="red"></u-loading-icon>
					</template>
				</u-image>
				<div class="name"><span class="span">{{item.city}}
					</span>
					<div class="icon">
						<u-icon name="thumb-up-fill" color="red" size="25"></u-icon><span>{{item.likeSum || 0}}</span>
					</div>
				</div>
			</div>
			<u-back-top :scroll-top="scrollTop"></u-back-top>
		</div>
	</view>
	<goLoginVue v-if="loginShow" @loginStatus='goLogin'></goLoginVue>
</template>

<script setup>
	import {
		ref,
		reactive,
		onMounted,
	} from "vue"
	import {
		getList
	} from "@/api/list.js"
	import {
		onLoad,
		onPageScroll
	} from "@dcloudio/uni-app";
	import {
		userStoreInfo
	} from "../../store/user/user.js"
	import goLoginVue from "../../components/goLogin.vue"
	const storeInfo = userStoreInfo()
	const loginShow = ref(false)
	const scrollTop = ref(0)
	const list = ref([])
	onPageScroll((e) => {
		scrollTop.value = e.scrollTop
	})
	const goLogin = (e) => {
		loginShow.value = e
		if (!loginShow.value) {
			uni.navigateTo({
				url: "../personalInformation/Login&Register/login/login"
			})
		}
	}
	const goInDetail = (e) => {
		if (!storeInfo.token) {
			loginShow.value = true
			return
		}
		//console.log(e)
		uni.navigateTo({
			url: `./details/details?list=${JSON.stringify(e)}`
		})
	}
	onLoad(async (e) => {
		const res = await getList({
			recommend: 1
		})
		list.value = res.data
	})
</script>
<style lang="scss">
	.list {

		display: flex;
		flex: 2;
		flex-wrap: wrap;

		.image {
			width: 45%;
			margin: 10px;

			box-shadow: 8px 19px 10px;
		}

		.name {
			display: flex;
			justify-content: space-evenly;
			text-align: center;
			font-size: 20px;
			font-weight: 700;
			//padding: 0 30px;
			background-color: palegreen;

			.icon {
				display: flex;
			}
		}
	}
</style>