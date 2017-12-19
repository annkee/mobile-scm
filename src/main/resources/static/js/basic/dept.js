function checkFrm() {
	
	var oDeptName = $("input[name=name]");
	if (oDeptName.val().trim().length == 0) {
		alert("部门名称不能为空");
		oDeptName.focus();
		return false;
		
	}
	return true;
}
