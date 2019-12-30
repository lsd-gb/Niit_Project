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
   <div class="layui-form-item">
    <label class="layui-form-label">接待人</label>
    <div class="layui-input-block">
      <select name="userid" >
      </select>
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">下次回访时间</label>
    <div class="layui-input-block">
		<input class="layui-input"  placeholder="下次回访时间"  autocomplete="off" name="nexttime" id="next">
	</div>
  </div>
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
      <select name="custypeid" >
      </select>
    </div>
  </div>
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
      <input type="text" name="address"  autocomplete="off" placeholder="请输入地址 " class="layui-input">
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
   <input type="hidden" name="type" class="layui-input" value="1">
   <input type="hidden" name="free" class="layui-input" value="1">
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>

<script type="text/javascript">
var id="${param.id}";
var p="${c.province}";
var c="${c.city}";
var a="${c.area}";
$.post("edit",{id:id}, function(json) {
	render('myform', json);
	getlist("getUserid",{},"[name=userid]",json.userid);
	getarray("getStatus",{},"[name=status]",json.sex);
	getlist("getCustypeid",{},"[name=custypeid]",json.custypeid);
	getarray("getLevels",{},"[name=level]",json.level);
	getarray("getSexs",{},"[name=sex]",json.sex);
	getarray("getRoles",{},"[name=role]",json.role);
	
},"json");
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
		 $.post("update", data.field, function(json) {
			  closeFrame();
			  parent.fresh('demo');
			}, "json");
		    
		    return false;
		  });
});
layui.use(['form','code'], function(){
    form = layui.form;
    layui.code();
    $('#start').xcity(p,c,a);
    
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