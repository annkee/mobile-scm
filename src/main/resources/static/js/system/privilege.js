var MENUTYPE_PARENT = 1;
var MENUTYPE_NODE = 2;
var MENUTYPE_LINE = 3;

$().ready(function () {
    $("#treeContainer").css("height", $(window).height() - 90);
    //处理数据、加载树并绑定内容与事件
    loadTree();

    $("select#role").change(function () {
        matchPriv();
    });

});

function loadTree() {
    var url = "../privilege/loadTree";
    var para = {
        ts: new Date().getTime()
    };
    $.getJSON(url, para, function (data) {
        console.log(data);
        function genPrivTree(menuList, parent) {
            for (var i = 0; i < menuList.length; i++) {
                menu = menuList[i];
                var privMenu = {
                    id: menu.id,
                    type: "menu",
                    label: "<span style='color:#000099;'>" + menu.name + "</span> <span style='color:gray;'>[菜单]</span>" + (menu.remark ? "<span style='color:gray;'>[" + menu.remark + "]</span>" : ""),
                    subTree: []
                };
                parent.push(privMenu);

                if (menu.type == MENUTYPE_PARENT) {
                    //alert(menu.subMenuList.length);
                    if (menu.subMenuList && menu.subMenuList.length > 0) {
                        genPrivTree(menu.subMenuList, privMenu.subTree);
                    }
                } else if (menu.type == MENUTYPE_NODE) {

                    var action = menu.action;
                    if (action != null) {
                        privMenu.subTree.push({
                            id: action.id,
                            type: "action",
                            label: "<span style='color:#990000'>" + (action.remark || "") + "</span> <span style='color:gray;'>[" + action.typeName + "]</span> <span style='color:gray'>[" + action.name + "]</span>"
                        });
                    }

                }
            }
        }

        var privTree = [];

        genPrivTree([data], privTree);
        // genPrivTree([data.menuTree], privTree);

        var props = treeDefaultProps;
        props.expandLevel = 2;
        props.indent = 25;
        $("#treeContainer").tree(privTree, props, function (item) {
            var id = item.id;
            var cbx = item.renderer.addCheckbox(item, 0, id, function () {

                //所有下级的选中状态与此框相同
                $("input:checkbox[id^=" + this.id + "]").attr("checked", this.checked);

                //上级
                if (this.checked) { //此框被选中，则所有上级应被选中
                    var curId = $(this).attr("id");
                    while ((curId = curId.substring(0, curId.lastIndexOf("."))).length > 0) {
                        $("input:checkbox[id=" + curId + "]").attr("checked", this.checked);
                    }
                } else { //若此框被取消选中
                    //类别不为ACTION（即MENU类型）则根据兄弟节点选中情况处理是否取消父节点选中状态
                    if ($(this).attr("itemType") != "action") {
                        function synParent(node) {//定义一个同步处理父节点的方法用于递归
                            var parentNode = $("input:checkbox[id=" + node.attr("pid") + "]");
                            if (parentNode.length > 0) {
                                //寻找当前节点的被选中的兄弟节点,若个数为0则取消父节点选中, 并递归处理更上一级节点
                                if ($("input:checkbox[pid=" + node.attr("pid") + "][checked=true]").length == 0) {
                                    parentNode.attr("checked", false);
                                    synParent(parentNode);
                                }
                            }
                        }

                        synParent($(this));
                    }
                }

            });
            cbx.attr("pid", id.substring(0, id.lastIndexOf(".")));
            cbx.attr("rid", id.substr(id.lastIndexOf(".") + 1));
            cbx.attr("itemType", item.data.type);
            item.renderer.addLabel(item, item.data.label);
        });


        //将当前权限设置情况对应到树中
        matchPriv();
    });
}

function matchPriv() {
    //清除当前选中
    $("input:checkbox").attr("checked", false);
    //获取当前角色菜单权限与动作权限
    var url = "../privilege/loadPrivilege";
    var para = {roleId: $("select#role").val(), ts: new Date().getTime()};

    $.getJSON(url, para, function (data) {
        var menus = data[0];
        var actions = data[1];

        for (var i = 0; i < menus.length; i++) {
            $("input:checkbox[rid=" + menus[i].menuId + "]").attr("checked", true);
        }

        for (i = 0; i < actions.length; i++) {
            $("input:checkbox[rid=" + actions[i].actionId + "]").attr("checked", true);
        }
    });
}

function savePriv() {
    var roleId = $("select#role").val();
    var menuIds = [], actionIds = [];
    $("input:checkbox[checked=true][itemType=menu]").each(function () {
        menuIds.push($(this).attr("rid"));
    });
    $("input:checkbox[checked=true][itemType=action]").each(function () {
        actionIds.push($(this).attr("rid"));
    });

    var url = "../privilege/savePrivilege";
    var para = {roleId: roleId, menuIds: menuIds, actionIds: actionIds};

    $.post(url, para, function (data) {
        if (data == "success") {
            alert("数据保存成功！");
        } else {
            alert("数据保存失败，请重试！");
        }
    });
}


