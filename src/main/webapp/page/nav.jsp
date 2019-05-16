<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="layui-col-md2 block-border-top">
	<ul class="layui-nav layui-nav-tree" style="width: 100%">
		<li class="layui-nav-item"><a href="javascript:;">我的会议</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="${pageContext.request.contextPath}/meetroom/remeetroom">会议室预定</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath}/page/meeting/meettable.jsp">我的预定</a>
				</dd>
				<dd>
						<a href="${pageContext.request.contextPath}/page/meeting/meet_history.jsp">我的历史会议</a>
				</dd>
			</dl>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">会议室管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="${pageContext.request.contextPath}/page/meet_management/meet_management.jsp">会议室维护</a>
				</dd>
				<dd>
					<a href="#">常用会议室</a>
				</dd>
			</dl>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">会议统计</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="${pageContext.request.contextPath}/page/report/meet_report.jsp">会议报表</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath}/page/report/history_report.jsp">历史报表</a>
				</dd>
			</dl>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">系统管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="${pageContext.request.contextPath}/page/other/mail_home.jsp">邮件管理</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath}/page/user/linkman.jsp">联系人</a>
				</dd>
			</dl>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">管理后台</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="${pageContext.request.contextPath}/page/dept/meet_dept.jsp">部门管理</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath}/page/user/meet_user.jsp">用户管理</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath}/page/dict/dict_home.jsp">字典管理</a>
				</dd>
				<dd>
					<a href="${pageContext.request.contextPath}/page/limit.jsp">权限管理</a>
				</dd>
			</dl>
		</li>
	</ul>
</div>