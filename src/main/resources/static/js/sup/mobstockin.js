$().ready(function(){
    $("select[name=supTypeId]").relate($("select[name=supplierid]"));
    $("select[name=brand]").relate($("select[name=mobtypeid]"));
    
    $("select[name=mobtypeid]").change(function(){
    
        $("#refPrice").empty().append("<imag src='images/loading.gif' />");
        
        var mobTypeId = this.value;
        if (mobTypeId.length == 0) {
            $("#refPrice").html("未选机型");
        }
        else {
            $.post("mobStockIn_findRefPrice.do", {
                mobtypeid: mobTypeId
            }, function(data){
                if (data.length == 0) {
                    $("#refPrice").html("参考值未设置");
                }
                else {
                    $("#refPrice").html(parseFloat(data).toFixed(2));
                }
            });
        }
    });
    
    $("select[name=mobtypeid]").change();
    
    //单双串号
    $("input:radio[name=setSn]").click(function(){
        var sn2 = $("input[name=sn2]");
        if (this.value == "single") {
            sn2.val("");
            sn2.attr("disabled", true);
            sn2.css("background-color", "gray");
        }
        else {
            sn2.removeAttr("disabled");
            sn2.css("background-color", "white");
        }
    })
    
    $("input[name=buyprice]").bind("propertychange input", function(){
    
        $("input[name=totalmoney]").val(this.value * $("input[name=amount]").val());
    })
    
    $("input[name=sn1]").keypress(function(event){
        if (event.keyCode == 13) {
            if ($("input:radio[name=setSn][checked]").val() == "single") {
                addSn();
            }
            else {
                $("input[name=sn2]").focus();
            }
        }
    })
    
    $("input[name=sn2]").keypress(function(event){
        if (event.keyCode == 13) {
            addSn();
        }
    })
});

var sns = [];

function addSn(){

    var sn1 = $("input[name=sn1]").val().trim();
    var sn2 = $("input[name=sn2]").val().trim();
    
    if (sn1.length == 0) {
        $("input[name=sn1]").focus();
        return;
    }
    
    if ($("input:radio[name=setSn][checked]").val() == "double" && sn2.length == 0) {
        $("input[name=sn2]").focus();
        return;
    }
    
    var sn = {
        sn1: sn1,
        sn2: sn2
    };
    
    $("input[name=sn1]").val("");
    $("input[name=sn2]").val("");
    $("input[name=sn1]").focus();
    
    for (var i = 0; i < sns.length; i++) {
        if (sns[i].sn1 == sn1 || (($("input:radio[name=setSn][checked]").val() == "double") && sns[i].sn2 == sn2)) {
            sn.status = "已输入";
            return;
        }
    }
    
    //加入表格行
    var tr = $("<tr></tr>");
    $("<td></td>").appendTo(tr);
    $("<td>" + sn1 + "</td>").appendTo(tr);
    $("<td>" + sn2 + "</td>").appendTo(tr);
    $("<td><a href='#' onclick='return delSn(\"" + sn1 + "\")'>删除</a></td>").appendTo(tr);
    $("<td></td>").appendTo(tr);
    
    $("#tblSns").append(tr);
    
    
    
    setSerial();
    
    sns.push(sn);
    
    if (i == sns.length - 1) {
        sn.method = $("input:radio[name=setSn][checked]").val();
        $.post("mobStockIn_dupSn.do", sn, function(data){
            if (data == "dup") {
                sn.status = "库中已存在";
            }
            else if (data == "succ") {
                sn.status = "OK";
            }
            else {
                sn.status = "请求发生错误";
            }
            
            $("td:last", tr).html(sn.status);
            
            //数量
            var amount = 0;
            for (var j = 0; j < sns.length; j++) {
                if (sns[i].status == "OK") {
                    amount++;
                }
            }
            $("input[name=amount]").val(amount);
            
            //总价格
            var buyprice = $("input[name=buyprice]").val();
            if (buyprice.trim().length > 0) {
                $("input[name=totalmoney]").val(buyprice * amount);
            }
            else {
                $("input[name=totalmoney]").val("NaN");
            }
        })
    }
}


function setSerial(){
    var s = 0;
    $("tr", $("#tblSns")).each(function(){
        $("td:first", $(this)).html(s++);
    })
}

function submitFrm(frm){
    var strSns = [];
    for (var i = 0; i < sns.length; i++) {
        var sn = sns[i];
        if (sn.status == "OK") {
            strSns.push(sn.sn1 + "," + sn.sn2);
        }
    }
    //验证
    //.....
    ajaxSubmit(frm, {
        sns: strSns
    });
}

function delSn(sn1){
    $("tr", $("#tblSns")).each(function(){
        if ($("td:eq(1)", $(this)).html() == sn1) {
            $(this).remove();
        }
    })
    
    for (var i = 0; i < sns.length; i++) {
        if (sns[i].sn1 == sn1) {
            sns.splice(i, 1);
            break;
        }
    }
	setSerial();
    return false;
}
