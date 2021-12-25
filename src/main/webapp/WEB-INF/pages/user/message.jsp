<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/19
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>mindex</title>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <script src="static/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <jsp:include page="../common/header.jsp"/>


    <%--主体--%>
    <div class="mylayui-index-body">
        <div class="layui-btn-container">

            <button type="button" class="layui-btn">默认按钮</button>

        </div>

        <h1>测试保存</h1>
        <form action="account/save" method="post">
            姓名：<input type="text" name="name"/><br/>
            金额：<input type="text" name="money"/><br/>
            <input type="submit" value="保存">
        </form>
        <form action="pagerto/mindex">
            <input type="submit" value="跳转">
        </form>
        <form action="pagerto/register">
            <input type="submit" value="登录">
        </form>
        <a href="pagerto/register">ss</a>
        <a href="pagerto/test">ss</a>
    </div>

    <%--尾页--%>
    <div class="mylayui-index-bottom">
        <jsp:include page="../common/bottom.jsp"/>
    </div>
</div>
<script>


    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</body>
</html>
