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
        <div style="padding: 30px;">
            <form class="layui-form layui-form-pane" action="messages/select">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="text" name="messagesOrId" placeholder="请输入用户uid或留言内容" value=""
                               autocomplete="" class="layui-input"/>
                    </div>
                    <div class="layui-input-inline">
                        <input type="submit" class="layui-btn" value="搜索">
                    </div>
                </div>
            </form>
        </div>

        <%--表格主体--%>
        <div style="border: #beb9b0 solid 1px;margin-top: 30px;border-radius: 5px;">
            <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                <h2 style="margin:10px 0 10px 15px;">订单列表</h2>
            </div>
            <div style="padding:20px;">
                <table id="demo" lay-filter="demo">
                    <thead>
                    <tr>
                        <th lay-data="{field:'oid',align: 'center'}">订单号</th>
                        <th lay-data="{field:'commodity',minWidth:120,align: 'center'}">商品名</th>
                        <th lay-data="{field:'simage',align: 'center'}">商品图片</th>
                        <th lay-data="{field:'amount',align: 'center',sort: true}">购买数量</th>
                        <th lay-data="{field:'nubmer',align: 'center',sort: true}">总价</th>
                        <th lay-data="{field:'sstate',align: 'center'}">卖家状态</th>
                        <th lay-data="{field:'bstate',align: 'center'}">买家状态</th>
                        <th lay-data="{field:'odate',align: 'center',sort: true}">订单创建时间</th>
                        <th lay-data="{field:'okdate',align: 'center',sort: true}">订单完成时间</th>
                        <th lay-data="{field:'operate',align: 'center'}">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${mOrder}" var="obj">
                        <tr>

                            <td>${obj.oid}</td>
                            <td>${obj.commoditys.commodity}</td>
                            <td><img src="static/images/commoditys/${obj.commoditys.simage} "></td>
                            <td>${obj.amount}</td>
                            <td>${obj.amount*obj.commoditys.price}</td>
                            <td>${obj.sstate}</td>
                            <td>${obj.bstate}</td>
                            <td>${obj.odate}</td>
                            <td>${obj.okdate}</td>
                            <td>
                                <a class="operateBtn" lay-event="cheak" objuid="${obj.uid}" objId="${obj.oid}">查看详情</a>
                                <a class="operateBtn" lay-event="delete" objId="${obj.oid}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>


    </div>

    <%--查看订单详情--%>
    <div style="border:0px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 10px;display: none;"
         id="selMyOrder">
        <div style="flex: auto">
        <div style="display:inline-block;line-height:40px; padding: 20px ">
            <div style="flex: auto" >
                <span>订单id :  </span><span id="oid"></span>
            </div>
            <div style="flex: auto;border-color: #FAFAFA;">
                <span>商品名字 :  </span><span id="commodityName"></span>
            </div>
            <div style="flex: auto">
                <span>商品图片 :  </span>
                <img id="image" src="" style="width:70px; height:70px; ">
            </div>
            <div style="flex: auto">
                <span>卖家名字 :  </span><span id="sName"></span>
            </div>
            <div style="flex: auto">
                <span>卖家联系方式 :  </span><span id="sPhone"></span>
            </div>
            <div style="flex: auto">
                <span>购买数量 :  </span><span id="amount"></span>
            </div>
            <div style="flex: auto">
                <span>应支付金额 :  </span><span id="price"></span>
            </div>
            <div style="flex: auto">
                <span>是否已支付 :  </span><span id="payment"></span>
            </div>
        </div>
        <div style="display:inline-block;line-height:40px; padding:  20px 60px ">
            <div style="flex: auto">
                <span>买家名字 :  </span><span id="bName"></span>
            </div>
            <div style="flex: auto">
                <span>买家联系方式 :  </span><span id="bPhone"></span>
            </div>
            <div style="flex: auto">
                <span>买家收货地址 :  </span><span id="address"></span>
            </div>
            <div style="flex: auto">
                <span>卖家状态 :  </span><span id="sstate"></span>
            </div>
            <div style="flex: auto">
                <span>买家状态 :  </span><span id="bstate"></span>
            </div>
            <div style="flex: auto">
                <span>购买时间 :  </span><span id="odate"></span>
            </div>
            <div style="flex: auto">
                <span>完成时间 :  </span><span id="okdate"></span>
            </div>
        </div>
        </div>
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
                    layer.confirm('确认删除留言 \"' + data.message + '\" ?', {title: '提示'}, function (index) {
                        $.get('messages/delete?mid=' + id1, function (data) {
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

                //编辑用户信息
                if (layEvent == 'cheak') {
                    //选中行的id
                    var oid = $(this).attr("objId");
                    var uid = $(this).attr("objuid");

                    //弹窗
                    layer.open({
                        type: 1
                        , title: '查看订单信息'
                        , area: ['30%', '50%']

                        , content: $("#selMyOrder")
                        , success: function () {


                            $.ajax({
                                url: 'usermanager/selMyOrder'
                                , type: 'post'
                                , dataType: "json"
                                , data: {oid: oid, uid: uid}
                                , success: function (data) {
                                    console.log(data);
                                    console.log(data.selMyOrder.phone);

                                    document.getElementById("oid").innerHTML = data.selMyOrder.phone;
                                    document.getElementById("image").src = "static/images/commoditys/" + data.selMyOrder.order[0].commoditys.simage;
                                    document.getElementById("commodityName").innerHTML = data.selMyOrder.order[0].commoditys.commodity;
                                    document.getElementById("sName").innerHTML = data.selMyOrder.order[0].user.username;
                                    document.getElementById("sPhone").innerHTML = data.selMyOrder.order[0].user.phone;
                                    document.getElementById("amount").innerHTML = data.selMyOrder.order[0].amount;
                                    document.getElementById("price").innerHTML = data.selMyOrder.order[0].amount*data.selMyOrder.order[0].commoditys.price+' (元)';
                                    document.getElementById("payment").innerHTML = data.selMyOrder.order[0].payment==1?'已经支付':(data.selMyOrder.order[0].payment==2?'货到付款':'未支付');
                                    document.getElementById("bName").innerHTML = data.selMyOrder.username;
                                    document.getElementById("bPhone").innerHTML = data.selMyOrder.phone;
                                    document.getElementById("address").innerHTML = data.selMyOrder.address;
                                    document.getElementById("sstate").innerHTML = data.selMyOrder.order[0].sstate;
                                    document.getElementById("bstate").innerHTML = data.selMyOrder.order[0].bstate;
                                    document.getElementById("odate").innerHTML = data.selMyOrder.order[0].odate;
                                    document.getElementById("okdate").innerHTML = data.selMyOrder.order[0].okdate;
                                }
                                , error: function () {
                                    alert("获取商品数据失败")
                                }


                            });


                        }
                        , end() {

                            $("#selMyOrder").css({"display": "none"})
                        }

                    });
                }

            });


        });
    </script>
</body>

</html>
