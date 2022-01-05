<%--
  Created by IntelliJ IDEA.
  User: Keafmd
  Date: 2021/2/17
  Time: 23:20
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
        <%--        <form action="usermanager/test">--%>
        <form action="pagerto/test">
            <%--            <input type="hidden" name="username" value="${sessionScope.tt}">--%>
            <input type="submit" value="测试">
        </form>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>拖拽上传</legend>
        </fieldset>

        <div class="layui-form-item layui-form-text" id="ss" style="display: none">
            <label class="layui-form-label">上传按钮</label>
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="test1">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
            </div>
            <img id="image" src="static/images/headImg/1576635039_7.jpg"
                 style="width:70px; height:70px; border-radius:50%; ">
        </div>

        <div id="layerDemo" style="margin-bottom: 0;">
            <div class="layui-btn-container">
                <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">居中弹出</button>
            </div>
        </div>
        <div id="pager" style="margin-bottom: 0;">
            <div class="daf">


                <c:forEach items="${commoditys.list}" var="commoditys">

                    <div class="layui-bg-gray" style="padding: 30px;">
                        <div class="layui-row layui-col-space15">
                            <div class="layui-col-md6">
                                <div class="layui-panel">
                                    <div style="padding: 50px 30px;">${commoditys.sid}</div>
                                </div>
                            </div>
                            <div class="layui-col-md6">
                                <div class="layui-panel">
                                    <div style="padding: 50px 30px;">${commoditys.commodity}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div id="demo7"></div>
            </div>
        </div>

        <%--        <ul class="layui-fixbar" style="right: 50px; bottom: 100px;">--%>
        <%--            <li class="layui-icon" lay-type="bar1" style="background-color:#393D49">&#xe61f;</li>--%>
        <%--            <li class="layui-icon" lay-type="bar2" style="background-color:#393D49">&#xe604;</li>--%>
        <%--            <li class="layui-icon layui-fixbar-top" lay-type="top"--%>
        <%--                style="background-color: rgb(57, 61, 73); display: none;">--%>
        <%--            </li>--%>
        <%--        </ul>--%>



    </div>
    <%--尾页--%>
    <div class="mylayui-index-bottom">
        <jsp:include page="common/bottom.jsp"/>
    </div>
</div>
<script>



    layui.use(['util', 'upload', 'element', 'laypage', 'layer'], function () {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , laypage = layui.laypage
            , util = layui.util
            , layer = layui.layer;


        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });

        //json数据的测试
        /*  var jj={
              "kk":1,
              "ss":"ss"
          }

          alert(jj)
          alert("json字符串"+JSON.stringify(jj))
          */
        var curr;
if (${commoditys.pageNum==null}){
    curr=1;
}else {
    curr=${commoditys.pageNum};
}


        //分页

        laypage.render({
            elem: 'demo7'
            , count: ${commoditys.total}
            ,limit:${commoditys.pageSize}
            ,curr:curr
            , layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            , jump: function (obj, first) {

                if (!first) {
                    var curr = obj.curr;
                    $.get("index/toPage", {"pageNum": curr}, function () {
                            location.replace("index/toindex?pageNum="+curr);

                    })
                }
            }
        });

        //常规使用 - 普通图片上传
        let uploadInst = upload.render({
            elem: '#test1'
            , url: 'usermanager/image' //改成您自己的上传接口
            , dataType: "json"
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#image').attr('src', result); //图片链接（base64）
                    // alert(result);
                });
            }
            , done: function (res) {

                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败!!!');
                }
                alert("上传头像成功" + res.data.src);

            }
            , error: function () {
                alert("上传失败");
            }
        });


        //弹窗触发事件
        var active = {
            offset: function (othis) {
                var type = othis.data('type')
                    , text = othis.text();

                layer.open({
                    type: 1
                    , offset: type //具体配置参考：https://www.layui.site/doc/modules/layer.html#offset
                    , id: 'layerDemo' + type //防止重复弹出
                    , content: $("#ss")
                    , success: function () {
                        alert("你好")
                    }
                });
            }
        };

        $('#layerDemo .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        //固定块
        util.fixbar({
            bar1: '&#xe61f;'
            , bar2: '&#xe604;'
            , css: {right: 50, bottom: 100}
            , bgcolor: '#393D49'
            , click: function (type) {
                if (type === 'bar1') {
                    layer.msg('icon 是可以随便换的')
                } else if (type === 'bar2') {
                    layer.msg('两个 bar 都可以设定是否开启')
                }
            }
        });

    });


</script>
</body>
</html>
