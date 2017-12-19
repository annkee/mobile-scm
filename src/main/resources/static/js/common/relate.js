$.fn.extend({
    /**
     * 静态页面下拉列表联动
     * followList: 从列表
     */
    relate: function (followList, limit) {
        //主列表
        var primaryList = this;

        //从列表选项:根据主列表分类
        var followOptions = {};

        //从列表选项：未分类
        var followOptionsNot = [];

        //解析从列表，构造数据
        followList.children("option").each(function () {
            //从列表的值
            var followValue = $.trim($(this).val());

            if (followValue.length > 0) {
                //主列表关联从列表的值
                var primaryKey = $.trim($(this).attr("primaryKey"));
                //显示值
                var text = $(this).text();

                if (!followOptions[primaryKey]) {
                    followOptions[primaryKey] = [];
                }

                var option = "<option primaryKey='" + primaryKey + "' value='" + followValue + "'>" + text + "</option>";
                if (this.selected) {
                    option = $(option).attr("selected", "selected");
                }
                followOptions[primaryKey].push(option);

                followOptionsNot.push(option);
            }
        });

        //为主列表绑定change事件
        $(primaryList).change(function () {
            var primaryValue = $.trim($(this).val());
            //清空子列表
            $(followList).empty();
            //添加数据
            if (primaryValue.length > 0) {
                //获取主键下的列表选项
                var followOptionList = followOptions[primaryValue];
                if (followOptionList) {
                    if (limit) {
                        $(followList).append("<option value=''>--不限--</option>");
                    }
                    for (var i = 0; i < followOptionList.length; i++) {
                        $(followList).append(followOptionList[i]);
                    }
                } else {
                    $(followList).append("<option value=''>--无数据--</option>");
                }
            } else {
                if (limit) {
                    $(followList).append("<option value=''>--不限--</option>");
                }
                for (var i = 0; i < followOptionsNot.length; i++) {
                    $(followList).append(followOptionsNot[i]);
                }
            }
            //手动触发一次子列表的change，以便多级联动时将更新动作传递下去
            $(followList).change();
        });

        //手动触发一次change,完成列表初始化
        $(primaryList).change();

    }

})
//判断查询的复选框是否选中一个
function checkBox() {
    if ($("input[type='checkbox']").is(':checked') == true) {
        return true;
    } else {
        alert("请设置一或多个复选框中的值！");
        return false;
    }

}

