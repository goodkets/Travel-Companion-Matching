<template>
	<view>
		<div class="list" v-if="listStatus">
			<div class="image" v-for="(item,index) in list" :key="index" @click="goInDetail(item)">
				<u-image :src=" item.img" :fade="true" duration="450" width="100%">
					<template v-slot:loading>
						<u-loading-icon color="red"></u-loading-icon>
					</template>
				</u-image>
				<div class="name">{{item.city}}</div>
			</div>
		</div>
		<div v-else>
			<u-empty mode="search" icon="http://cdn.uviewui.com/uview/empty/search.png">
			</u-empty>
			<div class="center"> <u-button :disabled="disabled" type="error" size="large" shape="circle" text="重新匹配"
					@click="closemate"></u-button></div>
		</div>
		<u-back-top :scroll-top="scrollTop"></u-back-top>
	</view>
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
	const scrollTop = ref(0)
	const list = ref([])
	const listStatus = ref(true)
	onPageScroll((e) => {
		scrollTop.value = e.scrollTop
	})
	const goInDetail = (e) => {
		uni.navigateTo({
			url: `./inDetail/inDetail?name=${e.city}`
		})
	}
	const closemate = () => {
		uni.navigateBack()
	}
	onLoad(async (e) => {
		try {
			const data = JSON.parse(e.userInfo)
			const res = await getList(data)
			if (res.status == 0) {
				list.value = res.data
				listStatus.value = true
			}
		} catch (e) {
			listStatus.value = false
			console.log(e)
		}
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
			text-align: center;
			font-size: 20px;
			font-weight: 700;
			background-color: palegreen;
		}
	}
</style>