<template>
	<view>
		<u-modal class="center-text-modal" :show="show" :title="title" :content='content' showCancelButton="true"
			@confirm="successJoin" @cancel="cancel"></u-modal>
	</view>
</template>

<script setup>
	import {
		ref,
		inject
	} from "vue"
	const content = ref('未登录，前往登录！');
	const $emit = defineEmits(['loginStatus'])
	const show = ref(true)
	const successJoin = (e) => {
		show.value = false
		$emit('loginStatus', show.value)
	}
	const cancel = () => {
		show.value = false
	}
</script>

<style lang="scss">

</style>