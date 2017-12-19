var parameter = {
    "mobileType.bonusList": []
};

/**
 * 动态填加返利价
 */
function addBonus() {
    //从表单获得原始数据
    var bonusType = $("#bonusType").val();
    var bonusTypeId = bonusType.substring(0, bonusType.indexOf(":"));
    var bonusTypeName = bonusType.substring(bonusType.indexOf(":") + 1);
    var bonusPrice = $("#bonusPrice").val();

    //校验
    for (var i = 0; i < parameter["mobileType.bonusList"].length; i++) {
        if (parameter["mobileType.bonusList"][i].bonusTypeId == bonusTypeId) {
            window.alert("这个类别已经填加！");
            return false;
        }
    }

    var price = bonusPrice - 0;
    if (isNaN(price) || price <= 0) {
        window.alert("价格只能为正数！");
        return;
    }

    //完成填加
    var bonus = {
        bonusTypeId: bonusTypeId,
        bonusTypeName: bonusTypeName,
        bonusPrice: bonusPrice
    }
    //加入数组
    parameter["mobileType.bonusList"].push(bonus);
    //生成新行
    drawNewLine(bonus);
}

function drawNewLine(bonus) {
    var tr = $("<tr></tr>").attr("name", bonus.bonusTypeId);
    tr.append($("<td></td>").html(bonus.bonusTypeName));
    tr.append($("<td></td>").html(bonus.bonusPrice));
    tr.append($("<td></td>").html("<a href='javascript:delPrice(\"" + bonus.bonusTypeId + "\")'>删除</a>"));
    tr.appendTo($("#tblPrice"));
}

function delPrice(typeId) {
    // var typeId = $("#bonus").val();
    //删除数组中值
    for (var i = 0; i < parameter["mobileType.bonusList"].length; i++) {
        if (parameter["mobileType.bonusList"][i].bonusTypeId == typeId) {
            break;
        }
    }
    parameter["mobileType.bonusList"].splice(i, 1);
    console.log(parameter["mobileType.bonusList"]);
    //删除表格行
    $("tr[name=" + typeId + "]", $("#tblPrice")).remove();
    console.log(parameter["mobileType.bonusList"].length);
}

//提交表单
function submitType(frm) {
    for (var i = 0; i < parameter["mobileType.bonusList"].length; i++) {
        parameter["mobileType.bonusList"][i] = JSON.stringify(parameter["mobileType.bonusList"][i]);
    }
    //原始的手动验证方式
    ajaxSubmit(frm, parameter["mobileType.bonusList"])
}

function repass(callback) {
    if ($("textarea[name=remark]").val() == $("input[name=buyprice]").val()) {
        callback("pass");
    }
    else {
        callback("密码不一致");
    }
}

//自定义替换全局字符
String.prototype.replaceAll = function (findText, repText) {
    var newRegExp = new RegExp(findText, 'gm');
    return this.replace(newRegExp, repText);
};

function boot(arrStr) {
    var parameter1 = {
        "mobileType.bonusList": []
    };
    var str = arrStr.substring(1, arrStr.length - 1);
    var str = str.replaceAll("{", "");
    var str = str.replaceAll("}", "");
    var j = 0;
    for (var i = 0; i < str.length; i++) {
        if (str.substr(i, 1) == ",") {
            j += 1;
        }

    }
    if (j == 2) {
        var arr = new Array(3);
        parameter1["mobileType.bonusList"] = str.split(',');
        for (var i = 0; i < 3; i++) {
            arr[i] = parameter1["mobileType.bonusList"][i].split('=')[1];
            if (i == 2) {
                var bonus = {
                    bonusTypeId: arr[0],
                    bonusTypeName: arr[2],
                    bonusPrice: arr[1]
                };
                parameter["mobileType.bonusList"].push(bonus);
            }
        }
    }
    if (j == 5) {
        var arr = new Array(6);
        parameter1["mobileType.bonusList"] = str.split(',');
        for (var i = 0; i < 6; i++) {
            arr[i] = parameter1["mobileType.bonusList"][i].split('=')[1];
            if (i == 2) {
                var bonus = {
                    bonusTypeId: arr[0],
                    bonusTypeName: arr[2],
                    bonusPrice: arr[1]
                };
                parameter["mobileType.bonusList"].push(bonus);
            }
            if (i == 5) {
                var bonus = {
                    bonusTypeId: arr[3],
                    bonusTypeName: arr[5],
                    bonusPrice: arr[4]
                };
                parameter["mobileType.bonusList"].push(bonus);

            }
        }
    }
    if (j == 8) {
        var arr = new Array(9);
        parameter1["mobileType.bonusList"] = str.split(',');
        for (var i = 0; i < 9; i++) {
            arr[i] = parameter1["mobileType.bonusList"][i].split('=')[1];
            if (i == 2) {
                var bonus = {
                    bonusTypeId: arr[0],
                    bonusTypeName: arr[2],
                    bonusPrice: arr[1]
                };
                parameter["mobileType.bonusList"].push(bonus);
            }
            if (i == 5) {
                var bonus = {
                    bonusTypeId: arr[3],
                    bonusTypeName: arr[5],
                    bonusPrice: arr[4]
                };
                parameter["mobileType.bonusList"].push(bonus);

            }
            if (i == 8) {
                var bonus = {
                    bonusTypeId: arr[6],
                    bonusTypeName: arr[8],
                    bonusPrice: arr[7]
                };
                parameter["mobileType.bonusList"].push(bonus);

            }
        }
    }
}