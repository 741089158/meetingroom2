<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../page/common.jsp" %>
<body>
<%@ include file="../../page/top.jsp" %>

<div class="layui-row">
	<%@ include file="../../page/nav.jsp" %>
	<div class="layui-col-md10 main-bg-color">
		<div class="layui-row block-bg-color block-border-top">
			<div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>管理后台</cite></a>
					</span>
			</div>
			<div class="layui-col-md12 block-padding-around">
				<h2 class="block-bot-left">部门管理</h2>
				<div class="block-bot-right">
					<button class="layui-btn layui-btn-sm layui-btn-normal" id="add">
						<i class="layui-icon layui-icon-add-1"></i> 添加部门
					</button>
				</div>
			</div>
		</div>
		<div class="layui-fluid">
			<div class="layui-row block-bg-color block-margin-both">
				<div class="layui-col-md12 block-padding-around">
                        <div class="layui-form-item" style="margin: 0px">
                            <div class="layui-inline">
                                <h2>部门详情一览</h2>
                            </div>
                            <div class="layui-inline" style="float: right">
                                <div class="layui-input-inline">
                                    <input class="layui-input" name="deptName" id="deptName" autocomplete="off"
                                           placeholder="部门名称">
                                </div>
                                <div class="layui-inline">
                                    <button class="layui-btn" lay-submit="" data-type="getInfo" id="search">搜索</button>
                                </div>
                            </div>
                        </div>
				</div>
				<hr/>
				<div class="layui-col-md12 block-padding-around">
					<table id="demo" lay-filter="test"></table>
				</div>
			</div>
		</div>

	</div>
</div>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script>

	layui.use(['laydate', 'laypage', 'layer', 'table'],function () {
		var  laypage = layui.laypage //分页
				// ,laydate = layui.laydate//日期
				// , layer = layui.layer //弹层
				, table = layui.table //表格
		;
		//第一个实例
		table.render({
			elem: '#demo'
			, height: 330
			, url: '${pageContext.request.contextPath }/dept/findAll' //数据接口
			, page: true //开启分页
			,method:"post"
			//,toolbar: 'default'  //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
			,totalRow: true //开启合计行
			, cols: [[ //表头
				{type: 'checkbox', fixed: 'left'}
				, {field: 'deptid', title: 'ID', width: 80, fixed: 'left'}
				, {field: 'deptname', title: '部门名称', width: 120}
				, {field: 'deptaddr', title: '部门地址', width: 120}
				, {field: 'depttel', title: '部门电话', width: 150}
				, {field: 'email', title: '部门邮箱', width: 150}
				, {field: 'subofficename', title: '公司', width: 120}
				, {fixed: 'right',title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
			]]
		});
		//监听行工具事件
		table.on('tool(test)', function(obj){
			var data = obj.data;
			// console.log(data.roomId)   //获取roomid
			if(obj.event === 'delete'){
				layer.confirm('真的删除行么', function(index){
					$.post("${pageContext.request.contextPath}/meet/delete",{roomId:data.roomId},function (response) {
						location.reload();
					});

				});
			} else if(obj.event === 'edit'){
				layer.open({
					type:2
					,area: ['700px', '500px']
					,title: '修改部门'
					,content:"${pageContext.request.contextPath}/meet/findOne?roomId="+data.roomId
				});
			}else if(obj.event === 'detail'){
				layer.open({
					type:2
					,area: ['700px', '500px']
					,title: '查看部门'
					,content:"${pageContext.request.contextPath}/meet/findOne?roomId="+data.roomId
				});
			}
		});

		$("#add").click(function () {
			layer.open({
				type:2
				,area: ['700px', '500px']
				,title: '添加部门'
				,content:"${pageContext.request.contextPath}/page/meet_management/room_add.jsp"
			});
		});

		var Meet = {
			tableId: "demo",
			condition: {
				deptName: ""
			}
		};
		Meet.search = function(){
			var queryData = {};
			queryData['deptName'] = $("#deptName").val();
			table.reload(Meet.tableId,{where:queryData});
		};

		// 搜索按钮点击事件
		$('#search').click(function () {
			Meet.search();
		});

	});
</script>
</body>
</html>