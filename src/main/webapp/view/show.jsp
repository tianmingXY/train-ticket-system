<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>火车票售票系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/admin.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/template.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
    <style>
        #myEcharts02 {
            width: 800px;
            height: 500px;
            /*border: solid 1px red;*/
            margin: 50px auto;

        }
    </style>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.bootcss.com/echarts/3.7.1/echarts.min.js"></script>
    <!--引入中国的地图数据js文件，引入后会自动注册地图名字和数据-->
    <script src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js?_v_=1598903772045"></script>
</head>
<body>

<!--为echarts准备一个dom容器-->
<div id="myEcharts02"></div>
<script>
    //初始化echarts实例
    //柱状图
    function getpieChart() {
        console.log("21");
        var url = "${ctx}/matchinfo/selectAction";
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'json',
            data: {"sql":'select matchresult as vkey,count(*) as nums from matchinfo where matchusera="<%=request.getParameter("teamname")%>" group by matchresult '},
            cache: false,
            success: function (result) {
                var kk=result.data;
                var pieData = [];
                for (let j = 0; j < kk.length; j++) {
                    var o = {value: kk[j].nums, name: kk[j].vkey};
                    pieData.push(o);
                }
                // console.log(pieData);
                //饼图
                var pieChart = echarts.init(document.getElementById("myEcharts02"));
                var pieoption = {
                    title: {
                        text: '数字结果统计',
                        left: 'left'
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {show: true},
                            dataView: {show: true, readOnly: false},
                            magicType: {
                                show: true,
                                type: ['pie', 'funnel'],
                                option: {
                                    funnel: {
                                        x: '25%',
                                        width: '50%',
                                        funnelAlign: 'left',
                                        max: 1548
                                    }
                                }
                            },
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    //设置饼状图每个颜色块的颜色
                   // color: ['#48B7FE', '#008AFF', '#9F6AFF', '#734DFF', '#f7c5a0', '#FC97AF', '#87F7CF', '#D4A4EB'],
                    legend: {
                        orient: 'vertical',
                        right: 'right',
                    },
                    series: [
                        {
                            name: '结果统计',
                            radius: ['20%', '80%'],
                            hoverAnimation: true,
                            avoidLabelOverlap: true,
                            label: {
                                show: false,
                                position: 'center'
                            },
                            type: 'pie',
                            data: pieData,
                            emphasis: {
                                itemstyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                pieChart.setOption(pieoption);
                $(window).resize(pieChart.resize);

            },
            error: function (responseStr) {
                alert("数据类模板数量查询失败！");
            }
        });


    }


    $(function () {
        //加载饼图
        getpieChart();


    });


</script>


<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;

        //…
    });
</script>
<script>
    layui.use('form', function () {
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>


</body>
</html>
