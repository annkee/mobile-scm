function checkFrm() {
	var oTypeId = $("input[name=supType.supTypeId]");
	var idRegexp = /^[a-zA-Z0-9-]{1,15}$/g;
	if (!oTypeId.val().trim().match(idRegexp)) {
		oTypeId.focus();
		alert("编号格式不正确!");
		return false;
	}
	
	var oTypeName = $("input[name=supType.supTypeName]");
	if (oTypeName.val().trim().length == 0) {
		oTypeName.focus();
		alert("名称不允许为空!");
		return false;
	}
	
	return true;
}
