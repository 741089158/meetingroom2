<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">系统管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">字典添加</a>
        </div>
        <hr>
        <div >
            <div >
                <div class="row">
                    <div class="modal-body ">
                        <form class="form-control-file" action="${pageContext.request.contextPath}/dict/add" method="post">
                            <div class="form-group">
                                <div><label for="name" class="control-label col-md-3">字典名称:</label></div>
                                <div class="col-md-8">
                                    <input type="text" id="name" name="name"   class="form-control"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <div><label for="code" class="control-label col-md-3">字典编码:</label></div>
                                <div class="col-md-8">
                                    <input type="text" id="code" name="code"  class="form-control"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <div><label for="description" class="control-label col-md-3">详情:</label></div>
                                <div class="col-md-8">
                                    <input type="text" id="description" name="description"   class="form-control"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <div><label for="orderby" class="control-label col-md-3">排序:</label></div>
                                <div class="col-md-8">
                                    <input type="text" id="orderby" name="orderby"   class="form-control"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <div><label for="pid" class="control-label col-md-3">备注:</label></div>
                                <div class="col-md-8">
                                    <input type="text" id="pid" name="pid"   class="form-control"  />
                                </div>
                            </div>


                            <div class="col-md-12">
                                <input type="submit" class="btn btn-primary" />
                                <button type="button" class="btn btn-default" onclick="history.back(-1);">取消</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- 添加修改对话框开始 -->


<!-- 添加修改对话框结束 -->

</body>

<%
    if ((String)request.getAttribute("response")=="success") { %>
<script>
    alert("添加成功！");
    window.location.reload();
</script>
<%}%>
<%
    if ((String)request.getAttribute("deleteInfo") == "success") { %>
<script>
    alert("删除成功！");
    window.location.reload();
</script>
<%}%>

</html>
