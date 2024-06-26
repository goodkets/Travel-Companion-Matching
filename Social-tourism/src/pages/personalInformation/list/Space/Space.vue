<template>
	<view>
		<div class="list" v-if="listStatus">
			<div class="image" v-for="(item,index) in list" :key="index" @click="goInDetail(item)">
				<div class="item">
					<div class="imgUlr" :style="{opacity: item.detailSchedule == 100  ? 1 :0.3}">
						<u-image :src=" item.img" :fade="true" duration="450" width="100%">
							<template v-slot:loading>
								<u-loading-icon color="red"></u-loading-icon>
							</template>
						</u-image>
					</div>
					<div class="progress">
						<div v-if="item.detailSchedule == 100" class="success">已完成</div>
						<div v-else-if="item.detailSchedule == 0" class="error">未开始</div>
						<u-line-progress inactiveColor="skyblue" :percentage="item.detailSchedule || 0"
							activeColor="green" showText='true' height="40px" v-else></u-line-progress>
					</div>
					<div class="name">
						<div class="names">
							{{item.name}}
						</div>
					</div>
				</div>
			</div>

		</div>
		<div v-else>
			<u-empty mode="list" icon="http://cdn.uviewui.com/uview/empty/list.png">
			</u-empty>
		</div>
	</view>
</template>

<script setup>
	import {
		getUserDetail,
		getList,
	} from "../../../../api/list.js"
	import {
		ref,
		onMounted
	} from "vue"
	import {
		userStoreInfo
	} from "../../../../store/user/user.js"
	const storeInfo = userStoreInfo()
	const list = ref([])
	const listStatus = ref(false)
	onMounted(async () => {
		getUserDeta()
	})
	const goInDetail = (e) => {
		console.log(e)
		uni.navigateTo({
			url: `../../../../pages/homePage/LUG/inDetail/inDetail?name=${e.name}`
		})
	}
	const getUserDeta = async () => {
		try {
			const res = await getUserDetail({
				uid: storeInfo.userID
			})
			if (res.status == 0) {
				list.value = res.data,
					listStatus.value = true
			}
		} catch (e) {
			listStatus.value = false
			console.log(e)
		}
	}
</script>

<style lang="scss">
	.list {
		display: flex;
		flex: 2;
		flex-wrap: wrap;

		.image {
			position: relative;
			width: 45%;
			margin: 10px;
			box-shadow: 8px 19px 10px;

			.progress {
				position: absolute;
				top: -1px;
				z-index: 9999;
				width: 100%;
				display: flex;
				justify-content: center;
				align-items: center;
				height: 100%;

				.line {
					text-align: center;
				}
			}

			.success,
			.error {
				text-align: center;
				font-weight: 700;
				font-size: 18px;
				display: block;
				margin: 0 auto;
				color: #fff;
				z-index: 99999;
			}

			.error {
				color: red;
			}
		}

		.imgUlr {
			width: 100%;
			height: 100%;
		}

	}

	@keyframes zoomInOut {
		0% {
			transform: scale(1);
		}

		50% {
			transform: scale(1.2);
		}

		100% {
			transform: scale(1);
		}
	}

	.name {
		.names {
			animation: zoomInOut 2s infinite;
		}

		text-align: center;
		font-size: 16px;
		font-weight: 700;
		background-color: palegreen;
	}
</style>