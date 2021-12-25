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
    <title>Title</title>
    <base href="<%=basePath%>">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="../../static/layui/css/layui.css" media="all">
    <script src="../../static/layui/layui.js" charset="utf-8"></script>

</head>
<body>
<div class="layui-layout layui-layout-admin">
    <jsp:include page="common/header.jsp"/>
    <%--头部导航栏--%>
    <%--<div class="mylayui-index-header">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>CO二手商城</legend>
        </fieldset>
        <ul class="layui-nav">
            <li class="layui-nav-item">
                <a href="javascript:;">返回首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">求物留言区</a>
            </li>
            <li class="layui-nav-item"><a href="pagerto/login">演示</a></li>
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
                        欢迎管理员：[ ${sessionScope.user.username} ]登录
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
    </div>--%>

    <%--主体--%>
    <div class="mylayui-index-body">
        <div class="layui-btn-container">

            <button type="button" class="layui-btn">默认按钮</button>

        </div>
        <div>
            <h1>测试保存</h1>
            <form action="account/save" method="post">
                姓名：<input type="text" name="name"/><br/>
                金额：<input type="text" name="money"/><br/>
                <input type="submit" value="保存">
            </form>
            <form action="pagerto/mindex">
                <input type="submit" value="跳转">
            </form>
            <form action="pagerto/register">

                <input type="submit" value="登录">
            </form>
            <a href="pagerto/register">ss</a>
            <a href="pagerto/test">ss</a>
        </div>
        <form action="usermanager/test">
            <input type="hidden" name="username" value="${sessionScope.tt}">
            <input type="submit" value="测试">
        </form>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>拖拽上传</legend>
        </fieldset>

        <div class="layui-upload-drag" id="test10">
            <i class="layui-icon"></i>
            <p>点击上传，或将文件拖拽到此处</p>
            <div class="layui-hide" id="uploadDemoView">
                <hr>
                <img src="" alt="上传成功后渲染" style="max-width: 196px">
            </div>
        </div>


    </div>

    <%--尾页--%>
    <div class="mylayui-index-bottom">
        <jsp:include page="common/bottom.jsp"/>
    </div>
</div>
<script>
    layui.use(['upload', 'element', 'layer'], function () {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , layer = layui.layer;

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
//拖拽上传
        upload.render({
            elem: '#test10'
            , url: 'usermanager/headImg' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
            , type: 'POST'
            , processData: false // 告诉jQuery不要去处理发送的数据
            , contentType: false // 告诉jQuery不要去设置Content-Type请求头
            , done: function (res) {
                layer.msg('上传成功');
                layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', res.files.file);
                console.log(res)
            }
        });


    });
</script>
</body>
</html>
