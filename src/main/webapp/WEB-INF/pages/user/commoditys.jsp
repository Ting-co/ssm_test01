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

    <jsp:include page="../common/uheader.jsp"/>


    <div class="layui-body">
        <!-- 内容主体区域 -->
        <%--搜索框--%>
        <div style="">
            <form class="layui-form layui-form-pane" action="commoditys/select">
                <div class="layui-form-item">
                    <label class="layui-form-label">搜索</label>
                    <div class="layui-input-inline">
                        <input type="text" name="commodity" placeholder="请输入商品名字或商品uuid" value=""
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
                        <th lay-data="{field:'sid',align: 'center'}">商品uuid</th>
                        <th lay-data="{field:'simage',align: 'center',style:'height:100%;max-width:100%;' }">商品图片</th>
                        <th lay-data="{field:'commodity',align: 'center'}">商品名字</th>
                        <th lay-data="{field:'synopsis',minWidth:120,align: 'center'}">简介</th>
                        <th lay-data="{field:'price',align: 'center',sort: true}">价格</th>
                        <th lay-data="{field:'amount',align: 'center',sort: true}">库存</th>
                        <th lay-data="{field:'sdate',align: 'center',sort: true}">发布时间</th>
                        <th lay-data="{field:'sort',align: 'center',rowspan: 2}">种类</th>
                        <th lay-data="{field:'state',align: 'center'}">状态</th>
                        <th lay-data="{field:'message',align: 'center'}">审核留言</th>
                        <th lay-data="{field:'operate',align: 'center',width:222}">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${commoditys}" var="obj">
                        <tr>

                            <td></td>
                            <td>${obj.sid}</td>
                            <td><img  src="static/images/commoditys/${obj.simage} "></td>
                            <td>${obj.commodity}</td>
                            <td>${obj.synopsis}</td>
                            <td>${obj.price}</td>
                            <td>${obj.amount}</td>
                            <td>${obj.sdate}</td>
                            <td>${obj.sort}</td>
                            <td><c:choose>
                                <c:when test="${obj.state=='0'}">
                                    无货
                                </c:when>
                                <c:when test="${obj.state=='1'}">
                                    在审核中
                                </c:when>
                                <c:when test="${obj.state == '2'}">
                                    不通过
                                </c:when>
                                <c:when test="${obj.state=='3'}">
                                    待售卖
                                </c:when>
                                <c:when test="${obj.state == '4'}">
                                    售卖中
                                </c:when>
                                </c:choose>
                            </td>
                            <td>${obj.message}</td>
                            <td>
                                <a href="commoditys/look/${obj.sid}" class="operateBtn">查看</a>
                                <a class="operateBtn" lay-event="update" objId="${obj.sid}">编辑</a>
                                <a class="operateBtn" lay-event="delete" objId="${obj.sid}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <h1 id="none" style="display: none" >没有商品，快去添加商品吧</h1>
                    </tbody>
                </table>
            </div>

        </div>



        <%--留言模拟--%>
        <%--<div style="border: #beb9b0 solid 1px;margin-top: 30px;border-radius: 5px;">
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

                    <c:forEach items="${commoditys}" var="obj">
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
                    <h1 id="none" style="display: none" >没有商品，快去添加商品吧</h1>
                    </tbody>
                </table>
            </div>

        </div>--%>

        <%--添加表单--%>
        <div style="border:1px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 10px;display: none;"
             id="addCommoditys">
            <img id="image" src="/static/images/commoditys/${sessionScope.commoditys.simage}"
                 style="width:70px; height:70px; border-radius:50%; ">
            <div class="layui-form-item layui-form-text">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="test1">
                        <i class="layui-icon">&#xe67c;</i>上传商品图片${sessionScope.commoditys.simage}
                    </button>
                </div>
            </div>

            <form class="layui-form layui-form-pane" action="commoditys/add">

                <div class="layui-form-item">
                    <label class="layui-form-label">商品名字</label>
                    <div class="layui-input-inline">
                        <input type="text" name="commodity" lay-verify="required" placeholder="填写你商品的名字" autocomplete=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品价格</label>
                    <div class="layui-input-inline">
                        <input type="text" name="price" lay-verify="required" placeholder="￥" autocomplete=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品库存</label>
                    <div class="layui-input-inline">
                        <input type="text" name="amount" lay-verify="required" placeholder="个" autocomplete=""
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">商品种类</label>
                    <div class="layui-input-inline">
                        <select name="sort" lay-verify="required">
                            <option value="">请选择</option>
                            <option value="衣服装扮">衣服装扮</option>
                            <option value="美妆护肤">美妆护肤</option>
                            <option value="电子数码">电子数码</option>
                            <option value="书本文具">书本文具</option>
                            <option value="零食水果">零食水果</option>
                            <option value="项链饰品">项链饰品</option>
                        </select>
                    </div>
                </div>


                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">简介</label>
                    <div class="layui-input-block">
                        <textarea name="synopsis" class="layui-textarea"></textarea>
                    </div>
                </div>

                <input id="newsimage" type="hidden" name="simage" value=""/>

                <div class="layui-form-item">
                    <input type="submit" class="layui-btn" value="添加">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </form>
        </div>

        <%--修改表单--%>
        <div style="border:1px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 10px;display: none;"
             id="updateCommoditys">
            <img id="upimage" src=""
                 style="width:70px; height:70px; border-radius:50%; ">
            <div class="layui-form-item layui-form-text">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="utest1">
                        <i class="layui-icon">&#xe67c;</i>上传商品图片${sessionScope.commoditys.simage}
                    </button>
                </div>
            </div>

            <form class="layui-form layui-form-pane" action="commoditys/update">

                <div class="layui-form-item">
                    <label class="layui-form-label">商品名字</label>
                    <div class="layui-input-inline">
                        <input type="text" id="commodity" name="commodity" lay-verify="required" placeholder="填写你商品的名字"
                               autocomplete=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品价格</label>
                    <div class="layui-input-inline">
                        <input type="text" id="price" name="price" lay-verify="required" placeholder="￥" autocomplete=""
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品库存</label>
                    <div class="layui-input-inline">
                        <input type="text" id="amount" name="amount" lay-verify="required" placeholder="个"
                               autocomplete=""
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">商品种类</label>
                    <div class="layui-input-inline">
                        <select name="sort" lay-verify="required">
                            <option id="sort" selected:disabled style="diaplay:none" value=""></option>
                            <option value="衣服装扮">衣服装扮</option>
                            <option value="美妆护肤">美妆护肤</option>
                            <option value="电子数码">电子数码</option>
                            <option value="书本文具">书本文具</option>
                            <option value="零食水果">零食水果</option>
                            <option value="项链饰品">项链饰品</option>
                        </select>
                    </div>
                </div>


                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">简介</label>
                    <div class="layui-input-block">
                        <textarea id="synopsis" name="synopsis" class="layui-textarea"></textarea>
                    </div>
                </div>

                <input id="updatenewsimage" type="hidden" name="simage" value=""/>
                <input id="sid" type="hidden" name="sid" value=""/>

                <div class="layui-form-item">
                    <input type="submit" class="layui-btn" value="修改">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </form>
        </div>

        <%--添加的按钮--%>
        <script type="text/html" id="toolbarLeft">
            <div class="layui-inline" title="添加商品" lay-event="addCommoditys">
                <i class="layui-icon layui-icon-add-1" style="color: #77746e">
                </i>
            </div>
        </script>

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
            var myselect = "${myselect}";
            if (myselect != null || myselect != ' ') {
                //名称文本框回显
                $("input[name='commodity']").val('${myselect}');
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



            //表格头工具栏事件
            table.on('toolbar(demo)', function (obj) {
                switch (obj.event) {
                    case 'addCommoditys':    //添加商品
                        layer.open({
                            type: 1
                            , title: '添加商品'
                            , area: ['700px', '720px']
                            , content: $("#addCommoditys")
                            , end: function () {
                                $("#addCommoditys").css({"display": "none"})
                            }
                        });
                        break;
                }

            });


            //常规使用 - 添加普通图片上传
            let uploadInst = upload.render({
                elem: '#test1'
                , url: 'commoditys/image' //改成您自己的上传接口
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
                    alert("上传头像成功");
                    document.getElementById("newsimage").value = res.data.src;
                }
                , error: function () {
                    alert("上传失败");
                }
            });

            //常规使用 - 修改普通图片上传
            let updateloadInst = upload.render({
                elem: '#utest1'
                , url: 'commoditys/image' //改成您自己的上传接口
                , dataType: "json"
                , before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#upimage').attr('src', result); //图片链接（base64）
                        // alert(result);
                    });
                }
                , done: function (res) {

                    //如果上传失败
                    if (res.code > 0) {
                        return layer.msg('上传失败!!!');
                    }
                    alert("上传头像成功");
                    document.getElementById("updatenewsimage").value = res.data.src;
                }
                , error: function () {
                    alert("上传失败");
                }
            });

            //表单的行内操作
            //表格行操作按钮点击事件
            table.on('tool(demo)', function (obj) {
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

                //删除商品
                if (layEvent == 'delete') {
                    var id1 = $(this).attr("objId");
                    layer.confirm('确认删除商品 \"' + data.commodity + '\" ?', {title: '提示'}, function (index) {
                        $.get('commoditys/delete?sid=' + id1, function (data) {
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

                //编辑商品信息
                if (layEvent == 'update') {
                    //选中行的id
                    var id = $(this).attr("objId");

                    //弹窗
                    layer.open({
                        type: 1
                        , title: '修改商品信息'
                        , area: ['700px', '720px']

                        , content: $("#updateCommoditys")
                        , success: function () {
                            /*//根据选择的类型获取分类
                            layerForm.on('select(type3)', function () {
                                //获取选中的类型id
                                var type = $('#type3').val();
                                var selected = '';
                                var html = '<option value="">--请选择--</option>';

                                if (type == 0) {
                                    html = '<option value="">--请选择--</option>';
                                    $("#category5,#category6,#category7").html(html);
                                    layerForm.render();
                                } else {
                                    $.ajax({
                                        url: 'manager/video/getCategoryByPid/' + type
                                        , success: function (data) {
                                            for (var i = 0; i < data.length; i++) {
                                                html += '<option value="' + data[i].id + '">' + data[i].categoryName + '</option>'
                                            }
                                            $("#category5,#category6,#category7").html(html);
                                            layerForm.render();
                                        }
                                    })
                                }
                            });*/

                            $.ajax({
                                url: 'commoditys/getBysId'
                                , type: 'post'
                                , dataType: "json"
                                , data: {id: id}
                                , success: function (data) {
                                    // alert(JSON.stringify(data));
                                    $("#sid").attr("value", id);
                                    $("#sort").attr("value", data.sort);

                                    // $("#commodity").attr("value",data.commodity);
                                    $("#price").attr("value", data.price);
                                    $("#amount").attr("value", data.amount);
                                    document.getElementById("synopsis").value = data.synopsis;
                                    document.getElementById("commodity").value = data.commodity;
                                    document.getElementById("updatenewsimage").value = data.simage;
                                    document.getElementById("upimage").src = "static/images/commoditys/" + data.simage;
                                    document.getElementById("sort").innerHTML = data.sort;
                                    // form.render(); //更新全部
                                    form.render('select'); //刷新select选择框渲染
                                }
                                , error: function () {
                                    alert("获取商品数据失败")
                                }


                            });


                        }
                        , end() {

                            $("#updateCommoditys").css({"display": "none"})
                        }

                    });
                }
            });


        });
    </script>
</body>

</html>
