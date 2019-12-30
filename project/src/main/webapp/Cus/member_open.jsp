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
<a class="layui-btn layui-btn-xs" lay-event="take">领取</a>
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
<button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="manydel">批量删除</button>
<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="manytake">批量领取</button>
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
			url : 'index1' //数据接口
			,
			toolbar : '#toolbarDemo',
			page : true //开启分页
			,
			cols : [ [ //表头
				{type:'checkbox'},
			{
				field : 'id',
				title : 'ID',
				width : 60,
				sort : true,
				
			}, {
				field : 'name',
				title : '客户名称',
			}, {
				field : 'username',
				title : '接待人',
			}, {
				field : 'nexttime',
				title : '下次回访时间',
			}, {
				field : 'statusname',
				title : '客户状态',
			},{
				field : 'custypename',
				title : '客户行业',
			},{
				field : 'levelname',
				title : '客户等级',
			},{
				field : 'contacts',
				title : '客户联系人',
			},{
				fixed : 'right',
				title : '操作',
				toolbar : '#barDemo',
				width : 220,
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
					openFrame('edit_open.jsp?id='+data.id);
				}
				else if(obj.event === 'look'){
					openLookFrame('look.jsp?id='+data.id);
				}else{
					 data.userid=id;
					 $.post("updateFree", data, function(json) {
						 	fresh("demo");
						}, "json");
				}
			});

			table.on('toolbar(test)', function(obj) {
				if (obj.event === 'search') {
					var txt = $(event.target).prev().find("input").val();
					reload('demo',{txt : txt});
				}else if(obj.event === 'add') {
					openFrame("add_open.jsp");
				}else if(obj.event === 'manydel') {
					var checkStatus = table.checkStatus('demo');
					if(checkStatus.data.length==0){
						parent.layer.msg('请先选择要删除的数据行！', {icon: 2});
						return ;
					}
					var ids = "";
					for(var i=0;i<checkStatus.data.length;i++){
						ids += checkStatus.data[i].id+",";
					}
					parent.layer.msg('删除中...', {icon: 16,shade: 0.3,time:1000});
					 $.ajax({
	                        type:"POST",
	                        url: 'manydelete',
	                        data:ids,
	                        contentType:"application/json",
	                        success:function (json) {
	                            layer.closeAll('loading');
	                            if(json==1){
	                                parent.layer.msg('删除成功！', {icon: 1,time:2000,shade:0.2});
	                                fresh('demo')
	                            }else{
	                                parent.layer.msg('删除失败！', {icon: 2,time:2000,shade:0.2});
	                                fresh('demo')
	                            }
	                        }
	                    })
				}
				else if(obj.event === 'manytake') {
					var checkStatus = table.checkStatus('demo');
					for(var i=0;i<checkStatus.data.length;i++){
						checkStatus.data[i].userid=${user.id};
					}
					if(checkStatus.data.length==0){
						parent.layer.msg('请先选择要领取的数据行！', {icon: 2});
						return ;
					}
					parent.layer.msg('领取中...', {icon: 16,shade: 0.3,time:1000});
					 $.ajax({
	                        type:"POST",
	                        url: 'manytake',
	                        data:JSON.stringify(checkStatus.data),
	                        contentType:"application/json",
	                        success:function (json) {
	                            layer.closeAll('loading');
	                            if(json==1){
	                                parent.layer.msg('领取成功！', {icon: 1,time:2000,shade:0.2});
	                                fresh('demo')
	                            }else{
	                                parent.layer.msg('领取失败！', {icon: 2,time:2000,shade:0.2});
	                                fresh('demo')
	                            }
	                        }
	                    })
				}
			});
			

		});
	</script>
</body>
</html>