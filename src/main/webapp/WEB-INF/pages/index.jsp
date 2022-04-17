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


        <div class="layui-row" style="padding: 50px 25% ">
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
            <div class="layui-col-md9">
                <div class="grid-demo grid-demo-bg1">
                    <div id="pager" style="margin-bottom: 0;">
                        <div class="daf">
                            <c:forEach items="${commoditys.list}" var="commoditys" varStatus="status">

                                <div style="background: #c0c4cc">
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
                                        <tr><%--${status.index}--%>
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
                                                <%-- <td colspan="3">Row 3 Cell 1</td>--%>
                                        </tr>
                                        <tr>

                                            <td>
                                                <li><input type="button" name="minus" value="-"
                                                           onclick="minus(${status.index})">
                                                    <input type="number" class="amount${status.index}" value="1">
                                                    <input type="button" name="plus" value="+"
                                                           onclick="plus(${status.index},${commoditys.price},${commoditys.sid},${commoditys.uid})"></li>
                                            </td>
                                                <%-- <td colspan="3">Row 3 Cell 1</td>--%>
                                        </tr>
                                        <tr>

                                            <td>&nbsp;&nbsp;&nbsp;<BUTTON onclick="addshoping(${status.index})">加入购物车
                                            </BUTTON>
                                                <BUTTON onclick="buyCommodity(${status.index},${commoditys.price},${commoditys.sid},${commoditys.uid},${commoditys.amount})">立即购买</BUTTON>
                                            </td>
                                                <%-- <td colspan="3">Row 3 Cell 1</td>--%>
                                        </tr>

                                    </table>
                                </div>
                                </br>
                                <input style="display: none" class="amounts${status.index}"
                                       value="${commoditys.amount}"/>
                                <input style="display: none" class="sid${status.index}" value="${commoditys.sid}"/>
                            </c:forEach>

                            <div id="demo7"></div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md3" style="background-color: #888888;padding-left: 30px">
                <div class="grid-demo">
                    <div>
                        <ul>
                            <li><a href="index/selectBySort?sort=衣服装扮">衣服装扮</a></li>
                            <li><a href="index/selectBySort?sort=美妆护肤">美妆护肤</a></li>
                            <li><a href="index/selectBySort?sort=电子数码">电子数码</a></li>
                            <li><a href="index/selectBySort?sort=书本文具">书本文具</a></li>
                            <li><a href="index/selectBySort?sort=零食水果">零食水果</a></li>
                            <li><a href="index/selectBySort?sort=项链饰品">项链饰品</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <%--尾页--%>
    <div class="mylayui-index-bottom">
        <jsp:include page="common/bottom.jsp"/>
    </div>
</div>

<div style="border:0px solid #eee ;margin: 0 auto;max-width: 1140px;padding-top: 10px;display: none;" id="buyCommodity">
    <form class="layui-form layui-form-pane" id="fromtest"  >
        <input id="uid" type="hidden" name="uid" value=""/>
        <input id="sid" type="hidden" name="sid" value=""/>
        <input id="kunc" type="hidden" name="kunc" value=""/>
        <input id="dprice" type="hidden" name="kunc" value=""/>


        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px">收货手机号码</label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" value="" lay-verify="required|phone" placeholder="${sessionScope.user.phone}"
                        class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">收货地址</label>
            <div class="layui-input-inline">
                <input type="text" id="address" name="address" value="" placeholder="${sessionScope.user.address}"
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
                <input type="radio" id="payLocal"  name="payment"  value="0" title="线下付款">
                <input type="radio" id="payOnline" name="payment" value="1" title="线上付款" checked>
            </div>
        </div>
    </form>
    <div  style="padding-left: 300px">
        <button type="button" class="layui-btn"  onclick="buy()">确认订单</button>
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


            window.buy= function(){
                let phone = document.getElementById("phone").value;
                let address = document.getElementById("address").value;
                if (phone==''&&address==''){
                    alert('收货电话或地址为空')
                    return;
                }

                //获取表单区域所有值
                var datas =$("#fromtest").serialize();
                if (!this.cheakNum()) {
                    return;
                }
                layer.closeAll();
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

        if (count >= total.value) {
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
    function buyCommodity(index,price,sid,uid,kamount) {
        if (${sessionScope.user == null}) {
            alert("请先登录，再加入购物车");
            return;
        }
        var amounts = document.querySelector(".amount" + index);
        //弹窗
        layer.open({
            type: 1
            , title: '确认订单信息'
            ,offset: '300px'
            , area: ['500px', '435px']
            , content: $("#buyCommodity")
            , success: function () {
                document.getElementById("uid").value =  uid;
                document.getElementById("sid").value =  sid;
                document.getElementById("amount").value =  amounts.value;
                document.getElementById("price").value =  price*amounts.value;
                document.getElementById("kunc").value =  kamount;
                document.getElementById("dprice").value =  price;
            }
            , end() {

                $("#buyCommodity").css({"display": "none"})
            }

        });
    }
    /*检查数量是否正确*/
    function cheakNum(){
        let amount = document.getElementById("amount").value;
        let kamount = document.getElementById("kunc").value;
        let money = document.getElementById("money").value;
        let dprice = document.getElementById("dprice").value;
        let price =dprice*amount;
        if (amount<0){
            alert('输入的不能是负数')
            return false;
        }
        if (amount>kamount){
            alert('输入的大于库存数量')
            return false;
        }

        if (money<price){
            alert('余额不足')
            return false;
        }else {
            document.getElementById("price").value=price;
        }

        return true;
    }





</script>
</body>
</html>
