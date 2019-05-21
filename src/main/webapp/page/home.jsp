<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp"%>
<body>
<%@ include file="../page/top.jsp"%>
<div class="layui-row row_black">
	<%@ include file="../page/nav.jsp"%>
	<div class="layui-col-md10 main-bg-color">
		<div class="layui-row block-bg-color block-border-top">
			<div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>我的会议</cite></a>
					</span>
			</div>
			<div class="layui-col-md12 block-padding-around">
				<h2 class="block-bot-left">会议室预定</h2>
				<div class="block-bot-right">
					<a class="layui-btn layui-btn-sm layui-btn-normal" href="${pageContext.request.contextPath}/page/schedule/schedule.jsp">
						<i class="layui-icon layui-icon-date"></i> 日程
					</a>
				</div>
			</div>
		</div>
		<div class="layui-fluid">
			<div class="layui-row block-bg-color block-margin-both">
				<div class="layui-col-md12 block-padding-around">
					<form class="layui-form" action="">
						<div class="layui-form-item block-margin-both-15">
							<div class="layui-inline">
								<label class="layui-form-label">地区</label>
								<div class="layui-input-inline">
									<select id="home_area" lay-filter="home_area" lay-verify="required">
										<option selected="selected" id="c5539aa3-af34-463d-9415-1a7f8ae42727" value="c5539aa3-af34-463d-9415-1a7f8ae42727">WH</option>
										<c:forEach items="${meetRoomArea}" var="area">
											<option id="${area.areaId}" value="${area.areaId}">${area.roomAreaName}</option>
										</c:forEach>
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
								<label class="layui-form-label">日期</label>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="home_date" placeholder="yyyy年MM月dd日" lay-verify="required">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">时间</label>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="home_time" placeholder="H点m分" lay-verify="required">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">时长</label>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="home_duration" placeholder="H点m分" lay-verify="required">
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
			</div>
			<div class="layui-row block-bg-color block-margin-both">
				<div class="layui-col-md12 block-padding-around">
					<div class="layui-tab layui-tab-brief" lay-filter="home_floor">
						<ul class="layui-tab-title" id="home_floor">
							<li class="layui-this">全部</li>
						</ul>
						<div class="layui-tab-content" style="height: 100px;" id="home_tab_content_container">
							<div class="layui-tab-item layui-show" id="home_card_container_parent">
								<div class="layui-row layui-col-space20" id="home_card_container">
									<div class="layui-col-md3">
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
	layui.use([ 'form', 'laydate' ], function() {
		//处理高度
		$("#home_tab_content_container").height($(window).height()-$("#home_card_container").offset().top-50);
		var laydate = layui.laydate;
		var form = layui.form;
		laydate.render({
			elem : '#home_date',
			format : 'yyyy年MM月dd日'
		});
		laydate.render({
			elem : '#home_time',
			type : 'time',
			format : 'H点m分'
		});
		laydate.render({
			elem : '#home_duration',
			type : 'time',
			btns : [ 'confirm' ],
			format : 'H小时m分'
		});
		//地区联动选楼
		form.on('select(home_area)', function(data) {
			url = "${pageContext.request.contextPath}"
					+ "/meetroom/meetbuilding";
			var str = "";
			$("#home_building").empty();
			$.post(url, {
				"key" : data.value
			}, function(result) {
				$(result).each(
						function() {
							$("#home_building").append(
									"<option value='"+this.roomBuilding+"'>"
									+ this.roomBuilding
									+ "</option>");
						});
				form.render('select');
			}, "json");
		});
		//楼联动楼层
		form.on('select(home_building)', function(e) {
			url = "${pageContext.request.contextPath}"
					+ "/meetroom/meetfloor";
			var data = {
				"area" : $("#home_area").val(),
				"building" : e.value
			};
			$.post(url, data, function(result) {
				$("#home_floor").empty();
				$("#home_floor").append("<li data-floor='all' class='layui-this'>全部</li>");
				$("#home_card_container_parent").siblings().remove();
				$("#home_card_container").empty();
				$.each(result, function(k, v) {
					$("#home_floor").append("<li data-floor='"+k+"'>" + k + "F</li>");
					var top_tmp = $('<div class="layui-tab-item"></div>');
					var tmp = $('<div class="layui-row layui-col-space20"></div>');
					top_tmp.append(tmp);
					$("#home_tab_content_container").append(top_tmp);
					$.each(v, function(i, n) {
						//console.log(n);
						var card = $('<div class="layui-col-md3">'+
								'<div class="layui-card box">'+
								'<div class="layui-card-header">'+
								'<div class="home-point">'+k+'F</div>'+
								'<div class="home-point-label">'+
								'<h3>'+
								'<strong>'+n.roomType+'</strong>'+
								'</h3>'+
								'</div>'+
								'</div>'+
								'<div class="layui-card-body home-point-body">'+
								'可容纳人数'+
								'<h3>'+
								'<strong>'+n.personCount+'人</strong>'+
								'</h3>'+
								'</div>'+
								'<div class="layui-card-footer-a">预约</div>'+
								'</div>'+
								'</div>');
						$("#home_card_container").append(card.clone());
						tmp.append(card);
					});
				});
			}, "json");
		});
		form.on('submit(home_search)', function(data) {
			layer.alert(JSON.stringify(data.field), {
				title : '最终的提交信息'
			})
			return false;
		});
		//处理高度
		//$("#home_tab_content_container").height($(window).height()-$("#home_card_container").offset().top-50);
	});
</script>
</body>
</html>