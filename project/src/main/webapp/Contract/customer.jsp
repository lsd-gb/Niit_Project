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
.layui-input{
 background-color: rgb(241, 241, 241);
     border:none;
     border-radius:0;
     box-shadow: 0px 0px 0px 0px;
     text-align: center;
}
.layui-form-label{
	
}
</style>
	<span style="font-size: 20px;padding-left: 20px;">详细信息</span>
	<hr>
	<div id="look" style="border:0px solid #F00;margin:0;">

	<form class="layui-form" lay-filter="myform" method="post">
	
	<table class="tchange">
	<tr class="st">
	<td width="70%">
	  <div class="layui-form-item" >
	    <label class="layui-form-label">客户名称</label>
	    <div class="layui-input-block" >
	      <input type="text"  name="name" style="width:350px;"  autocomplete="off"  value="" class="layui-input" disabled="disabled">
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
	 
	<tr class="st">
	 
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
	  
	 <tr class="change">
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
	 
	 <tr class="change">
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
	 <tr class="change">
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
<script type="text/javascript">
var id=parent.cid;
	$.post("customer",{id:id}, function(json) {
	render('myform', json);
	var ad=$("[name='province']").val()+$("[name='city']").val()+$("[name='area']").val()+$("[name='address']").val();
	$("[name='address']").val(ad);
},"json");
</script>
</body>
</html>