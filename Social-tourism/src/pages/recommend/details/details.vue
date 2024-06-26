<template>
	<view>
		<div>
			<div class="img"><u-image :show-loading="true" :src="details.img" width="100%"></u-image></div>
			<div class="from">
				<ul class="ul">
					<li class="li">性别:{{details.sex}}</li>
					<li class="li">爱好:{{details.hobby}}</li>
					<li class="li">年龄段:{{details.years}}</li>
				</ul>
				<br />
				<p class="p">{{details.text}}</p>
				<div class="star">
					<h3 class="h3">推荐指数</h3>
					<u-rate count="5" v-model="star" readonly size="25"></u-rate>
				</div>
				<div class="submit">
					<div class="button" @click="getDetails">
						<u-button text="查看景点路线" type="success"></u-button>
					</div>
				</div>
			</div>
		</div>
		<u-back-top :scroll-top="scrollTop"></u-back-top>
	</view>
</template>

<script setup>
	import {
		ref
	} from "vue"
	import {
		onLoad,
		onPageScroll
	} from '@dcloudio/uni-app';
	const details = ref({})
	const star = ref(0)
	const scrollTop = ref(0)
	onPageScroll((e) => {
		scrollTop.value = e.scrollTop
	})
	onLoad((e) => {
		details.value = JSON.parse(e.list)
		star.value = details.value.star
	})
	const getDetails = () => {
		uni.navigateTo({
			url: `../../homePage/LUG/inDetail/inDetail?name=${details.value.city}`
		})
	}
</script>

<style lang="scss">
	.img {
		width: 90%;
		margin: 20px auto;
	}

	.popup {
		width: 90%;
		margin: 20px auto;
	}

	.from {
		margin: 0 20px;

		.ul {
			.li {
				text-align: center;
			}
		}

		.p {
			text-indent: 20px;
		}

		.star {
			display: flex;
			flex-direction: column;
			align-items: center;
			font-size: 20px;
			font-weight: 700;

			.h3 {
				margin-bottom: 5px
			}

			;
		}

		@keyframes zoomInOut {
			0% {
				transform: scale(1);
			}

			50% {
				transform: scale(1.1);
			}

			100% {
				transform: scale(1);
			}
		}

		.submit {
			display: flex;
			justify-content: center;
			margin-top: 20px;
		}

		.submit .button {
			animation: zoomInOut 2s infinite;
			/* 使用定义好的关键帧动画，并设置为无限循环 */
			display: inline-block;
			/* 让按钮变成块级元素以便应用动画效果 */
		}
	}
</style>