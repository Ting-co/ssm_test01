<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/7
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
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
    <script src="static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="static/layui/css/user/tologin.css"  media="all">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>演示：清爽简洁的登录页面</title>

    </head>
<body>
<div class="dowebok">
    <div class="logo"></div>
    <div class="form-item">
        <input id="username" type="text" autocomplete="off" placeholder="邮箱">
        <p class="tip">请输入合法的邮箱地址</p>
    </div>
    <div class="form-item">
        <input id="password" type="password" autocomplete="off" placeholder="登录密码">
        <p class="tip">邮箱或密码不正确</p>
    </div>
    <div class="form-item"><button id="submit">登 录</button></div>
    <div class="reg-bar">
        <a class="reg" href="pagerto/register" target="_blank" >立即注册</a>
        <a class="forget" href="#" target="_blank">忘记密码</a>
    </div>
</div>
<script>
    $(function () {
        $('input').val('')
        $('#submit').on('click', function () {
            $('.tip').show()
        })
    })
</script>
</body>
</html>
