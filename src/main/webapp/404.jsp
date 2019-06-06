<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./page/common.jsp" %>
<%@ include file="./page/top.jsp" %>
<head>
	<style type="text/css">
		.block-bot-left{
			position: absolute;
			top: 50%;
			left: 50%;
		}
	</style>
</head>
<div class="layui-row row_black">
	<%@ include file="./page/nav.jsp" %>
	<div class="layui-col-md10 main-bg-color">
		<div class="layui-row block-bg-color block-border-top">
			<div class="layui-col-md12 block-padding-around">
				<h2 class="block-bot-left">出错了...</h2>
			</div>
		</div>
	</div>

</div>
</html>

<script>
	layui.use(['form', 'laydate', 'layer'], function () {
		//处理高度
		$(".block-border-top").css("min-height", $(window).height()-70);//.height();
	});
</script>