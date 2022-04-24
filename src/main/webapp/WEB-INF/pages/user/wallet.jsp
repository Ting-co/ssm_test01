<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/26
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <style>
        #car {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            text-align: center;
            margin: 10px 100px;
            border-radius: 15px;
            width: 60%;
            height: 60%;
        }

        .carMessger {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            margin: 10px 100px;
            border-radius: 15px;
            width: 60%;
            height: 40%;
        }


    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">

    <jsp:include page="../common/uheader.jsp"/>


    <div class="layui-body">


        <div class="carMessger">
            <h2 style="margin-left: 30px;padding-top: 20px ;width: auto">
                钱包余额：${sessionScope.user.money}
            </h2>
            <h5 class="header" style="margin-left: 30px; width:auto;padding-top: 20px">
                目前我正在努力去维护这网站，还有很多不是很完善的地方。</br>
                对于支付部分，我左边更支持你线下付款，如要走平台，请在下面充值。
                <p style="color: red">支付时务必填写账号的邮箱，若忘记填写请联系客服。 </p>
            </h5>
        </div>

        <div id="car">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">支付宝</li>
                    <li>微信</li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;">
                    <div class="layui-tab-item layui-show" style="margin-left: 80px">
                        <img src="static/images/zfb.jpg"
                             style="height: 300px;width: 230px">
                    </div>
                    <div class="layui-tab-item" style="margin-left: 80px">
                        <img src="static/images/wx.jpg"
                             style="height: 300px;width: 230px">
                    </div>
                </div>
            </div>

        </div>

    </div>
    <script>
        //JS
        layui.use(['element', 'layer', 'util'], function () {
            var element = layui.element
                , layer = layui.layer
                , util = layui.util
                , $ = layui.jquery
                , table = layui.table
                , form = layui.form
                , laydate = layui.laydate
                , upload = layui.upload;


            //头部事件
            util.event('lay-header-event', {
                //左侧菜单事件
                menuLeft: function (othis) {
                    layer.msg('展开左侧菜单的操作', {icon: 0});
                }
            });


        });
    </script>
</body>

</html>
