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
<script type="text/javascript" src="/CRM/js/tableSelect.js"></script>
<title></title>
</head>
<body>
<style>
.layui-input-block{
	width:25%
}
.layui-input-inline{width:25%}
</style>
<form class="layui-form" lay-filter="myform">
<input type="hidden" name="id" >
   <div class="layui-form-item">
    <label class="layui-form-label">员工名称</label>
    <div class="layui-input-block">
    	<input type="hidden" name="userid">
		<input class="layui-input" autocomplete="off" placeholder="请输入"  name="username" id="user">
    </div>
  </div>
     <div class="layui-form-item">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-block">
    <input type="hidden" name="roleid">
		<input class="layui-input" autocomplete="off" placeholder="请输入"  name="rolename" id="role">
    </div>
  </div>
     <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>

<script type="text/javascript">
var id="${param.id}";
var tableSelect = layui.tableSelect;
tableSelect.render({
	elem: '#role',
	searchKey: 'my',
	checkedKey: 'id',
	searchPlaceholder: '自定义文字和name',
	table: {
		url : 'takeRole' //数据接口
		,
		cols : [ [ //表头
			{ type: 'radio' , fixed: 'left'},
		{
			field : 'id',
			title : 'ID',
			sort : true,
			
		}, {
			field : 'name',
			title : '名称',
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
		$("[name=roleid]").val(NEWJSON1.join(","))
	}
	});
tableSelect.render({
	elem: '#user',
	searchKey: 'my',
	checkedKey: 'id',
	searchPlaceholder: '自定义文字和name',
	table: {
		url : 'index' //数据接口
		,
		cols : [ [ //表头
			{ type: 'radio' , fixed: 'left'},
		{
			field : 'id',
			title : 'ID',
			sort : true,
			
		}, {
			field : 'name',
			title : '名称',
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
$.post("edit_role",{id:id}, function(json) {
	render('myform', json);
},"json");
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
		 $.post("update_role", data.field, function(json) {
			  closeFrame();
			  parent.fresh('demo');
			}, "json");
		    
		    return false;
		  });
});
</script>
</body>
</html>