<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%--<%@ include file="../../page/schedule/fullCalendar.jsp"%>--%>
<%@ include file="../../page/common.jsp" %>
<link href='${pageContext.request.contextPath }/packages/core/main.min.css' rel='stylesheet'/>
<link href='${pageContext.request.contextPath }/packages/daygrid/main.min.css' rel='stylesheet'/>
<link href='${pageContext.request.contextPath }/packages/timegrid/main.min.css' rel='stylesheet'/>
<link href='${pageContext.request.contextPath }/packages/timeline/main.css' rel='stylesheet'/>
<link href='${pageContext.request.contextPath }/packages/resource-timeline/main.css' rel='stylesheet'/>
<script src='${pageContext.request.contextPath }/packages/core/main.min.js'></script>
<script src='${pageContext.request.contextPath }/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath }/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath }/packages/timegrid/main.js'></script>
<script src='${pageContext.request.contextPath }/packages/timeline/main.js'></script>
<script src='${pageContext.request.contextPath }/packages/resource-common/main.js'></script>
<script src='${pageContext.request.contextPath }/packages/resource-timeline/main.js'></script>
<script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/popper.js/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.min.js"></script>

<body>
<%@ include file="../../page/top.jsp" %>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px;
    }

    #calendar {
        width: 93%;
        height: 510px;
        margin: 10px;
    }
</style>
<div class="layui-row">
    <%@ include file="../../page/nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <%--<div class="layui-row block-bg-color block-border-top">
        <div class="layui-col-md12 block-padding-around">
                <span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>日晨</cite></a>
                </span>
        </div>
    </div>--%>
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around" id="home_tab_content_container">
                    <div id='calendar'></div>
                </div>
            </div>
        </div>

    </div>
</div>
<script>
    layui.use(['form', 'laydate', 'layer'], function () {
        var laydate = layui.laydate;
        $("#home_tab_content_container").height(
            $(window).height() - 115);
        var calendar = new FullCalendar.Calendar(
            document.getElementById('calendar'), {
                plugins: ['interaction', 'dayGrid', 'timeGrid'],
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'timeGridDay,timeGridWeek,dayGridMonth'
                },
                locale: "ch",
                height: 550,
                scrollTime: '08:00',
                minTime: '08:00',
                maxTime: '20:00',
                editable: true,
                defaultView: 'timeGridDay',
                buttonText: {
                    today: '今天'
                },
                droppable: true,
                drop: function (info) {
                    if (checkbox.checked) {
                        info.draggedEl.parentNode.removeChild(info.draggedEl);
                    }
                },
                events: '${pageContext.request.contextPath }/meet/meetFullEvents',
                eventClick: function (calEvent, jsEvent, view) {
                    var title = calEvent.event._def.title;
                    var start = getFormatDate(calEvent.event.start);
                    var end = getFormatDate(calEvent.event.end);
                    layer.open({
                        type: 1,
                        content: '<div style="padding: 15px 80px;">' + "时间 : " + start + "--" + end + '</div><div style="padding: 15px 80px;">' + "主题 : " + title + '</div>'
                    });
                }
            });
        /* 立即渲染日历或者调整它的大小 */
        calendar.render();
    });

    function getFormatDate(date) {
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var hour;
        var minutes;
        var currentDate;
        //currentDate = date.getFullYear() + "-" + month + "-" + strDate+ " ";
        if (date.getHours() == 0 || date.getHours() < 10) {
            hour = '0' + date.getHours();
        } else {
            hour = date.getHours();
        }
        currentDate = hour + ":";
        if (date.getMinutes() == 0 || date.getMinutes() < 10) {
            minutes = '0' + date.getMinutes();
        } else {
            minutes = date.getMinutes();
        }
        currentDate += minutes;
        return currentDate;
    }
</script>

</body>
</html>