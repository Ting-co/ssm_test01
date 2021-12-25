<%--
  Created by IntelliJ IDEA.
  User: Keafmd
  Date: 2021/2/17
  Time: 23:20
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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/layui/css/user/bottom.css" media="all">
    <script src="static/layui/layui.js" charset="utf-8"></script>
</head>
<body>

<%--<div class="mybottom" >
    <li class="mybottom-ul">
    <a class="mybottom-a1" href="#" >网站</a>
    <a class="mybottom-a2" href="#" > 网站</a>
    </li>
    <li class="mybottom-text"><p class="mybottom-p">© 2022 li guan ke. 保留所有权利。</p> </li>

</div>--%>

<!-- FOOTER -->
<footer class="footer text-center">
    <section class="footer-bg">
        <div class="container theme-container">
            <ul class="list-items">
                <li> <a href="javascript:;" class="hover-color"> 广告合作 </a> </li>
                <li> <a href="mailto:jakjim@gmail.com" class="hover-color"> 帮助中心 </a> </li>
                <li> <a href="javascript:;" class="hover-color" target="_blank"> 关于我们 </a> </li>
                <li> <a href="javascript:;" class="hover-color" target="_blank"> 联系我们</a> </li>
            </ul>
        </div>
    </section>
    <section class="copy-rights-bg">
        <p class="copy-rights">© 2022  li guan ke. 保留所有权利.</p>
    </section>
</footer>
<!-- /FOOTER -->


</body>
</html>
