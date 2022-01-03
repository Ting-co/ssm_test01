<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/19
  Time: 21:03
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
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <jsp:include page="../common/header.jsp"/>


    <%--主体--%>
    <div class="mylayui-index-body">
        <div class="top-message" style="margin: 0 auto; max-width: 1000px; padding-top: 10px">

            <blockquote class="layui-elem-quote">注意：下述演示中的颜色只是做一个区分作用，并非栅格内置。</blockquote>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>始终等比例水平排列</legend>
            </fieldset>
        </div>
        <div style="margin: 0 auto; max-width: 1000px; padding-top: 10px">
        <%--留言模拟--%>
        <div style="border: #beb9b0 solid 1px;margin-top: 30px;border-radius: 5px;">
            <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                <h2 style="margin:10px 0 10px 15px;">商品列表</h2>
            </div>
            <div style="padding:20px;">
                <table id="demo" lay-filter="demo" style="border:0px ">
                    <thead>
                    <tr>
                        <th lay-data="{field:'sid',align: 'center'}"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${messages}" var="obj">
                        <tr>
                            <td>
                                <div id="message">

                                    <div class="layui-bg-gray" style="padding: 30px;">
                                        <div class="layui-row layui-col-space15">
                                            <div class="layui-col-md6">
                                                <div class="layui-card">
                                                    <div class="layui-card-header">卡片面板${obj.commodity}</div>
                                                    <div class="layui-card-body">
                                                        卡片式面板面板通常用于非白色背景色的主体内${obj.commodity}<br>
                                                        从而映衬出边框投影
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>

        </div>
        </div>
    </div>



    <%--尾页--%>
    <div class="mylayui-index-bottom">
        <jsp:include page="../common/bottom.jsp"/>
    </div>
</div>
<script>


    layui.use('laypage','element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        var laypage = layui.laypage;

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });

        //执行一个laypage实例
        /*laypage.render({
            elem: 'message' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: ${fn:length(commoditys)} //数据总数，从服务端得到
        });*/

        /**
         * 表格渲染
         */
        table.init('demo', {
            limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            , page: true //开启分页
            , toolbar: '#toolbarLeft'
            , limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, ${fn:length(commoditys)}]
            //支持所有基础参数
            // ,skin:'nob'
            // , defaultToolbar: []
        });
    });
</script>
</body>
</html>
