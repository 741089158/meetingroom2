<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp" %>
<body>
<%@ include file="../page/top.jsp" %>
<div class="layui-row row_black">
    <%@ include file="../page/nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <%--<div class="layui-row block-bg-color block-border-top">
            <div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>我的会议</cite></a>
					</span>
            </div>
            <div class="layui-col-md12 block-padding-around">
                <h2 class="block-bot-left">会议室预订</h2>
                <div class="block-bot-right">
                    <a class="layui-btn layui-btn-sm layui-btn-normal"
                       href="${pageContext.request.contextPath}/page/schedule/schedule.jsp">
                        <i class="layui-icon layui-icon-date"></i> 日程
                    </a>
                </div>
            </div>
        </div>--%>
        <%-- <div class="layui-row block-bg-color block-border-top">
             <div class="layui-col-md12 block-padding-around">
                 <span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>会议室预订</cite></a>
                 </span>
             </div>
         </div>--%>
        <div class="layui-fluid">
            <%--<div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around" style="height: 130px">
                    <form class="layui-form" action="">
                        <div class="layui-form-item block-margin-both-15">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">地区</label>
                                    <div class="layui-input-inline">
                                        <select id="home_area" lay-filter="home_area" lay-verify="required">
                                            &lt;%&ndash;<c:forEach items="${meetRoomArea}" var="area">
                                                <option id="${area.areaId}"
                                                        value="${area.areaId}">${area.roomAreaName}</option>
                                            </c:forEach>&ndash;%&gt;
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
                                <div class="layui-inline" style="float: right;margin-right: 100px">
                                    <a class="layui-btn layui-btn-sm layui-btn-normal"
                                       href="${pageContext.request.contextPath}/page/schedule/schedule.jsp">
                                        <i class="layui-icon layui-icon-date"></i> 日程
                                    </a>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">日期</label>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id="home_date" placeholder="yyyy年MM月dd日"
                                               lay-verify="required" onchange="checkTime()">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">时间</label>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id="home_time" placeholder="HH:mm"
                                               lay-verify="required" onchange="checkTime()">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">时长</label>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id="home_duration" placeholder="HH:mm"
                                               lay-verify="required" onchange="checkTime()">
                                    </div>
                                </div>
                            </div>
                            <!--
                            <div class="layui-inline">
                                <label class="layui-form-label"></label>
                                <div class="layui-input-inline">
                                    <button class="layui-btn" lay-submit="" lay-filter="home_search">查询</button>
                                </div>
                            </div>
                             -->
                        </div>
                    </form>
                </div>
            </div>--%>
                <div class="layui-fluid">
                    <div class="layui-row block-bg-color block-margin-both">
                        <div class="layui-col-md12 block-padding-around " style="height: 90px">
                            <form class="layui-form relativei" action="">
                                <div class="layui-form-item block-margin-both-15">
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <%--<label class="layui-form-label">地区</label>--%>
                                            <div class="layui-input-inline ">
                                                <select id="home_area" lay-filter="home_area" lay-verify="required">
                                                    <%--<c:forEach items="${meetRoomArea}" var="area">
                                                        <option id="${area.areaId}"
                                                                value="${area.areaId}">${area.roomAreaName}</option>
                                                    </c:forEach>--%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="layui-inline">
                                            <%--<label class="layui-form-label">区域</label>--%>

                                            <div class="layui-input-inline">
                                                <select id="home_building" lay-filter="home_building" lay-verify="required">
                                                    <option value=""></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="layui-inline">
                                            <%--<label class="layui-form-label">日期</label>--%>
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" id="home_date" placeholder="yyyy年MM月dd日"
                                                       lay-verify="required" onchange="checkTime()">
                                            </div>
                                        </div>
                                        <div class="layui-inline">
                                            <%--<label class="layui-form-label">时间</label>--%>
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" id="home_time" placeholder="HH:mm"
                                                       lay-verify="required" onchange="checkTime()">
                                            </div>
                                        </div>
                                        <div class="layui-inline">
                                            <%--<label class="layui-form-label">时长</label>--%>
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" id="home_duration" placeholder="HH:mm"
                                                       lay-verify="required" onchange="checkTime()">
                                            </div>
                                        </div>
                                        <div class="layui-inline" style="float: right;margin-right: 100px">
                                            <a class="layui-btn layui-btn-sm layui-btn-normal"
                                               href="${pageContext.request.contextPath}/page/schedule/schedule.jsp">
                                                <i class="layui-icon layui-icon-date"></i> 日程
                                            </a>
                                        </div>
                                    </div>
                                    <%--<div class="layui-form-item">--%>
                                    <%----%>
                                    <%----%>
                                    <%----%>
                                    <%--</div>--%>
                                    <!--
                                    <div class="layui-inline">
                                        <label class="layui-form-label"></label>
                                        <div class="layui-input-inline">
                                            <button class="layui-btn" lay-submit="" lay-filter="home_search">查询</button>
                                        </div>
                                    </div>
                                     -->
                                </div>
                            </form>
                        </div>
                    </div>
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around">
                    <div class="layui-tab layui-tab-brief" lay-filter="home_floor" style="margin-top: 0px">
                        <ul class="layui-tab-title" id="home_floor">
                            <li class="layui-this">全部</li>
                        </ul>
                        <div class="layui-tab-content" style="height: 100px;" id="home_tab_content_container">
                            <div class="layui-tab-item layui-show" id="home_card_container_parent">
                                <div class="layui-row layui-col-space20" id="home_card_container">
                                    <div class="layui-col-md3">
                                        <!--
                                        <div class="layui-card box">
                                            <div class="layui-card-header">
                                                <div class="home-point">F25</div>
                                                <div class="home-point-label">
                                                    <h3>
                                                        <strong>卡片面板</strong>
                                                    </h3>
                                                </div>
                                            </div>
                                            <div class="layui-card-body home-point-body">
                                                可容纳人数
                                                <h3>
                                                    <strong>111人</strong>
                                                </h3>
                                            </div>
                                            <div class="layui-card-footer-a">卡片面板</div>
                                        </div>
                                         -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var layer;//层
    layui.use(['form', 'laydate', 'layer'], function () {
        //处理高度
        $("#home_tab_content_container").height($(window).height() - $("#home_card_container").offset().top - 50);
        var laydate = layui.laydate;
        var form = layui.form;
        layer = layui.layer;
<%--
        //显示所有会议室
        $.post("${pageContext.request.contextPath}/meet/findList", {}, function (result) {
            $("#home_floor").empty();
            $("#home_floor").append("<li data-floor='all' class='layui-this'>全部</li>");
            $("#home_card_container_parent").siblings().remove();
            $("#home_card_container").empty();
            $.each(result.data, function (k, v) {
                var top_tmp = $('<div class="layui-tab-item"></div>');
                var tmp = $('<div class="layui-row layui-col-space20"></div>');
                top_tmp.append(tmp);
                $("#home_tab_content_container").append(top_tmp);
                var card = $('<div class="layui-col-md2" >' +
                    '<div class="layui-card box">' +
                    '<div class="layui-card-header" >' +
                    '<div class="home-point">' + this.personCount + 'P</div>' +
                   /* '<div class="home-point-label">' +
                    '<h4>' +
                    '<strong>' + this.roomName + '</strong>' +
                    '</h4>' +
                    '</div>' +*/
                    '</div>' +
                    '<div class="layui-card-body home-point-body" data-roomId="' + this.roomId + '"  data-roomType="' + this.roomName + '"  onclick="findMeeting(this)" style="height: 25px">' +
                    /*'<h4>' +
                    '<strong>' + this.personCount + '人</strong>' +
                    '</h4>' +*/
                    '<img src="${pageContext.request.contextPath}/image/2.png" style="margin-top: 0px" />'+
                    '</div>' +
                    '<div class="layui-card-footer-a ' + this.roomId + '" data-roomType="' + this.roomName +
                    '" data-roomId="' + this.roomId +
                    '" onclick="cardFooterAClick(this)" id="' + this.roomId + '" style="background-color: white" name="remeet">' + this.roomName + '</div>' +
                    '</div>' +
                    '</div>');
                $("#home_card_container").append(card.clone());
                tmp.append(card);
            });
        }, "json");
--%>

        laydate.render({
            elem: '#home_date',
            format: 'yyyy-MM-dd',
            value: new Date(),
            done: function (value, date) {
                var home_time = $("#home_time").val();             //时间
                var check_duration = $("#home_duration").val();     //时长
                var data = {
                    "date": value,
                    "time": home_time,
                    "duration": check_duration
                };
                if (home_time == "" || check_duration == "") {
                    return;
                }
                console.log(data);
                checkTime(data);
            }
        });
        laydate.render({
            elem: '#home_time',
            type: 'time',
            format: 'HH:mm',
            ready: formatMinutes,
            done: function (value, date) {
                var check_date = $("#home_date").val();             //日期
                var check_duration = $("#home_duration").val();     //时长
                var data = {
                    "date": check_date,
                    "time": value,
                    "duration": check_duration
                };
                if (check_date == "" || check_duration == "") {
                    return;
                }
                checkTime(data);
            }
        });
        laydate.render({
            elem: '#home_duration',
            type: 'time',
            btns: ['confirm'],
            format: 'HH:mm',
            value: '01:00',
            ready: formatMinutes,
            done: function (value, date) {
                var check_date = $("#home_date").val();      //日期
                var check_time = $("#home_time").val();     //时间
                var data = {
                    "date": check_date,
                    "time": check_time,
                    "duration": value
                };
                if (check_date == "" || check_time == "") {
                    return;
                }
                checkTime(data);
            }
        });

<%-- Amendment passed Start --%>
<%-- 初始化 地区 区域 --%>
$.post("${pageContext.request.contextPath}/meetroom/meetarea", {}, function(result) {
	$(result).each(function() {
		$("#home_area").append("<option value='" + this.areaId + "'>" + this.roomAreaName + "</option>");
	});
	form.render('select');
	// 渲染区域
	var key = $("#home_area").val();
	renderBuilding(key)
}, "JSON");
<%-- 渲染会议室区域 --%>
function renderRoom(area, building) {
	var data = {
		area : area,
		building : building
	};
	$("#home_time").val("");
	var url = "${pageContext.request.contextPath}/meetroom/meetfloor";
	$.post(url, data, function(result) {
		$("#home_floor").empty();
		$("#home_floor").append("<li data-floor='all' class='layui-this'>全部</li>");
		$("#home_card_container_parent").siblings().remove();
		$("#home_card_container").empty();
		$.each(result, function(k, v) {
			$("#home_floor").append("<li data-floor='" + k + "'>" + k + "F</li>");
			var top_tmp = $('<div class="layui-tab-item"></div>');
			var tmp = $('<div class="layui-row layui-col-space20"></div>');
			top_tmp.append(tmp);
			$("#home_tab_content_container").append(top_tmp);
			$.each(v, function(i, n) {
				var card = $('<div class="layui-col-md2" >' + '<div class="layui-card box">' + '<div class="layui-card-header">' + '<div class="home-point">' + this.personCount + 'P</div>'
						+ '<div class="home-point-label">' + '<h4>' + '<strong>' + n.roomName + '</strong>' + '</h4>' + '</div>' + '</div>'
						+ '<div class="layui-card-body home-point-body" data-roomId="' + this.roomId + '" data-roomType="' + this.roomName + '" style="height: 25px" onclick="findMeeting(this)">'
						+ '<img src="${pageContext.request.contextPath}/image/2.png" style="margin-top: 0px" />' +
                    '</h4>' + '</div>' + '<div class="layui-card-footer-a ' + this.roomId + '" data-roomType="' + n.roomName
						+ '" data-roomId="' + n.roomId + '" onclick="cardFooterAClick(this)" id="' + this.roomId + '" style="background-color: white" name="' + this.roomId + '">' + this.roomName + '</div>' + '</div>'
						+ '</div>');
				$("#home_card_container").append(card.clone());
				tmp.append(card);
			});
		});
	}, "JSON");
}
<%--
	地区联动: 刷新区域，并且刷新会议室视图
--%>
function renderBuilding(areaKey) {
	var url = "${pageContext.request.contextPath}/meetroom/meetbuilding";
	var key = areaKey;
	$("#home_building").empty(); // 清空区域
	$.post(url, {
		key : key
	}, function(result) {
		$(result).each(function() {
			var htmlArray = [ "<option value='", this.roomBuilding, "'>", this.roomBuilding, "</option>" ];
			$("#home_building").append(htmlArray.join("")); // 添加新的区域
		});
		form.render('select'); // 重新渲染
		// 重新渲染会议室区域
		var area = $("#home_area").val();
		var building = $("#home_building").val();
		renderRoom(area, building);
	}, "JSON");
}
form.on('select(home_area)', function(data) {
	var key = data.value;
	renderBuilding(key);
});
<%-- 楼层联动 --%>
form.on('select(home_building)', function(e) {
	var area = $("#home_area").val();
	var building = e.value;
	renderRoom(area, building);
});
<%--  Amendment passed End --%>

        form.on('submit(home_search)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });
            return false;
        });

    });

    //卡片中间的点击事件  e ->  roomId
    function findMeeting(e) {
        var roomId = $(e).attr("data-roomId");
        var roomName = $(e).attr("data-roomType");
        //console.log(roomName);
        layer.open({
            type: 2
            , title: roomName
            , area: ['600px', '550px']
            , content: '${pageContext.request.contextPath}/page/meeting/room_meeting.jsp?roomId=' + roomId
        });
    }

    //footer下面的点击事件
    function cardFooterAClick(e) {
        var roomId = $(e).attr("data-roomId");
        var roomType = $(e).attr("data-roomType");
        var d = $("#home_date").val();
        d = d.replace("年", "-");
        d = d.replace("月", "-");
        d = d.replace("日", "");
        var t = $("#home_time").val();
        t = t.replace("点", ":");
        t = t.replace("分", "");
        var meetTime = $("#home_duration").val();
        var startTime = $("#home_time").val();

        layer.open({
            type: 2
            , title: "预约会议"
            , area: ['750px', '600px']
            , content: "${pageContext.request.contextPath }/meetroom/remmet?id=" + roomId + "&date=" + d + "&time=" + t + "&meetTime=" + meetTime
        });


    }



    //冲突检查
    function checkTime(data) {
        //预定会议冲突检查  根据地区,建筑,日期,时间,时长
        $.post("${pageContext.request.contextPath}/appointreet/checkTime", data, function (resp) {
            
            // Step1: 重置已被预约的项
			$(".layui-card-footer-a").css("display", "block");
			// Step2: 根据返回数据隐藏匹配的项
			$.each(resp, function() {
				if ((document.getElementById(this.meetRoomId)) != null) {
					$("." + this.meetRoomId).hide();
				}
			})
            
        });
    }

</script>
<%--时间控件css 去掉秒,时间以15分钟间隔--%>
<style type="text/css">
    .layui-laydate-content > .layui-laydate-list {
        padding-bottom: 0px;
        overflow: hidden;
    }

    .layui-laydate-content > .layui-laydate-list > li {
        width: 50%
    }

    .merge-box .scrollbox .merge-list {
        padding-bottom: 5px;
    }
</style>
</body>
</html>