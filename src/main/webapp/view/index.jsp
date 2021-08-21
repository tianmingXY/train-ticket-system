<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>火车票售票系统-首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/admin.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/template.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
    <link rel="shortcut icon" href="${ctx}/static/favicon.png" type="image/x-icon"/>
    <link rel="icon" href="${ctx}/static/favicon.png" type="image/gif">
</head>
<body>
<!--导航条 start-->
<jsp:include page="head.jsp"/>

<!--导航条 end-->

<!--轮播图 start-->
<jsp:include page="banner.jsp"/>
<!--轮播图 end-->

<div class="layui-container" style="padding-top: 10px;">

    <form class="layui-form" action="${ctx}/index" method="post">
        <div class="layui-form-item">
            <div class="layui-inline" style="text-align: left;">
                <div class="layui-input-inline">
                    <input type="text" class="layui-input dateIcon" name="startName" id="startName"
                           value="${startName}"
                           placeholder="请输入出发站点"
                           style="width: 240px;">
                </div>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input dateIcon" name="endName" id="endName"
                           value="${endName}"
                           placeholder="请输入目的站点"
                           style="width: 240px;">
                </div>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input dateIcon" name="senddate" id="senddate"
                           value="${senddate}"
                           placeholder="请输入出发日期"
                           style="width: 240px;">
                </div>
                <div class="layui-input-inline">
                    <select name="type" id="type" class="layui-select">
                        <option value="火车直达" ${type=='火车直达'?'selected':''}>火车直达</option>
                        <option value="火车换乘" ${type=='火车换乘'?'selected':''}>火车换乘</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <button type="submit" class="layui-btn layui-btn-blue"><i
                            class="layui-icon layui-icon-search"></i> 搜索
                    </button>
                </div>
            </div>
        </div>

    </form>
    <fieldset class="layui-elem-field layui-field-title site-title" style="text-align: center;margin: 10px">
        <legend><a name="compatibility">信息详情-展示</a></legend>
    </fieldset>
    <div class="layui-row layui-col-space20">

        <table class="layui-table">
            <tbody>
            <tr class="layui-bg-blue">
                <th>列车id</th>
                <th>列车编号</th>
                <th>列车名称</th>
                <th>起点站</th>
                <th>终点站</th>
                <th>发车时间</th>
                <th>到达时间</th>
                <th>发车日期</th>
                <th>操作</th>
            </tr>

            <c:if test="${type!='火车换乘'}">
                <%--直达信息查询显示--%>
                <c:forEach items="${carinfoList}" var="v">
                    <c:if test="${senddate==null || (v.senddate==senddate && (fn:contains(v.intro, startName) && fn:contains(v.intro, startName)) ) }">
                        <tr>
                            <td>${v.carid}</td>
                            <td>${v.carnum}</td>
                            <td>${v.carname}</td>
                            <td>${v.startname}</td>
                            <td>${v.endname}</td>
                            <td>${v.starttime}</td>
                            <td>${v.endtime}</td>
                            <td>${v.senddate}</td>
                            <td style="width: 180px;">
                                <a href="${ctx}/indexSite?id=${v.carid}" class="layui-btn layui-btn layui-btn-sm">订座</a>
                                <button path="${ctx}/carinfo/detail?id=${v.carid}"
                                        class="layui-btn layui-btn-normal layui-btn-sm showDetail">详情
                                </button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${type=='火车换乘'}">
                <%--直达信息查询显示--%>
                <tr>
                    <td colspan="9" class="layui-bg-red" style="text-align: center;">${mymsg}</td>
                </tr>
                <c:forEach items="${carinfoList}" var="v">
                    <tr>
                        <td>${v.carid}</td>
                        <td>${v.carnum}</td>
                        <td>${v.carname}</td>
                        <td>${v.startname}</td>
                        <td>${v.endname}</td>
                        <td>${v.starttime}</td>
                        <td>${v.endtime}</td>
                        <td>${v.senddate}</td>
                        <td style="width: 180px;">
                            <a href="${ctx}/indexSite?id=${v.carid}" class="layui-btn layui-btn layui-btn-sm">订座</a>
                            <button path="${ctx}/carinfo/detail?id=${v.carid}"
                                    class="layui-btn layui-btn-normal layui-btn-sm showDetail">详情
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
<div style="height: 50px;"></div>
<jsp:include page="foot.jsp"/>
<style>
    .layui-card {
        border: 1px #eee solid;
    }

    .layui-card:hover {
        border: 1px red solid;
    }
</style>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
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
        $(".showDetail").click(function () {
            var path = $(this).attr("path");
            layer.open({
                type: 2,  //弹出类型
                skin: 'layui-layer-demo', //样式类名
                title: '信息详情页面',
                anim: 2,    //弹出窗口使用的动画
                area: ['800px', '500px'],  //设置弹出窗口的大小 宽度,高度
                shadeClose: true, //开启遮罩关闭
                content: path  //加载内容路径
            });
        });


        //时间选择器
        laydate.render({
            elem: '#senddate'
            , type: 'date'
        });
        //…
    });
</script>
</body>
</html>