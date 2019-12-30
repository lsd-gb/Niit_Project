<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link href="/CRM/lib/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="/CRM/lib/layui/layui.all.js"></script>
<script src="/CRM/js/jquery.min.js"></script>
<script type="text/javascript" src="/CRM/js/my.js"></script>
<link rel="stylesheet" href="../css/font.css">
<link rel="stylesheet" href="../css/xadmin.css">

<title></title>
</head>
<body>
<style>
.layui-tab-item{
	height: 100%;
}
.change{
	display: none;
}
</style>
	<span style="font-size: 20px;padding-left: 20px;">详细信息</span>
	<hr>
	<div style="float: right;">
		<button class="layui-btn layui-btn-sm" id="ch" style="margin-right: 20px">展开</button>
	</div>
	<div id="look" style="border:0px solid #F00;margin:0 10% 0;">

	<form class="layui-form" lay-filter="myform" method="post">
	
	<table >
	<tr class="st">
	<td width="70%">
	  <div class="layui-form-item" >
	    <label class="layui-form-label">客户名称</label>
	    <div class="layui-input-block" >
	      <input type="text"  name="customername" style="width:350px;" autocomplete="off"  value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	 </td>
	   
	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">创建人</label>
	    <div class="layui-input-block">
	      <input type="text"  name="username" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 </tr>
	 
	<tr class="st">
	<td>
	   <div class="layui-form-item">
 		<label class="layui-form-label" style="width: 85px; padding-left: 15px; padding-right: 0px;">预约时间</label>
	    <div class="layui-input-block">
	      <input type="text"  name="reservedate" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	   </td> 
	   	
	   	
	   	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">预约接待人</label>
	    <div class="layui-input-block">
	      <input type="text"  name="execusername" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  <td>
	 </tr>
	
	<tr class="st">
	 
	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">预约状态</label>
	    <div class="layui-input-block">
	      <input type="text"  name="statusname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">执行状态</label>
   	    <div class="layui-input-block">
	      <input type="text"  name="execstatusname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  
	  
	 </tr>
	  
	 <tr class="change">
	  <td>
	  	<div class="layui-form-item">
	    <label class="layui-form-label">详细情况</label>
	    <div class="layui-input-block">
	      <textarea rows="5" name="result" class="layui-textarea"style="width:350px;"></textarea>
	    </div>
	  </div>
	  </td>
	 </tr>
	 </table>

	</form> 	
	</div>

<script type="text/javascript">



var id="${param.id}";

function getid(){
	return id;
}

$.post("edit",{id:id}, function(json) {
	render('myform', json);
	
	var ad=$("[name='province']").val()+$("[name='city']").val()+$("[name='area']").val()+$("[name='address']").val();
	$("[name='address']").val(ad);
},"json");
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
			  closeFrame();
			  parent.fresh('demo');
		  });

});

	$("#ch").click(function() {
		//判断对象是显示还是隐藏
		if($(".change").is(":hidden")){
			//表示隐藏
				$("#ch").text("收回");
				$(".change").animate({
						height: 'show'
					}, 100);
		} else {
			//表示显示
			$("#ch").text("展开");
				$(".change").animate({
						height: 'hide'
					}, 100)
		}
});

</script>
</body>
</html>