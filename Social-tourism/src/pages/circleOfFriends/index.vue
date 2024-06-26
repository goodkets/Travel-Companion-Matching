<template>
	<view v-if="commentList.length > 0">
		<view class="comment" v-for="(res, index) in commentList" :key="res.id">
			<view class="left">
				<u-image src="https://cdn.uviewui.com/uview/album/1.jpg" height="50px" width="50px" shape="circle"
					v-if="!res.url"></u-image>
				<view v-else class="img">
					<user-img-vue :img="[JSON.parse(res.url)]"></user-img-vue>
				</view>
			</view>
			<view class="right">
				<view class="top">
					<view class="name">{{ res.user_name }}</view>
					<view class="like" :class="{ highlight: res.is_like }">
						<view class="num">{{ res.like_sum }}</view>
						<u-icon v-if="res.is_like &&!res.is_like.includes(storeInfo.userID)" name="thumb-up" :size="30"
							color="#9a9a9a" @click="getLike(index,res)"></u-icon>
						<u-icon v-if="res.is_like&&res.is_like.includes(storeInfo.userID)" name="thumb-up-fill"
							:size="30" @click="getLike(index,res)"></u-icon>
					</view>
				</view>
				<view class="content">
					<div class=".p">{{ res.content_text }}</div>
					<div class="img">
						<images-vue :imagesList="res.images"></images-vue>
					</div>
				</view>
				<view class="reply-box" v-if="res.replyList && res.replyList.length">
					<view class="item" v-for="(item, indexs) in res.replyList.slice(0,4)" :key="indexs">

						<view class="username">{{ item.user_name }}</view>
						<view class="text">{{ item.content_str }}</view>

					</view>
					<view class="all-reply" @tap="toAllReply(index)" v-if="res.replyList && res.replyList.length">
						共{{ res.replyList.length}}条评论
						<u-icon class="more" name="arrow-right" :size="26"></u-icon>
					</view>
				</view>
				<view class="bottom">
					{{ res.data }}
					<view class="reply" @click="talkShowFun(res,index)">评论</view>
					<u-popup :show="talkShow" mode="bottom" :customStyle="{'width':'100%','border-radius':'8rpx'}"
						@close="closeTalkShow" @open="keyboard=true" :safeAreaInsetBottom="true">
						<view class="flex justify-between align-center" style="padding: 32rpx;">
							<view class="cirbOX padding-left padding-right-sm">
								<u--form labelPosition="left" :model="talkData" ref="Form" :borderBottom="false">
									<u-form-item label=" " prop="txt" :borderBottom="false" ref="item1" labelWidth='0'>
										<u--input :focus="true" v-model="talkData.txt" cursorSpacing="30"
											maxlength="100" :placeholder="pinglunHolder" border="none"
											clearable></u--input>
									</u-form-item>
								</u--form>
							</view>
							<view class="submitpinglun" @click="submit">发布</view>
						</view>
					</u-popup>
				</view>
			</view>
		</view>
		<u-back-top :scroll-top="scrollTop"></u-back-top>

	</view>
	<view v-else>
		<u-empty mode="message" icon="http://cdn.uviewui.com/uview/empty/message.png">
		</u-empty>
	</view>
	<view class="topButtom" @click="goTOP">
		<u-icon name="plus" color="#fff" size="28"></u-icon>
	</view>
	<goLoginVue v-if="loginShow" @loginStatus='goLogin'></goLoginVue>

</template>

<script setup>
	import {
		onMounted,
		ref,
		provide
	} from "vue"
	import {
		onLoad,
		onPageScroll,
		onShow
	} from "@dcloudio/uni-app"
	import imagesVue from "../../../src/components/imgaes.vue"
	import {
		getCommentList,
		getCommentSumList,
		postLikeAdd,
		postCommentSum
	} from "../../api/comment.js"
	import {
		userStoreInfo
	} from "../../store/user/user.js"
	import {
		getCurrentTime
	} from "../../../src/utils/times.js"
	import goLoginVue from "../../components/goLogin.vue"
	import {
		userInfo
	} from "../../api/user"
	import userImgVue from "../../components/userImg.vue"
	const talkShow = ref(false)
	const talkData = ref({
		txt: ''
	})
	const loginShow = ref(false)
	const storeInfo = userStoreInfo()
	const commentList = ref([]) //第一个接口data --发布者
	const comentListReply = ref([]) //第二个接口data--评论者
	const pinglunHolder = ref('说出你的想法吧！')
	const commentID = ref([])
	const commentallReply = ref([])
	const scrollTop = ref(0)
	const talkRes = ref() //临时存储的弹出数据
	onPageScroll((e) => {
		scrollTop.value = e.scrollTop
	})
	onMounted(() => {
		talkShow.value = false
	})
	onShow(() => {
		talkShow.value = false
		getList()
	})
	onLoad(async () => {
		//talkShow.value = false
		//getList()
		// commentList.value = [{
		// 	id: 1,
		// 	name: '叶轻眉',
		// 	date: '12-25 18:58',
		// 	content_text: '我不信伊朗会没有后续反应，美国肯定会为今天的事情付出代价的',
		// 	url: 'https://cdn.uviewui.com/uview/template/SmilingDog.jpg',
		// 	all_reply: 12,
		// 	like_num: 33,

		// }, ];
	})
	const getList = async () => {
		const res = await getCommentList()
		if (res.status == 0) {
			commentList.value = res.data
			commentID.value = res.data.map(item => item.id)
			commentallReply.value = res.data.map(item => item.all_reply)
			if (commentallReply.value.length > 0) {
				const res1 = await getCommentSumList({
					comment_id: commentID.value
				})
				if (res1.status == 0) {
					comentListReply.value = res1.data
					// // 循环遍历第一个数组
					commentList.value.forEach(item1 => {
						// 找到与当前对象 id 匹配的数据
						const matchingReplies = comentListReply.value.filter(item2 => item2
							.comment_id === item1.id);
						// 将匹配到的数据存储到当前对象的 replyList 属性下
						item1.replyList = matchingReplies;
					});
				}
			}
			commentList.value = commentList.value.map(item => ({
				...item,
				is_like: item.is_like === undefined || item.is_like === null || item.is_like ===
					'' ? [] : JSON.parse(item.is_like),
			}));
		}
	}
	// 跳转到全部回复
	const toAllReply = (index) => {
		uni.navigateTo({
			url: `./reply/reply?commentList=${JSON.stringify(commentList.value[index])}`
		});
	}
	const goLogin = (e) => {
		loginShow.value = e
		if (!loginShow.value) {
			uni.navigateTo({
				url: "../personalInformation/Login&Register/login/login"
			})
		}
	}
	const goTOP = () => {
		if (storeInfo.token) {
			uni.navigateTo({
				url: "./addReply/addReply"
			})
		} else {
			loginShow.value = true
		}

	}
	// 点赞
	const getLike = async (index, res) => {
		try {
			if (commentList.value[index].is_like != null) {
				if (commentList.value[index].is_like.includes(storeInfo.userID)) {
					console.log('已点赞过！')
				} else {
					const res1 = await postLikeAdd({
						id: res.id,
						userId: storeInfo.userID,
						like_sum: Number(res.like_sum) + 1
					})
					if (res1.status === 0) {
						console.log(commentList.value[index].is_like)
						commentList.value[index].is_like.push(storeInfo.userID)
						commentList.value[index].like_sum = Number(commentList.value[index].like_sum) + 1
					} else {
						console.log('请求失败！')
					}
				}
			}
		} catch (e) {
			console.log(e)
		}

	}
	//弹出popup，暂存数据
	const talkShowFun = (res, index) => {
		talkShow.value = true
		talkRes.value = res
	}
	//点击白板
	const closeTalkShow = () => {
		talkData.value.txt = ''
		talkShow.value = false
	}
	//去评论发布者的
	const submit = async () => {
		const res = await postCommentSum({
			uid: storeInfo.userID,
			user_name: storeInfo.username,
			data: getCurrentTime(),
			content_str: talkData.value.txt,
			url: storeInfo.urlimg,
			comment_id: talkRes.value.id,
		})
		talkShow.value = false
		talkData.value.txt = ''

		if (res.status == 1) {
			getList()
		}
	}
</script>

<style lang="scss" scoped>
	.comment {
		display: flex;
		padding: 30rpx;

		.left {
			image {
				width: 64rpx;
				height: 64rpx;
				border-radius: 50%;
				background-color: #f2f2f2;
			}
		}

		.right {
			flex: 1;
			padding-left: 20rpx;
			font-size: 30rpx;

			.top {
				display: flex;
				justify-content: space-between;
				align-items: center;
				margin-bottom: 10rpx;

				.name {
					color: #5677fc;
				}

				.like {
					display: flex;
					align-items: center;
					color: #9a9a9a;
					font-size: 26rpx;

					.num {
						margin-right: 4rpx;
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

			.content {
				margin-bottom: 10rpx;

				.p {
					margin-left: 10px;
				}
			}

			.reply-box {
				background-color: rgb(242, 242, 242);
				border-radius: 12rpx;

				.item {
					padding: 20rpx;
					border-bottom: solid 2rpx $u-border-color;

					.username {
						font-size: 24rpx;
						color: #999999;
					}
				}

				.all-reply {
					padding: 20rpx;
					display: flex;
					color: #5677fc;
					align-items: center;

					.more {
						margin-left: 6rpx;
					}
				}
			}

			.bottom {
				margin-top: 20rpx;
				display: flex;
				font-size: 24rpx;
				color: #9a9a9a;

				.reply {
					color: #5677fc;
					margin-left: 10rpx;
				}
			}
		}
	}

	.cirbOX {
		width: 550rpx;
		height: 80rpx;
		background: #F4F5F7;
		border-radius: 40rpx;
		padding-left: 10px;
	}

	.submitpinglun {
		height: 80rpx;
		width: 64rpx;
		font-size: 32rpx;
		font-weight: 500;
		color: #00875A;
		line-height: 80rpx;
		margin-left: 20px;
	}

	.flex {
		display: flex;
	}

	.topButtom {
		position: fixed;
		bottom: 40px;
		right: 40px;
		background-color: #ccc;
		color: #fff;
		border: none;
		padding: 12px 16px;
		border-radius: 100%;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
		z-index: 1000;
	}

	.u-upload__deletable {
		display: none !important;
	}

	.u-upload__success {
		display: none !important;
	}
</style>