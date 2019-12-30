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
<title></title>
</head>
<body>
<style>
select {
	width: 220px;
}
div {
	width: 260px;
}
.layui-form-label{
	
}
</style>
<form class="layui-form" lay-filter="myform">
<input type="hidden" name="id" >
   <div class="layui-form-item">
    <label class="layui-form-label">客户类型</label>
    <div class="layui-input-block">
		<input class="layui-input" autocomplete="off" placeholder="请输入"  name="name">
    </div>
  </div>
     <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>

<script type="text/javascript">
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
		 $.post("insert", data.field, function(json) {
			  closeFrame();
			  parent.fresh('demo');
			}, "json");
		    
		    return false;
		  });
});
</script>
</body>
</html>