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
<link rel="stylesheet" href="../css/xadmin.css">
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
<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
<div class="layui-input-inline">
      <input type="text" name="txt" lay-verify="title"  autocomplete="off" placeholder="请输入名称" class="layui-input input">
    </div>
	
    <button class="layui-btn layui-btn-sm" lay-event="search">查询</button>
    <button class="layui-btn layui-btn-sm" lay-event="add">新增</button>
  </div>
</script>

	<script>
	var id=${user.id};
	var p=${user.power};
	var d=${user.deptid};
	layui.use('table', function() {
		var table = layui.table;

		//第一个实例
		table.render({
			elem : '#demo',
			height : 600,
			url : 'index' //数据接口
			,
			where : {userid:id,power:p,deptid:d},
			toolbar : '#toolbarDemo',
			page : true //开启分页
			,
			cols : [ [ //表头
			{
				field : 'id',
				title : 'ID',
				sort : true,
				
			}, {
				field : 'name',
				title : '合同名称',
			}, {
				field : 'username',
				title : '签署人',
			}, {
				field : 'approvalname',
				title : '审批人',
			}, {
				field : 'customername',
				title : '客户名称',
			},{
				field : 'amount',
				title : '销售金额',
			},{
				field : 'signtime',
				title : '签署时间',
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
			
			

			//obj 行      obj.data 行数据    data.id 列
			//test  是table的lay-filter="test" 属性
			table.on('tool(test)', function(obj) {
				var data = obj.data;
				if (obj.event === 'del') { ///lay-event 属性
					
					myconfirm("刪除？",function(){
						$.post("delete", {id:data.id}, 
								function(json) {
							if(json.status!=1) console.log("");
							else{
								obj.del();
							}
							layer.close(layer.index);
								}, "json");
					});
				}else if(obj.event === 'edit'){
					openLookFrame('edit.jsp?id='+data.id);
				}
				else{
					openLookFrame('look.jsp?id='+data.id);
				}
			});

			table.on('toolbar(test)', function(obj) {
				if (obj.event === 'search') {
					var txt = $(event.target).prev().find("input").val();
					reload('demo',{txt : txt});
				} else {
					openLookFrame("add.jsp");
				}
			});

		});
	</script>
</body>
</html>