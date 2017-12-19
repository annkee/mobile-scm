/** 菜单类型：无子菜单*/
var MENUTYPE_NODE = 2;
/** 菜单类型：分隔线*/
var MENUTYPE_LINE = 3;

/**
 * 显示隐藏动作输入框
 * @param {Object} o
 */
function showHideActionRow(o) {
    if (o.value == MENUTYPE_NODE) {
        $("#actionRow").css("display", "");
        $("#input[name=menuActionName]").removeAttr("disabled");
    } else {
        $("#actionRow").css("display", "none");
        $("#input[name=menuActionName]").attr("disabled", true);
    }

    if (o.value == MENUTYPE_LINE) {
        $("#menuNameRow").css("display", "none");
    } else {
        $("#menuNameRow").css("display", "");
    }
}

/**
 * 菜单表单校验
 */
function validateFrm() {
    var oMenuName = $("input[name=menuName]");
    var oActionName = $("input[name=menuActionName]");
    var type = $("select[name=menuType]").val();
    if (oMenuName.val().trim().length == 0 && type != MENUTYPE_LINE) {
        oMenuName.focus();
        window.alert("菜单名不能为空！");
        return false;
    }
    if (type == MENUTYPE_NODE && oActionName.val().trim().length == 0) {
        oActionName.focus();
        window.alert("动作名不能为空！");
        return false;
    }
    return true;
}

//编辑action动作
function submitActionEdit() {
    var menuId = $.trim($("input[name=menuId]").val());
    var actionName = $.trim($("input[name=actionName]").val());
    var actionId = $.trim($("input[name=actionId]").val());
    var actionMenuId = $.trim($("input[name=actionMenuId]").val());
    var actionType = $("input[name=actionType]:checked").val();
    var actionRemark = $("textarea[name=actionRemark]").val();

    // var data = getFormPara($("#menuEditForm"));
    var redata = "{\"actionMenuId\": " + "\"" + actionMenuId + "\"" + ",\"menuId\": " + "\"" + menuId + "\"" + ",\"actionId\": " + "\"" + actionId + "\"" + ",\"actionName\": " + "\"" + actionName + "\"" + ",\"actionType\": " + "\"" + actionType + "\"" +
        ",\"actionRemark\": " + "\"" + actionRemark + "\"" + "}";
    console.log(redata);
    $.ajax({
            type: "POST",
            contentType: "application/json ; charset=utf-8",
            url: "../menu/editAction?time=" + new Date().getTime(),
            data: redata,
            dataType: "json",
            async: false,
            success: function (result) {
                if (result == "success") {

                } else {
                    window.location.href = result.msg;
                }

            }
        }
    )
}
//添加action菜单
function submitMenuAddAction() {
    var actionMenuId = $.trim($("input[name=actionMenuId]").val());
    var actionName = $.trim($("input[name=actionName]").val());
    var actionType = $("input[name=actionType]:checked").val();
    var actionRemark = $("textarea[name=actionRemark]").val();

    // var data = getFormPara($("#menuEditForm"));
    var redata = "{\"actionMenuId\": " + "\"" + actionMenuId + "\"" + ",\"actionName\": " + "\"" + actionName + "\"" + ",\"actionType\": " + "\"" + actionType + "\"" +
        ",\"actionRemark\": " + "\"" + actionRemark + "\"" + "}";
    $.ajax({
            type: "POST",
            contentType: "application/json ; charset=utf-8",
            url: "../menu/addAction?time=" + new Date().getTime(),
            data: redata,
            dataType: "json",
            async: false,
            success: function (result) {
                if (result == "success") {

                } else {
                    window.location.href = result.msg;
                }

            }
        }
    )
}
//编辑菜单
function submitMenuEdit() {
    var menuId = $.trim($("input[name=menuId]").val());
    var menuParentId = $.trim($("input[name=menuParentId]").val());
    var menuName = $("input[name=menuName]").val();
    var menuType = $("select option[name=menuType]").val();
    var menuActionName = $("input[name=menuActionName]").val();
    var menuActionId = $("input[name=menuActionId]").val();
    var menuRemark = $("textarea[name=menuRemark]").val();


    var data = getFormPara($("#menuEditForm"));
    var redata = "{\"menuParentId\": " + "\"" + menuParentId + "\"" + ",\"menuId\": " + "\"" + menuId + "\"" + ",\"menuName\": " + "\"" + menuName + "\"" +
        ",\"menuActionId\": " + "\"" + menuActionId + "\"" +
        ",\"menuActionName\": " + "\"" + menuActionName + "\"" + ",\"menuRemark\": " + "\"" + menuRemark + "\"" +
        ",\"menuType\":" + "\"" + data.menuType + "\"" + "}";
    $.ajax({
            type: "POST",
            contentType: "application/json ; charset=utf-8",
            url: "../menu/editMenu?time=" + new Date().getTime(),
            data: redata,
            dataType: "json",
            async: false,
            success: function (result) {
                if (result == "success") {

                } else {
                    window.location.href = result.msg;
                }

            }
        }
    )
}

function submitMenuAddForm() {

    var menuParentId = $.trim($("input[name=menuParentId]").val());
    var menuName = $("input[name=menuName]").val();
    var menuType = $("select option[name=menuType]").val();
    var menuActionName = $("input[name=menuActionName]").val();
    var menuRemark = $("textarea[name=menuRemark]").val();


    var data = getFormPara($("#menuAddForm"));
    var redata = "{\"menuParentId\": " + "\"" + menuParentId + "\"" + ",\"menuName\": " + "\"" + menuName + "\"" + ",\"menuActionName\": " + "\"" + menuActionName + "\"" + ",\"menuRemark\": " + "\"" + menuRemark + "\"" + ",\"menuType\":" + "\"" + data.menuType + "\"" + "}";
    $.ajax({
            type: "POST",
            contentType: "application/json ; charset=utf-8",
            url: "../menu/addMenu?time=" + new Date().getTime(),
            data: redata,
            dataType: "json",
            async: false,
            success: function (result) {
                if (result == "success") {

                } else {
                    window.location.href = result.msg;
                }

            }
        }
    )
}
/**
 * 动作表单校验
 */
function validateActionFrm() {
    var oActionName = $("input[name=actionName]");
    if (oActionName.val().trim().length == 0) {
        oActionName.focus();
        window.alert("动作不能为空!");
        return false;
    }
    return true;
}

function cans() {
    var menuId = $.trim($("input[name=cancel]").val());
    window.location.href = '../menu/menuDetail?menuId=' + menuId;
}