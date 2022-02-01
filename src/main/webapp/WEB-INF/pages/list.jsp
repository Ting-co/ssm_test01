<%--
  Created by IntelliJ IDEA.
  User: Keafmd
  Date: 2021/2/18
  Time: 15:50
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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <script src="static/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>按钮主题</legend>
</fieldset>
<div class="layui-btn-container">
    <button type="button" class="layui-btn layui-btn-primary">原始按钮</button>
    <button type="button" class="layui-btn">默认按钮</button>
    <button type="button" class="layui-btn layui-btn-normal">百搭按钮</button>
    <button type="button" class="layui-btn layui-btn-warm">暖色按钮</button>
    <button type="button" class="layui-btn layui-btn-danger">警告按钮</button>
    <button type="button" class="layui-btn layui-btn-disabled">禁用按钮</button>
    <button type="button" class="layui-btn layui-btn-danger"  onclick="x()"></button>
    <button type="button" class="layui-btn layui-btn-danger"  onclick="x()"></button>
</div>
<h1>查询所有的账户</h1>
<%--${list}--%>

<c:forEach items="${list}" var="account">
    ${account.name}
    ${account.money}
</c:forEach>





<table id="demo" lay-filter="test"></table>
<script>
    layui.use('table', function () {
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: 312
            , url: '/account/findAll' //数据接口
            // ,page: true //开启分页
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'}
                , {field: 'name', title: '用户名', width: 80}
                , {field: 'money', title: '性别', width: 80,}

            ]]
        });

    });

    function x() {
        //1、
        var jsonstr="[{'name':'a','value':1},{'name':'b','value':2}]";
        var jsonarray = eval('('+jsonstr+')');
        alert(JSON.parse(jsonarray))
        var arr  =
            {
                "name" : "safsf",
                "value" : 12
            }
        jsonarray.push(arr);
        alert(JSON.parse(jsonarray))

    }
    function ss() {
        //2、
        var json={};// 定义一个json对象
        json.array1=["2","4"];// 增加一个新属性，此属性是数组
        json.array1[json.array1.length]='6';// 数组追加一个元素
        alert(json.array1)
    }

</script>
</body>
</html>
