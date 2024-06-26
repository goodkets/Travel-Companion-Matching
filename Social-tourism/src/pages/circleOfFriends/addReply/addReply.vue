<template>
	<view class="pageedit">
		<view class="mar-l-r-40 content-edit">
			<!-- 文本输入框 -->
			<view class="content-text">
				<textarea placeholder="这一刻的想法..." v-model="text" maxlength="-1"></textarea>
			</view>
		</view>
		<view class=".hr">
		</view>
		<view class="acatar">
			<u-upload :fileList="fileList1" @afterRead="afterRead" @delete="deletePic" name="1" multiple
				:maxCount="10"></u-upload>
		</view>
		<view class="send-out">
			<view class="send iconfont" @tap="relyPost">发 表</view>
		</view>
	</view>
</template>

<script setup>
	import {
		ref
	} from "vue"
	import {
		postAddRely
	} from "../../../api/comment.js"
	import {
		userStoreInfo
	} from "../.../../../../store/user/user.js"
	import {
		getCurrentTime
	} from "../../../utils/times.js"
	const storeInfo = userStoreInfo()
	const text = ref()
	const fileList1 = ref([]);
	// 删除图片
	const deletePic = (event) => {
		fileList1.value.splice(event.index, 1);
	};
	// 新增图片
	const afterRead = async (event) => {
		// 当设置 mutiple 为 true 时, file 为数组格式，否则为对象格式
		let lists = [].concat(event.file);
		let fileListLen = fileList1.value.length;
		lists.map((item) => {
			fileList1.value.push({
				...item,
				status: 'uploading',
				message: '上传中',
			});
		});
		for (let i = 0; i < lists.length; i++) {
			//const result = await uploadFilePromise(lists[i].url);
			let item = fileList1.value[fileListLen];
			fileList1.value.splice(fileListLen, 1, {
				...item,
				status: 'success',
				message: '',
				//url: result,
			});
			fileListLen++;
		}
		console.log(fileList1.value)
	};
	const relyPost = async () => {
		const res = await postAddRely({
			uid: storeInfo.userID,
			images: fileList1.value,
			user_name: storeInfo.username,
			data: getCurrentTime(),
			content_text: text.value,
			url: storeInfo.urlimg
		})
		if (res.status == 1) {
			uni.navigateBack()
		}
	}
</script>

<style lang="scss">
	.uni-picker-container {
		z-index: 9;
	}

	.pageedit {
		.emojiIcon {
			position: relative;
			z-index: 10;
			padding-left: 25upx;
			padding-right: 20upx;
			font-size: 0;

			&::before {
				content: "\e60b";
				font-size: 55upx;
			}
		}


		.mar-l-r-40 {
			margin-left: 40upx;
			margin-right: 40upx;
		}

		.content-edit {
			margin-top: 40upx;
			margin-bottom: 100upx;
		}

		.content-text {
			width: 100%;
			height: 100px;
		}

		.content-text {
			textarea {
				width: 100%;
				font-size: 30upx;
			}
		}


		.send {
			display: inline-block;
			border-radius: 10upx;
			background-color: red;
			padding: 10upx 40upx;
			color: white;
		}

		.send-out {
			text-align: center;
			padding: 50upx;
		}

		.hr {
			width: 60%;
			height: 1px;
			margin: 0 auto;
			background-color: #ccc;
			animation: virtual 3s linear infinite;
		}

		@keyframes virtual {
			0% {
				width: 80%;
			}

			50% {
				width: 60%;
			}

			100% {
				width: 80%;
			}
		}
	}

	.acatar {
		margin: 10px 30px;
	}
</style>