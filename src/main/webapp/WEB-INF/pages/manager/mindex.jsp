<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/7
  Time: 14:25
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
    <jsp:include page="../common/mheader.jsp"/>
   <%-- <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">二手商城</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs"><a href="">返回首页</a></li>
        </ul>




            &lt;%&ndash;用户头像&ndash;%&gt;
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="pagerto/register" >
                    <cite class="layui-hide-xs" style="color: #fff;margin-left: 5px;"></cite>
                    <c:if test="${sessionScope.user == null}">
                        未登录,点击登录
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                       欢迎用户：[ ${sessionScope.user.username} ]登录
                    </c:if>
                </a>
                <c:if test="${sessionScope.user != null}">
                    <dl class="layui-nav-child">
                        <dd><a href="">个人主页</a></dd>
                        <dd><a href="">注销</a></dd>
                    </dl>
                </c:if>
            </li>
        </ul>

    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="javascript:;">修改个人资料</a></li>
                <li class="layui-nav-item"><a href="">个人钱包</a></li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">订单中心</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">当前订单</a></dd>
                        <dd><a href="javascript:;">历史订单</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">购物车</a></li>
                <li class="layui-nav-item"><a href="">管理商品</a></li>
                <li class="layui-nav-item"><a href="">留言区</a></li>
            </ul>
        </div>
    </div>--%>

     <div class="layui-body">
         <!-- 内容主体区域 -->
         <div style="padding: 15px;">mindex内容主体区域。记得修改 layui.css 和 js 的路径</div>
     </div>

    <!-- 底部固定区域 -->
    <%-- <div class="layui-footer">

     </div>--%>
</div>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            , menuRight: function () {
                layer.open({
                    type: 1
                    , content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    , area: ['260px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });

    });


</script>
</body>
</html>
