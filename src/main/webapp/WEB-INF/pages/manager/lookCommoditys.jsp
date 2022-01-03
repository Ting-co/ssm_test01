<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/31
  Time: 14:00
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
    <style type="text/css">
        .layui-layout-admin .layui-body{bottom: 0;}

        .detail-div{box-sizing: border-box; width: 97%; margin: 20px auto;background: #ffffff; border: #e6e1d5 1px solid;border-radius: 5px;}
        .avatar-div{height: 50px;box-sizing: border-box; padding: 10px 20px; background: #e3e3e3;border-top-right-radius: 5px;border-top-left-radius: 5px;}
        .info-div{padding: 30px 20px;box-sizing: border-box;}
        .videoImg{width: 100%;height: 100%}
        .commoditysImg{max-width: 600px;height: 400px}

        .description-div{flex: 1; display: inline-block; padding: 0 0 0 30px; box-sizing: border-box; vertical-align: middle;}
        .description-line span{ display: inline-block;margin-top: 10px;}
        .description-line span:first-child{line-height: 30px; text-align: start;vertical-align: top; font-weight: 600;font-size: 17px;}
        .description-line span:last-child{line-height: 30px;font-size: 17px;width: 930px;}

        table[id='table']{display: none;}

        .btn{margin: 20px auto 0 auto;display: inline-block; height: 30px;line-height: 30px; color: #fff; text-align: center; width: 50px;background: #4EBBF9;}
        .btn:hover{ color: #fff; background: #15a8f9;}

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">

    <jsp:include page="../common/mheader.jsp"/>

    <div class="layui-body">
        <div class="detail-div">
            <div class="avatar-div">
                <h2>商品详情</h2>
            </div>

            <div class="info-div">
                <div style="display: flex;">
                    <div class="commoditysImg">
                    <img class="videoImg" src="static/images/commoditys/${commodity.simage}" alt="${commodity.commodity}">
                    </div>
                    <div class="description-div">
                        <h1>${commodity.commodity}</h1>
                        <div class="description-line">
                            <span>种类：</span>
                            <span>${commodity.sort}</span>
                        </div>
                        <div class="description-line">
                            <span>价格：</span>
                            <span>￥${commodity.commodity}</span>
                        </div>
                        <div class="description-line">
                            <span>库存：</span>
                            <span>￥${commodity.amount}</span>
                        </div>

                        <div class="description-line">
                            <span>发布时间：</span>
                            <span>${commodity.sdate}</span>
                        </div>
                        <div class="description-line">
                            <span>状态：</span>
                            <span><c:choose>
                                <c:when test="${commodity.state=='0'}">
                                    无货
                                </c:when>
                                <c:when test="${commodity.state=='1'}">
                                    在审核中
                                </c:when>
                                <c:when test="${commodity.state == '2'}">
                                    不通过
                                </c:when>
                                <c:when test="${commodity.state=='3'}">
                                    待售卖
                                </c:when>
                                <c:when test="${commodity.state == '4'}">
                                    售卖中
                                </c:when>
                            </c:choose></span>
                        </div>



                        <div class="description-line">
                            <span>审核留言：</span>
                            <span>${commodity.message}</span>
                        </div>

                        <div class="description-line">
                            <span>简介：</span>
                            <span>${commodity.synopsis}</span>
                        </div>
                    </div>

                </div>
            </div>

            <div style="width: 100%;text-align: center;margin-top: 10px;">
                <a class="btn" style="" href="Mcommoditys/all">返回</a>
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
