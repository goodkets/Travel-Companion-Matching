import request from "@/utils/request.js"
//登录
export const userLogin = async (username, password) => {
	return request(`login`, 'post', {
		username: username,
		password: password
	})
}
//注册
export const regUser = async (username, password, nickname) => {
	return request(`regUser`, 'post', {
		username: username,
		password: password,
		nickname: nickname
	})
}
// 获取用户信息
export const userInfo = async (userId) => {
	return request(`userInfo`, 'get', {
		id: userId
	})
}
// 修改用户信息
// export const updateUserInfo = async (userInfo) => {
// 	return request(
// 		`updateUserInfo?nickname=${userInfo.nickname}&sex=${userInfo.sex}&born=${userInfo.born}&eduction=${userInfo.eduction}&tall=${userInfo.tall}&textareaHobby=${userInfo.textareaHobby}&myTextarea=${userInfo.myTextarea}&user_pic=${userInfo.user_pic}`,
// 		'post')
// }
export const updateUserInfo = async (userInfo) => {
	return request('updateUserInfo', 'post', userInfo)
}