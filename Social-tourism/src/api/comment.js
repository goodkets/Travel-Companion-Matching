import request from "@/utils/request.js"
//获取评论信息--发布者
export const getCommentList = async (data) => {
	return request(`comment/list`, 'get', data)
}

// 获取评论信息--评论者
export const getCommentSumList = async (data) => {
	return request('commentSum/list', 'get', data)
}
//点赞
export const postLikeAdd = async (data) => {
	return request("comment/addLike", 'post', data)
}
//评论发布者
export const postCommentSum = async (data) => {
	return request("commentSum/add", "post", data)
}
//发说说
export const postAddRely = async (data) => {
	return request('comment/addRely', "post", data)
}