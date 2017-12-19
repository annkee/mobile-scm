var sns = [];
//添加串号
function addSerialNumber() {
    var sn1 = $.trim($("input[name='sn1']").val());
    var sn2 = $.trim($("input[name='sn2']").val());

    if (sn1.length == 0) {
        $("input[name='sn1']").focus();
        return;
    }
    if ($(":radio[name='setSn'][checked]").val() == "double" && sn2.length == 0) {
        $("input[name='sn2']").focus();
        return;
    }

    sn = sn1 + "=" + sn2;
    //json对象没有length属性，数组有length属性
    for (var i = 0; i < sns.length; i++) {
        var t = sns[i].split("=");
        if (t[0] == sn1) {
            alert("列表已存在串号一");
            $("input[name='sn1']").focus();
            return;
        }
        if (t[1] != "" && t[1] == sn2) {
            alert("列表已存在串号二");
            $("input[name='sn2']").focus();
            return;
        }
    }

    var repeat = false;
    //判断数据库是否已存在相同串号
    console.log(sn);
    var redata = "{\"serialNumber\": " + "\"" + sn + "\"" + ",\"t\": " + "\"" + new Date().getTime() + "\"" + "}";
    $.ajax({
        type: "POST",
        contentType: "application/json ; charset=utf-8",
        data: redata,
        dataType: "json",
        url: "../mobileStorage/serialNumberRepeat",
        async: false,
        success: function (data) {
            alert(data);
            if (data == "repeat") {
                repeat = true;
            }
        }
    });
    if (repeat) {
        alert("数据库已存在该串号");
        $("input[name='sn1']").focus();
        return;
    }

    //添加
    sns.push(sn);

    var tr = $("<tr></tr>");
    $("<td class='order'></td>").appendTo(tr);
    $("<td>" + sn1 + "<input type='hidden' name='snList' value='" + sn + "'/></td>").appendTo(tr);
    $("<td>" + sn2 + "</td>").appendTo(tr);
    $("<td><a sn=" + sn + " href='javascript:;' onclick='deleteSerialNumber(this);'>删除</a></td>").appendTo(tr);

    $(tr).appendTo($("#tblSns"));

    setOrder();
}

//改变序号
function setOrder() {
    var i = 1;
    $("td.order").each(function () {
        $(this).text(i++);
    });
    //改变总价，数量
    $("input[name='amount']").val(sns.length);
    var buyPrice = $.trim($("input[name='buyPrice']").val());
    $("input[name='totalMoney']").val(sns.length * buyPrice);
}

//删除串号
function deleteSerialNumber(a) {
    if (confirm("确认删除？")) {
        //移除表格
        $(a).closest("tr").remove();
        //删除数组中的值
        var sn = $(a).attr("sn");
        for (var i = 0; i < sns.length; i++) {
            if (sn == sns[i]) {
                sns.splice(i, 1);
                break;
            }
        }
        setOrder();
    }
}

//提交验证
function check() {
    if ($("#supplierId").val() == "") {
        alert("请选择供应商");
        return false;
    }
    if ($("#mobileTypeId").val() == "") {
        alert("请选择机型");
        return false;
    }
    if ($.trim($("input[name='buyPrice']").val()) == "") {
        alert("请输入进价");
        return false;
    }
    if (sns.length == 0) {
        alert("请输入至少一个串号");
        return false;
    }
    return true;
}









