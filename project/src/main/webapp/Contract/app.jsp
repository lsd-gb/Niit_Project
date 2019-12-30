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


	
	<script type="text/html" id="barDemo">
</script>
	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <div class="layui-input-inline">
      <input type="text" name="txt" lay-verify="title"  autocomplete="off" placeholder="请输入名称" class="layui-input input">
    </div>
	
    <button class="layui-btn layui-btn-sm" lay-event="search">查询</button>
  </div>
</script>

	<script>
	var id=${user.id};
	layui.use('table', function(){
        var table = layui.table;
        layer.open({
        type : 1,
        area : [ "600px", '430px' ],
        title : "选择模板",
        maxmin : false,
        content : '<div><table id="demo" lay-filter="test" ></table></div>',
        success : function(index, layero) {
            
        	table.render({
    			elem : '#demo',
    			height : 600,
    			url : 'user' //数据接口
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
            
        },
        
        btn : [ '确定', '关闭' ],
        yes : function(index, layero) {
                var checkStatus = table.checkStatus('demo'); //
                var datas = checkStatus.data;//选中的数据
                if(datas.length > 0){
                    var selectData = datas[0];
                     var tpid = selectData.id;
                     var tpname = selectData.name;
                     $('#app').val(tpname);
                     try{
                         layer.close(index);//关闭对话框.
                     }catch(e){
                         setTimeout(function(){layer.close(index)}, 100);//延时0.1秒，对应360 7.1版本bug
                     }
                }else{
                    layer.msg('请选择一个模板!');
                }
                 
            }
        });
    });
	layui.use('table', function() {
		var table = layui.table;
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
			});
		});
	</script>
</body>