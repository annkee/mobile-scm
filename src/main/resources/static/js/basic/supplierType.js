function checkFrm() {
    var typeIdRegExp = /^[a-zA-Z0-9-_]{1,32}$/g;
    var oTypeId = $("input[name=id]");
    if (!oTypeId.val().match(typeIdRegExp)) {
        alert("编号只能为字母或数字,不能空,最大长度为10!");
        oTypeId.focus();
        return false;
    }

    var oTypeName = $("input[name=name]");
    if (oTypeName.val().trim().length == 0) {
        alert("供应商类别名称不能为空!");
        oTypeName.focus();
        return false;
    }

    return true;
}
