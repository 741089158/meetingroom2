<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Carbon - Admin Template</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
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
            <div class="text-left">
                <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a
                    href="#">我的会议</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">我的历史会议</a>
            </div>
        </div>
        <hr>
        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-12">
                   <%-- <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px" placeholder="搜索">
                    <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索</button>--%>
                       <form action="${pageContext.request.contextPath }/appointreet/history" method="post">
                           <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px" placeholder="搜索" name="meetName" value="${meetName}">
                           <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索</button>
                       </form>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center">会议名称</th>
                            <th class="text-center">会议类型</th>
                            <th class="text-center">开始时间</th>
                            <th class="text-center">时长</th>
                            <th class="text-center">状态</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="list">
                            <tr>
                                <td class="text-center">${list.meetName}</td>
                                <td class="text-center">${list.meetType}</td>
                                <td class="text-center">${list.starttime}</td>
                                <td class="text-center">${list.duration}</td>
                                <td class="text-center">完结</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <a class="btn btn-default"
                                           href="${pageContext.request.contextPath}/appointreet/findHistoryUser?page=1&size=10&id=${list.id}">参会人员</a>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="form-group form-inline">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页 10 条
                        </div>&nbsp;&nbsp;
                        <ul class="pagination ">
                            <li>
                                <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=1&size=${pageInfo.pageSize}"
                                   aria-label="Previous">首页</a>
                                <%-- <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> --%>
                            </li>
                            <c:if test="${pageInfo.pageNum!=1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageInfo.pages!=pageInfo.pageNum}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a>
                                </li>
                            </c:if>

                            <li>
                                <a href="${pageContext.request.contextPath}/meetroom/meet_history?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                                   aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
