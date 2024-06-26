<template>
	<view>
		<u-upload :fileList="img || {}" name="1" multiple :width="width || '50px'" :height="height || '50px'"
			:maxCount="1" :previewImage="true" xCount="1" v-if="status" :deletable="false"></u-upload>
		<u-image src="https://cdn.uviewui.com/uview/album/1.jpg" height="50px" width="50px" shape="circle"
			v-if="!status"></u-image>

	</view>
</template>

<script setup>
	import {
		ref,
		onMounted
	} from "vue"
	const images = ref(['https://img.zcool.cn/community/01427857bbf6c40000018c1bd3430f.gif'])
	const prop = defineProps(['width', 'height', 'img'])
	const status = ref(false)
	onMounted(() => {
		if (prop.img && prop.img[0] !== null) {
			status.value = true
		}
	})
</script>

<style lang="scss" scoped>
	.u-upload__deletable {
		display: none !important;
	}

	.u-upload__success {
		display: none !important;
	}
</style>