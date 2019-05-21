<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../page/schedule/fullCalendar.jsp" %>

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
        width: 97%;
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
                <div class="layui-col-md12 block-padding-around">
                        <div id='calendar'></div>
                </div>
            </div>
        </div>

    </div>
</div>
<script>
   /* layui.use(['laydate', 'laypage', 'layer', 'table'],function () {
        var  laypage = layui.laypage //分页
            , table = layui.table //表格
        ;
    });*/


    $(document).ready(function () {
    var calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
        plugins: ['interaction', 'dayGrid', 'timeGrid', 'resourceTimeline'],
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
            right: 'resourceTimelineDay,resourceTimelineThreeDays,timeGridWeek,dayGridMonth'
        },
        /* 默认视图 */
        defaultView: 'resourceTimelineDay',
        buttonText: {
            today: '今天'
        },
        views: {
            /* resourceTimelineThreeDays: {
              type: 'resourceTimeline',
              duration: { days: 3 },
              buttonText: '3 天'
            } */
            resourceTimelineDay: {
                type: 'resourceTimeline',
                duration: {days: 1},
                buttonText: '天'
            },
            timeGridWeek: {
                type: 'timeGridWeek',
                duration: {weeks: 1},
                buttonText: '周'
            },
            dayGridMonth: {
                type: 'dayGridMonth',
                duration: {months: 1},
                buttonText: '月'
            }
        },
        /* 标题 */
        resourceLabelText: '会议室',

        /* 会议室列表 */
        resources:'${pageContext.request.contextPath }/meet/fullCalendar',
        /* [
         {id: '1', title: '会议室1', eventColor: 'red'},
         {id: '2', title: '会议室2', eventColor: 'green'},
         {id: '3', title: '会议室3', eventColor: 'orange'},
         {id: '4', title: '会议室4', eventColor: 'orange'},
         {id: '4', title: '会议室5', eventColor: 'red'},
         {id: '5', title: '会议室6', eventColor: 'red'}
          /!* {
      id: 'd', title: '会议室4', children: [
          {id: 'd1', title: 'Room D1'},
          {id: 'd2', title: 'Room D2'}
      ]
  },*!/
         ],*/
        events:'${pageContext.request.contextPath }/meet/fullEvents'

    });
    /* 立即渲染日历或者调整它的大小 */
    calendar.render();
    });

</script>
</body>
</html>