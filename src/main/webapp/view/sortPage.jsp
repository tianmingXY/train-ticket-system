<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div style="text-align: center">
    <div class="layui-btn-group">
        <a href="${ctx}/${pageListURL}?p=1" class="layui-btn layui-btn-primary layui-btn-sm">首页</a>
        <c:if test="${cp>1}">
            <a href="${ctx}/${pageListURL}?p=${cp-1}"
               class="layui-btn layui-btn-primary layui-btn-sm">上一页</a>
        </c:if>
        <%--前后各显示3个页码--%>
        <c:forEach begin="${cp-3>1?cp-3:1}" end="${cp+3<tp?cp+3:tp}" var="k">
            <c:if test="${cp==k}">  <%-- 是当前页--%>
                <a href="${ctx}/${pageListURL}?p=${k}" class="layui-btn  layui-btn-sm">${k}</a>
            </c:if>
            <c:if test="${cp!=k}"> <%-- 不是当前页--%>
                <a href="${ctx}/${pageListURL}?p=${k}"
                   class="layui-btn layui-btn-primary layui-btn-sm">${k}</a>
            </c:if>
        </c:forEach>

        <c:if test="${cp<tp}">
            <a href="${ctx}/${pageListURL}?p=${cp+1}"
               class="layui-btn layui-btn-primary layui-btn-sm">下一页</a>
        </c:if>
        <a href="${ctx}/${pageListURL}?p=${tp}" class="layui-btn layui-btn-primary layui-btn-sm">尾页</a>
    </div>
</div>