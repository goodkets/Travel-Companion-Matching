import request from "@/utils/request.js"
//获取城市
export const getList = async (data) => {
	const filteredData = {
		sex: data.sex,
		characters: data.characters,
		hobby: data.hobby,
		years: data.years,
		city: data.city,
		recommend: data.recommend,
		uid: data.uid
	};

	return request(`list/mate`, 'get', filteredData);
}
//城市详细信息
export const getListDetails = async (data) => {
	return request('list/mate/details', 'get', {
		name: data.name
	})
}
//添加路线
export const postListDetail = async (data) => {
	return request('list/mate/detail', 'post', data)
}

// 获取用户+城市的详细信息--也是用于路线存储
export const getDetailInfo = async (data) => {
	return request('list/mate/detailInfo', 'get', data)
}
//修改路线状态--是否是旅游状态--一般用于选择路线存储
export const postDetailStatus = async (data) => {
	return request("list/mate/detailStatus", 'post', data)
}

//加一推荐
export const listPost = async (data) => {
	return request('list/likeSum', 'post', data)
}

//只用于获取用户自己的旅游路线
export const getUserDetail = async (data) => {
	return request("list/mate/userDetail", "get", data)
}