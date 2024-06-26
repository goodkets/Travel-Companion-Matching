import {
	defineStore
} from 'pinia'
import {
	userLogin,
	regUser,
	updateUserInfo
} from "@/api/user.js"
export const userStoreInfo = defineStore('user', {
	state: () => {
		return {
			token: null || uni.getStorageSync('userToken'),
			username: null || uni.getStorageSync('username'),
			nickname: null || uni.getStorageSync('nickname'),
			userID: null || uni.getStorageSync('userID'),
			urlimg: null || uni.getStorageSync('urlimg'),

		}
	},
	getters: {},
	actions: {
		//登录
		async login(username, password) {
			try {
				const res = await userLogin(username, password)
				if (res.status === 0) {
					this.token = res.token
					this.username = res.data.username
					this.nickname = res.data.nickname
					this.userID = res.data.id
					uni.setStorageSync('userToken', res.token);
					uni.setStorageSync('username', res.data.username)
					uni.setStorageSync("nickname", res.data.nickname)
					uni.setStorageSync('userID', res.data.id)
					uni.setStorageSync('urlimg', res.data.user_pic)
				}
				return res
			} catch (err) {
				console.error(err)
			}
		},
		//注册
		async regUser(username, password, nickname) {
			try {
				const res = await regUser(username, password, nickname)
				if (res.status === 0) {
					this.token = res.token
					this.username = res.data.username
					this.nickname = res.data.nickname
					this.userID = res.data.id
					uni.setStorageSync('userToken', res.token);
					uni.setStorageSync('username', res.data.username)
					uni.setStorageSync("nickname", res.data.nickname)
					uni.setStorageSync('userID', res.data.id)
					uni.setStorageSync('userimg', res.data.user_pic)
				}
				return res
			} catch (err) {
				console.error(err)
			}
		},
		// 修改个人信息
		async updateUserInfoPost(userInfo) {
			const res = await updateUserInfo(userInfo)
			return res
		},
		async loginOut() {
			uni.removeStorageSync('userToken')
			uni.removeStorageSync('username')
			uni.removeStorageSync("nickname")
			uni.removeStorageSync('userID')
			uni.removeStorageSync('userimg')
			this.token = ''
			this.username = ''
			this.nickname = ''
			this.userID = ''
			this.urlimg = ''
		}
	}
})