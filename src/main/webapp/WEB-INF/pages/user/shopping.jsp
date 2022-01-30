<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/1/6
  Time: 20:04
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

        .logo {
            margin: 10px 0;
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
            margin-top: 125px;
        }

        .cartList ul:nth-of-type(2) {
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
            width: 80px;
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


    <div class="content">
        <div class="logo">
            <span onclick="javascript:if (confirm('确认要关闭吗'))window.close() ">关闭</span>
        </div>
        <div class="cartList"  >
            <ul>
                <li>商品信息</li>
                <li>商品图片</li>
                <li>单价（元）</li>
                <li>数量</li>
                <li>金额（元）</li>
                <li>操作</li>
            </ul>
            <c:forEach items="${all}" var="all" varStatus="status">
            <ul style="display: flex;justify-content: space-between;align-items: center;border:1px solid #eee ;" id="first">
                <li>${all.commoditys.commodity}</li>
                <li><img src="../image/1.jpg" alt="" width="50" height="50"></li>
                <li>¥<input type="text" name="price" value="21.90"></li>
                <li><input type="button" name="minus" value="-" onclick="minus(${status.index})">
                    <input type="text" name="amount"
                           value="1">
                    <input type="button"
                           name="plus"
                           value="+"
                           onclick="plus(${status.index})">
                </li>
                <li id="price0">¥21.90</li>
                <li><p onclick="save()">移入收藏</p>
                    <p onclick="delete1()">删除</p></li>
            </ul>
            </c:forEach>
            <ol>
                <li id="totalPrice">&nbsp;</li>
                <li><span>结算</span></li>
            </ol>
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


    //减法
    function minus(index) {
        //获取当前数量的值
        var amounts = document.getElementsByName("amount");

        //得到第一个amount的元素的value属性的值
        var count = parseInt(amounts[index].value); //数量加1

        if (count <= 1) {
            alert("不能再减了，快没了！！");
        } else {
            //得到第一个amount的元素的value属性的值
            var count = parseInt(amounts[index].value) - 1; //数量加1

            //重新把count的值绑定在数量文本框里
            amounts[index].value = count;
            var prices = document.getElementsByName("price");
            var price = parseFloat(prices[index].value);
            //乘以Math.pow(10,2)的原因为避免失真
            var totalMoney = ((price * Math.pow(10, 2)) * count) / Math.pow(10, 2);

            document.getElementById("price" + index).innerHTML = "¥：" + totalMoney;
        }

        total();

    }

    //加法
    function plus(index) {

        //获取当前数量的值
        var amounts = document.getElementsByName("amount");

        //得到第一个amount的元素的value属性的值
        var count = parseInt(amounts[index].value) + 1; //数量加1

        //重新把count的值绑定在数量文本框里
        amounts[index].value = count;

        //当前操作端口的价格也要重新计算
        //得到当前端口的单价
        var prices = document.getElementsByName("price");
        var price = parseFloat(prices[index].value);
        //乘以Math.pow(10,2)的原因为避免失真
        var totalMoney = ((price * Math.pow(10, 2)) * count) / Math.pow(10, 2);

        //把当前价格显示在文本中
        document.getElementById("price" + index).innerHTML = "¥：" + totalMoney;

        total();
    }


    //求总金额

    function total() {

        //得到所有的数量
        var counts = document.getElementsByName("amount");

        //得到所有的单价
        var prices = document.getElementsByName("price");

        var sumMoney = 0;

        for (var i = 0; i < counts.length; i++) {

            //乘以Math.pow(10,2)的原因为避免失真
            sumMoney += (parseFloat(prices[i].value) * Math.pow(10, 2) * parseInt(counts[i].value) / Math.pow(10, 2));
        }

        //把总金额显示再指定的元素中
        document.getElementById("totalPrice").innerHTML = "¥：" + sumMoney;

    }


    //加入收藏
    function save() {
        if (confirm("确认要收藏吗？")) {
            alert("收藏成功！");
        }

    }

    //删除
    function delete1() {
        if (confirm("确认要删除吗？")) {
            var del = document.getElementById("first");
            del.parentNode.removeChild(del);
            alert("删除成功！！");
        }
    }


</script>

</body>
</html>
