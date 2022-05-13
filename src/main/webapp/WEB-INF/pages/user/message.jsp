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
    <style>


        .ds-avatar img {
            display: block;
            width: 31px;
            height: 31px;
            background: #98c4dc;
            border-radius: 50%;
        }


        .messagebox {
            display: flex;
            flex-wrap: wrap;
        }

        .message {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 15px;
            margin: 10px;
            max-width: 500px;

        }

        #demo7 {
            margin: 0 auto;
            max-width: 1000px;
            padding-top: 10px
        }



        .content{
            /* background-color: #bfa; */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 15px;
            width: 400px;
            margin: 10px auto;
        }
        .top{
            font-size: 10px;
            display: flex;
            margin-right: 5px;
            padding: 3px;
        }
        .r-top{
            margin-left: 10px;
            display: flex;
            flex-direction: column;
            color: #aaa;
        }
        .username{
            color: rgb(51, 194, 251);
        }
        .center{
            font-size: 12px;
            margin-top: 5px;
            margin-left: 40px;
        }
        .bottom{
            margin-top: 5px;
            margin-left: 40px;
        }
        .bottom .layui-icon{
            font-size: 12px;
            margin-right: 3px;
        }
        .layui-icon-praise::before,.layui-icon-email::before{
            font-size: 14px;
        }

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <jsp:include page="../common/header.jsp"/>


    <%--主体--%>
    <div class="mylayui-index-body">
        <div class="top-message" style="margin: 0 auto; max-width: 1000px; padding-top: 10px">

            <blockquote class="layui-elem-quote">注意：请规范发言，拒绝违法违规等发言</blockquote>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>留言区</legend>
            </fieldset>
        </div>


        <div style="margin: 0 auto; max-width: 1000px; padding-top: 10px">

            <div class="messagebox">
                <c:forEach items="${messages.list}" var="obj">
                    <div class="content">
                        <div class="top">
                            <div class="left">
                                <img src="static/images/headImg/${obj.user.himage}"
                                     style="width: 30px;height: 30px;border-radius: 15px;" alt="">
                            </div>
                            <div class="right">
                                <div class="r-top">
                                    <span class="username">${obj.user.username}</span>
                                    <span class="comment">${obj.mdate}</span>
                                </div>
                            </div>
                        </div>
                        <!-- 内容 -->
                        <div class="center">
                            <span>${obj.message}</span>
                        </div>
                        <div class="bottom">
                          <i class="layui-icon layui-icon-praise"  onclick="buy()">0</i>
<%--                            <i class="layui-icon layui-icon-email">回复</i>--%>
                        </div>
                    </div>
                </c:forEach>
            </div>




        </div>
        <div id="demo7"></div>
    </div>

    <div style="border:1px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 10px;display: none;"
         id="addCommoditys">


        <form class="layui-form layui-form-pane" id="addmessage" action="">


            <div class="layui-form-item layui-form-text">

                <div class="layui-input-block">
                    <textarea name="message" class="layui-textarea" placeholder="写下你的留言.."></textarea>
                </div>
            </div>


            <div class="layui-form-item">
                <input type="button" class="layui-btn" value="添加">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </form>
    </div>


    <%--尾页--%>
    <div class="mylayui-index-bottom">
        <jsp:include page="../common/bottom.jsp"/>
    </div>
</div>
<script>

    <%--console.log('${messages}')--%>

    layui.use(['util', 'laypage', 'element'], function () {
        var element = layui.element //导航的hover效果、二级菜单等功能，需要依赖element模块
            , laypage = layui.laypage
            , table = layui.table
            , util = layui.util
            , $ = layui.jquery;
        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });


        var curr;
        if (${messages.pageNum==null}) {
            curr = 1;
        } else {
            curr =${messages.pageNum};
        }
        //分页
        laypage.render({
            elem: 'demo7'
            , count: ${messages.total}
            , limit:${messages.pageSize}
            , curr: curr
            , layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            , jump: function (obj, first) {

                if (!first) {
                    var curr = obj.curr;
                    $.get("messages/all", {"pageNum": curr}, function () {
                        location.replace("messages/all?pageNum=" + curr);
                    })
                }
            }
        });

        //执行一个laypage实例
        /*laypage.render({
            elem: 'message' //注意，这里的 test1 是 ID，不用加 # 号
            ,count:








        ${fn:length(commoditys)} //数据总数，从服务端得到
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

        $(".layui-btn").click(function () {
            var data = $("#addmessage").serialize();
            $.post("messages/add", data, function (date) {
                    if (date.msg != null) {
                        alert(date.msg);
                    }else {

                        location.replace("messages/all");
                    }
                }
            )
        })
        window.buy = function () {
            alert('sssss')
        }


        //固定块
        util.fixbar({
            bar1: '&#xe61f;'
            , bar2: '&#xe604;'
            , css: {right: 50, bottom: 100}
            , bgcolor: '#393D49'
            , click: function (type) {
                if (type === 'bar1') {
                    layer.open({
                        type: 1
                        , title: '添加留言'
                        , area: ['400px', '220px']
                        , offset: '300px'
                        , content: $("#addCommoditys")
                        , end: function () {
                            $("#addCommoditys").css({"display": "none"})

                        }

                    });
                } else if (type === 'bar2') {
                    layer.msg('两个 bar 都可以设定是否开启')
                }
            }
        });


    });
</script>
</body>
</html>
