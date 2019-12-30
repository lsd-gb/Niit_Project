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
.layui-input-inline{
	width: 250px;
}
.w{
 width: 80%;
 position: absolute;
 left:15%;
 top:0;
}
</style>
<div class="w">
<form class="layui-form" lay-filter="myform">
<input type="hidden" name="id" >
  <div class="layui-form-item">
    <label class="layui-form-label">回访时间</label>
    <div class="layui-input-inline">
      <input type="text" name="time"  autocomplete="off" placeholder="请输入标题" class="layui-input" id="time">
    </div>
       <label class="layui-form-label">回访人</label>
    <div class="layui-input-inline">
    	<input type="hidden" name="customerid" value="">
		<input type="hidden" name="userid" value="${user.id}">
		<input type="text" name="username" autocomplete="off" class="layui-input" value="${user.name}">
    </div>
  </div>
   <div class="layui-form-item">

    <label class="layui-form-label">联通状态</label>
    <div class="layui-input-inline">
	  <select name="linkstatus" >
      </select>
	</div>
	    <label class="layui-form-label">客户状态</label>
    <div class="layui-input-inline">
      <select name="customerstatus" >
      </select>
    </div>
  </div>
    <div class="layui-form-item">

    <label class="layui-form-label">意向状态</label>
    <div class="layui-input-inline">
      <select name="purposestatus" >
      </select>
    </div>
        <label class="layui-form-label">评估等级</label>
    <div class="layui-input-inline">
      <select name="assessstatus" >
      </select>	
    </div>
  </div>
     <div class="layui-form-item">

  
    <label class="layui-form-label">客户意见</label>
    <div class="layui-input-inline">
		<input type="text" name="askinfo"  autocomplete="off" placeholder="请输入" class="layui-input" value=" ">
    </div>
        <label class="layui-form-label">跟踪信息</label>
    <div class="layui-input-inline">
      <input type="text" name="followinfo"  autocomplete="off" placeholder="请输入" class="layui-input" value=" ">
    </div>
    </div>
    <div class="layui-form-item">

    <label class="layui-form-label">问题反馈</label>
    <div class="layui-input-inline">
  <input type="text" name="followinfo"  autocomplete="off" placeholder="请输入 " class="layui-input" value=" ">
    </div>
        <label class="layui-form-label">备注</label>
    <div class="layui-input-inline">
  		<input type="text" name="comments"  autocomplete="off" placeholder="请输入 " class="layui-input" value=" ">
    </div>
     </div>
    <br>
   <div class="layui-form-item">
    <div class="layui-input-block" style="margin-left: 300px">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>
</div>
<script type="text/javascript">
$("[name=customerid]").val(parent.cid);
var form = layui.form;
form.render();
var tableSelect = layui.tableSelect;
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
			sort : true,
			
		}, {
			field : 'name',
			title : '员工名称',
		},{
			field : 'rolename',
			title : '角色',
		}, {
			field : 'deptname',
			title : '部门',
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
	getlist("getCustomerid",{},"[name=customerid]",parent.cid);
	getarray("getLstatus",{},"[name=linkstatus]",-1);
	getarray("getCstatus",{},"[name=customerstatus]",-1);
	getarray("getPstatus",{},"[name=purposestatus]",-1);
	getarray("getAstatus",{},"[name=assessstatus]",-1);
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
		 $.post("insert_revisit", data.field, function(json) {
			  closeFrame();
			  parent.fresh('revisit');
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