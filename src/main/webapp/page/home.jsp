<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp"%>
<body>
<%@ include file="../page/top.jsp"%>
<div class="layui-row row_black">
	<%-- 导航开始 Start --%>
	<%@ include file="../page/nav.jsp"%>
	<%-- 导航开始 End --%>
	<div class="layui-col-md10 main-bg-color">
		<%-- 主体 Start --%>		
		<div class="layui-fluid">
			<div class="layui-fluid" style="padding: 0px;">
				<%-- 搜索BOX Start --%>
				<div class="layui-row block-bg-color block-margin-both">
					<div class="layui-col-md12 block-padding-around " style="height: 90px">
						<%-- 搜索条件 Start --%>
						<form class="layui-form relativei" action="">
							<div class="layui-form-item block-margin-both-15">
								<div class="layui-form-item">
									<%-- AREA下拉框 Start --%>
									<div class="layui-inline">
										<div class="layui-input-inline ">
											<select id="home_area" lay-filter="home_area" lay-verify="required">
											</select>
										</div>
									</div>
									<%-- AREA下拉框 End --%>
									<%-- BUILDING下拉框 Start --%>
									<div class="layui-inline">
										<div class="layui-input-inline">
											<select id="home_building" lay-filter="home_building" lay-verify="required">
												<option value=""></option>
											</select>
										</div>
									</div>
									<%-- BUILDING下拉框 End --%>
									<%-- QUERY_DATE时间插件 Satrt --%>
									<div class="layui-inline">
										<div class="layui-input-inline">
											<input type="text" class="layui-input" id="query_date" readonly="readonly">
										</div>
									</div>
									<%-- QUERY_DATE时间插件 End --%>
									<%-- QUERY_START_TIME时间插件 Satrt --%>
									<div class="layui-inline">
										<div class="layui-input-inline">
											<input type="text" class="layui-input" id="query_start_time" readonly="readonly">
										</div>
									</div>
									<%-- QUERY_START_TIME时间插件 End --%>
									<%-- QUERY_END_TIME时间插件 Satrt --%>
									<div class="layui-inline">
										<div class="layui-input-inline">
											<input type="text" class="layui-input" id="query_end_time" readonly="readonly">
										</div>
									</div>
									<%-- QUERY_END_TIME时间插件 End --%>
									<%-- 日程按钮 Start --%>
									<div class="layui-inline" style="float: right; margin-right: 100px; padding-top: 6px;">
										<a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/page/schedule/schedule.jsp"> <i class="layui-icon layui-icon-date"></i> 日程
										</a>
									</div>
									<%-- 日程按钮 End --%>
								</div>
							</div>
						</form>
						<%-- 搜索条件 End --%>
					</div>
				</div>
				<%-- 搜索BOX End --%>
				<%-- 展示BOX Start --%>
				<div class="layui-row block-bg-color block-margin-both">
					<div class="layui-col-md12 block-padding-around">
						<div class="layui-tab layui-tab-brief" lay-filter="home_floor" style="margin-top: 0px">
							<ul class="layui-tab-title" id="home_floor">
								<li class="layui-this">全部</li>
							</ul>
							<div class="layui-tab-content" style="height: 100px;" id="home_tab_content_container">
								<div class="layui-tab-item layui-show" id="home_card_container_parent">
									<div class="layui-row layui-col-space20" id="home_card_container">
										<div class="layui-col-md3"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%-- 展示BOX End --%>
			</div>
		</div>
		<%-- 主体 End --%>
	</div>
</div>		
<script>
var layer;
layui.use([ 'form', 'laydate', 'layer' ], function() {
	var laydate = layui.laydate;
	var form = layui.form;
	layer = layui.layer;
	var element = layui.element;
	
	// 初始化会议室展示容器的高度
	var initHeight = function() {
		var winH = $(window).height();
		var cardH = $("#home_card_container").offset().top;
		var contentH = winH - cardH - 50;
		$("#home_tab_content_container").height(contentH); // 设置会议室展示容器的高度
		return contentH;
	}();
	
	// 下一个时间节点
	var nextTimeStr = function() {
		var unit = 30 * 60 * 1000; // 30MIN
		var now = new Date();
		var nextTime = now.getTime() + unit;
		var next = new Date(nextTime);
		var nextHours = next.getHours();
		var nextMinutes = next.getMinutes();
		nextMinutes = nextMinutes >= 30 ? "30" : "00";
		return "" + nextHours + ":" + nextMinutes;
	}();
	// 获取指定时间30MIN后的时间
	var nextEndStr = function(_HHmm) {
		var hoursAndMinutes = _HHmm.split(":");
		var the = new Date();
		the.setHours(hoursAndMinutes[0]);
		the.setMinutes(hoursAndMinutes[1]);
		var unit = 30 * 60 * 1000; // 30MIN
		var nextTime = the.getTime() + unit;
		var next = new Date(nextTime);
		var nextHours = next.getHours();
		var nextMinutes = next.getMinutes();
		nextMinutes = nextMinutes < 10 ? "0" + nextMinutes : "" + nextMinutes;
		return "" + nextHours + ":" + nextMinutes; // End
	};
	// 计算会议持续时间
	var calaDuration = function(startStr, endStr) {
		var _toTime = function(str) {
			var theArray = str.split(":");
			var the = new Date();
			the.setHours(theArray[0]);
			the.setMinutes(theArray[1]);
			return the.getTime();
		}
		var startTime = _toTime(startStr);
		var endTime = _toTime(endStr);
		var diffVal = (endTime - startTime) / (60 * 1000);
		if (diffVal < 0) {
			diffVal = (24 * 60) + diffVal;
		}
		var hl = parseInt(diffVal / 60); // 小时
		var ml = parseInt(diffVal % 60); // 分钟
		hl = hl < 10 ? "0" + hl : "" + hl;
		ml = ml < 10 ? "0" + ml : "" + ml;
		return hl + ":" + ml;
	}
						
	//初始化时间下拉框
	laydate.render({
		elem : '#query_date',
		format : 'yyyy-MM-dd',
		value : new Date(),
		btns: ['now','confirm'],
		done : function(value, date) {
			var theDay = value;
			var startStr = $("#query_start_time").val();
			var endStr = $("#query_end_time").val();
			var duration = calaDuration(startStr, endStr);
			var data = {
				"date" : theDay,
				"time" : startStr,
				"duration" : duration
			};
			checkTime(data);
		}
	});
	laydate.render({
		elem : '#query_start_time',
		type : 'time',
		format : 'HH:mm',
		value : nextTimeStr,
		ready : formatMinutes,
		btns: ['confirm'],
		done : function(value, date) {
			$("#query_end_time").val(nextEndStr(value)); // 刷新结束时间
			var theDay = $("#query_date").val();
			var startStr = value;
			var endStr = $("#query_end_time").val();
			var duration = calaDuration(startStr, endStr);
			var data = {
				"date" : theDay,
				"time" : startStr,
				"duration" : duration
			};
			checkTime(data);
		}
	});
	laydate.render({
		elem : '#query_end_time',
		type : 'time',
		format : 'HH:mm',
		value : nextEndStr(nextTimeStr),
		ready : formatMinutes,
		btns: ['confirm'],
		done : function(value, date) {
			var theDay = $("#query_date").val();
			var startStr = $("#query_start_time").val();
			var endStr = value;
			var duration = calaDuration(startStr, endStr);
			var data = {
				"date" : theDay,
				"time" : startStr,
				"duration" : duration
			};
			checkTime(data);
		}
	});
	var doFirstCheck = function() {
		var theDay = $("#query_date").val();
		var startStr = $("#query_start_time").val();
		var endStr = $("#query_end_time").val();
		var duration = calaDuration(startStr, endStr);
		var data = {
			"date" : theDay,
			"time" : startStr,
			"duration" : duration
		};
		checkTime(data);
		return "OK";
	}();
				
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
					<%-- 会议室卡片 重构 Start --%>
					var $md2 = $('<div class="layui-col-md2"></div>');
					var $cardBox = $('<div class="layui-card box"></div>');
					var $cardHeader = $('<div class="layui-card-header"></div>');
					var $homePoint = $('<div class="home-point">' + this.personCount + '</div>'); // 人数
					var $homePointLabel = $('<div class="home-point-label"></div>');
					$homePointLabel.html('<h4><strong>' + this.roomName + '</strong></h4>'); // 房间名
					$cardHeader.append($homePoint).append($homePointLabel); // 组建头部
					var $cardBody = $('<div class="layui-card-body home-point-body"></div>');
					$cardBody.attr("data-roomid", this.roomId);
					$cardBody.attr("data-roomtype", this.roomName);
					$cardBody.attr("data-roomtype", this.roomName);
					$cardBody.attr("onclick", "cardFooterAClick(this)");
					// 图片格局人数改变
					var _personCount = this.personCount || 0;
					if (_personCount < 10) {
						$cardBody.html('<img class="roomImg" src="${pageContext.request.contextPath}/image/space_small_blue.png" style="margin-top: 0px;position: relative;top: -15px;">');
					} else if (_personCount < 30) {
						$cardBody.html('<img class="roomImg" src="${pageContext.request.contextPath}/image/space_middle_blue.png" style="margin-top: 0px;position: relative;top: -15px;">');
					} else {
						$cardBody.html('<img class="roomImg" src="${pageContext.request.contextPath}/image/space_large_blue.png" style="margin-top: 0px;position: relative;top: -15px;">');
					}
					var $cardFooter = $('<div class="layui-card-footer-a"></div>');
					$cardFooter.addClass(this.roomId);
					$cardFooter.attr("data-roomtype", this.roomName);
					$cardFooter.attr("data-roomid", this.roomId);
					$cardFooter.attr("id", this.roomId);
					$cardFooter.attr("style", "background-color: white");
					$cardFooter.attr("name", this.roomId);
					$cardFooter.html(this.roomName);
					$cardFooter.attr("onclick", "cardFooterAClick(this)");
					$cardBox.append($cardHeader).append($cardBody).append($cardFooter); // 组建BOX
					$md2.append($cardBox);
					$("#home_card_container").append($md2.prop("outerHTML"));
					tmp.append($md2.prop("outerHTML"));
					<%-- 会议室卡片 重构 End --%>
				});
			});
		}, "JSON");
	}
	<%-- 地区联动: 刷新区域，并且刷新会议室视图 --%>
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
});
// 会议室信息
function findMeeting(roomDom) {
	var roomId = $(roomDom).attr("data-roomId");
	var roomName = $(roomDom).attr("data-roomType");
	layer.open({
		type : 2,
		title : roomName,
		area : [ '600px', '550px' ],
		content : '${pageContext.request.contextPath}/page/meeting/room_meeting.jsp?roomId=' + roomId
	});
}
// 预约事件
function cardFooterAClick(footerDom) {
	var roomId = $(footerDom).attr("data-roomId");
	var roomType = $(footerDom).attr("data-roomType");
	var d = $("#query_date").val();
	d = d.replace("年", "-");
	d = d.replace("月", "-");
	d = d.replace("日", "");
	var t = $("#query_start_time").val();
	t = t.replace("点", ":");
	t = t.replace("分", "");
	var meetTime = $("#query_end_time").val();
	var startTime = $("#query_start_time").val();
	var roomName = $(footerDom).attr("data-roomType");
	layer.open({
		type : 2,
		title : roomName,
		area : [ '750px', '600px' ],
		content : "${pageContext.request.contextPath }/meetroom/remmet?id=" + roomId + "&date=" + d + "&time=" + t + "&meetTime=" + meetTime
	});
}
// 冲突检查
function checkTime(data) {
	// 预定会议冲突检查 根据地区,建筑,日期,时间,时长
	$.post("${pageContext.request.contextPath}/appointreet/checkTime", data, function(resp) {
		// Step1: 重置已被预约的项
		$(".layui-card-footer-a").each(function() {
			var $img = $(this).parent().find(".roomImg");
			var oldSrc = $img.attr("src");
			if (oldSrc.indexOf("_blue") < 0) {
				var newSrc = oldSrc.replace(".png", "_blue.png");
				$img.attr("src", newSrc);
			}
		});
		// Step2: 根据返回数据隐藏匹配的项
		$.each(resp, function() {
			if ((document.getElementById(this.meetRoomId)) != null) {
				// $("." + this.meetRoomId).hide();
				var $img = $("." + this.meetRoomId).parent().find(".roomImg");
				var oldSrc = $img.attr("src");
				var newSrc = oldSrc.replace("_blue", "");
				$img.attr("src", newSrc);
			}
		})
	});
}
</script>
<%--时间控件CSS 去掉秒, 时间以15分钟间隔--%>
<style type="text/css">
	.layui-laydate-content>.layui-laydate-list {
		padding-bottom: 0px;
		overflow: hidden;
	}
	
	.layui-laydate-content>.layui-laydate-list>li {
		width: 50%
	}
	
	.merge-box .scrollbox .merge-list {
		padding-bottom: 5px;
	}
</style>
</body>
</html>