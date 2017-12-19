/**
 * 常量: 菜单类型
 */
var MENUTYPE_PARENT = 1;
var MENUTYPE_NODE = 2;
var MENUTYPE_LINE = 3;


$().ready(function(){
    /**
     * 处理表格
     */
    //扩展行数
    $("table.table").each(function(){
    
        var targetNum = $(this).attr("rowNum");
        if (targetNum) {
            var curNum = $("tr", $(this)).length - 1;
            var diff = targetNum - curNum;
            if (diff > 0) {
                var tdNum = $("tr:first", $(this)).children().length;
                
                var tr;
                for (var i = 0; i < diff; i++) {
                    tr = $("<tr></tr>").appendTo($(this));
                    for (var j = 0; j < tdNum; j++) {
                        $("<td>&nbsp;</td>").appendTo(tr);
                    }
                }
            }
        }
        
    });
    
    //偶数行样式
    $("table.table tr:nth-child(2n+3)").css("background-color", "#f3f3f3");
    
    //鼠标经过样式
    /*	 
     $(".table td").mouseover(function() {
     $(this).attr("origColor", $(this).css("background-color"));
     $(this).parent().children("td").css("background-color","#ffeec2");
     }).mouseout(function() {
     $(this).parent().children("td").css("background-color", $(this).attr("origColor") || "white");
     });
     */
	
    $("form").each(function() {
		//为text, password, textare三种类型表单元素填加一个用于错误显示的DIV
		$("input:text,input:password,textarea", $(this)).each(function() {
			var errDivId = "err" + parseInt(Math.random()*100000);
			$(this).attr("errDivId", errDivId);
			$("<div style='color:red'></div>").attr("id", errDivId).insertAfter($(this));
		});
		
		ValidateFrm.bindValidate(this);
	})
});
