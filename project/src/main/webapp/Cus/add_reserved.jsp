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
	width: 350px;
}
</style>
<form class="layui-form" lay-filter="myform">
 <input type="hidden" name="id">
   <div class="layui-form-item">
    <label class="layui-form-label">客户名称</label>
    <div class="layui-input-block">
   	    <input type="hidden" name="customerid">
		<input type="text"  name="customername" style="width:350px;"  autocomplete="off" value="" class="layui-input" id="customer">
    </div>
  </div>

  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">创建人</label>
    <div class="layui-input-block">
    	<input type="hidden"  name="createdate" style="width:350px;"  autocomplete="off" value="" class="layui-input"">
    	<input type="hidden" name="userid">
		<input type="text"  name="username" style="width:350px;"  autocomplete="off" value="" class="layui-input" id="user">
	</div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">预约时间</label>
    <div class="layui-input-block">
		<input type="text"  name="reservedate" style="width:350px;"  autocomplete="off" value="" class="layui-input" id="time">	
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">预约接待人</label>
    <div class="layui-input-block">
		<input type="text"  name="execusername" style="width:350px;"  autocomplete="off" value="" class="layui-input" id="exec">
    </div>
  </div>
     <div class="layui-form-item">
    <label class="layui-form-label">预约状态</label>
    <div class="layui-input-block">
      <select name="status">
      </select>	
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">执行状态</label>
    <div class="layui-input-block">
	  <select name="execstatus" >
      </select>	
    </div>
    </div>
    <div class="layui-form-item">
    <label class="layui-form-label">详细情况</label>
    <div class="layui-input-block">
 		<textarea rows="5" name="result" class="layui-textarea"style="width:350px;"></textarea>
    </div>
    </div>
    <br>
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>
<script type="text/javascript">
var form = layui.form;
form.render();
var tableSelect = layui.tableSelect;

tableSelect.render({
elem: '#customer',
searchKey: 'my',
checkedKey: 'id',
searchPlaceholder: '自定义文字和name',
table: {
	url : 'customer' //数据接口
	,
	cols : [ [ //表头
		{ type: 'radio' , fixed: 'left'},
	{
		field : 'id',
		title : 'ID',
		sort : true,
		
	}, {
		field : 'name',
		title : '客户名称',
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
	var NEWJSON1 = []
	layui.each(data.data, function (index, item) {
		NEWJSON.push(item.name);
		NEWJSON1.push(item.id);
	})
	elem.val(NEWJSON.join(","))
	$("[name=customerid]").val(NEWJSON1.join(","))
}
});
tableSelect.render({
	elem: '#user',
	searchKey: 'my',
	checkedKey: 'id',
	searchPlaceholder: '自定义文字和name',
	table: {
		url : 'user' //数据接口
		,
		cols : [ [ //表头
			{ type: 'radio' , fixed: 'left'},
		{
			field : 'id',
			title : 'ID',
			width : 80,
			sort : true,
			
		}, {
			field : 'name',
			title : '员工名称',
			width : 140
		},{
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
		var NEWJSON1 = []
		layui.each(data.data, function (index, item) {
			NEWJSON.push(item.name);
			NEWJSON1.push(item.id);
		})
		elem.val(NEWJSON.join(","))
		$("[name=userid]").val(NEWJSON1.join(","))
	}
	});
tableSelect.render({
	elem: '#exec',
	searchKey: 'my',
	checkedKey: 'id',
	searchPlaceholder: '自定义文字和name',
	table: {
		url : 'user' //数据接口
		,
		cols : [ [ //表头
			{ type: 'radio' , fixed: 'left'},
		{
			field : 'id',
			title : 'ID',
			width : 80,
			sort : true,
			
		}, {
			field : 'name',
			title : '员工名称',
			width : 140
		},{
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
		var NEWJSON1 = []
		layui.each(data.data, function (index, item) {
			NEWJSON.push(item.name);
		})
		elem.val(NEWJSON.join(","))
	}
	});
	getarray("getStatus",{},"[name=status]",-1);
	getarray("getExec",{},"[name=execstatus]",-1);
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
		 $.post("insert_reserved", data.field, function(json) {
			  closeFrame();
			  parent.fresh('demo');
			}, "json");
		    
		    return false;
		  });
	     layui.use(['laydate','form'], function(){
	         var laydate = layui.laydate;
	         var  form = layui.form;
	         //执行一个laydate实例
	         laydate.render({
	           elem: '#time' ,//指定元素
	           trigger: 'click'
	         });

	       });
});
var datetime = new Date();
var year = datetime.getFullYear();
var month = datetime.getMonth() + 1;
var day = datetime.getDate();

var now = year+"-"+month+"-"+day;
$("[name=createdate]").val(now);
</script>
</body>
</html>