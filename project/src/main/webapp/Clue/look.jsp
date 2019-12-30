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


<title></title>
</head>
<body>
<style>
td{
height: 60px;
}
</style>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
	<legend>详细信息</legend>	<br/><br/>
	<div style="border:0px solid #F00;margin:0 10% 0;">
	
	<form class="layui-form" lay-filter="myform" method="post">
	
	<table >
	<tr>
	<td width="70%">
	  <div class="layui-form-item" >
	    <label class="layui-form-label">客户名称</label>
	    <div class="layui-input-block" >
	      <input type="text"  name="name" style="width:350px;" autocomplete="off"  value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	 </td>
	   
	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">接待人</label>
	    <div class="layui-input-block">
	      <input type="text"  name="username" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 </tr>
	 
	<tr>
	<td>
	   <div class="layui-form-item">
 		<label class="layui-form-label" style="width: 85px; padding-left: 15px; padding-right: 0px;">下次回访时间</label>
	    <div class="layui-input-block">
	      <input type="text"  name="nexttime" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	   </td> 
	   	
	   	
	   	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">客户状态</label>
	    <div class="layui-input-block">
	      <input type="text"  name="statusname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  <td>
	 </tr>
	
	<tr>
	 
	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">客户行业</label>
	    <div class="layui-input-block">
	      <input type="text"  name="custypename" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">地址</label>
   	      <input type="hidden"  name="province" style="width:100px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	      <input type="hidden"  name="city" style="width:100px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	      <input type="hidden"  name="area" style="width:100px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
   	    <div class="layui-input-block">
	      <input type="text"  name="address" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  
	  
	 </tr>
	  
	 <tr>
	 <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">客户等级</label>
	    <div class="layui-input-block">
	      <input type="text"  name="levelname" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  
	  <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">客户联系人</label>
	    <div class="layui-input-block">
	      <input type="text"  name="contacts" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 </tr>
	 
	 <tr>
	 <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系人性别</label>
	    <div class="layui-input-block">
	      <input type="text"  name="sexname" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  
	 <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系人电话</label>
	    <div class="layui-input-block">
	      <input type="text"  name="phone" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  </tr>
	 <tr>
	 <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系人角色</label>
	    <div class="layui-input-block">
	      <input type="text"  name="rolename" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系人职务</label>
	    <div class="layui-input-block">
	      <input type="text"  name="post" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
  </div>
	  </td>
	  </tr>
	 </table>
	 
	</form> 	
	</div>
 </fieldset>


<script type="text/javascript">
var id="${param.id}";

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


</script>
</body>
</html>