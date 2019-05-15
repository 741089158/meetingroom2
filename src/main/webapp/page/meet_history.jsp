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
					<h2 class="block-bot-left">我的历史会议</h2>
					<div class="block-bot-right">
						<button class="layui-btn layui-btn-sm layui-btn-normal">
							<i class="layui-icon layui-icon-add-1"></i> 添加
						</button>
					</div>
				</div>
			</div>
			<div class="layui-fluid">
				<div class="layui-row block-bg-color block-margin-both">
					<div class="layui-col-md12 block-padding-around">
						<h3>历史会议一览</h3>
					</div>
					<hr />
					<div class="layui-col-md12 block-padding-around">
						<table id="demo" lay-filter="test"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		layui.use('table', function() {
			var table = layui.table;
			//第一个实例
			table.render({
				elem : '#demo',
				height : 550,
				url : '${pageContext.request.contextPath }/appointreet/history' //数据接口
				,
				page : true //开启分页
				,
				cols : [ [ //表头
				{
					field : 'id',
					title : 'ID',
					width : 50,
					fixed : 'left'
				}, {
					field : 'meetName',
					title : '会议名称',
					width : 100
				}, {
					field : 'meetType',
					title : '会议类型',
					width : 100
				}, {
					field : 'starttime',
					title : '开始时间',
					width : 180
				}, {
					field : 'duration',
					title : '时长',
					width : 80
				} ] ]
			});

		});
	</script>
</body>
</html>