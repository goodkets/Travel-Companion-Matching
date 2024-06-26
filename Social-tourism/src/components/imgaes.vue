<template>
	<view class="u-page" v-if="prop.imagesList && prop.imagesList.length > 0">
		<view class="u-demo-block">
			<view class="u-demo-block__content">
				<view class="album">
					<view class="album__content">
						<u-album :urls="images" v-if="!status"></u-album>
						<u-upload v-else :fileList="images||{}" :width="width || '100px'" :height="height || '100px'"
							:maxCount="images.length" :previewImage="true" :deletable="false"></u-upload>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script setup>
	import {
		ref,
		onMounted
	} from "vue"
	const prop = defineProps(["imagesList", "width", "height"])
	const images = ref(['https://img.zcool.cn/community/01427857bbf6c40000018c1bd3430f.gif'])
	const status = ref(false)
	onMounted(() => {
		if (prop.imagesList && prop.imagesList.length > 0) {
			status.value = true
			images.value = JSON.parse(prop.imagesList)
			console.log(images.value)
		}
	})
</script>

<style lang="scss" scoped>
	.album {
		@include flex;
		align-items: flex-start;

		&__avatar {
			background-color: $u-bg-color;
			padding: 5px;
			border-radius: 3px;
		}

		&__content {
			margin-left: 10px;
			flex: 1;
		}
	}

	.u-upload__deletable {
		display: none !important;
	}

	.u-upload__success {
		display: none !important;
	}
</style>