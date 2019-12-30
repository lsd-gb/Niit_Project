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
	    <label class="layui-form-label">合同名称</label>
	    <div class="layui-input-block" >
	      <input type="hidden" name="number" >
	      <input type="text"  name="name" style="width:350px;" autocomplete="off"  value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	 </td>
	   
	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">签署人</label>
	    <div class="layui-input-block">
	      <input type="text"  name="username" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 </tr>
	 
	<tr class="st">
	<td>
	   <div class="layui-form-item">
 		<label class="layui-form-label">审批人</label>
	    <div class="layui-input-block">
	      <input type="text"  name="approvalname" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	   </td> 
	   	
	   	
	   	<td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">客户名称</label>
	    <div class="layui-input-block">
	      <input type="hidden" name="customerid">
	      <input type="text"  name="customername" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  <td>
	 </tr>
	
	<tr class="st">
	 
	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">销售金额</label>
	    <div class="layui-input-block">
	      <input type="text"  name="amount" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	 <td>
	   <div class="layui-form-item">
	    <label class="layui-form-label">签署时间</label>
   	    <div class="layui-input-block">
	      <input type="text"  name="signtime" style="width:350px;"  autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  
	  
	 </tr>
	  
	 <tr class="change">
	 <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">合同开始时间</label>
	    <div class="layui-input-block">
	      <input type="text"  name="begintime" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
	    </div>
	  </div>
	  </td>
	  
	  <td>
	  <div class="layui-form-item">
	    <label class="layui-form-label">合同结束时间</label>
	    <div class="layui-input-block">
	      <input type="text"  name="endtime" style="width:350px;" autocomplete="off" value="" class="layui-input" disabled="disabled">
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
  <li class="layui-this">产品详情</li>
  <li>客户信息</li>
    <li>跟踪日志</li>
    <li>上传附件</li>
  </ul>
  <div class="layui-tab-content" style="height:400px;padding: 5px;">
    <div class="layui-tab-item layui-show">
    	<table id="goods_details" lay-filter="test""></table>
    </div>
    <div class="layui-tab-item">
    	<iframe src='customer.jsp' frameborder="0" scrolling="yes" class="x-iframe" width="100%" height="100%"></iframe>
    </div>
    <div class="layui-tab-item">
    	<table id="revisit" lay-filter="test2""></table>
    </div>
    <div class="layui-tab-item">
    	<iframe src='member.jsp' frameborder="0" scrolling="yes" class="x-iframe" width="100%" height="100%"></iframe>
    </div>
  </div>


<script type="text/javascript">
var id="${param.id}";
var cid=0;
var cn;
layui.use('table', function() {
	var table = layui.table;
	$.post("edit",{id:id}, function(json) {
		$("[name=customerid]").val(json.customerid);
		cid=json.customerid;
		cn=json.number;
		table.render({
			elem : '#goods_details',
			height : 400,
			url : 'goods_details' //数据接口
			,
			where : {contractnumber:cn},
			page : true //开启分页
			,
			cols : [ [ //表头
			{
				field : 'id',
				title : '序号',
				sort : true,
				
			}, {
				field : 'goodsname',
				title : '产品名称',
			}, {
				field : 'price',
				title : '产品单价',
			},{
				field : 'discount',
				title : '折扣(%)',
			},{
				field : 'quantity',
				title : '数量',
			},{
				field : 'statistics',
				title : '小计',
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
			elem : '#revisit',
			height : 600,
			url : 'revisit' //数据接口
			,
			where : {customerid:cid},
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
			}, {
				field : 'username',
				title : '回访人',
			}, {
				field : 'lstatusname',
				title : '联通状态',
			}, {
				field : 'cstatusname',
				title : '客户状态',
			},{
				field : 'pstatusname',
				title : '意向状态',
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
		$.post("goodsByid",{id:json.goodsid},function(goods){
			json.goodsname=goods.name;
			render('myform', json);
		},"json");
	},"json");
	//第一个实例


	table.on('tool(test2)', function(obj) {
		var data = obj.data;
		if(obj.event === 'look'){
			openLookFrame('look_revisit.jsp?id='+data.id);
		}
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