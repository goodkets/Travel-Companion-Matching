//判断对象属性值是否是空值
function isObjectEmpty(obj) {
	for (let key in obj) {
		if (obj.hasOwnProperty(key)) {
			if (obj[key] !== null && obj[key] !== undefined && obj[key] !== '') {
				return false;
			}
		}
	}
	return true;
}
export {
	isObjectEmpty
}