<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>会议管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css">
<script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/popper.js/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/chart.js/chart.min.js"></script>
<script src="${pageContext.request.contextPath }/js/carbon.js"></script>
<script src="${pageContext.request.contextPath }/js/demo.js"></script>
<script type="text/javascript">
	function SetIFrameHeight() {
		var iframeid = document.getElementById("iframe"); //iframe id
		if (document.getElementById) {
			iframeid.height = document.documentElement.clientHeight;
		}
	}
</script>
<style type="text/css">
body {
	overflow: scroll;
	overflow-y: hidden;
}
</style>
</head>
<body class="sidebar-fixed header-fixed">
	<div class="page-wrapper">
		<!-- 页面头部 -->
		<header class="navbar page-header">

			<a class="navbar-brand" href="#"> <img src="./image/1.png" width="50px" height="40px" style="margin-left: 50px" alt="会议管理系统">
			</a>

			<ul class="navbar-nav ml-auto">

				<%--<li class="nav-item d-md-down-none">
                <a href="${pageContext.request.contextPath }/page/email_management.jsp" target="iframe">
                    <i class="fa fa-envelope-open"></i>
                    <span class="badge badge-pill badge-danger">5</span>
                </a>
            </li>--%>

				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <img
						src="./image/avatar-1.png" class="avatar avatar-sm" alt="logo"> <span class="small ml-1 d-md-down-none">张任</span>
				</a>

					<div class="dropdown-menu dropdown-menu-right">

						<a href="#" class="dropdown-item"> <i class="fa fa-user"></i> 个人信息
						</a> <a href="${pageContext.request.contextPath }/user/findInternal" class="dropdown-item" target="iframe"> <i class="fa fa-wrench"></i> 联系人
						</a> <a href="#" class="dropdown-item"> <i class="fa fa-lock"></i> 退出
						</a>
					</div></li>
			</ul>
		</header>
		<!-- 页面头部 /-->


		<!-- 导航侧栏 -->
		<aside class="main-container">
			<div class="sidebar">
				<nav class="sidebar-nav">
					<ul class="nav">
						<li class="nav-item nav-dropdown"><a href="#" class="nav-link nav-dropdown-toggle" target="iframe"> <i class="icon icon-speedometer"></i> 我的会议<i
								class="fa fa-caret-left"></i>
						</a>
							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="${pageContext.request.contextPath }/meetroom/remeetroom" class="nav-link" target="iframe"> <i class=""></i> 预定会议室
								</a></li>

								<li class="nav-item"><a href="${pageContext.request.contextPath }/meetroom/myappointmeet" class="nav-link" target="iframe"> <i class=""></i> 我的预订
								</a></li>

								<li class="nav-item"><a href="${pageContext.request.contextPath }/appointreet/history" class="nav-link" target="iframe"> <i class=""></i> 我的历史会议
								</a></li>
							</ul></li>
						<li class="nav-item nav-dropdown"><a href="#" class="nav-link nav-dropdown-toggle" target="iframe"> <i class="icon icon-target"></i> 会议室管理<i
								class="fa fa-caret-left"></i>
						</a>
							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="${pageContext.request.contextPath }/meet/findAll" class="nav-link" target="iframe"> <i class=""></i>会议室维护
								</a></li>
								<li class="nav-item"><a href="${pageContext.request.contextPath }/page/comment_room.jsp" class="nav-link" target="iframe"> <i class=""></i> 常用会议室
								</a></li>

							</ul></li>

						<li class="nav-item nav-dropdown"><a href="#" class="nav-link nav-dropdown-toggle" target="iframe"> <i class="icon icon-energy"></i> 会议统计 <i
								class="fa fa-caret-left"></i>
						</a>
							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="${pageContext.request.contextPath }/page/meet_report.jsp" class="nav-link" target="iframe"> <i class=""></i> 会议报表
								</a></li>
								<li class="nav-item"><a href="${pageContext.request.contextPath }/page/history_report.jsp" class="nav-link" target="iframe"> <i class=""></i> 历史报表
								</a></li>
							</ul></li>
						<%-- <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle" target="iframe">
                            <i class="icon icon-graph"></i> 会议审批 <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath }/page/meet_review.jsp" class="nav-link" target="iframe">
                                    <i class=""></i> 会议审批进度
                                </a>
                            </li>
                            <li class="nav-item">

                                <a href="${pageContext.request.contextPath }/page/history_review.jsp" class="nav-link" target="iframe">
                                    <i class=""></i> 审批历史
                                </a>
                            </li>
                        </ul>
                    </li>--%>

						<li class="nav-item nav-dropdown"><a href="#" class="nav-link nav-dropdown-toggle" target="iframe"> <i class="icon icon-puzzle"></i> 系统管理<i
								class="fa fa-caret-left"></i>
						</a>

							<ul class="nav-dropdown-items">

								<%-- <li class="nav-item">
                                <a href="${pageContext.request.contextPath }/page/mcu_management.jsp" class="nav-link" target="iframe">
                                    <i class=""></i> MCU管理
                                </a>
                            </li>--%>

								<li class="nav-item"><a href="${pageContext.request.contextPath }/mail/findPage" class="nav-link" target="iframe"> <i class=""></i> 邮件管理
								</a></li>
								<li class="nav-item"><a href="${pageContext.request.contextPath }/user/findInternal" class="nav-link" target="iframe"> <i class=""></i> 联系人
								</a></li>
							</ul></li>

						<li class="nav-item nav-dropdown"><a href="#" class="nav-link nav-dropdown-toggle" target="iframe"> <i class="icon icon-umbrella"></i> 管理后台 <i
								class="fa fa-caret-left"></i>
						</a>

							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="${pageContext.request.contextPath }/dept/findAll" class="nav-link" target="iframe"> <i class=""></i> 部门管理
								</a></li>

								<li class="nav-item"><a href="${pageContext.request.contextPath }/user/findAll" class="nav-link" target="iframe"> <i class=""></i> 用户管理
								</a></li>

								<li class="nav-item"><a href="${pageContext.request.contextPath }/dict/findPage" class="nav-link" target="iframe"> <i class=""></i> 字典管理
								</a></li>
								<li class="nav-item"><a href="${pageContext.request.contextPath }/page/limit.jsp" class="nav-link" target="iframe"> <i class=""></i> 权限管理
								</a></li>

								<%-- <li class="nav-item">
                                <a href="${pageContext.request.contextPath }/page/log/log.jsp" class="nav-link" target="iframe">
                                    <i class=""></i> 日志管理
                                </a>
                            </li>--%>
								<%-- <li class="nav-item">
                                <a href="#" class="nav-link" target="iframe">
                                    <i class=""></i> 配置管理
                                </a>
                            </li>--%>
							</ul></li>
					</ul>
				</nav>
			</div>
		</aside>
		<!-- 导航侧栏 /-->


		<!-- 内容区域 -->
		<div class="content-wrapper">
			<iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src="${pageContext.request.contextPath }/meetroom/remeetroom"></iframe>
		</div>
		<!-- 内容区域 /-->
	</div>
</body>
</html>
