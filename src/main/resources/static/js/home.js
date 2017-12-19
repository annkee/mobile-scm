var menuData;
var menuStat = "over";
var ctx;
var skinpath;

$().ready(function () {
    // 获取全局参数
    ctx = $("input:hidden[name=ctx]").val();
    skinpath = $("input:hidden[name=skinpath]").val();

    //页面布局
    pageLayout();
    $(window).resize(pageLayout);

    //获取菜单数据
    getMenuData(drawMenu);

    $("div.mask").click(function () {
        hideOtherSubMenu();
        $("div.menuItemBack").css("visibility", "hidden");
        menuStat = "over";
    });
});

function getMenuData(callback) {
    var url = "../menu/menuTree";

    $.getJSON(
        url,
        {time: new Date().getTime()},
        function (data) {
            menuData = [data.menuTree.subMenuList][0];
            callback(menuData);
        }
    );
}

function drawMenu(data) {
    for (var id in data) {
        var mname = data[id]["name"];
        var back = $("<div></div>").addClass("menuItemBack").appendTo("div.menu");
        $("<div></div>").addClass("menuItem").html(mname).attr("menuId", id).appendTo($("div.menu")).mouseover(function () {
            var left = this.offsetLeft;
            var top = this.offsetTop;
            var width = this.offsetWidth;
            var height = this.offsetHeight;
            back.css("left", left).css("top", top).css("width", width).css("height", height).css("visibility", "visible");
            if (menuStat == "over") {
                back.css("background-image", "url(" + skinpath + "/images/menuItem_over.gif)");
            } else {
                back.css("background-image", "url(" + skinpath + "/images/menuItem_active.gif)");
            }
        }).mouseout(function () {
            //$("div.menu .menuItemBack").css("visibility", "hidden");
        }).click(function (event) {
            if (menuStat == "over") {
                back.css("background-image", "url(" + skinpath + "/images/menuItem_active.gif)");
                menuStat = "active";
                //显示下级菜单
                showSubMenu(this);
            } else {
                back.css("background-image", "url(" + skinpath + "/images/menuItem_over.gif)");
                menuStat = "over";
                hideOtherSubMenu();
            }
            event.stopPropagation();
        });

    }
}

function showSubMenu(mainMenu) {
    hideOtherSubMenu();

    var menuId = $(mainMenu).attr("menuId");
    var subMenuDiv = $("div#sm" + menuId);
    var subMenuBackDiv;

    if (subMenuDiv.length == 0) {
        subMenuDiv = $("<div></div>").addClass("subMenuDiv").appendTo("div.menu").attr("id", "sm" + menuId);
        subMenuBackDiv = $("<div></div>").addClass("subMenuItemBack").appendTo(subMenuDiv);
        subMenuDiv.css("left", mainMenu.offsetLeft).css("top", mainMenu.offsetTop + mainMenu.offsetHeight - 1);
        var subMenuItems = menuData[menuId]["subMenuList"];
        // console.log('subMenuItems---' + subMenuItems);
        for (var subMenuItemId in subMenuItems) {
            var menuItem;
            // console.log(subMenuItems[subMenuItemId]);
            if (subMenuItems[subMenuItemId]["type"] != 3) {
                menuItem = $("<div></div>").addClass("subMenuItem").html(subMenuItems[subMenuItemId]["name"]).attr("menuId", subMenuItemId);
            } else {
                menuItem = $("<div></div>").addClass("subMenuSeparateLineDiv").html("<div class='subMenuSeparateLine'></div>").appendTo(subMenuDiv);
            }
            if (subMenuItems[subMenuItemId]["action"]) {
                $(menuItem).attr("action", subMenuItems[subMenuItemId]["action"]["name"]);
                $(menuItem).attr("name", subMenuItems[subMenuItemId]["name"]);
            }
            $(menuItem).appendTo(subMenuDiv);
            menuItem.mousemove(function () {
                subMenuBackDiv.css("top", this.offsetTop + 1).css("left", 1).css("height", this.offsetHeight - 2).css("width", this.offsetWidth - 2);
                subMenuBackDiv.css("display", "block");
            }).mouseout(function () {
                subMenuBackDiv.css("display", "none");
            }).click(function () {
                var action = $(this).attr("action");
                // console.log('action---' + action);
                //*******地址*******
                if (action != null) {
                    window.frames["content"].location = action;
                }
                hideOtherSubMenu();
                $("div.menuItemBack").css("visibility", "hidden");
                menuStat = "over";
            });
        }
    }

    subMenuDiv.css("visibility", "visible");
    $("div.mask").css("display", "block");
}

function pageLayout() {
    $("div.main").css("height", $(window).height() - $("div.menu").height() - $("div.foot").height());
    $("div.conDiv").css("width", $("div.main").width() - 6).css("height", $("div.main").height() - 8);
}

function hideOtherSubMenu() {
    $("div[id^=sm]").css("visibility", "hidden");
    $("div.mask").css("display", "none");

}
