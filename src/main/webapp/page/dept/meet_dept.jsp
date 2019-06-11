<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../page/common.jsp" %>
<body>
<%@ include file="../../page/top.jsp" %>

<div class="layui-row row_black">
	<%@ include file="../../page/nav.jsp" %>
	<div class="layui-col-md10 main-bg-color">
		<div class="layui-fluid">
			<div class="layui-row block-bg-color block-margin-both">
				<div class="layui-col-md12 block-padding-around" style="height: 35px">
					<div class="layui-form-item" >
						<div class="layui-inline">
							<h2>部门详情一览</h2>
						</div>
						<div class="layui-inline" style="float: right">
							<div class="layui-input-inline">
								<input class="layui-input" name="deptname" id="deptname" autocomplete="off"
									   placeholder="部门名称">
							</div>
							<div class="layui-inline">
								<button class="layui-btn" lay-submit="" data-type="getInfo" id="search">搜索</button>
							</div>
							<security:authorize access="hasAnyRole('ROLE_DEPT')">
							<div class="layui-inline">
								<button class="layui-btn" lay-submit="" data-type="getInfo" id="add">添加</button>
							</div>
							</security:authorize>
						</div>
					</div>
				</div>
				<div class="layui-col-md12 block-padding-around">
					<table id="demo" lay-filter="test"></table>
				</div>
			</div>
		</div>

	</div>
</div>
<script type="text/html" id="barDemo">
	<%--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
	<security:authorize access="hasAnyRole('ROLE_DEPT')">
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
	</security:authorize>
</script>
<script>

	layui.use(['laydate', 'laypage', 'layer', 'table'],function () {
		var  laypage = layui.laypage //分页
				, table = layui.table;
		var h = $(window).height()-160;
		//第一个实例
		table.render({
			elem: '#demo'
			, height: h
			, url: '${pageContext.request.contextPath }/dept/findAll' //数据接口
			, page: true //开启分页
			,cellMinWidth: 60
			,method:"post"
			, cols: [[ //表头
				{type: 'checkbox', fixed: 'left'}
				, {field: 'deptid', title: 'ID', width: 60, fixed: 'left'}
				, {field: 'deptname', title: '部门名称'}
				, {field: 'deptaddr', title: '部门地址'}
				, {field: 'depttel', title: '部门电话'}
				, {field: 'email', title: '部门邮箱'}
				, {field: 'subofficename', title: '公司'}
				, {fixed: 'right',title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
			]],id:'table'
		});
		//监听行工具事件
		table.on('tool(test)', function(obj){
			var data = obj.data;
			if (obj.event === 'delete') {
				layer.confirm('确定删除?', function (index) {
					$.post("${pageContext.request.contextPath}/dept/delete",{deptid:data.deptid},function () {
						layer.msg("删除成功");
						setTimeout(function () {
							active.reload();
						}, 800);
					});
				});
			} else if(obj.event === 'edit'){
				layer.open({
					type:2
					,area: ['600px', '380px']
					,title: '修改部门'
					,content:"${pageContext.request.contextPath}/dept/findOne?deptid="+data.deptid
					,end:function () {
						setTimeout(function () {
							active.reload();
						}, 100);
					}
				});
			}else if(obj.event === 'detail'){
				layer.open({
					type:2
					,area: ['600px', '380px']
					,title: '查看部门'
					,content:"${pageContext.request.contextPath}/dept/findOne?deptid="+data.deptid

				});
			}
		});

		$("#add").click(function () {
			layer.open({
				type:2
				,area: ['600px', '380px']
				,title: '添加部门'
				,content:"${pageContext.request.contextPath}/page/dept/dept_add.jsp"
				,end:function () {
					setTimeout(function () {
						active.reload();
					}, 100);
				}
			});
		});

		var active ={
			reload:function(){
				var reload = $("#demo");
				var index= layer.msg('查询中...',{icon:16,time:false,shade:0});
				setTimeout(function () {
					table.reload('table',{//执行重载
						page:{curr:1},where:{name:reload.val()}});
					layer.close(index);
				},500);
			}
		};//监听查询btn
		$('.demo .layui-btn').on('click',function () {
			var type=$(this).data('type');
			active[type]?active[type].call(this):'';
		});

		var Meet = {
			tableId: "table",
			condition: {
				deptname: ""
			}
		};
		Meet.search = function(){
			var queryData = {};
			queryData['deptname'] = $("#deptname").val();
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