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
<script type="text/javascript" src="/CRM/js/xcity.js"></script>
<title></title>
</head>
<body>
<style>
.layui-input-block{
	width:25%
}
.layui-input-inline{width:25%}
.layui-form-label{
width: 25%;
}
</style>
 <form class="layui-form layui-col-md12  layui-form-pane" lay-filter="myform">
<input type="hidden" name="id" >
  <div class="layui-form-item">
    <label class="layui-form-label">客户名称</label>
    <div class="layui-input-block">
      <input type="text" name="name"  autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
  </div>
		<input class="layui-input" name="userid" type="hidden" value="${user.id}">
		<input class="layui-input" placeholder="下次回访时间"  name="nexttime" type="hidden" value="未指定">
    <div class="layui-form-item">
    <label class="layui-form-label">客户状态</label>
    <div class="layui-input-block">
      <select name="status" >
      </select>
    </div>
  </div>
	<div class="layui-form-item">
			<label class="layui-form-label">客户行业</label>
			<div class="layui-input-block">
				<select name="custypeid">
				</select>
		</div>
		<br>
	<div class="layui-form-item x-city" id="start">
		<label class="layui-form-label">城市联动</label>
		<div class="layui-input-inline">
			<select name="province" lay-filter="province">
				<option value="">请选择省</option>
			</select>
		</div>
		<div class="layui-input-inline">
			<select name="city" lay-filter="city">
				<option value="">请选择市</option>
			</select>
		</div>
		<div class="layui-input-inline">
			<select name="area" lay-filter="area">
				<option value="">请选择县/区</option>
			</select>
		</div>
	</div>
	<div class="layui-form-item">
    <label class="layui-form-label">详细地址</label>
    <div class="layui-input-block">
		<input class="layui-input" autocomplete="off" placeholder="地址"  name="address">
	</div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">客户等级</label>
    <div class="layui-input-block">
      <select name="level" >
      </select>
    </div>
    <br>
    <div class="layui-form-item">
    <label class="layui-form-label">客户联系人</label>
    <div class="layui-input-block">
      <input type="text" name="contacts"  autocomplete="off" placeholder="请输入联系人名称 " class="layui-input">
    </div>
   </div>
    <div class="layui-form-item">
    <label class="layui-form-label">联系人性别</label>
    <div class="layui-input-block">
      <select name="sex" >
      </select>
    </div>
     <br>
    <div class="layui-form-item">
    <label class="layui-form-label">联系人电话</label>
    <div class="layui-input-block">
      <input type="text" name="phone"  autocomplete="off" placeholder="请输入联系人电话 " class="layui-input">
    </div>
   </div>
     <div class="layui-form-item">
    <label class="layui-form-label">联系人角色</label>
    <div class="layui-input-block">
      <select name="role" >
      </select>
    </div>
     <br>
    <div class="layui-form-item">
    <label class="layui-form-label">联系人职务</label>
    <div class="layui-input-block">
      <input type="text" name="post"  autocomplete="off" placeholder="请输入联系人职务" class="layui-input">
    </div>
   </div>
   <input type="hidden" name="type" class="layui-input" value="0">
   <input type="hidden" name="free" class="layui-input" value="1">
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>

<script type="text/javascript">
	getlist("getUserid",{},"[name=userid]",-1);
	getarray("getStatus",{},"[name=status]",-1);
	getlist("getCustypeid",{},"[name=custypeid]",-1);
	getarray("getLevels",{},"[name=level]",-1);
	getarray("getSexs",{},"[name=sex]",-1);
	getarray("getRoles",{},"[name=role]",-1);
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
		 $.post("insert", data.field, function(json) {
			  closeFrame();
			  parent.fresh('demo');
			}, "json");
		    
		    return false;
		  });
});
layui.use(['form','code'], function(){
    form = layui.form;

    layui.code();

    $('#start').xcity();
    
    $('#end').xcity('广东','广州市','东山区');

  });
layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  //执行一个laydate实例
	  laydate.render({
	    elem: '#next' //指定元素
	  });
	});
</script>
</body>
</html>