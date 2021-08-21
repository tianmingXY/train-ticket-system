<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-container" style="text-align: center;">
    <br>
    <br>

    <br>
    <div>
        <table class="layui-table layui-table-grid" lay-even lay-skin="line" lay-size="lg">
            <thead>
            <tr>
                <th colspan="2" style="color: green;font-weight: bold;text-align: center;font-size: 20px;">火车票售票系统</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>数据库</th>
                <th>MySQL</th>
            </tr>
            <tr>
                <th>后台技术</th>
                <th>SSM框架:Spring + Spring MVC + MyBatis</th>
            </tr>
            <tr>
                <th>前台技术</th>
                <th>Html+Css+JavaScript</th>
            </tr>
            <tr>
                <th>后台测试</th>
                <th>谷歌浏览器</th>
            </tr>
            <tr>
                <th>笔记存储</th>
                <th>基于谷歌浏览器</th>
            </tr>

            </tbody>
        </table>
    </div>
</div>

</body>
</html>
