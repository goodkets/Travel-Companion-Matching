const toChineseNumber = (num) => {
	const chineseNums = ['一', '二', '三', '四', '五'];
	return chineseNums[num - 1] || num;
}

export {
	toChineseNumber
}