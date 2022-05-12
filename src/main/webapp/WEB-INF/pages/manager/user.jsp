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
        <div style="padding: 30px">
            <form class="layui-form layui-form-pane" action="usermanager/selLikeUser">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">uid</label>
                        <div class="layui-input-inline">
                            <input type="text" name="uid"  value=""  placeholder="请输入uid"  class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-inline">
                            <input type="text" name="email" lay-verify="email" value=""  class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="username"  value="" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">电话</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" value="" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <input type="submit" class="layui-btn" value="搜索">
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>




<%--表格主体--%>
        <div style="border: #beb9b0 solid 1px;margin-top: 30px;border-radius: 5px;">
            <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                <h2 style="margin:10px 0 10px 15px;">用户列表</h2>
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
                                    <a class="operateBtn" lay-event="role" role="1"  objId="${obj.uid}">升权限</a>
                                    <a class="operateBtn" lay-event="update" objId="${obj.uid}">编辑</a>
                                    <a class="operateBtn" lay-event="delete" objId="${obj.uid}">删除</a>
                                </c:if>
                                <c:if test="${obj.role==1}">
                                    <a class="operateBtn" lay-event="role" role="0" objId="${obj.uid}">降权限</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>


    </div>

        <div style="border:0px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 10px;display: none;" id="updataUser">
            <img id="image" src=""
                 style="width:70px; height:70px; border-radius:50%; ">


            <form class="layui-form layui-form-pane" action="usermanager/updataByUser">
                <input id="uid" type="hidden" name="uid" value=""/>
                <div class="layui-form-item">
                    <label class="layui-form-label">名字</label>
                    <div class="layui-input-inline">
                        <input type="text" id="username" name="username" value="" autocomplete=""
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item" pane="">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" id="nan"  name="sex" value="男" title="男">
                        <input type="radio" id="nv" name="sex" value="女" title="女">
                        <input type="radio"  id="other" name="sex" value="其他" title="其他" >
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">手机号码</label>
                    <div class="layui-input-inline">
                        <input type="text" id="phone" name="phone" value="" lay-verify="required|phone"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-inline">
                        <input type="text" id="email" name="email" value="" lay-verify="email"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">收货地址</label>
                    <div class="layui-input-inline">
                        <select name="address">
                            <option id="address" value=""></option>
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

                <div class="layui-form-item">
                    <label class="layui-form-label">金额</label>
                    <div class="layui-input-inline">
                        <input type="text" id="money" name="money" value="" autocomplete=""
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">留言</label>
                    <div class="layui-input-block">
                        <textarea id="text" name="text" placeholder="" class="layui-textarea"></textarea>
                    </div>
                </div>



                <div class="layui-form-item">
                    <input type="submit" class="layui-btn" value="确认修改">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </form>
        </div>

    <script>
       function  testTime(){
           location.replace("usermanager/allUser");
        }
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

                //名称文本框回显
                $("input[name='uid']").val('${selUser.uid}');
                $("input[name='email']").val('${selUser.email}');
                $("input[name='username']").val('${selUser.username}');
                $("input[name='phone']").val('${selUser.phone}');


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
                //删除商品
                if (layEvent == 'role') {
                    var id1 = $(this).attr("objId");
                    var role = $(this).attr("role");
                    if(role=="1"){
                        layer.confirm('确认升级为管理员吗 \"' + data.username + '\" ?', {title: '提示'}, function (index) {
                            $.ajax({
                                url: 'usermanager/updataRole?uid='+id1+'&role='+role
                                , type: 'post'
                                , success: function (data) {
                                    if (data >= 1) {
                                        layer.msg("成功");
                                    } else {
                                        layer.msg("失败");
                                    }
                                }
                                , error: function () {
                                    alert("修改失败")
                                }


                            });
                            layer.close(index);
                            setInterval("testTime()",1000);
                        });
                    }else {
                        layer.confirm('确认降级为用户吗 \"' + data.username + '\" ?', {title: '提示'}, function (index) {
                            $.ajax({
                                url: 'usermanager/updataRole?uid='+id1+'&role='+role
                                , type: 'post'
                                , success: function (data) {
                                    if (data >= 1) {
                                        layer.msg("成功");
                                    } else {
                                        layer.msg("失败");
                                    }
                                }
                                , error: function () {
                                    alert("修改失败")
                                }


                            });
                            layer.close(index);

                            setInterval("testTime()",1000);

                        });
                    }

                }


                //编辑用户信息
                if (layEvent == 'update') {
                    //选中行的id
                    var uid = $(this).attr("objId");

                    //弹窗
                    layer.open({
                        type: 1
                        , title: '修改用户信息'
                        , area: ['800px', '90%']

                        , content: $("#updataUser")
                        , success: function () {


                            $.ajax({
                                url: 'usermanager/sleUser'
                                , type: 'post'
                                , dataType: "json"
                                , data: {uid: uid}
                                , success: function (data) {
                                    console.log(data);
                                     document.getElementById("username").value = data.sleUser.username;
                                     document.getElementById("phone").value = data.sleUser.phone;
                                     document.getElementById("email").value = data.sleUser.email;
                                     document.getElementById("image").src = "static/images/headImg/" + data.sleUser.himage;
                                     document.getElementById("address").innerHTML = data.sleUser.address;
                                     document.getElementById("text").placeholder = data.sleUser.text;
                                     document.getElementById("uid").value = data.sleUser.uid;
                                     document.getElementById("money").value = data.sleUser.money;
                                     data.sleUser.sex=="男"?document.getElementById("nan").checked = true:(data.sleUser.sex=="女"?document.getElementById("nv").checked = true:document.getElementById("other").checked = true)
                                     form.render(); //更新全部
                                     form.render('select'); //刷新select选择框渲染*/
                                }
                                , error: function () {
                                    alert("获取商品数据失败")
                                }


                            });


                        }
                        , end() {

                            $("#updataUser").css({"display": "none"})
                        }

                    });
                }


            });


        });
    </script>
</body>

</html>

