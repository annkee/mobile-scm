function checkAddFrm(){

    //其它非空，长度及允计字符类型验证
    var oAcc =  $("input[name=acc.account]");
	if (oAcc.val().trim().length == 0) {
		window.alert("帐号不能为空！");
		oAcc.focus();
		return false;
	}
	
    $.ajax({
        url: "accManage_dupAcc.do",
        data: {
            "account": oAcc.val()
        },
        async: false,
        success: function(data){
            if (data.dupAcc) {
                $("#accDupInfo").css("display", "");
                return false;
            }
        },
        dataType: "json"
    });
    
    return true;
}
