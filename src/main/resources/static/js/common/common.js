//=========================================================================
// DOM对象操作工具
//=========================================================================
function getAbsPosition(o) {

    o = $(o);
    if (o.length == 0) {
        return false;
    }

    o = o[0];

    var left, top;
    left = o.offsetLeft;
    top = o.offsetTop;

    while (o = o.offsetParent) {
        left += o.offsetLeft;
        top += o.offsetTop;
    }

    return {
        left: left,
        top: top
    };
}

//=========================================================================
// STRING操作工具
//=========================================================================
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.startWith = function (str) {
    if (typeof(str) === "undefined") {
        return false;
    }
    str = str.toString();
    if (this.substr(0, str.length) == str) {
        return true;
    }
    else {
        return false;
    }
}

String.prototype.endWith = function (otherStr) {
    if (typeof(otherStr) === "undefined") {
        return false;
    }
    otherStr = otherStr.toString();
    var startPos = this.length - otherStr.length;
    if (startPos >= 0) {
        var tmp = this.substr(startPos);
        if (tmp === otherStr) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        return false;
    }
}

String.prototype.contains = function (otherStr) {
    if (typeof(otherStr) === "undefined") {
        return false;
    }
    if (this.indexOf(otherStr.toString()) == -1) {
        return false;
    }
    else {
        return true;
    }
}
//=========================================================================
// FORM操作工具
//=========================================================================
/**
 * 将表单中各域的值自动封装成参数对象
 * @param {Object} oFrm 表单对象
 */
function getFormPara(oFrm, obj) {
    oFrm = $(oFrm)[0];
    var len = oFrm.elements.length;

    var ret;
    if (obj && obj instanceof Object) {
        ret = obj;
    }
    else {
        ret = {};
    }

    for (var i = 0; i < len; i++) {

        var oEle = oFrm.elements[i];

        if (oEle.type === "radio") {
            if (oEle.checked) {
                ret[oEle.name] = oEle.value.trim();
            }
        }
        else if (oEle.type === "checkbox") {
            var curVal = ret[oEle.name];
            if (curVal === undefined) {
                ret[oEle.name] = [];
            }
            if (oEle.checked) {
                ret[oEle.name].push(oEle.value.trim());
            }
        }
        else {
            ret[oEle.name] = oEle.value.trim();
        }
    }
    return ret;
}

/**
 * ajax提交表单
 * @param {Object} version
 */
function ajaxSubmit(frm, parameter, afterSubmit) {

//    if (!ValidateFrm.submitValidate(frm)) {
//        return false;
//    }
    frm = $(frm)[0];
    var action = frm.action;
    var method = frm.method ? frm.method : "post";

    var paraObj = {};
    if (parameter) {
        paraObj = parameter;
    }
    var bonusStr = paraObj.toString();
    paraObj = getFormPara(frm, new Object());
    // var redata = "{\"bonusList\": " + "\"" + bonusStr + "\"" + ",\"buyPrice\": " + "\"" + paraObj.buyPrice + "\"" + ",\"name\": " + "\"" + paraObj.name + "\"" + ",\"remark\": " + "\"" + paraObj.remark + "\"" + ",\"id\": " + "\"" + paraObj.id + "\"" + ",\"brand\":" + "\"" + paraObj.brand + "\"" + "}";
    var redata = "{\"bonusList\": " + "[" + bonusStr + "]" + ",\"buyPrice\": " + "\"" + paraObj.buyPrice + "\"" + ",\"name\": " + "\"" + paraObj.name + "\"" + ",\"remark\": " + "\"" + paraObj.remark + "\"" + ",\"id\": " + "\"" + paraObj.id + "\"" + ",\"brand\":" + "\"" + paraObj.brand + "\"" + "}";
    window.alert(action);
    $.ajax({
        type: method,
        contentType: "application/json ; charset=utf-8",
        url: action,
        data: redata,
        dataType: "json",
        async: false,
        success: function (data) {
            if (afterSubmit && afterSubmit instanceof Function) {
                afterSubmit(data);
            }
            else if (data == "repeat") {
                alert("编号已存在");
            }
            else {
                location = data;
            }
        },
        error: function () {
            // window.alert("表单提交失败");
            window.location = "../mobileType/list";
        }
    });
}

/**
 * 表单验证 - 类
 * @param {Object} version
 */
function validateFrm() {

    //提示错误信息
    function showInfo(o, defaultInfo) {
        validateRun = false;
        o.css("background-color", "red");

        var info = o.attr("info");
        if (!info) {
            info = defaultInfo;
        }

        var errDivId = o.attr("errDivId");
        $("div#" + errDivId).html(info);
        validateRun = true;
    }

    //取消错误提示
    function restore(o) {
        validateRun = false;
        o.css("background-color", "");
        var errDivId = o.attr("errDivId");
        $("div#" + errDivId).html("");
        validateRun = true;
    }

    function validate(o) {

        var val = o.val();

        //必填
        if (typeof(o.attr("required")) == "string") {
            if (val.trim().length == 0) {
                showInfo(o, "不能为空！");
                return false;
            }
            else {
                restore(o);
            }
        }

        //最大长度
        var len = o.attr("maxlength");
        if (len && len > 0) {
            while (getStrByteLen(o.val()) > len) {
                o.val(o.val().substr(0, o.val().length - 1));
            }
        }


        //最小长度
        len = o.attr("minlength");
        if (len && len > 0) {
            if (getStrByteLen(val) < len) {
                showInfo(o, "长度不能小于" + len);
                return false;
            }
            else {
                restore(o);
            }
        }

        //预定类型
        var valType = o.attr("valType");
        if (valType) {
            var ret = FrmCheck[valType](val, o);
            if (ret == "pass" || val.trim().length == 0) {
                restore(o);
            }
            else {
                showInfo(o, ret);
                return false;
            }
        }

        //模式匹配
        var pattern = o.attr("pattern");
        if (pattern) {
            if (val.match(eval(pattern)) || val.trim().length == 0) {
                restore(o);
            }
            else {
                showInfo(o, "格式不符合要求！");
                return false;
            }
        }

        //自定义验证
        var ret = true;
        var validate = o.attr("validate");
        if (validate) {
            eval(validate)(function (data) {
                if (data == "pass" || val.trim().length == 0) {
                    restore(o);
                }
                else {
                    showInfo(o, data);
                    data = false;
                }
            });
        }
        return ret;
    }

    /**
     * 提交表单时验证
     * @param {Object} frm
     */
    this.submitValidate = function (frm) {
        frm = $(frm)[0];

        $.ajaxSetup({
            async: false
        });

        var ret = true;

        var len = frm.elements.length;
        for (var i = 0; i < len; i++) {
            var ele = frm.elements[i];
            if (ele.type == "text" || ele.type == "password" || ele.tagName.toLowerCase() == "textarea") {
                if (validate($(ele))) {
                    ret = false;
                    break;
                }
            }
        }
        $.ajaxSetup({
            async: true
        });

        return ret;
    }

    /**
     * 初始化时绑定事件
     * @param {Object} frm
     */
    this.bindValidate = function (frm) {
        frm = $(frm)[0];
        var len = frm.elements.length;
        for (var i = 0; i < len; i++) {
            var ele = frm.elements[i];
            if (ele.type == "text" || ele.type == "password" || ele.tagName.toLowerCase() == "textarea") {
                $(ele).bind("input propertychange", function () {
                    validateRun && validate($(this));
                })
            }
        }
    }
}

//获得字节长度
function getStrByteLen(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        if (str.charCodeAt(i) < 128) {
            len++;
        }
        else {
            len += 2;
        }
    }
    return len;
}

var validateRun = true;
var ValidateFrm = new validateFrm();

/**
 * 常用表单验证方法
 * @param {Object} version
 */
FrmCheck = {
    //Email格式验证
    email: function (str) {
        if (str.match(/^\w+@\w+(\.\w+)+$/ig)) {
            return "pass";
        }
        return "无效的电子邮件格式！";
    },
    //整数类型验证
    integer: function (str, o) {
        if (str.match(/^[+-]?\d+$/)) {
            if (o && o.attr("range")) {
                var val = str - 0;

                var range = o.attr("range");
                var start = range.substring(0, range.indexOf('-'));
                var end = range.substring(range.indexOf('-') + 1);
                if (start && end) {
                    if (val >= start && val <= end) {
                        return "pass";
                    }
                    else {
                        return "输入值必须介于" + start + "与" + end + "之间！";
                    }
                }
                else if (start) {
                    if (val >= start) {
                        return "pass";
                    }
                    else {
                        return "输入值必须大于等于" + start;
                    }
                }
                else if (end) {
                    if (val <= end) {
                        return "pass";
                    }
                    else {
                        return "输入值必须小于等于" + end;
                    }
                }
            }
            return "pass";
        }
        return "输入的值必须是整数!";
    },
    //实数类型的验证
    number: function (str, o) {
        if (str.match(/^[+-]?\d+(\.\d+)?$/)) {
            if (o && o.attr("range")) {
                var val = str - 0;

                var range = o.attr("range");
                var start = range.substring(0, range.indexOf('-'));
                var end = range.substring(range.indexOf('-') + 1);
                if (start && end) {
                    if (val > start && val < end) {
                        return "pass";
                    }
                    else {
                        return "输入值必须大于" + start + "并且小于" + end + "！";
                    }
                }
                else if (start) {
                    if (val > start) {
                        return "pass";
                    }
                    else {
                        return "输入值必须大于" + start;
                    }
                }
                else if (end) {
                    if (val < end) {
                        return "pass";
                    }
                    else {
                        return "输入值必须小于" + end;
                    }
                }
            }
            return "pass";
        }
        return "输入的值必须是数字!";
    }
}
//=========================================================================
// Browser操作工具
//=========================================================================
var Browser = {
    isIE: function (version) {

        if (navigator.userAgent.toLowerCase().indexOf("msie") == -1) {
            return false;
        }
        else {
            if (version) {
                var regexpr = new RegExp("msie\\s*" + version, "g");
                if (navigator.userAgent.toLowerCase().match(regexpr)) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                return true;
            }
        }
    }

};

//=========================================================================
// COOKIE操作工具
//=========================================================================
var Cookie = {
    /**
     * 设置cookie
     * @param {Object} cname 名称
     * @param {Object} cvalue 值
     * @param {Object} expires 过期时间，可以是数值，表示存活时间，可以是日期对象，表示到期日期
     */
    set: function (cname, cvalue, expires) {
        var expiresString;
        if (expires) {
            if (expires instanceof Date) {
                expiresString = ";expires=" + expires.toGMTString();
            }
            else {
                var d = parseInt(expires);
                if (!isNaN(d)) {
                    var t = new Date();
                    t = new Date(t.getTime() + d);
                    expiresString = ";expires=" + t.toGMTString();
                }
            }
        }

        var tmp = cname + "=" + escape(cvalue);
        if (expiresString) {
            tmp += expiresString;
        }
        document.cookie = tmp;
    },

    /**
     * 按名称查找cookie
     * @param {Object} cname
     */
    find: function (cname) {
        var cookies = document.cookie;
        var regexpr = new RegExp(cname + "\\s*=[^;]*(;|$)", "g");
        var ret = cookies.match(regexpr);
        if (ret) {
            var val = ret[0].replace(new RegExp(cname + "\\s*="), "").replace(";", "");
            return unescape(val);
        }
    },

    /**
     * 按名称删除cookie
     * @param {Object} cname
     */
    remove: function (cname) {
        document.cookie = cname + "=no;expires=" + new Date(1970, 0, 0).toGMTString();
    }
};

//=========================================================================
// Object操作工具
//=========================================================================
var ObjUtils = {
    /**
     * 值字段深度复制
     */
    deepClone: function (o) {
        var isSimpleVal = function (val) {
            if (typeof(val) === "string" || typeof(val) === "number" || typeof(val) == "boolean") {
                return true;
            }
            else {
                return false;
            }
        };

        var isArray = function (o) {
            if (o instanceof Array) {
                return true;
            }
            else {
                return false;
            }
        };

        var isObject = function (o) {
            if (typeof(o) === "object") {
                return true;
            }
            else {
                return false;
            }
        };

        var cloneArray = function (o) {
            if (!o) {
                return null;
            }

            var ret = [];
            for (var i = 0; i < o.length; i++) {
                if (isSimpleVal(o[i])) {
                    ret.push(o[i]);
                }
                else if (isObject(o[i])) {
                    ret.push(cloneObj(o[i]));
                }
            }
            return ret;
        };

        var cloneObj = function (o) {
            if (!o) {
                return null;
            }

            var ret = {};
            for (var prop in o) {
                var val = o[prop];
                if (isArray(val)) {
                    ret[prop] = cloneArray(val);
                }
                else if (isSimpleVal(val)) {
                    ret[prop] = val;
                }
                else if (isObject(val)) {
                    ret[prop] = cloneObj(val);
                }
            }
            return ret;
        };

        if (isArray(o)) {
            return cloneArray(o);
        }
        else {
            return cloneObj(o);
        }
    }

}
