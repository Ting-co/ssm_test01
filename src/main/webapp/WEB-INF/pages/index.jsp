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
    <script src="static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../static/layui/css/layui.css" media="all">
    <script src="../../static/layui/layui.js" charset="utf-8"></script>
    <style>
        .daf{
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 15px;
            width: 100%;
            height: 300px;

        }
        .fenlei{
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 15px;
            width: 150px;
            height: 150px;
            margin-left: 30px;
            position: fixed;
        }

        .content{
            /* background-color: #bfa; */
            width: 80%;
            margin: 30px 0px;
            display: flex;
        }
        .left-content{
            /* border: 1px solid red; */
            display: flex;
            justify-content: space-around;
            width: 100%;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 15px;
            margin: 5px;
        }
        .left-content .left{
            width: 400px;
            height: 300px;
        }
        .left-content .left img{
            width: 100%;
            height: 100%;
        }

        .left-content .right{
            width: 48%;
            display: flex;
            flex-wrap: wrap;
            align-content: space-between;
        }
        .right{
            padding: 10px;
        }
        .left-content .right .item{
            width: 100%;
            display: flex;
        }

        .right-content{
            width: 30%;
        }
        .content{
            margin-top: 20px;
            text-align: center;
        }
        .item :first-child{
            margin-right: 30px;
        }
        .left{
            margin-right: 40px;
            padding: 7px;

        }
        .right :nth-child(4) :last-child{
            font-weight: bold;
            color: rgb(255, 98, 0);
        }
        .right :nth-child(5) :last-child{
        }
        .price :last-child{
            font-weight: bold;
            color: rgb(255, 98, 0);
            font-size: 1.3em;
        }

        .dec{
            margin-right: -30px;
        }
        #lwidth{
            width: 40px;
        }
        .add,.dec{
            width: 20px;
        }
        .cn{
            width: 70%;
            display: flex;
            justify-content: space-around;
            margin-left: -10px;
        }
        .cn span{
            /* width: 33%; */
            margin-right: 0 !important;
            color: red;
        }
        .type{
            margin-top: 30px;
            padding: 9px 10px;
            width: 180px;
            height:  390px;
            display: flex;
            flex-direction: column;
            letter-spacing: 2px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 15px;
        }
        dl{
            display: flex;
            width: 175px;
            justify-content: space-around;
        }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <jsp:include page="common/header.jsp"/>

    <%--主体--%>
    <div class="mylayui-index-body">


        <div class="layui-row" style="padding: 50px 50px 23% 15%">
            <%--搜索框--%>
            <div style="margin-bottom: 50px">
                <form class="layui-form layui-form-pane" action="index/select">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <input type="text" name="commodity" placeholder="请输入商品名字" value=""
                                   autocomplete="" class="layui-input"/>
                        </div>
                        <div class="layui-inline">
                            <input type="submit" class="layui-btn" value="搜索">
                        </div>
                    </div>
                </form>
            </div>
                <div style="display: flex">


                <!-- 分类 -->
                 <div class="type">
                     <h2>商品分类</h2>
                     <span><a href="index/selectBySort?sort=衣服装扮">衣服装扮</a></span>
                     <span><a href="index/selectBySort?sort=美妆护肤">美妆护肤</a></span>
                     <span><a href="index/selectBySort?sort=电子数码">电子数码</a></span>
                     <span><a href="index/selectBySort?sort=书本文具">书本文具</a></span>
                     <span><a href="index/selectBySort?sort=零食水果">零食水果</a></span>
                     <span><a href="index/selectBySort?sort=项链饰品">生活用品</a></span>
                 </div>
                <div class="layui-carousel" id="test1" style="margin:30px; ">
                    <div carousel-item >
                        <div><img  src="static/images/ppt/p1.jpg" alt=""></div>
                        <div><img  src="static/images/ppt/p2.jpg" alt=""></div>
                        <div><img  src="static/images/ppt/p3.jpg" alt=""></div>
                    </div>
                </div>
                </div>
                <div class="content">
                    <div style="display: flex;flex-wrap: wrap" >

                    <!-- 左边商品区 -->
                    <c:forEach items="${commoditys.list}" var="commoditys" varStatus="status">
                        <div class="left-content">

                            <div class="left" >
                                <img style="border-radius: 15px;" src="static/images/commoditys/${commoditys.simage}" alt="">
                            </div>
                            <div class="right">
                                <div class="item">
                                    <h2 class="title">${commoditys.commodity}</h2>
                                </div>
                                <div class="item">
                                    <span>简介</span>
                                    <span>${commoditys.synopsis}</span>
                                </div>
                                <div class="item">
                                    <div class="price">
                                        <span>价格</span>
                                        <span>&yen;${commoditys.price}</span>
                                    </div>
                                </div>
                                <div class="item">
                                    <span>月销量</span>
                                    <span>100+</span>
                                </div>
                                <div class="item">
                                    <span>库存</span>
                                    <span>${commoditys.amount}</span>
                                </div>
                                <div class="item">
                                    <span>上架时间</span>
                                    <span>${commoditys.sdate}</span>
                                </div>
                                <div class="item">
                                    <span>数量</span>
                                    <div>
                                        <button class="dec" onclick="minus(${status.index})">-</button>
                                        <input id="lwidth" type="number" min="1" step="1" value="1" class="amount${status.index}"/>
                                        <button class="add" onclick="plus(${status.index},${commoditys.price},${commoditys.sid},${commoditys.uid})">+</button>
                                    </div>
                                </div>
                                <div class="item">
                                    <button class=" layui-btn layui-btn-warm layui-btn-sm"
                                            onclick="buyCommodity(${status.index},${commoditys.price},${commoditys.sid},${commoditys.uid},${commoditys.amount})" >
                                        立即购买
                                    </button>
                                    <button class=" layui-btn layui-btn-danger layui-btn-sm"
                                            onclick="addshoping(${status.index})">
                                        加入购物车
                                    </button>
                                </div>
                                <div class="item">
                                    <span>承诺</span>
                                    <div class="cn">
                                        <span>正品保证</span>
                                        <span>极速退款</span>
                                        <span>七天无理由退换</span>
                                    </div>
                                </div>
                                <input style="display: none" class="amounts${status.index}"
                                       value="${commoditys.amount}"/>
                                <input style="display: none" class="sid${status.index}" value="${commoditys.sid}"/>
                            </div>
                        </div>
                    </c:forEach>
                        <c:if test="${commoditys.list!=''}">

                            <div id="demo7" ></div>
                        </c:if>
                    </div>


                    <div class="right-content">
                        <%--<div style="width: 47%;
                                    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                                    border-radius: 15px;">
                            <h3 style="font-weight: bold;margin-bottom: 8px;">商品热度</h3>
                            <dl>
                                <dd>
                                    <a href="">
                                        <img style="width: 50px;height: 50px;" src="">
                                    </a>
                                </dd>
                                <dd>
                                    <a href="">
                                        <img style="width: 50px;height: 50px;" src="">
                                    </a>
                                </dd>
                                <dd>
                                    <a href="">
                                        <img style="width: 50px;height: 50px;" src="">
                                    </a>
                                </dd>
                            </dl>
                        </div>--%>

                        <%-- 分类 -->
                       <%-- <div class="type">
                            <h2>商品分类</h2>
                            <span><a href="index/selectBySort?sort=衣服装扮">衣服装扮</a></span>
                            <span><a href="index/selectBySort?sort=美妆护肤">美妆护肤</a></span>
                            <span><a href="index/selectBySort?sort=电子数码">电子数码</a></span>
                            <span><a href="index/selectBySort?sort=书本文具">书本文具</a></span>
                            <span><a href="index/selectBySort?sort=零食水果">零食水果</a></span>
                            <span><a href="index/selectBySort?sort=项链饰品">项链饰品</a></span>
                        </div>--%>
                    </div>
                </div>

                <div id="demo7" ></div>

            <%--<div class="layui-col-md9">
                <div class="grid-demo grid-demo-bg1">
                    <div id="pager" style="margin-bottom: 0;">
                        <div >
                            <c:forEach items="${commoditys.list}" var="commoditys" varStatus="status">

                                <div class="daf">
                                    <table border="0">
                                        <tr>
                                            <td rowspan="6">
                                                <div style="padding: 5px">
                                                    <img src="static/images/commoditys/${commoditys.simage}"
                                                         style="height: 200px;width: 300px">
                                                </div>
                                            </td>
                                            <td>&nbsp;<div style="padding-left: 13px">${commoditys.commodity}</div>
                                            </td>
                                        </tr>
                                        <tr>&lt;%&ndash;${status.index}&ndash;%&gt;
                                            <td class="price">&nbsp;&nbsp;&nbsp;￥${commoditys.price}
                                                <div style="padding-left: 10px">
                                                    <hr>
                                                </div>
                                            </td>
                                            <td>库存${commoditys.amount}
                                                </br>
                                                <hr width="220">
                                            </td>
                                        </tr>

                                        <tr>

                                            <td>&nbsp;&nbsp;&nbsp;
                                                <div style="padding-left: 13px;padding-bottom: 5px">
                                                    上架时间: ${commoditys.sdate}
                                                </div>

                                            </td>

                                        </tr>
                                        <tr>

                                            <td>&nbsp;&nbsp;&nbsp;简介：</br>
                                                <div style="padding-left: 10px"><br/></div>
                                                &nbsp;&nbsp;&nbsp;${commoditys.synopsis}</td>
                                            </td>
                                                &lt;%&ndash; <td colspan="3">Row 3 Cell 1</td>&ndash;%&gt;
                                        </tr>
                                        <tr>

                                            <td>
                                                <li><input type="button" name="minus" value="-"
                                                           onclick="minus(${status.index})">
                                                    <input type="text" class="amount${status.index}" value="1">
                                                    <input type="button" name="plus" value="+"
                                                           onclick="plus(${status.index},${commoditys.price},${commoditys.sid},${commoditys.uid})">
                                                </li>
                                            </td>
                                                &lt;%&ndash; <td colspan="3">Row 3 Cell 1</td>&ndash;%&gt;
                                        </tr>
                                        <tr>

                                            <td>&nbsp;&nbsp;&nbsp;<BUTTON onclick="addshoping(${status.index})">加入购物车
                                            </BUTTON>
                                                <BUTTON onclick="buyCommodity(${status.index},${commoditys.price},${commoditys.sid},${commoditys.uid},${commoditys.amount})">
                                                    立即购买
                                                </BUTTON>
                                            </td>
                                                &lt;%&ndash; <td colspan="3">Row 3 Cell 1</td>&ndash;%&gt;
                                        </tr>

                                    </table>
                                </div>
                                </br>
                                <input style="display: none" class="amounts${status.index}"
                                       value="${commoditys.amount}"/>
                                <input style="display: none" class="sid${status.index}" value="${commoditys.sid}"/>
                            </c:forEach>

                            <div id="demo7" ></div>

                        </div>
                    </div>
                </div>
            </div>
            <div cass="layui-col-md3" >l
                <div class="grid-demo">
                    <div class="fenlei">
                        <ul style="padding: 20px">
                            <li><a href="index/selectBySort?sort=衣服装扮">衣服装扮</a></li>
                            <li><a href="index/selectBySort?sort=美妆护肤">美妆护肤</a></li>
                            <li><a href="index/selectBySort?sort=电子数码">电子数码</a></li>
                            <li><a href="index/selectBySort?sort=书本文具">书本文具</a></li>
                            <li><a href="index/selectBySort?sort=零食水果">零食水果</a></li>
                            <li><a href="index/selectBySort?sort=项链饰品">项链饰品</a></li>
                        </ul>
                    </div>
                </div>
            </div>--%>
        </div>


    </div>
    <%--尾页--%>
    <div class="mylayui-index-bottom">
        <jsp:include page="common/bottom.jsp"/>
    </div>
</div>

<div style="border:0px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 10px;display: none;" id="buyCommodity">
    <form class="layui-form layui-form-pane" id="fromtest">
        <input id="uid" type="hidden" name="uid" value=""/>
        <input id="sid" type="hidden" name="sid" value=""/>
        <input id="kunc" type="hidden" name="kunc" value=""/>
        <input id="dprice" type="hidden" name="dprice" value=""/>


        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px">收货手机号码</label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" value="" lay-verify="required|phone"
                       placeholder="${sessionScope.user.phone}"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">收货地址</label>
            <div class="layui-input-inline">
                <input type="text" id="address" name="address" value="${sessionScope.user.address}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">钱包余额</label>
            <div class="layui-input-inline">
                <input type="text" id="money" value="${sessionScope.user.money}" disabled
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">购买数量</label>
            <div class="layui-input-inline">
                <input type="number" id="amount" name="amount" min="1" value="" autocomplete="" onchange="cheakNum()"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">应付金额(元)</label>
            <div class="layui-input-inline">
                <input type="text" id="price" name="price" value="" autocomplete="" disabled
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" pane="">
            <label class="layui-form-label">付款方式</label>
            <div class="layui-input-block">
                <input type="radio" id="payLocal" name="payment" value="0" title="线下付款">
                <input type="radio" id="payOnline" name="payment" value="1" title="线上付款" checked>
            </div>
        </div>
    </form>
    <div style="padding-left: 300px">
        <button type="button" class="layui-btn" onclick="buy()">确认订单</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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

        layui.use('carousel', function(){
            var carousel = layui.carousel;
            //建造实例
            carousel.render({
                elem: '#test1'
                ,height:'400px'
                ,width: '60%' //设置容器宽度
                ,arrow: 'always' //始终显示箭头
                //,anim: 'updown' //切换动画方式
            });
        });

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });


        var curr;
        if (${commoditys.pageNum==null}) {
            curr = 1;
        } else {
            curr =${commoditys.pageNum};
        }

        var select =${select};


        //搜索回显
        var myselect = "${myselect}";

        if (myselect != null || myselect != ' ') {
            //名称文本框回显
            $("input[name='commodity']").val('${myselect}');
        } /*else {
            $("#none").css({"display": "hidden"})
        }*/

        var selectBySort = "${selectBySort}";


        //分页
        laypage.render({
            elem: 'demo7'
            , count: ${commoditys.total}
            , limit:${commoditys.pageSize}
            , curr: curr
            , layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            , jump: function (obj, first) {

                if (!first) {
                    var curr = obj.curr;
                    $.get("index/toPage", {"pageNum": curr}, function () {
                        if (select != 1) {
                            location.replace("index/toindex?pageNum=" + curr);
                        } else {
                            if (myselect == null || myselect == "") {
                                location.replace("index/select?pageNum=" + curr + "select=" + select);
                            } else {
                                if (select == 1 || select == "1") {
                                    location.replace("index/select?pageNum=" + curr + "&select=" + select + "&commodity=" + myselect);
                                } else {
                                    location.replace("index/select?pageNum=" + curr + "&select=" + select + "&commodity=" + selectBySort);
                                }
                            }

                        }

                    })
                }
            }
        });


        window.buy = function () {
            let phone = document.getElementById("phone").value;
            let address = document.getElementById("address").value;
            let price = document.getElementById("price").value;
            if (phone == '' && address == '') {
                alert('收货电话或地址为空')
                return;
            }


            if (!this.cheakNum()) {
                return;
            }

            //获取表单区域所有值
            var datas = $("#fromtest").serialize();

            datas += '&price=' + price

            $.post({
                url: 'myOrder/buyIndex',
                data: datas,
                success: function (data) {

                    layer.msg(data.msg, {icon: 1,offset: '100px' ,time: 2000 })
                    layer.closeAll('page'); //关闭所有页面层

                },




            });



        }


    });
    //物品的加减

    //减法
    function minus(index) {
        var url = ".amount" + index;
        //获取当前数量的值
        var amounts = document.querySelector(url);

        //得到第一个amount的元素的value属性的值
        var count = parseInt(amounts.value); //数量加1

        if (count <= 1) {
            alert("不能再减了，快没了！！");
        } else {
            //得到第一个amount的元素的value属性的值
            var count = parseInt(amounts.value) - 1; //数量加1

            //重新把count的值绑定在数量文本框里
            amounts.value = count;
        }

        total();

    }

    //加法
    function plus(index) {

        var amounturl = ".amount" + index;
        var totalurl = ".amounts" + index;

        //获取当前数量的值
        var amounts = document.querySelector(amounturl);
        var total = document.querySelector(totalurl);

        //得到第一个amount的元素的value属性的值
        var count = parseInt(amounts.value); //数量加1

        if (count >= +total.value) {
            alert("不能再加了，超出仓库数了！！");
        } else {
            //得到第一个amount的元素的value属性的值
            var count = parseInt(amounts.value) + 1; //数量加1

            //重新把count的值绑定在数量文本框里
            amounts.value = count;
        }


    }

    //加入购物车
    function addshoping(index) {
        if (${sessionScope.user == null}) {
            alert("请先登录，再加入购物车");
            return;
        }


        var amounturl = ".amount" + index;
        var sidurl = ".sid" + index;

        //获取当前数量的值
        var amounts = document.querySelector(amounturl);
        var sid = document.querySelector(sidurl);


        var data = {sid: sid.value + "", amounts: amounts.value + ""};
        $.post("shopping/add", data, function (date) {
                alert(date.msg)
            }
        )

    }

    /*立即购买*/
    function buyCommodity(index, price, sid, uid, kamount) {
        if (${sessionScope.user == null}) {
            alert("请先登录，再购买商品");
            return;
        }
        var amounts = document.querySelector(".amount" + index);
        //弹窗
        layer.open({
            type: 1
            , title: '确认订单信息'
            , offset: '300px'
            , area: ['500px', '435px']
            , content: $("#buyCommodity")
            , success: function () {
                document.getElementById("uid").value = uid;
                document.getElementById("sid").value = sid;
                document.getElementById("amount").value = amounts.value;
                document.getElementById("price").value = price * amounts.value;
                document.getElementById("kunc").value = kamount;
                document.getElementById("dprice").value = price;
            }
            , end() {

                $("#buyCommodity").css({"display": "none"})
            }

        });
    }

    /*检查数量是否正确*/
    function cheakNum() {
        let amount = document.getElementById("amount").value;
        let kamount = document.getElementById("kunc").value;
        let money = document.getElementById("money").value;
        let dprice = document.getElementById("dprice").value;
        let price = dprice * amount;
        if (amount < 0) {
            alert('输入的不能是负数')
            return false;
        }
        if (+amount > +kamount) {
            alert('输入的大于库存数量')
            return false;
        }

        if (money < price) {
            alert('余额不足')
            return false;
        } else {
            document.getElementById("price").value = price;
        }

        return true;
    }


</script>
</body>
</html>
