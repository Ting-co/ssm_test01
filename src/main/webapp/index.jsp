<%--
  Created by IntelliJ IDEA.
  User: Keafmd
  Date: 2021/2/17
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="static/layui/css/layui.css"  media="all">
    <script src="static/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<%--头部--%>
<jsp:include page="./WEB-INF/pages/common/header.jsp"/>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>水平导航菜单</legend>
</fieldset>

<ul class="layui-nav">
    <li class="layui-nav-item layui-this"><a href="">选中</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">常规</a>
    </li>
    <li class="layui-nav-item"><a href="">导航</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">子级</a>
        <dl class="layui-nav-child">
            <dd><a href="">菜单1</a></dd>
            <dd><a href="">菜单2</a></dd>
            <dd><a href="">菜单3</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">选项</a>
        <dl class="layui-nav-child">
            <dd><a href="">选项1</a></dd>
            <dd class="layui-this"><a href="">选项2</a></dd>
            <dd><a href="">选项3</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="pagerto/login">演示</a></li>
</ul>

<div class="layui-btn-container">

    <button type="button"  class="layui-btn">默认按钮</button>

</div>

<h1>测试保存</h1>
<form action="account/save" method="post">
    姓名：<input type="text" name="name" /><br/>
    金额：<input type="text" name="money" /><br/>
    <input type="submit" value="保存">
</form>
<form action="pagerto/mindex" >
    <input type="submit" value="跳转">
</form>
<form action="pagerto/register" >
    <input type="submit" value="登录">
</form>
<script>


    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</body>
</html>
