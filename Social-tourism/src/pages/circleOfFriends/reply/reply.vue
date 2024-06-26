<template>
	<view class="wrap">
		<view class="comment">
			<view class="top">
				<view class="left">
					<view class="heart-photo">
						<user-img-vue :img="[JSON.parse(comment.url)]"></user-img-vue>
					</view>
					<view class="user-info">
						<view class="name">{{ comment.user_name }}</view>
						<view class="date">{{comment.data}}</view>
					</view>
				</view>
				<view class="right" :class="{ highlight: comment.is_like }">
					{{ comment.like_sum }}
					<view v-if="comment.is_like.length > 0">
						<u-icon v-if="!comment.is_like.includes(storeInfo.userID)" name="thumb-up" class="like"
							color="#9a9a9a" :size="30" @click="getLikes(index,comment)"></u-icon>
						<u-icon v-if="comment.is_like.includes(storeInfo.userID)" name="thumb-up-fill" class="like"
							:size="30" @click="getLikes(index,comment)"></u-icon>
					</view>
					<u-icon v-else name="thumb-up" class="like" color="#9a9a9a" :size="30"
						@click="getLikes(index,comment)"></u-icon>
				</view>
			</view>
			<view class="content">{{ comment.content_text}}</view>
		</view>
		<view class="all-reply">
			<view class="all-reply-top">全部回复（{{commentList.length}}）</view>
			<view class="item" v-for="(item, index) in commentList" :key="index">
				<view class="comment">
					<view class="top">
						<view class="left">
							<view class="heart-photo">
								<user-img-vue :img="[JSON.parse(item.url)]"></user-img-vue>

							</view>
							<view class="user-info">
								<view class="name">{{ item.user_name }}</view>
								<view class="date">{{ item.data }}</view>
							</view>
						</view>
						<view class="right" :class="{ highlight: item.is_like }">
							<view class="num">{{ item.like_sum }}</view>
							<u-icon v-if="!item.is_like.includes(storeInfo.userID)" name="thumb-up" class="like"
								:size="30" color="#9a9a9a" @click="getLike(index,item,1)"></u-icon>
							<u-icon v-if="item.is_like.includes(storeInfo.userID)" name="thumb-up-fill" class="like"
								:size="30" @click="getLike(index,item,1)"></u-icon>
						</view>
					</view>
					<view class="reply" v-if="item.reply">
						<view class="username">{{ item.reply.name }}</view>
						<view class="text">{{ item.reply.content_str }}</view>
					</view>
					<view class="content">{{ item.content_str }}</view>
				</view>
			</view>
		</view>
		<u-back-top :scroll-top="scrollTop"></u-back-top>
	</view>
</template>

<script setup>
	import {
		userStoreInfo
	} from "../../../store/user/user.js"
	import {
		postLikeAdd
	} from "../../../api/comment.js"
	import {
		ref
	} from "vue"
	import {
		onLoad,
		onPageScroll
	} from "@dcloudio/uni-app"
	import userImgVue from "../../../components/userImg.vue"
	const commentList = ref([])
	const comment = ref('')
	const storeInfo = userStoreInfo()
	const scrollTop = ref(0)
	onPageScroll((e) => {
		scrollTop.value = e.scrollTop
	})
	onLoad((query) => {
		comment.value = JSON.parse(query.commentList)
		commentList.value = JSON.parse(query.commentList).replyList
		commentList.value = commentList.value.map(item => ({
			...item,
			is_like: item.is_like === undefined || item.is_like === null || item.is_like ===
				'' ? [] : JSON.parse(item.is_like)
		}));
	})
	// 点赞
	const getLike = async (index, res, isSum) => {
		try {
			if (commentList.value[index].is_like != null) {
				if (commentList.value[index].is_like.includes(storeInfo.userID)) {
					console.log("已点赞过！")
				} else {
					const res1 = await postLikeAdd({
						id: res.id,
						userId: storeInfo.userID,
						like_sum: Number(res.like_sum) + 1,
						isSumTable: isSum
					})
					if (res1.status == 0) {
						commentList.value[index].is_like.push(storeInfo.userID)
						commentList.value[index].like_sum = Number(commentList.value[index].like_sum) + 1
					} else {
						console.log("请求失败")
					}
				}
			}
		} catch (e) {
			console.log(e)
		}
	}
	// 点赞发布者
	const getLikes = async (index, res) => {
		try {
			if (comment.value.is_like != null) {
				if (comment.value.is_like.includes(storeInfo.userID)) {
					console.log("已点赞过！")
				} else {
					const res1 = await postLikeAdd({
						id: res.id,
						userId: storeInfo.userID,
						like_sum: Number(res.like_sum) + 1,
					})
					if (res1.status == 0) {
						comment.value.is_like.push(storeInfo.userID)
						comment.value.like_sum = Number(comment.value.like_sum) + 1
					} else {
						console.log("请求失败")
					}
				}
			}
		} catch (e) {
			console.log(e)
		}
	}
</script>

<style lang="scss" scoped>
	page {
		background-color: #f2f2f2;
	}

	.comment {
		padding: 30rpx;
		font-size: 32rpx;
		background-color: #ffffff;

		.top {
			display: flex;
			justify-content: space-between;
		}

		.left {
			display: flex;

			.heart-photo {
				image {
					width: 64rpx;
					height: 64rpx;
					border-radius: 50%;
					background-color: #f2f2f2;
				}
			}

			.user-info {
				margin-left: 10rpx;

				.name {
					color: #5677fc;
					font-size: 28rpx;
					margin-bottom: 4rpx;
				}

				.date {
					font-size: 20rpx;
					color: $u-light-color;
				}
			}
		}

		.right {
			display: flex;
			font-size: 20rpx;
			align-items: center;
			color: #9a9a9a;

			.like {
				margin-left: 6rpx;
			}

			.num {
				font-size: 26rpx;
				color: #9a9a9a;
			}
		}

		.highlight {
			color: #5677fc;

			.num {
				color: #5677fc;
			}
		}
	}

	.all-reply {
		margin-top: 10rpx;
		padding-top: 20rpx;
		background-color: #ffffff;

		.all-reply-top {
			margin-left: 20rpx;
			padding-left: 20rpx;
			border-left: solid 4rpx #5677fc;
			font-size: 30rpx;
			font-weight: bold;
		}

		.item {
			border-bottom: solid 2rpx $u-border-color;
		}

		.reply {
			padding: 20rpx;
			background-color: rgb(242, 242, 242);
			border-radius: 12rpx;
			margin: 10rpx 0;

			.username {
				font-size: 24rpx;
				color: #7a7a7a;
			}
		}
	}

	.content {
		padding-left: 80px;
	}
</style>