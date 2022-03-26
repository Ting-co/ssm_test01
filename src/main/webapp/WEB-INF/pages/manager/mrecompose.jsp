<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/26
  Time: 17:42
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



    <div class="layui-body">

        <div style="margin: 0 auto; max-width: 1140px; padding-top: 10px">

            <blockquote class="layui-elem-quote">注意：下述演示中的颜色只是做一个区分作用，并非栅格内置。</blockquote>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>始终等比例水平排列</legend>
            </fieldset>
        </div>
        <div style="border:1px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 10px;">

            <form class="layui-form layui-form-pane" action="usermanager/urecompose">


                <img id="image" src="static/images/headImg/${sessionScope.user.himage}" style="width:80px; height:70px;  border-radius:100%; padding: 10px;">
                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" id="test1">
                            <i class="layui-icon">&#xe67c;</i>上传图片
                        </button>
                    </div>
                </div>



                <div class="layui-form-item">
                    <label class="layui-form-label">名字</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username"  value="${sessionScope.user.username}" autocomplete="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">uuid</label>
                    <div class="mylayui-input-inline" style="padding-left: 120px;padding-top: 10px">
                        <font style="color:#b3aeae;height: 38px;" > ${sessionScope.user.uuidname}</font>
                    </div>
                </div>


                <div class="layui-form-item" pane="">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男" >
                        <input type="radio" name="sex" value="女" title="女">
                        <input type="radio" name="sex" value="其他" title="其他" d>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">手机号码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phone" value="${sessionScope.user.phone}"  lay-verify="required|phone" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-inline">
                        <input type="text" name="email"  value="${sessionScope.user.email}"  lay-verify="email" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <%--                <div class="layui-form-item">--%>
                <%--                    <label class="layui-form-label">密码</label>--%>
                <%--                    <div class="layui-input-inline">--%>
                <%--                        <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
                <%--                    </div>--%>
                <%--                    <div class="layui-form-mid layui-word-aux">请务必填写用户名</div>--%>
                <%--                </div>--%>



               <%-- <div class="layui-form-item">
                    <label class="layui-form-label">收货地址</label>
                    <div class="layui-input-inline">
                        <select name="address"  >
                            <option value="${sessionScope.user.address}">${sessionScope.user.address}</option>
                            <option value="1A" >1A101</option>
                            <option value="1A" >1A201</option>
                            <option value="1A" >1A301</option>
                            <option value="1B">1B101</option>
                            <option value="1B">1B201</option>
                            <option value="1B">1B202</option>
                            <option value="2A">2A101</option>
                            <option value="2B">2B102</option>
                            <option value="3A">3A203</option>
                        </select>
                    </div>
                </div>--%>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">留言</label>
                    <div class="layui-input-block">
                        <textarea   name="text" placeholder="${sessionScope.user.text}" class="layui-textarea"  ></textarea>
                    </div>
                </div>

                <input id="newhimage"  type="hidden" name="himage" value=""/>

                <div class="layui-form-item">
                    <input type="submit" class="layui-btn" value="确认修改">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </form>
        </div>
    </div>

</div>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$
            ,upload = layui.upload;


        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
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
                    // alert(result);
                });
            }
            , done: function (res) {

                //如果上传失败
                if (res.code>0) {
                    return layer.msg('上传失败!!!');
                }
                alert("上传头像成功");
                document.getElementById("newhimage").value=res.data.src;
            }
            , error: function () {
                alert("上传失败");
            }
        });

        //监听提交
        form.on('submit(demo2)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

    });
</script>
</body>
</html>
