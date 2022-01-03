<%--
  Created by IntelliJ IDEA.
  User: Keafmd
  Date: 2021/2/17
  Time: 23:20
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
    <%--    <link rel="stylesheet" href="static/layui/css/user/global.css" media="all">--%>
    <script src="static/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="layui-header">
<%--    <div class="mylayui-index-header">--%>
    <%--头部--%>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>水平导航菜单</legend>
    </fieldset>
    <div class="layui-logo layui-hide-xs layui-bg-black">二手商城</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <!-- 移动端显示 -->
        <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
            <i class="layui-icon layui-icon-spread-left"></i>
        </li>

        <li class="layui-nav-item layui-hide-xs"><a href="pagerto/homeindex">返回首页</a></li>
        <li class="layui-nav-item layui-hide-xs"><a href="messages/all">求物留言区</a></li>
    </ul>




    <%--用户头像--%>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item layui-hide layui-show-md-inline-block">
            <c:if test="${sessionScope.user == null}">
                <a href="javascript:;">
                    <img src="static/images/password.png" class="layui-nav-img" >
                    未登录
                </a>
                <dl class="layui-nav-child layui-anim layui-anim-upbit">
                    <dd><a href="pagerto/register">去登录或注册</a></dd>
                </dl>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <a href="javascript:;">

                    <img src="static/images/headImg/${sessionScope.user.himage}" class="layui-nav-img" >
                    欢迎用户：[ ${sessionScope.user.username} ]登录
                </a>
                <dl class="layui-nav-child layui-anim layui-anim-upbit">
                    <dd><a href="pagerto/toindex">个人主页</a></dd>
                    <dd><a href="usermanager/tologout">注销</a></dd>
                </dl>
            </c:if>
        </li>
    </ul>

</div>


</body>
</html>
