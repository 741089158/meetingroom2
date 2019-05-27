<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%--<%@ include file="../../page/schedule/fullCalendar.jsp"%>--%>
<%@ include file="../../page/common.jsp" %>
<link href='${pageContext.request.contextPath }/packages/core/main.css' rel='stylesheet'/>
<link href='${pageContext.request.contextPath }/packages/daygrid/main.css' rel='stylesheet'/>
<link href='${pageContext.request.contextPath }/packages/timegrid/main.css' rel='stylesheet'/>
<link href='${pageContext.request.contextPath }/packages/timeline/main.css' rel='stylesheet'/>
<link href='${pageContext.request.contextPath }/packages/resource-timeline/main.css' rel='stylesheet'/>
<script src='${pageContext.request.contextPath }/packages/core/main.js'></script>
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
    $(document)
        .ready(
            function () {
               /* $("#home_tab_content_container").height(
                    $(window).height() - 115);*/
                var calendar = new FullCalendar.Calendar(
                    document.getElementById('calendar'),
                    {
                        plugins: ['interaction', 'dayGrid',
                            'timeGrid', 'resourceTimeline'],
                        schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                        /* 设置事件,不设置默认为当前时间 */
                        /* now: '2019-04-07', */
                        /* 设置为中文*/
                        locale: "ch",
                        /* 是否允许事件可以被编辑 */
                        editable: false,
                        /* 设置高度 */
                        aspectRatio: 2,
                        /* 设置默认滚动到的时间点,默认是'06:00:00'(早上6点) */
                        scrollTime: '08:00', // undo default 6am scrollTime
                        /* 设置开始结束事件 */
                        minTime: '08:00',
                        maxTime: '20:00',

                        /* 用于定义日历头部的按钮和标题 */
                        header: {
                            left: 'today prev,next',
                            center: 'title',
                            right: 'resourceTimelineDay'
                            /*'resourceTimelineDay,resourceTimelineThreeDays,timeGridWeek,dayGridMonth'*/
                        },
                        /* 默认视图 */
                        defaultView: 'resourceTimelineDay',
                        buttonText: {
                            today: '今天'
                        },
                        views: {
                            resourceTimelineDay: {
                                type: 'resourceTimeline',
                                duration: {
                                    days: 1
                                },
                                buttonText: '天'
                            },
                            timeGridWeek: {
                                type: 'timeGridWeek',
                                duration: {
                                    weeks: 1
                                },
                                buttonText: '周'
                            },
                            dayGridMonth: {
                                type: 'dayGridMonth',
                                duration: {
                                    months: 1
                                },
                                buttonText: '月'
                            }
                        },
                        /* 标题 */
                        resourceLabelText: '会议室',
                        resourceAreaWidth :'100px',
                        /* 会议室列表 */
                        resources: '${pageContext.request.contextPath }/meet/fullCalendar',
                        events: '${pageContext.request.contextPath }/meet/fullEvents'

                    });
                /* 立即渲染日历或者调整它的大小 */
                calendar.render();
            });
</script>

</body>
</html>