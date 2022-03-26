<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/26
  Time: 17:42
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

    <jsp:include page="../common/mheader.jsp"/>


    <div class="layui-body">
        <!-- 内容主体区域 -->
        <%--搜索框--%>
        <div style="">
            <form class="layui-form layui-form-pane" action="messages/select">
                <div class="layui-form-item">
                    <label class="layui-form-label">搜索</label>
                    <div class="layui-input-inline">
                        <input type="text" name="messagesOrId" placeholder="请输入商品名字或商品uuid" value=""
                               autocomplete="" class="layui-input"/>
                        <input type="submit" class="layui-btn" value="搜索">
                    </div>
                </div>
            </form>
        </div>

        <%--表格主体--%>
        <div style="border: #beb9b0 solid 1px;margin-top: 30px;border-radius: 5px;">
            <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                <h2 style="margin:10px 0 10px 15px;">商品列表</h2>
            </div>
            <div style="padding:20px;">
                <table id="demo" lay-filter="demo">
                    <thead>
                    <tr>

                        <th lay-data="{type:'numbers', width:60}">序号</th>
                        <th lay-data="{field:'uid',align: 'center',sort: true}">用户id</th>
                        <th lay-data="{field:'himage',align: 'center'}">头像</th>
                        <th lay-data="{field:'uuidname',align: 'center',sort: true}">用户id名字</th>
                        <th lay-data="{field:'username',align: 'center'}">用户名字</th>
                        <th lay-data="{field:'sex',align: 'center',rowspan: 2}">性别</th>
                        <th lay-data="{field:'phone',align: 'center',rowspan: 2}">电话</th>
                        <th lay-data="{field:'email',align: 'center',rowspan: 2}">邮箱</th>
                        <th lay-data="{field:'role',align: 'center',rowspan: 2,sort: true}">用户权限</th>
                        <th lay-data="{field:'address',align: 'center',rowspan: 2}">收货地址</th>
                        <th lay-data="{field:'money',align: 'center',rowspan: 2,sort: true}">金额</th>
                        <th lay-data="{field:'operate',align: 'center'}">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${AllUser}" var="obj">
                        <tr>

                            <td></td>
                            <td>${obj.uid}</td>
                            <td><img src="static/images/headImg/${obj.himage}" class="layui-nav-img"></td>
                            <td>${obj.uuidname}</td>
                            <td>${obj.username}</td>
                            <td>${obj.sex}</td>
                            <td>${obj.phone}</td>
                            <td>${obj.email}</td>
                            <td>${obj.role==1?'管理员':'用户'}</td>
                            <td>${obj.address}</td>
                            <td>${obj.money}</td>
                            <td>
                                <c:if test="${obj.role!=1}">
                                    <a class="operateBtn" lay-event="update" objId="${obj.uid}">编辑</a>
                                    <a class="operateBtn" lay-event="delete" objId="${obj.uid}">删除</a>

                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>


    </div>

        <div style="border:0px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 10px;display: none;">
            <img id="image" src="static/images/headImg/${sessionScope.user.himage}"
                 style="width:70px; height:70px; border-radius:50%; ">
            <div class="layui-form-item layui-form-text">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="test1">
                        <i class="layui-icon">&#xe67c;</i>上传图片${sessionScope.user.himage}
                    </button>
                </div>
            </div>

            <form class="layui-form layui-form-pane" action="usermanager/urecompose">

                <div class="layui-form-item">
                    <label class="layui-form-label">名字</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" value="${sessionScope.user.username}" autocomplete=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">uuid</label>
                    <div class="mylayui-input-inline" style="padding-left: 120px;padding-top: 10px">
                        <font style="color:#b3aeae;height: 38px;"> ${sessionScope.user.uuidname}</font>
                    </div>
                </div>


                <div class="layui-form-item" pane="">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男">
                        <input type="radio" name="sex" value="女" title="女">
                        <input type="radio" name="sex" value="其他" title="其他" d>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">手机号码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phone" value="${sessionScope.user.phone}" lay-verify="required|phone"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-inline">
                        <input type="text" name="email" value="${sessionScope.user.email}" lay-verify="email"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">收货地址</label>
                    <div class="layui-input-inline">
                        <select name="address">
                            <option value="${sessionScope.user.address}">${sessionScope.user.address}</option>
                            <option value="1A">1A101</option>
                            <option value="1A">1A201</option>
                            <option value="1A">1A301</option>
                            <option value="1B">1B101</option>
                            <option value="1B">1B201</option>
                            <option value="1B">1B202</option>
                            <option value="2A">2A101</option>
                            <option value="2B">2B102</option>
                            <option value="3A">3A203</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">留言</label>
                    <div class="layui-input-block">
                        <textarea name="text" placeholder="${sessionScope.user.text}" class="layui-textarea"></textarea>
                    </div>
                </div>

                <input id="newhimage" type="hidden" name="himage" value=""/>

                <div class="layui-form-item">
                    <input type="submit" class="layui-btn" value="确认修改">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </form>
        </div>

    <script>
        //JS
        layui.use(['element', 'layer', 'util'], function () {
            var element = layui.element
                , layer = layui.layer
                , util = layui.util
                , $ = layui.jquery
                , table = layui.table
                , form = layui.form
                , laydate = layui.laydate
                , upload = layui.upload;


            //头部事件
            util.event('lay-header-event', {
                //左侧菜单事件
                menuLeft: function (othis) {
                    layer.msg('展开左侧菜单的操作', {icon: 0});
                }
            });

            /**
             * 搜索条件数据回显
             * @type {string}
             */
            var messages = "${messages}";
            if (messages != null || messages != ' ') {
                //名称文本框回显
                $("input[name='messagesOrId']").val('${messagesOrId}');
            } else {
                $("#none").css({"display": "hidden"})
            }

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


            //表单的行内操作
            //表格行操作按钮点击事件
            table.on('tool(demo)', function (obj) {
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

                //删除商品
                if (layEvent == 'delete') {
                    var id1 = $(this).attr("objId");
                    layer.confirm('确认删除该用户吗 \"' + data.username + '\" ?', {title: '提示'}, function (index) {
                        $.get('usermanager/delUserById?uid=' + id1, function (data) {
                            if (data >= 1) {
                                layer.msg("删除成功");
                                obj.del();
                            } else {
                                layer.msg("删除失败");
                            }
                        });
                        layer.close(index);
                    });
                }


            });


        });
    </script>
</body>

</html>

