<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp"%>
<body>
	<%@ include file="../page/top.jsp"%>
	<div class="layui-row">
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
						<button class="layui-btn layui-btn-sm layui-btn-normal">
							<i class="layui-icon layui-icon-date"></i> <a href="${pageContext.request.contextPath}/page/schedule/schedule.jsp">日晨</a>
						</button>
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
										<select id="home_area" lay-filter="">
											<option value=""></option>
											<option value="0">写作</option>
											<option value="1" selected="">阅读</option>
											<option value="2">游戏</option>
											<option value="3">音乐</option>
											<option value="4">旅行</option>
										</select>
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">区域</label>
									<div class="layui-input-inline">
										<select id="home_block" lay-filter="">
											<option value=""></option>
											<option value="0">写作</option>
											<option value="1" selected="">阅读</option>
											<option value="2">游戏</option>
											<option value="3">音乐</option>
											<option value="4">旅行</option>
										</select>
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">日期</label>
									<div class="layui-input-inline">
										<input type="text" class="layui-input" id="test11" placeholder="yyyy年MM月dd日">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label">时间</label>
									<div class="layui-input-inline">
										<input type="text" class="layui-input" id="test14" placeholder="H点m分">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="layui-row block-bg-color block-margin-both">
					<div class="layui-col-md12 block-padding-around">
						<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
							<ul class="layui-tab-title">
								<li class="layui-this">网站设置</li>
								<li>用户管理</li>
								<li>权限分配</li>
								<li>商品管理</li>
								<li>订单管理</li>
							</ul>
							<div class="layui-tab-content" style="height: 100px;">
								<div class="layui-tab-item layui-show">内容不一样是要有，因为你可以监听tab事件（阅读下文档就是了）</div>
								<div class="layui-tab-item">内容2</div>
								<div class="layui-tab-item">内容3</div>
								<div class="layui-tab-item">内容4</div>
								<div class="layui-tab-item">内容5</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		layui.use([ 'form', 'laydate' ], function() {
			var element = layui.element;
			var laydate = layui.laydate;
			laydate.render({
				elem : '#test11',
				format : 'yyyy年MM月dd日'
			});
			laydate.render({
				elem : '#test14',
				type : 'time',
				format : 'H点m分'
			});
		});
	</script>
</body>
</html>