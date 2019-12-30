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
    <label class="layui-form-label">员工姓名</label>
    <div class="layui-input-block">
      <input type="text" name="name"  autocomplete="off" placeholder="请输入" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">手机号</label>
    <div class="layui-input-block">
 		<input type="text" name="login"  autocomplete="off" placeholder="请输入" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
	  <input type="text" name="password"  autocomplete="off" placeholder="请输入" class="layui-input">
	</div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">角色</label>
    <div class="layui-input-block">
		<input type="hidden" name="roleids">
		<input type="text" name="rolename" autocomplete="off" class="layui-input" id="role">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">员工状态</label>
    <div class="layui-input-block">
      <select name="status" >
      </select>
    </div>
  </div>
     <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <select name="sex" >
      </select>	
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">部门</label>
    <div class="layui-input-block">
		<select name="deptid" >
      </select>	
    </div>
    <br>
    <div class="layui-form-item">
    <label class="layui-form-label">限权等级</label>
    <div class="layui-input-block">
      <select name="power">
      	<option value="1">最高级</option>
      	<option value="2">部门级</option>
      	<option value="3">员工级</option>
      </select>
    </div>
   </div>
      <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>

<script type="text/javascript">
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
			{ type: 'checkbox' , fixed: 'left'},
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
		$("[name=roleids]").val(NEWJSON1.join(","))
	}
	});
	getlist("getRoleid",{},"[name=roleid]",-1);
	getarray("getSexs",{},"[name=sex]",-1);
	getarray("getStatus",{},"[name=status]",-1);
	getlist("getDeptid",{},"[name=deptid]",-1);
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
		 $.post("insert", data.field, function(json) {
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
	           elem: '#time' //指定元素
	         });

	       });
});
</script>
</body>
</html>