<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取项目路径 例如 http://localhost:8080/weinxinadmin/ 或者 http://www.xxx.com/weinxinadmin/
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>火车票售票系统-系统首页</title>
    <%--设置ico图标--%>
    <link rel="shortcut icon" href="${ctx}/static/favicon.png" type="image/x-icon" />
    <link rel="icon" href="${ctx}/static/favicon.png" type="image/gif">
</head>
<body>
<script>
    location.href = "index";
</script>

</body>
</html>
