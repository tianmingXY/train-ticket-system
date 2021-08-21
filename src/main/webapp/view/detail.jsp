<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--获取当前时间--%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
<c:if test="${sessionScope.loginUserinfo==null}">
    <script>
        alert("登录以后才可以访问");
        location.href = "${ctx}/view/login.jsp";
    </script>
</c:if>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>火车票售票系统-详情显示</title>
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

<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title site-title" style="text-align: center;margin: 30px">
        <legend><a name="compatibility">${datainfo.dataname} 《${datainfo.datauser}》老师的教学视频 -展示</a></legend>
    </fieldset>

    <div class="layui-row">
        <div class="layui-col-md12" style="text-align: center">
            <video src="${datainfo.dataurl}" style="width: 100%;" controls="controls" poster="${datainfo.dataintro}"></video>
        </div>
        <div class="layui-col-md12">
            <table class="layui-table">
                <tbody>
                <tr>
                    <td style="width:150px;">编号</td>
                    <td>${datainfo.dataid}</td>
                </tr>
                <tr>
                    <td style="width:150px;">名称</td>
                    <td>${datainfo.dataname}</td>
                </tr>
                <tr>
                    <td style="width:150px;">内容</td>
                    <td>${datainfo.datacontent}</td>
                </tr>

                <tr>
                    <td style="width:150px;">教师</td>
                    <td>${datainfo.datauser}</td>
                </tr>

                <tr>
                    <td style="width:150px;">备注</td>
                    <td>${datainfo.dataremarker}</td>
                </tr>
                <tr>
                    <td style="width:150px;">分类</td>
                    <td>${datainfo.datatype}</td>
                </tr>
                <tr>
                    <td style="width:150px;">时间</td>
                    <td>${datainfo.dataaddtime}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="layui-col-md12">

            <div class="layui-row">
                <div class="layui-col-md12" style="background: #eee;border-radius:20px; ">
                    <form class="layui-form layui-form-pane" action="${ctx}/msginfo_submit" method="post">
                        <input type="hidden" name="tid" value="${datainfo.dataid}">
                        <input type="hidden" name="msguser" value="${sessionScope.loginUserinfo.name}">
                        <input type="hidden" name="msgaddtime" value="${nowTime}">
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label" id="commentShow">评论信息显示</label>
                            <div class="layui-input-block">
                                <textarea name="msgcontent" placeholder="请输入评论内容" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <c:if test="${sessionScope.loginUserinfo==null}">
                            <span class="layui-btn layui-btn-fluid layui-btn-primary">登录以后才可以发布评论</span>
                        </c:if>
                        <c:if test="${sessionScope.loginUserinfo!=null}">
                            <button class="layui-btn layui-btn-fluid layui-btn-danger">点我发布评论内容</button>
                        </c:if>
                    </form>
                </div>


                <div style="margin-top: 30px;">
                    <div class="site-title" style="text-align: center;font-size: 20px;border-left:0px;border-right:0px;border-bottom:0px;   ">
                        <fieldset>
                            <legend>评论内容显示区域</legend>
                        </fieldset>
                        <c:forEach items="${msginfoList}" var="v">
                            <div class="media-body" style="margin-left: 0px;border-left: 8px gainsboro solid;padding-left: 20px;border-radius: 10px;padding: 30px;margin: 20px">
                                <a href="javascript:;" class="media-left" style="float: left;">
                                        ${v.msguser} 评论:
                                </a>
                                <div class="pad-btm">
                                    <p class="min-font">
                                            ${v.msgcontent}<span class="layui-icon layui-icon-date"></span>
                                            ${v.msgaddtime} </p>
                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
<div style="height: 50px;"></div>
<jsp:include page="foot.jsp"/>

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

        //…
    });
</script>
</body>
</html>