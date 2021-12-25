<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/19
  Time: 13:46
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
    <script src="static/jquery/jquery.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">

    <jsp:include page="../common/uheader.jsp"/>



     <div class="layui-body">
         <!-- 内容主体区域 -->
         <div style="padding: 15px;">内容主体区域。记得修改 layui.css 和 js 的路径</div>
     </div>

</div>

</body>
</html>
