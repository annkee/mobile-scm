$.fn.extend({
    relate: function(slaveList){
        var primaryList = this;
        
        var slaveFirstOpt = $("option:first", slaveList);
        var noLimitOption = (slaveFirstOpt.length > 0 && slaveFirstOpt.val().trim().length == 0) ? slaveFirstOpt : false;
        
        var relation = {}; //分列的子列表数据
        var slaveOptions = []; //全部value非空的子列表数据
        //解析子列表，构造上述必需的数据结构
        slaveList.children("option").each(function(){
            var val = this.value.trim();
            if (val.length > 0) {
                var tmp = val.split(".");
                var catVal = tmp[0];
                var realVal = tmp[1];
                
                if (!relation[catVal]) {
                    relation[catVal] = [];
                }
                
                var option = $("<option value='" + realVal + "'>" + this.text + "</option>");
                option.toSelected = this.selected; //记录下原始是否有selected属性
                relation[catVal].push(option);
                slaveOptions.push(option);
            }
        });
        
        //主列表change时更新子列表
        primaryList.change(function(){
        
            slaveList.empty();
            var val = primaryList.val().trim();
            
            var relateList = val.length == 0 ? slaveOptions : relation[val];
            
            if (noLimitOption) {
                slaveList.append(noLimitOption);
                if (noLimitOption.attr("selected")) {
                    noLimitOption[0].selected = true;
                }
            }
            if (relateList && relateList.length > 0) {
                for (var i = 0; i < relateList.length; i++) {
                    //根据原始记录决定此项是否被选中
                    relateList[i][0].selected = relateList[i].toSeleted;
                    slaveList.append(relateList[i]);
                }
            }
            
            //如果子表没加入任何行,则加入一个代表无值的行
            if (slaveList.children("option").length == 0) {
                slaveList.append($("<option>--无数据--</option>"));
            }
            
            slaveList.change(); //手动触发一次子列表的change，以便多级联动时将更新动作传递下去
        });
        
        primaryList.change(); //手动触发一次change,完成列表初始化
    },
    
    /**
     * 动态ajax请求更新级联列表
     * @param {Object} slaveList 被更新的从列表
     * @param {Object} parameter 此参数应为一个对象，并包括六个属性<br>
     * {
     *  url(必选)：获取子列表数据的ajax请求
     *  key(可选，默认为key):发送AJAX请求时，提交给后台的主列表VALUE参数名
     *  dataList(可选，不设置则以返回的data做为有用数据): 返回的json数据中，哪个属性是用于构建option的有用数据
     *  value（可选，默认为val):返回数据中，做为OPTION VALUE部分的对象属性名
     *  text(可选，默认为text):返回数据中，做为OPTION TEXT部分的对象属性名
     *  selectedVal(可选):返回值列表中value与此值相等的项将被默认置为选中状态,不设此项则第一项被选中
     * }
     * 
     */
    ajaxRelate: function(slaveList, parameter){
    
        var primaryList = this;
        
        var noLimitOption = $("option:first", slaveList).val().trim().length == 0 ? $("option:first", slaveList) : false;
        
        primaryList.change(function(){
        
            var val = this.value.trim();
            
            var ajaxData = {
                ts: new Date().getTime()
            };
            
            //主列表值提交时参数名
            if (parameter.key) {
                ajaxData[parameter.key] = val;
            }
            else {
                ajaxData["key"] = val;
            }
            
            slaveList.empty().append("<option>正在加载...</option>");
            $.getJSON(parameter.url, ajaxData, function(data){ 
            
                if (parameter.dataList) {
                    data = data[parameter.dataList];
                }
               // [{xx:'aa', val:'bb', supid:'s001'}, {}]
                slaveList.empty();
                
				if(noLimitOption) {
					slaveList.append(noLimitOption);
				}
                for (var i = 0; i < data.length; i++) {
                    var optVal = parameter.value ? data[i][parameter.value] : data[i]["val"];
                    var optText = parameter.text ? data[i][parameter.text] : data[i]["text"];
                    var option = $("<option value='" + optVal + "'>" + text + "</option>");
                    option[0].selected = (parameter.selectedVal == optVal);
                    slaveList.append(option);
                }
                
                slaveList.change();
            });
            
        });
        
        primaryList.change();
    }
});
