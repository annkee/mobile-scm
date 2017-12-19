$(function () {
    //提交按钮样式
    $("#submitBtn").mouseover(function () {
        this.src = "../images/login_submitBtn2.png";
    }).mouseout(function () {
        this.src = "../images/login_submitBtn1.png";
    });

    //定位验证码图片框
    var oVCode = $("input[name='vcode']");
    oVCode.focus(function () {
        var pos = getAbsPosition(oVCode);
        var left = pos.left;
        var top = pos.top + oVCode.outerHeight() + 4;
        $("div.validateCodeDiv").css({'top': top, 'left': left, 'display': 'block'});
    });


});

/**
 * 改变验证码
 */
function changeCode() {
    $("#imgVcode").attr("src", "../system/getVCode?time=" + new Date().getTime());
}

/**
 * 提交表单
 */
function submitForm() {
    var account = $.trim($("input[name=account]").val());
    var password = $("input[name=password]").val();
    var vcode = $("input[name=vcode]").val();
    if (account.length == 0) {
        $("#messBox").text("请输入用户名!");
        return;
    }
    if (password.length == 0) {
        $("#messBox").text("请输入密码!");
        return;
    }
    if (vcode.length == 0) {
        $("#messBox").text("请输入验证码!");
        return;
    }
    var data = getFormPara($("#frm1"));
    var redata = "{\"account\": " + "\"" + data.account + "\"" + ",\"password\": " + "\"" + data.password + "\"" + ",\"vcode\":" + "\"" + data.vcode + "\"" + "}";

    $.ajax({
            type: "POST",
            contentType: "application/json ; charset=utf-8",
            url: "../system/login",
            data: redata,
            dataType: "json",
            async: false,
            success: function (result) {
                if (result.msg == "success") {
                    window.location.href = "../home/scmSystem";
                } else {
                    $("#messBox").text(result.msg);
                    changeCode();
                }
            }
        }
    )

    /*$.post(
     "/system/login?time=" + new Date().getTime(),
     str,
     //$("#frm1").serialize(),
     function (result) {
     if (result.msg == "success") {
     window.location.href = "/home/success";
     } else {
     $("#messBox").text(result.msg);
     changeCode();
     }
     },
     "json"
     );*/
}



