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
            <a href="usermanager/test">ss</a>
        </div>
        <form action="usermanager/test">
            <input type="hidden" name="username" value="${sessionScope.tt}">
            <input type="submit" value="测试">
        </form>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>拖拽上传</legend>
        </fieldset>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">上传按钮</label>
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="test1">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
            </div>
        </div>
        <img id="image" src="static/images/headImg/1576635039_7.jpg" style="width:70px; height:70px; border-radius:50%; ">

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


        //常规使用 - 普通图片上传
        let uploadInst = upload.render({
            elem: '#test1'
            , url: 'usermanager/image' //改成您自己的上传接口
            ,dataType:"json"
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#image').attr('src', result); //图片链接（base64）
                    alert(result);
                });
            }
            , done: function (res) {

                //如果上传失败
                if (res.code>0) {
                    return layer.msg('上传失败!!!');
                }
                alert("成功");

            }
            , error: function () {
                alert("上传失败");
            }
        });





    });
</script>
</body>
</html>
