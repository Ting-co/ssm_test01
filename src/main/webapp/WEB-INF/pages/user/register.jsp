<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/16
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
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
    <script src="static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="static/layui/css/user/style.css" media="all">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>注册</title>
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <script src="static/layui/layui.js" charset="utf-8"></script>
</head>
<body>

<div class="form-structor">

    <div class="signup">
        <h2 class="form-title" id="signup"><span>或</span>登录</h2>
        <form id="tologin"  >
            <div class="form-holder">
                <input type="email" class="input" lay-verify="email" name="email" placeholder="邮箱" />
                <input type="password" class="input" lay-verify="required" name="password"  placeholder="密码"/>
            </div>
            <input type="button" class="submit-btn" onclick="logins()" value="登录"/>

        </form>
        <div class="layui-form-item">

            <div class="layui-input-block" style="margin:0;text-align: center">
                <span>卖家</span>
                <input type="radio" name="sex" value="男" title="男" checked="">
                <span>买家</span>
                <input type="radio" name="sex" value="女" title="女">
                <span>管理员</span>
                <input type="radio" name="sex" value="禁" title="禁用" >
            </div>
        </div>
        <div class="reg-bar">
            <a class="forget" href="#" target="_blank">忘记密码</a>
        </div>
    </div>
    <div class="login slide-up">
        <div class="center">
            <h2 class="form-title" id="login"><span>或</span>注册</h2>
            <form id="toregister"  >
                <div class="form-holder">
                    <input type="text" class="input" lay-verify="required" name="username" placeholder="用户名"/>
                    <input type="email" class="input" lay-verify="email" name="email" placeholder="邮箱"/>
                    <input type="password" class="input" lay-verify="required" name="password" placeholder="密码"/>
                </div>
                <input id="register" type="button" class="submit-btn" value="注册"/>
            </form>
        </div>
    </div>
</div>
<script>
    console.clear();

    const loginBtn = document.getElementById('login');
    const signupBtn = document.getElementById('signup');

    loginBtn.addEventListener('click', (e) => {
        let parent = e.target.parentNode.parentNode;
        Array.from(e.target.parentNode.parentNode.classList).find((element) => {
            if (element !== "slide-up") {
                parent.classList.add('slide-up')
            } else {
                signupBtn.parentNode.classList.add('slide-up')
                parent.classList.remove('slide-up')
            }
        });
    });

    signupBtn.addEventListener('click', (e) => {
        let parent = e.target.parentNode;
        Array.from(e.target.parentNode.classList).find((element) => {
            if (element !== "slide-up") {
                parent.classList.add('slide-up')
            } else {
                loginBtn.parentNode.parentNode.classList.add('slide-up')
                parent.classList.remove('slide-up')
            }
        });
    });

    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.jquery
            , table = layui.table
            , form = layui.form
            , laydate = layui.laydate
            , upload = layui.upload;

        $("#register").click(function () {
            var data = $("#toregister").serialize();
            $.post("usermanager/toregister", data, function (date) {

                layer.msg(date.msg, {icon: 0,offset: '100px' })
                }
            )
        })


        window.logins=  function() {
            var data = $("#tologin").serialize();
            console.log(data);
            $.post("usermanager/tologin", data, function (date) {
                    if (date.msg != "成功") {
                        layer.msg(date.msg, {icon: 0,offset: '100px' })
                    } else {
                        location.replace("index/toindex");
                    }

                }
            )
        }
    });
</script>

</body>
</html>
