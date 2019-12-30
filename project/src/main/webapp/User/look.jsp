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
	    <label class="layui-form-label">员工名称</label>
	    <div class="layui-input-block" >
	      <input type="text"  name="name" style="width:350px;" autocomplete="off"  value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	 </td>
	   
	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">手机号</label>
	    <div class="layui-input-block">
	      <input type="text"  name="login" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 </tr>
	 
	<tr>
	<td>
	   <div class="layui-form-item">
 		<label class="layui-form-label" style="width: 85px; padding-left: 15px; padding-right: 0px;">密码</label>
	    <div class="layui-input-block">
	      <input type="text"  name="password" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	   </td> 
	   	
	   	
	   	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">角色</label>
	    <div class="layui-input-block">
	      <input type="text"  name="rolename" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  <td>
	 </tr>
	
	<tr>
	 
	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">员工状态</label>
	    <div class="layui-input-block">
	      <input type="text"  name="statusname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">性别</label>
	    <div class="layui-input-block">
	      <input type="text"  name="sexname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 </tr>
	  
	 <tr>
	  <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">部门</label>
	    <div class="layui-input-block">
	      <input type="text"  name="deptname" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">限权等级</label>
	    <div class="layui-input-block">
	      <input type="text"  name="powername" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
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
var p=["","最高级","部门级","员工级"];
$.post("edit",{id:id}, function(json) {
	render('myform', json);
	$("[name=powername]").val(p[json.power]);
},"json");
$.ajax({
    type:"POST",
    url: 'role',
    data:{id:id},
    async:true,
    dataType:'json',
    contentType:"application/x-www-form-urlencoded; charset=utf-8",
    success:function (data) {
 		$("[name=rolename]").val(data);
        }
});
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