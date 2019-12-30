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
	    <label class="layui-form-label">回访时间</label>
	    <div class="layui-input-block" >
	      <input type="text"  name="time" style="width:350px;" autocomplete="off"  value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	 </td>
	   
	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">客户名称</label>
	    <div class="layui-input-block">
	      <input type="text"  name="customername" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 </tr>
	 	<tr>
	   
	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">回访人</label>
	    <div class="layui-input-block">
	      <input type="text"  name="username" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  <td>
	  	   <div class="layui-form-item">
 		<label class="layui-form-label" style="width: 85px; padding-left: 15px; padding-right: 0px;">联通状态</label>
	    <div class="layui-input-block">
	      <input type="text"  name="lstatusname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	   </td> 
	 </tr>
	<tr>
	   	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">客户状态</label>
	    <div class="layui-input-block">
	      <input type="text"  name="cstatusname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  	 
	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">意向状态</label>
	    <div class="layui-input-block">
	      <input type="text"  name="pstatusname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 </tr>
	
	<tr>

	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">评估等级</label>
	    <div class="layui-input-block">
	      <input type="text"  name="astatusname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  	  <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">客户意见</label>
	    <div class="layui-input-block">
	      <input type="text"  name="askinfo" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 </tr>
	  
	 <tr>

	  <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">跟踪信息</label>
	    <div class="layui-input-block">
	      <input type="text"  name="followinfo" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  	 <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text"  name="comments" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
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

$.post("getRevisit",{id:id}, function(json) {
	render('myform', json);
	
},"json");


</script>
</body>
</html>