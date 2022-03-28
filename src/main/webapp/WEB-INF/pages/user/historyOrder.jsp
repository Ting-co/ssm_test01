<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/2/1
  Time: 21:37
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
    <title>shopping</title>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <script src="static/layui/layui.js" charset="utf-8"></script>
    <script src="static/jquery/jquery.js"></script>
    <style>
        body, ul, li, div, p, h1, h2, ol {
            margin: 0;
            padding: 0;
        }

        ul, li, ol {
            list-style: none;
        }

        .content {
            width: 810px;
            margin: 0 auto;
            font-family: "微软雅黑";
        }


        .logo span {
            display: inline-block;
            float: right;
            width: 60px;
            height: 30px;
            line-height: 30px;
            font-size: 14px;
            background: #ff0000;
            color: #ffffff;
            text-align: center;
            border-radius: 10px;
            margin-top: 5px;
            margin-right: 10px;
            cursor: pointer;
            font-weight: bold;
        }

        .cartList {
            /*background: url("../image/02.jpg") no-repeat;*/
            /*height: 414px;*/
            overflow: hidden;
        }

        .cartList ul {
            display: flex;
            justify-content: space-between;
            /*float: right;*/
            /*width: 450px;*/
        }

        .cartList ul:nth-of-type(1) {
            display: flex;
            margin-top: 10px;
        }

        .cartList ul {
            margin: 20px 0;
        }

        .cartList ul li {
            font-family: "微软雅黑";
            font-size: 12px;
            color: #666666;
            text-align: center;
            line-height: 25px;
            /*float: left;*/
        }

        .cartList ul li input[name="price"] {
            border: none;
            background: transparent;
            width: 45px;
            text-align: center;
        }

        .cartList ul li input[name="amount"] {
            width: 45px;
            text-align: center;
            border: 1px solid #999999;
            border-left: none;
            border-right: none;
            height: 21px;
        }

        .cartList ul li input[name="minus"], .cartList ul li input[name="plus"] {
            height: 25px;
            border: 1px #999999 solid;
            width: 25px;
            text-align: center;
        }

        .cartList ul li:nth-of-type(1) {
            width: 130px;
        }

        .cartList ul li:nth-of-type(2) {
            width: 100px;
        }

        .cartList ul li:nth-of-type(3) {
            width: 130px;
        }

        .cartList ul li p {
            cursor: pointer;
        }

        .cartList ol {
            float: right;
            clear: both;
            margin-top: 40px;
        }

        .cartList ol li {
            float: left;
        }

        .cartList ol li:nth-of-type(1) {
            color: #ff0000;
            width: 20px;
            height: 35px;
            line-height: 35px;
            text-align: center;
        }

        .cartList ol li:nth-of-type(2) {
            color: #ff0000;
            padding-left: 5px;
            padding-right: 40px;
            height: 35px;
            line-height: 35px;
            text-align: center;
        }

        .cartList ol li span {
            display: inline-block;
            float: right;
            width: 80px;
            height: 35px;
            line-height: 35px;
            font-size: 14px;
            font-family: "微软雅黑";
            background: #ff0000;
            color: #ffffff;
            text-align: center;
            /*margin-top: 5px;*/
            /*margin-right: 15px;*/
            cursor: pointer;
            font-weight: bold;
        }

    </style>
</head>
<body onload="total()">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="../common/uheader.jsp"/>

    <div class="layui-body">
        <div style="border:0px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 50px;padding-left: 50px">
            <%--           <img src="static/images/headImg/">--%>

            <div class="content">

                <div class="cartList">
                    <ul>
                        <li>当前身份</li>
                        <li>商品图片</li>
                        <li>商品名字</li>
                        <li>单价（元）</li>
                        <li>数量</li>
                        <li>实付款</li>
                        <li>交易状态</li>

                        <li>交易操作</li>
                    </ul>
                    <c:forEach items="${AllOrder.order}" var="allOrder" varStatus="status">

                        <ul style="display: flex;justify-content: space-between;align-items: center;border:1px solid #eee ;"
                            class="first${status.index}">
                            <li>
                                <c:if test="${allOrder.uid==sessionScope.user.uid}">
                                    <span class="layui-badge layui-bg-green">买家</span>
                                </c:if>
                                <c:if test="${allOrder.sid==sessionScope.user.uid}">
                                    <span class="layui-badge">卖家</span>
                                </c:if>
                            </li>

                            <li>
                                <img src="static/images/commoditys/${allOrder.commoditys.simage}" alt="" width="50"
                                     height="50">
                            </li>
                            <li>
                                    ${allOrder.commoditys.commodity}
                            </li>

                            <li>¥<input type="text" name="price" value="${allOrder.commoditys.price  }"></li>
                            <li>${allOrder.amount}</li>
                            <li class="price${status.index}">¥${allOrder.commoditys.price * allOrder.amount}</li>
                            <li>
                                <c:if test="${allOrder.uid==sessionScope.user.uid}">
                                    ${allOrder.bstate}
                                </c:if>
                                <c:if test="${allOrder.sid==sessionScope.user.uid}">
                                    ${allOrder.sstate}
                                </c:if>
                            </li>

                            <li>
                                <p onclick="orderDetails()">订单详情</p>
                                    <%--<p onclick="delete1(${status.index})">申请退款</p>--%>
                            </li>

                                <%--用于删除id--%>
                            <li style="display: none;" class="id${status.index}" value="${allOrder.oid}"></li>
                                <%--用于序列--%>
                            <li style="display: none;" class="ulid" value="${status.index}"></li>
                                <%--以下是商品id和卖家--%>
                            <li style="display: none;" class="sid${status.index}" value="${all.commoditys.sid}"></li>
                            <li style="display: none;" class="uid${status.index}" value="${all.commoditys.uid}"></li>
                        </ul>
                    </c:forEach>

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
            , $ = layui.$

            , upload = layui.upload;


        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
        });
    });


    //买家完成订单
    function okOrder(oid) {
        layer.confirm('确认收货吗 ?', {title: '提示'}, function () {
            $.post('myOrder/buyerOkOrder?oid=' + oid, function (data) {
                if (data >= 1) {
                    layer.msg(data.msg);
                } else {
                    layer.msg(data.msg);
                }
                setInterval("testTime()",1000);
            });

        });

    }

    function  testTime(){
        location.replace("usermanager/nowOrder");
    }
</script>

</body>
</html>
