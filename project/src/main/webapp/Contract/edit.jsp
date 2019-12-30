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
<link rel="stylesheet" href="../css/xadmin.css">
<script type="text/javascript" src="/CRM/js/tableSelect.js"></script>
<title></title>
</head>
<body>
<style>
select{
	width: 220px;
}
.layui-input-block{
	width: 260px;
}
.g{
	width:60px;
}
</style>
<div style="width: 50%;display: inline-block;">
<form class="layui-form" lay-filter="myform">
<input type="hidden" name="id" >
<input type="hidden" name="number" >
  <div class="layui-form-item">
    <label class="layui-form-label">合同名称</label>
    <div class="layui-input-block">
      <input type="text" name="name"  autocomplete="off" placeholder="请输入" class="layui-input" >
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">签署人</label>
    <div class="layui-input-block">
      <select name="userid" >
      </select>
    </div>
  </div>
  	<div class="layui-form-item">
		<label class="layui-form-label">审批人</label>
		<div class="layui-input-block">
			<input type="text" name="approvalname" placeholder="请输入" autocomplete="off" class="layui-input" id="demo">
		</div>
	</div>
    <div class="layui-form-item">
    <label class="layui-form-label">客户名称</label>
    <div class="layui-input-block">
      <select name="customerid" >
      </select>
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">销售金额</label>
    <div class="layui-input-block">
		<input class="layui-input" type="text" name="amount" >
    </div>
  </div>
     <div class="layui-form-item">
    <label class="layui-form-label">签署时间</label>
    <div class="layui-input-block">
    <input class="layui-input" type="text" autocomplete="off" name="signtime" id="sign">
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">合同开始时间</label>
    <div class="layui-input-block">
		<input class="layui-input" type="text" autocomplete="off" name="begintime" id="begin">
    </div>
    </div>
    <div class="layui-form-item">
    <label class="layui-form-label">合同结束时间</label>
    <div class="layui-input-block">
		<input class="layui-input" type="text"  autocomplete="off" name="endtime" id="end">    </div>
   </div>
    <div style="width: 50%;display: inline-block;position: absolute;left: 30%;top:0;">
	<div class="layui-form-item">
    <label class="layui-form-label">商品</label>
    <div class="layui-input-block">
    	<input class="layui-input" type="hidden"  autocomplete="off" name="goodsid">
    	<input class="layui-input" type="text"  autocomplete="off" name="goodsname" id="goods">
    </div>
    </div>
    <div class="layui-form-item">
    <label class="layui-form-label">商品详情表</label>
        <div class="layui-input-block">
        	<table class="layui-table">
			  <colgroup>
			    <col width="300">
			    <col width="300">
			    <col width="300">
			    <col width="300">
			    <col width="300">
			    <col width="300">
			  </colgroup>
			  <thead>
			    <tr>
			      <th>序号</th>
			      <th>商品名称</th>
			      <th>销售单价</th>
			      <th>折扣(%)</th>
			      <th>个数</th>
			      <th>统计</th>
			    </tr> 
			  </thead>
			  <tbody>
			    <tr>
			    	<td class="gtd"><input class="g" id="id" name="gd_id" type="text" readonly="readonly"></td>
        		    <td class="gtd"><input class="g" id="goodsname" type="text" readonly="readonly"></td>
        			<td class="gtd"><input class="g" id="price" name="price" type="text" readonly="readonly"></td>
        			<td class="gtd"><input class="g" id="discount" name="discount" type="text" value="0"></td>
        			<td class="gtd"><input class="g" id="amount"  name="quantity" type="text"></td>
        			<td class="gtd"><input class="g" name="statistics" type="text" readonly="readonly"></td>
			    </tr>
			  </tbody>
			</table>
    	</div>
    </div>
</div>
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>
</div>
<script type="text/javascript">
var id="${param.id}";
$.post("edit", {id:id}, function(json) {
	getlist("getUserid",{},"[name=userid]",json.userid);
	getlist("getCustomerid",{},"[name=customerid]",json.customerid);
	getlist("getGoodsid",{},"[name=goodsid]",json.goodsid);
	$.post("getGoods_details", {contractnumber:json.number}, function(goods) {
		render('myform', json);
		$("#goodsname").val(json.goodsname);
		$("#id").val(goods.id);
		$("#price").val(goods.price);
		$("#amount").val(goods.quantity);
		$("#discount").val(goods.discount);
		$("[name=statistics]").val(goods.statistics);
		}, "json");
	}, "json");
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
layui.use(['laydate','form'], function(){
    var laydate = layui.laydate;
    var  form = layui.form;
    
    //执行一个laydate实例
    laydate.render({
      elem: '#sign' //指定元素
    ,trigger: 'click'
    });
    laydate.render({
          elem: '#begin'
       ,trigger: 'click'//指定元素
    });
    laydate.render({
          elem: '#end' //指定元素
    	,trigger: 'click'
    });

  });

</script>
<script type="text/javascript">
	var pz=0;
	var p=0;
	var form = layui.form;
		form.render();
	var tableSelect = layui.tableSelect;

	tableSelect.render({
		elem: '#goods',
		searchKey: 'my',
		checkedKey: 'id',
		searchPlaceholder: '自定义文字和name',
		table: {
			url : 'goods' //数据接口
			,
			cols : [ [ //表头
				{ type: 'radio' , fixed: 'left'},
			{
				field : 'id',
				title : 'ID',
				sort : true,
				
			}, {
				field : 'name',
				title : '商品名称',
			}, {
				field : 'price',
				title : '单价',
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
		},
		done: function (elem, data) {
			var NEWJSON = []
			var NEWJSON1 = [];
			var NEWJSON2 = [];
			layui.each(data.data, function (index, item) {
				NEWJSON.push(item.id);
				NEWJSON1.push(item.name);
				NEWJSON2.push(item.price);
				p=item.price;
			})
			elem.val(NEWJSON1.join(","));
			$("[name=goodsid]").val(NEWJSON.join(","));
			$("#goodsname").val(NEWJSON1);
			$("#price").val(NEWJSON2);
		}
	});
	$("#discount").bind("input propertychange",function(){
		pz=p*$("#amount").val()*(1-$("#discount").val()/100);
		$("[name=amount]").val(pz);
		$("[name=statistics]").val(pz);
	});
	$("#amount").bind("input propertychange",function(){
		pz=p*$("#amount").val()*(1-$("#discount").val()/100);
		$("[name=amount]").val(pz);
		$("[name=statistics]").val(pz);
	});
	tableSelect.render({
		elem: '#demo',
		searchKey: 'my',
		checkedKey: 'id',
		searchPlaceholder: '自定义文字和name',
		table: {
			url : 'user' //数据接口
			,
			cols : [ [ //表头
				{ type: 'checkbox' , fixed: 'left'},
			{
				field : 'id',
				title : 'ID',
				width : 80,
				sort : true,
				
			}, {
				field : 'name',
				title : '客户名称',
			}, {
				field : 'rolename',
				title : '角色',
				width : 140
			}, {
				field : 'deptname',
				title : '部门',
				width : 140
			},{
				field : 'statusname',
				title : '员工状态',
				width : 140
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
		},
		done: function (elem, data) {
			var NEWJSON = []
			layui.each(data.data, function (index, item) {
				NEWJSON.push(item.name)
			})
			elem.val(NEWJSON.join(","))
		}
	});

</script>
</body>
</html>