<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags"%>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>登录</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
 
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>

    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="./index.html">客户管理系统</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">${user.name}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a href="./login.html">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                            <cite>会员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('我的客户','Cus/member.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>我的客户</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('我的线索','Clue/clue.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>我的线索</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('客户池','Cus/member_open.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>客户池</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('线索池','Clue/clue_open.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>线索池</cite></a>
                            </li>
                            <li>

                            <li>
                                <a onclick="xadmin.add_tab('客户类型','Custype/custype.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>客户类型</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="合同管理">&#xe723;</i>
                            <cite>合同管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('合同列表','Contract/contract.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>合同列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    <s:hasPermission name="add">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li layui-icon" lay-tips="员工管理">&#xe770;</i>
                            <cite>员工管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('员工信息列表','User/user.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>员工信息列表</cite></a>
                            </li>
                                                        <li>
                                <a onclick="xadmin.add_tab('员工角色列表','User/user_role.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>员工角色列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    </s:hasPermission>
                    <s:hasPermission name="add">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li layui-icon" lay-tips="部门管理">&#xe628;</i>
                            <cite>部门管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('部门列表','Dept/dept.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>部门列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    </s:hasPermission>
                    <s:hasPermission name="add">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li layui-icon" lay-tips="产品管理">&#xe698;</i>
                            <cite>产品管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('产品列表','Goods/goods.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>产品列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    </s:hasPermission>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li layui-icon" lay-tips="客户交流">&#xe638;</i>
                            <cite>客户交流</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('回访','Revisit/revisit.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>回访区</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('预约','Reserved/reserved.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>预约区</cite></a>
                            </li>
                        </ul>
                    </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>-->-->
         <div class="x-slide_left"></div> 
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd>
                        <dd data-type="fresh">刷新</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe  name="right" src='./welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <script>//百度统计可去掉
            var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>