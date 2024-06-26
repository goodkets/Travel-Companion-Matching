<template>
	<div>
		<div class="swiper">
			<u-swiper indicator='true' circular='true' :list="list" keyName="url" :autoplay="true"></u-swiper>
		</div>
		<div class="text">
			<h3 class="h3">{{details.name}}旅游介绍</h3>
			<p class="p">
				{{details.text}}
			</p>

		</div>
		<div class="recommend">
			<recommend-vue :recommendation='details.route_recommendation' :name="details.name"></recommend-vue>
		</div>
	</div>
</template>

<script setup>
	import {
		ref,
		onMounted
	} from "vue"
	import recommendVue from "./recommendedRoute/recommendedRoute.vue"
	import {
		getListDetails
	} from "../../../../api/list.js"
	import {
		onLoad
	} from "@dcloudio/uni-app";
	const list = ref([])
	const details = ref()
	onLoad(async (e) => {
		const res = await getListDetails({
			name: e.name
		})
		details.value = res.data
		list.value = JSON.parse(details.value.images)
	})
</script>
<style lang="scss">
	.text {
		margin: 10px 20px;

		.h3 {
			text-align: center;
			font-size: 20px;

		}

		.p {
			text-indent: 30px;
		}
	}

	.recommend {
		margin-top: 30px;

		.h3 {
			text-align: center;
			font-size: 20px;
			margin: 10px 0;
		}
	}

	.h3 {
		font-weight: 700;
	}

	.u-swiper-slide img {
		object-fit: cover;
		width: 100%;
		height: 100%;
	}
</style>