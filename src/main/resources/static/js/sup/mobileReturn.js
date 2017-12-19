
var sns = [];
//添加串号
function addSerialNumber(){
	var sn1 = $.trim($("input[name='sn1']").val());
	
	if(sn1.length == 0){
		$("input[name='sn1']").focus();
		return;
	}
	
	for(var i=0;i<sns.length;i++){
		if(sns[i] == sn1){
			alert("列表中已存在串号");
			$("input[name='sn1']").val("");
			$("input[name='sn1']").focus();
			return;
		}
	}
	
	var flag = false;
    var redata = "{\"serialNumber\": " + "\"" + sn1 + "\"" + ",\"t\": " + "\"" + new Date().getTime() + "\"" + "}";
	//判断数据库是否已存在相同串号
	$.ajax({
		type: "POST",
        contentType: "application/json ; charset=utf-8",
		data: redata,
		url: "../mobileReturn/serialNumberCheck",
		async: false,
		success: function(data){
			if(data.msg == "notExist"){
				flag = true;
				alert("该串号不存在");
				$("input[name='sn1']").val("");
				$("input[name='sn1']").focus();
			} else{
				var sn = data.numberOne+"="+data.numberTwo;
				var tr = $("<tr></tr>");
				$("<td class='order'></td>").appendTo(tr);
				$("<td class='numberOne'>"+data.numberOne+"</td>").appendTo(tr);
				$("<td class='numberTwo'>"+data.numberTwo+"</td>").appendTo(tr);
				$("<td class='supplierName'>"+data.supplierName+"</td>").appendTo(tr);
				$("<td class='mobileTypeName'>"+data.mobileTypeName+"</td>").appendTo(tr);
				$("<td><a sn1="+sn1+" href='javascript:;' onclick='deleteSerialNumber(this);'>删除</a></td>").appendTo(tr);
				$("<td class='status' sn="+sn+" style='color:red;'>"+data.status+"</td>").appendTo(tr);
				
				$(tr).appendTo($("#tblSns"));
				
				//添加
				sns.push(sn1);
				
				setOrder();
			}
		},
		dataType: "json"
	});
	if(flag){
		return;
	}
}
//改变序号
function setOrder(){
	var i = 0;
	$("td.order").each(function(){
		$(this).text(++i);
	});
	
	var supplierName = $("#supplierId option:selected").text();
	var mobileTypeName = $("#mobileTypeId option:selected").text();
	$("td.status").each(function(){
		$(this).find("input").remove();
		var sn = $(this).attr("sn");
		if($(this).html() == "OK" || $(this).html() == "数据不匹配"){
			var sname = $(this).siblings(".supplierName").text();
			var mname = $(this).siblings(".mobileTypeName").text();
			if(supplierName == sname && mobileTypeName == mname){
				$(this).css("color", "green");
				$(this).html("OK");
				$("<input type='hidden' name='snList' value='"+sn+"' />").appendTo(this);
			} else{
				$(this).css("color", "red");
				$(this).html("数据不匹配");
			}
		}
	});
	
	//改变总价，数量
	$("input[name='amount']").val(getOk());
	var returnPrice = $.trim($("input[name='returnPrice']").val());
	$("input[name='totalMoney']").val(getOk() * returnPrice);
}

function getOk(){
	var amount = 0;
	$("td.status").each(function(){
		if($(this).text() == "OK"){
			amount++;
		}
	});
	return amount;
}

//删除串号
function deleteSerialNumber(a){
	if(confirm("确认删除？")){
		//移除表格
		$(a).closest("tr").remove();
		//删除数组中的值
		var sn1 = $(a).attr("sn1");
		for(var i=0;i<sns.length;i++){
			if(sn1 == sns[i]){
				sns.splice(i,1);
				break;
			}
		}
		setOrder();
	}
}

//提交验证
function check(){
	if($("#supplierId").val() == ""){
		alert("请选择供应商");
		return false;
	}
	if($("#mobileTypeId").val() == ""){
		alert("请选择机型");
		return false;
	}
	if($.trim($("input[name='returnPrice']").val()) == ""){
		alert("请输入退货价");
		return false;
	}
	setOrder();
	if(getOk() == 0){
		alert("请输入至少一个状态OK串号");
		return false;
	}
	return true;
}









