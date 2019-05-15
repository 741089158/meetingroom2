<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>部门管理系统</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/popper.js/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/chart.js/chart.min.js"></script>
<script src="${pageContext.request.contextPath }/js/carbon.js"></script>
<script src="${pageContext.request.contextPath }/js/demo.js"></script>


</head>
<body class="sidebar-fixed header-fixed">
	<div class="content">
		<div class="container-fluid">
			<div class="card-header bg-light">
				<a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp </span><a href="#">管理后台</a><span>&nbsp&nbsp >&nbsp&nbsp </span><a href="#">部门管理系统</a> <a class="btn btn-primary"
					href="${pageContext.request.contextPath }/page/meet_manager/meet_manager_dept_add.jsp" style="float: right; margin-right: 10px"> 添加部门</a>
			</div>
			<hr>

			<div class="card-header bg-light">
				<div class="row">
					<div class="col-md-12">
						<div>
							<form action="${pageContext.request.contextPath }/dept/findAll" method="post">
								<input type="text" class="form-control" style="width: 200px; float: left; margin: 5px" placeholder="搜索" name="deptName" value="${deptName}">
								<button type="submit" class="btn btn-default" style="width: 60px; float: left; margin: 5px">搜索</button>
							</form>
							<table class="table table-bordered">
								<tr class="active">
									<th class="active text-center" style="width: 50px"><input type="checkbox" id="firstCb" /></th>
									<th class="text-center">部门名称</th>
									<th class="text-center">部门地址</th>
									<th class="text-center">部门电话</th>
									<th class="text-center">部门邮箱</th>
									<th class="text-center">部门所属分公司</th>

									<!--<th>管理者</th>-->
									<th class="text-center">操作</th>
								</tr>
								<c:forEach items="${pageInfo.list}" var="list">
									<tr class="active" style="width: 50px">
										<td class="active text-center" style="width: 50px"><input type="checkbox" name="deptid" value="${list.deptid}" /></td>
										<td class="text-center">${list.deptname}</td>
										<td class="text-center">${list.deptaddr}</td>
										<td class="text-center">${list.depttel}</td>
										<td class="text-center">${list.email}</td>
										<td class="text-center">${list.subofficename}</td>

										<!--<td>xx</td>-->
										<td class="text-center">
											<form class="navbar-form">
												<a class="btn btn-default" href="${pageContext.request.contextPath}/dept/findByid?deptid=${list.deptid}">修改</a> <a
													href="${pageContext.request.contextPath}/dept/delete?deptid=${list.deptid}" class="btn btn-danger">删除</a>
											</form>
										</td>
									</tr>
								</c:forEach>
							</table>
							<%--分页查询--%>
							<div class="form-group form-inline">
								<div class="form-group form-inline">总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页 10 条</div>
								&nbsp;&nbsp;
								<ul class="pagination ">
									<li><a href="${pageContext.request.contextPath}/dept/findAll?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> <%-- <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> --%>
									</li>
									<c:if test="${pageInfo.pageNum!=1}">
										<li><a href="${pageContext.request.contextPath}/dept/findAll?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a></li>
									</c:if>
									<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
										<li><a href="${pageContext.request.contextPath}/dept/findAll?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
									</c:forEach>
									<c:if test="${pageInfo.pages!=pageInfo.pageNum}">
										<li><a href="${pageContext.request.contextPath}/dept/findAll?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a></li>
									</c:if>

									<li><a href="${pageContext.request.contextPath}/dept/findAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
	window.onload = function() {
		//给删除选中按钮添加单击事件
		document.getElementById("delSelected").onclick = function() {
			if (confirm("您确定要删除选中条目吗？")) {

				var flag = false;
				//判断是否有选中条目
				var cbs = document.getElementsByName("deptid");
				for (var i = 0; i < cbs.length; i++) {
					if (cbs[i].checked) {
						//alert(cbs[i]);
						//有一个条目选中了
						flag = true;
						break;
					}
				}
				if (flag) {//有条目被选中
					//表单提交
					document.getElementById("form").submit();
				}
			}
		};
		//1.获取第一个cb
		document.getElementById("firstCb").onclick = function() {
			//2.获取下边列表中所有的cb
			var cbs = document.getElementsByName("deptid");
			//3.遍历
			for (var i = 0; i < cbs.length; i++) {
				//4.设置这些cbs[i]的checked状态 = firstCb.checked
				cbs[i].checked = this.checked;
			}
		};

	}
</script>