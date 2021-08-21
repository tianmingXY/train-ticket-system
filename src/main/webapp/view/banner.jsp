<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--轮播图 start-->
<%--banner图建议使用 1920*400的效果最佳--%>
<div class="layui-carousel" id="test1" style="margin-bottom: 20px;height: 500px;">
    <div carousel-item>
        <div style="background-image: url('${ctx}/uploads/banner20201223.jpg');background-size:100% 100%; "></div>
        <div style="background-image: url('${ctx}/uploads/banner10.jpg');background-size:100% 100%; "></div>
        <div style="background-image: url('${ctx}/uploads/banner12.jpg');background-size:100% 100%; "></div>
        <div style="background-image: url('${ctx}/uploads/banner0619.jpg');background-size:100% 100%; "></div>
    </div>
</div>
<!-- 条目中可以是任意内容，如：<img src=""> -->
<script>
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            , width: '100%' //设置容器宽度
            , arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
</script>
<!--轮播图 end-->
