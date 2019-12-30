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
<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs" lay-event="look">查看</a>
<a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
</script>
	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="add">新增</button>
  </div>
</script>
<style>
.layui-tab-item{
	height: 100%;
}
</style>
	<span style="font-size: 20px;padding-left: 20px;">详细信息</span>
	<hr>
	<div style="float: right;">
		<button class="layui-btn layui-btn-sm" id="ch" style="margin-right: 20px">收回</button>
	</div>
	<div id="look" style="border:0px solid #F00;margin:0 10% 0;">

	<form class="layui-form" lay-filter="myform" method="post">
	
	<table class="tchange">
	<tr class="st">
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
	 
	<tr class="st">
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
	<hr>

<div id="other" style="border:0px solid #F00;margin:0 10% 0;">
<div class="layui-tab layui-tab-card">
  <ul class="layui-tab-title">
    <li class="layui-this">跟踪日志</li>
    <li>日程安排</li>
    <li>合同信息</li>
    <li>上传附件</li>
  </ul>
  <div class="layui-tab-content" style="height:400px;padding: 5px;">
    <div class="layui-tab-item layui-show">
    	<table id="revisit" lay-filter="test""></table>
    </div>
    <div class="layui-tab-item">
    	<table id="reserved" lay-filter="test1""></table>
    </div>
    <div class="layui-tab-item">
    	<iframe src='member.jsp' frameborder="0" scrolling="yes" class="x-iframe" width="100%" height="100%"></iframe>
    </div>
  </div>


<script type="text/javascript">

//var id=parent.getid();
var id="${param.id}";
var cid=id;

layui.use('table', function() {
	var table = layui.table;

	//第一个实例
	table.render({
		elem : '#revisit',
		height : 400,
		url : 'revisit' //数据接口
		,
		toolbar : '#toolbarDemo',
		where : {customerid:id},
		page : true //开启分页
		,
		cols : [ [ //表头
		{
			field : 'id',
			title : 'ID',
			sort : true,
			
		}, {
			field : 'time',
			title : '回访时间',
		}, {
			field : 'customername',
			title : '客户名称',
		},{
			field : 'astatusname',
			title : '评估等级',
		},{
			fixed : 'right',
			title : '操作',
			toolbar : '#barDemo',
			width : 160,
			align : 'center'
		}

		] ],
		parseData : function(res) {
			return {
				"code" : res.code,
				"msg" : res.msg,
				"count" : res.count,
				data : res.list
			}
		}
	});
	table.render({
		elem : '#reserved',
		height : 400,
		url : 'reserved' //数据接口
		,
		toolbar : '#toolbarDemo',
		where : {customerid:id},
		page : true //开启分页
		,
		cols : [ [ //表头
			{
				field : 'id',
				title : 'ID',
				sort : true,
				
			}, {
				field : 'customername',
				title : '客户名称',
			},{
				field : 'username',
				title : '创建人',
			},{
				field : 'reservedate',
				title : '预约时间',
			},{
				field : 'execusername',
				title : '预约接待人',
			},{
				fixed : 'right',
				title : '操作',
				toolbar : '#barDemo',
				width : 160,
				align : 'center'
			}

			] ],
		parseData : function(res) {
			return {
				"code" : res.code,
				"msg" : res.msg,
				"count" : res.count,
				data : res.list
			}
		}
	});
	table.on('tool(test)', function(obj) {
		var data = obj.data;
		if(obj.event === 'look'){
			openLookFrame('look_revisit.jsp?id='+data.id);
		}else if (obj.event === 'del') { ///lay-event 属性
			
			myconfirm("删除？",function(){
				$.post("Revdelete", data, 
						function(json) {
					if(json.status!=1) console.log("");
					else{
						fresh("demo")
					}
					layer.close(layer.index);
						}, "json");
			});
		}
	});
	table.on('tool(test1)', function(obj) {
		var data = obj.data;
		if(obj.event === 'look'){
			openLookFrame('look_reserved.jsp?id='+data.id);
		}else if (obj.event === 'del') { ///lay-event 属性
			
			myconfirm("删除？",function(){
				$.post("Resdelete", data, 
						function(json) {
					if(json.status!=1) console.log("");
					else{
						fresh("demo")
					}
					layer.close(layer.index);
						}, "json");
			});
		}
	});
	table.on('toolbar(test)', function(obj) {
		if (obj.event === 'add') {
			openFrame("add_revisit.jsp");
		} 
	});
	table.on('toolbar(test1)', function(obj) {
		if (obj.event === 'add') {
			openFrame("add_reserved.jsp");
		} 
	});
});

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
		$("#look").animate({
			height: 'toggle'
		}, 500);
});

</script>
</body>
</html>