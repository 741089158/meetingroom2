<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="layui-row" style="background-color: #fff;">
	<div class="layui-col-md2" style="text-align: center; font-size: 20px; padding: 20px 0 20px 0; background-color: #393D49; color: #fff"><i class="layui-icon layui-icon-tabs" style="font-size: 20px; color: #FFFF33;"></i>  会议管理系统</div>
	<div class="layui-col-md10" style="padding: 2px 0 0 0">
		<ul class="layui-nav">

			<li class="layui-nav-item" style="float: right;"><a href="javascript:;" style="color: #000">
				<img src="${pageContext.request.contextPath}/image/top.jpg" class="layui-nav-img">
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="${pageContext.request.contextPath}/logout/cas">退出</a>
					</dd>
				</dl>
			</li>

		</ul>
		<div class="layui-nav-item" style="float: right;margin-top: 20px;margin-right: 40px"><%
			Date d = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String now = df.format(d);%> <h3>当前时间：<%=now %></h3>
			</div>
	</div>
</div>
