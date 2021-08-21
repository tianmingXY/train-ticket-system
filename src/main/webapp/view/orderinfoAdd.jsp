<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户下单确认</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/admin.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/template.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
<!--导航条 start-->
<jsp:include page="head.jsp"/>

<!--导航条 end-->

<!--轮播图 start-->
<jsp:include page="banner.jsp"/>
<!--轮播图 end-->

<div class="layui-container">

    <form class="layui-form  layui-form-pane" action="${ctx}/indexOrderinfoSave" method="post"
          style="margin: 50px auto;">

        <div class="layui-form-item">
            <label class="layui-form-label">乘车人</label>
            <div class="layui-input-block">
                <select name="ordercaruserid" id="ordercaruserid" class="layui-select">
                    <option value="">请选择乘车人</option>
                    <c:forEach items="#{caruserList}" var="item">
                        <option value="${item.caruserid}">${item.carusername} ${item.carusercardid}</option>
                    </c:forEach>
                </select>
            </div>
        </div>


        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">下单用户</label>
            <div class="layui-input-block">
                <input type="text" name="orderuser" id="orderuser" value="${sessionScope.loginUserinfo.name}" lay-verify
                       autocomplete="off"
                       placeholder="请输入下单用户"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">下单时间</label>
            <div class="layui-input-block">
                <input type="text" name="orderaddtime" id="orderaddtime" value="${nowTime}" lay-verify
                       autocomplete="off"
                       placeholder="请输入下单时间"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">订单状态</label>
            <div class="layui-input-block">
                <input type="text" name="orderstate" id="orderstate" value="未支付" lay-verify autocomplete="off"
                       placeholder="请输入订单状态"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">列车编号</label>
            <div class="layui-input-block">
                <input type="text" name="ordercarid" id="ordercarid" value="${ordercarid}" lay-verify autocomplete="off"
                       placeholder="请输入列车编号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">座位编号</label>
            <div class="layui-input-block">
                <input type="text" name="ordersiteid" id="ordersiteid" value="${ordersiteid}" lay-verify
                       autocomplete="off"
                       placeholder="请输入座位编号"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">订单备注</label>
            <div class="layui-input-block">
                <input type="text" name="orderintro" id="orderintro" value="无" lay-verify autocomplete="off"
                       placeholder="请输入订单备注"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">更新时间</label>
            <div class="layui-input-block">
                <input type="text" name="orderupdatetime" id="orderupdatetime" value="${nowTime}" lay-verify
                       autocomplete="off"
                       placeholder="请输入更新时间"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">订单金额</label>
            <div class="layui-input-block">
                <input type="text" name="ordermoney" id="ordermoney" value="${money}" lay-verify autocomplete="off"
                       placeholder="请输入订单金额"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="demo1" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>
<jsp:include page="foot.jsp"/>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    //定义layui的变量
    var $;
    var layer;
    var element;
    var form;
    layui.use(['element', 'layer', 'jquery', 'form', 'laydate', 'layedit'], function () {
        element = layui.element;
        layer = layui.layer;
        $ = layui.jquery;
        form = layui.form;
        var laydate = layui.laydate;
        var layedit = layui.layedit;

        //监听提交
        form.on('submit(demo1)', function (data) {
            console.log(JSON.stringify(data.field));
            return true;
        });

    });
</script>

</body>
</html>
