import {
	filterData
} from "./filterData"
const BASE_URL = import.meta.env.VITE_REQUEST_BASE_URL
// 封装请求方法
function request(url, method, data) {
	return new Promise((resolve, reject) => {
		uni.request({
			url: BASE_URL + url,
			method: method,
			data: filterData(data),
			header: {
				'Content-Type': 'application/json', // 设置请求头
			},
			success: (res) => {
				if (res.statusCode === 200) {
					resolve(res.data);
				} else {
					reject(res);
				}
			},
			fail: (err) => {
				reject(err);
			},
		});
	});
}

// 配置请求拦截器
uni.addInterceptor('request', {
	// 在发送请求之前做一些处理
	config(requestConfig) {
		// 添加请求头、身份验证等
		requestConfig.header.Authorization = 'Bearer ' + uni.getStorageSync('token');
		return requestConfig;
	},
	// 请求发生错误时的处理
	fail(error) {
		console.error('请求失败:', error);
	},
});

export default request;