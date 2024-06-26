// 过滤请求传的空值
const filterData = (data) => {
	if (!data) {
		return {}; // 数据本身就是空的，直接返回空对象
	}

	// 获取所有非空属性
	const entries = Object.entries(data).filter(([_, value]) => value !== undefined && value !== null && value !==
		"");
	// 将非空属性组合成对象
	return Object.fromEntries(entries);
};

export {
	filterData
};