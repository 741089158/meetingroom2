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
       <%-- <div class="layui-row block-bg-color block-border-top">
            <div class="layui-col-md12 block-padding-around">
                <span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>日程</cite></a>
                </span>
            </div>
        </div>--%>

        <div class="layui-fluid" >
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around">
                    <form class="layui-form" action="">
                        <div class="layui-form-item block-margin-both-15">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">地区</label>
                                    <div class="layui-input-inline">
                                        <select id="home_area" lay-filter="home_area" lay-verify="required">
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">区域</label>
                                    <div class="layui-input-inline">
                                        <select id="home_building" lay-filter="home_building" lay-verify="required">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">楼层</label>
                                    <div class="layui-input-inline">
                                        <select id="home_floor" lay-filter="home_floor" lay-verify="required">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
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
        var form = layui.form;
        var layer = layui.layer;
        $("#home_tab_content_container").height(
            $(window).height() - 210);
        var calendar;
         calendar = new FullCalendar.Calendar(document.getElementById('calendar'),
            {plugins: ['interaction', 'dayGrid',
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
                height: 450,
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
                resourceAreaWidth: '100px',
                method:'post',
                /* 会议室列表 */
                resources: '${pageContext.request.contextPath }/meet/fullCalendar',
                events: '${pageContext.request.contextPath }/meet/fullEvents',

                eventClick: function(calEvent, jsEvent, view) {
                    var title = calEvent.event._def.title;
                    var start = getFormatDate(calEvent.event.start);
                    var end = getFormatDate(calEvent.event.end);
                    layer.open({
                        type: 1
                        , content: '<div style="padding: 20px 100px;">'+"时间 : "+ start+"--"+end +'</div><div style="padding: 20px 100px;">'+"主题 : "+ title +'</div>'
                    });
                }
            });
        /* 立即渲染日历或者调整它的大小 */
        calendar.render();
        
<%-- 渲染方法 --%>
function renderCalendar(areaId, building, floor) {
	var paramData = {
		"areaId" : areaId,
		"building" : building,
		"floor" : floor
	};
	$.post("${pageContext.request.contextPath }/meet/fullCalendar", paramData, function(resp) {
		calendar.destroy(); // 摧毁当前日历组件
		var calendarDoc = document.getElementById('calendar'); // 日历DOC
		calendar = new FullCalendar.Calendar(calendarDoc, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid', 'resourceTimeline' ],
			schedulerLicenseKey : 'CC-Attribution-NonCommercial-NoDerivatives',
			locale : "ch",
			editable : false,
			aspectRatio : 2,
			scrollTime : '08:00',
			minTime : '08:00',
			maxTime : '20:00',
			height : 450,
			header : {
				left : 'today prev,next',
				center : 'title',
				right : 'resourceTimelineDay'
			},
			defaultView : 'resourceTimelineDay',
			buttonText : {
				today : '今天'
			},
			views : {
				resourceTimelineDay : {
					type : 'resourceTimeline',
					duration : {
						days : 1
					},
					buttonText : '天'
				},
				timeGridWeek : {
					type : 'timeGridWeek',
					duration : {
						weeks : 1
					},
					buttonText : '周'
				},
				dayGridMonth : {
					type : 'dayGridMonth',
					duration : {
						months : 1
					},
					buttonText : '月'
				}
			},
			resourceLabelText : '会议室',
			resourceAreaWidth : '100px',
			method : 'post',
			resources : resp,
			events : '${pageContext.request.contextPath }/meet/fullEvents',
			eventClick : function(calEvent, jsEvent, view) {
				var title = calEvent.event._def.title;
				var start = getFormatDate(calEvent.event.start);
				var end = getFormatDate(calEvent.event.end);
				layer.open({
					type : 1,
					content : '<div style="padding: 20px 100px;">' + "时间 : " + start + "--" + end + '</div><div style="padding: 20px 100px;">' + "主题 : " + title + '</div>'
				});
			}
		});
		calendar.render();
	});
}
function renderFloor(areaId, building) {
	var paramData = {
		"area" : areaId,
		"building" : building
	};
	$.post("${pageContext.request.contextPath}/meetroom/floor", paramData, function(result) {
		$.each(result, function(k, v) {
			$("#home_floor").append("<option id='" + this.roomFloor + "' value='" + this.roomFloor + "'>" + this.roomFloor + "</option>");
		});
		form.render();
		// 渲染Floor后，刷型日历
		var areaId = $("#home_area").val();
		var building = $("#home_building").val();
		var floor = $("#home_floor").val();
		renderCalendar(areaId, building, floor);
	});
}
function renderBuilding(key) {
	var paramData = {
		"key" : key
	};
	$("#home_building").empty();
	$("#home_floor").empty();
	$.post("${pageContext.request.contextPath}/meetroom/meetbuilding", paramData, function(result) {
		$.each(result, function(k, v) {
			$("#home_building").append("<option id='" + this.roomBuilding + "' value='" + this.roomBuilding + "'>" + this.roomBuilding + "</option>");
		});
		form.render();
		// 渲染之后，继续渲染楼层
		var areaId = $("#home_area").val();
		var building = $("#home_building").val();
		renderFloor(areaId, building);
	});
}

        $.post("${pageContext.request.contextPath}/meetroom/meetarea", {}, function (result) {
            $.each(result,function (k,v) {
                $("#home_area").append("<option id='"+this.areaId+"' value='"+this.areaId+"'>"+this.roomAreaName+"</option>");
            });
            form.render();
            renderBuilding($("#home_area").val());
        });
        //监听区域
        form.on('select(home_area)', function (data) {
            $("#home_building").empty();
            $("#home_floor").empty();
            <%--
            $.post("${pageContext.request.contextPath}/meetroom/meetbuilding", {"key":data.value}, function (result) {
                $.each(result,function (k,v) {
                    $("#home_building").append("<option id='"+this.roomBuilding+"' value='"+this.roomBuilding+"'>"+this.roomBuilding+"</option>");
                });
                form.render();
            });
            --%>
            renderBuilding(data.value);
        });

        //监听建筑
        form.on('select(home_building)', function (data) {
            $("#home_floor").empty();
            var areaId = $("#home_area option:selected").val();
        <%--    $.post("${pageContext.request.contextPath}/meetroom/floor", {"area":areaId,"building":data.value}, function (result) {
                $.each(result,function (k,v) {
                    $("#home_floor").append("<option id='"+this.roomFloor+"' value='"+this.roomFloor+"'>"+this.roomFloor+"</option>");
                });
                form.render();
            }); --%>
            renderFloor(areaId, data.value);
        });
        form.on('select(home_floor)', function (data) {
            var areaId = $("#home_area option:selected").val();
            var building = $("#home_building option:selected").val();
            $.post("${pageContext.request.contextPath }/meet/fullCalendar",{"areaId":areaId,"building":building,"floor":data.value},function (resp) {
                calendar.destroy();
                calendar = new FullCalendar.Calendar(document.getElementById('calendar'),
                    {plugins: ['interaction', 'dayGrid',
                            'timeGrid', 'resourceTimeline'],
                        schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                        locale: "ch",
                        editable: false,
                        aspectRatio: 2,
                        scrollTime: '08:00',
                        minTime: '08:00',
                        maxTime: '20:00',
                        height: 450,
                        header: {
                            left: 'today prev,next',
                            center: 'title',
                            right: 'resourceTimelineDay'
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
                        resourceLabelText: '会议室',
                        resourceAreaWidth: '100px',
                        method:'post',
                        resources: resp,
                        events: '${pageContext.request.contextPath }/meet/fullEvents',

                        eventClick: function(calEvent, jsEvent, view) {
                            var title = calEvent.event._def.title;
                            var start = getFormatDate(calEvent.event.start);
                            var end = getFormatDate(calEvent.event.end);
                            layer.open({
                                type: 1
                                , content: '<div style="padding: 20px 100px;">'+"时间 : "+ start+"--"+end +'</div><div style="padding: 20px 100px;">'+"主题 : "+ title +'</div>'
                            });
                        }
                    });
                calendar.render();
            });
        });
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
        if (date.getHours()==0 || date.getHours()<10){
            hour = '0'+date.getHours();
        } else {
            hour =  date.getHours();
        }
        currentDate =hour+ ":";
        if (date.getMinutes()==0||date.getMinutes()<10){
            minutes = '0'+date.getMinutes();
        } else {
            minutes =  date.getMinutes();
        }
        currentDate+=minutes;
        return currentDate;
    }
</script>
</body>
</html>