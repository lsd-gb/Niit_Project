<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link href="/CRM/lib/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="/CRM/lib/layui/layui.all.js"></script>
<script src="/CRM/js/jquery.min.js"></script>
<script type="text/javascript" src="/CRM/js/my.js"></script>
<title></title>
<style type="text/css">
.input {
	font-size: 16px; width : 200px;
	height: 30px;
	margin-top: -10px;
	margin-right: 10px;
	width: 200px;
}

.layui-form-select{width:200px;
}
</style>
</head>
<body>
	<table id="demo" lay-filter="test"></table>
	<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs" lay-event="look">查看</a>
<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">禁用</a>
<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="restart" >恢复</a>
</script>
	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <div class="layui-input-inline">
      <input type="text" name="txt" lay-verify="title"  autocomplete="off" placeholder="请输入名称" class="layui-input input">
    </div>
	<button class="layui-btn layui-btn-sm" lay-event="add">新增</button>
    <button class="layui-btn layui-btn-sm" lay-event="search">查询</button>
  </div>
</script>

	<script>
	var id=${user.id};
	layui.use('table', function() {
		var table = layui.table;

		//第一个实例
		table.render({
			elem : '#demo',
			height : 600,
			url : 'index' //数据接口
			,
			toolbar : '#toolbarDemo',
			page : true //开启分页
			,
			cols : [ [ //表头
			{
				field : 'id',
				title : 'ID',
				width : 80,
				sort : true,
				
			}, {
				field : 'name',
				title : '员工名称',
				width : 140
			}, {
				field : 'deptname',
				title : '部门',
				width : 140
			},{
				field : 'statusname',
				title : '员工状态',
				width : 140
			},{
				fixed : 'right',
				title : '操作',
				toolbar : '#barDemo',
				width : 210,
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
			
			

			//obj 行      obj.data 行数据    data.id 列
			//test  是table的lay-filter="test" 属性
			table.on('tool(test)', function(obj) {
				var data = obj.data;
				if (obj.event === 'del') { ///lay-event 属性
					
					myconfirm("禁用？",function(){
						$.post("stop", data, 
								function(json) {
							if(json.status!=1) console.log("");
							else{
								fresh('demo');
							}
							layer.close(layer.index);
								}, "json");
					});
				}else if(obj.event === 'edit'){
					openFrame('edit.jsp?id='+data.id);
				}
				else if(obj.event === 'look'){
					openLookFrame('look.jsp?id='+data.id);
				}else{
					$.post("restart", data, 
							function(json) {
						if(json.status!=1) console.log("");
						else{
							fresh('demo');
						}
						layer.close(layer.index);
							}, "json");
				}
			});

			table.on('toolbar(test)', function(obj) {
				if (obj.event === 'search') {
					var txt = $(event.target).prev().find("input").val();
					reload('demo',{txt : txt});
				}
				else if(obj.event === 'add'){
					openFrame("add.jsp");
				}
			});
		});
	</script>
</body>
</html>