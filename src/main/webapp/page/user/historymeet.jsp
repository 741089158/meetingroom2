<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">历史会议</a>&nbsp&nbsp >&nbsp&nbsp<a
                href="#">参会人列表></a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">
                <div class="tab-content col-md-12">
                    <form id="form" action="#" method="post">
                        <table class="table table-bordered">
                            <tr>
                                <th class="col-md-2 text-center">姓名</th>
                                <th class="col-md-2 text-center">用户名</th>
                                <th class="col-md-2 text-center">分部</th>
                                <th class="col-md-2 text-center">电话</th>
                                <th class="col-md-2 text-center">E-mail</th>
                            </tr>

                            <c:forEach items="${pageInfo.list}" var="list">
                                <tr>
                                    <td class="col-md-2 text-center">${list.name}</td>
                                    <td class="col-md-2 text-center">${list.username}</td>
                                    <td class="col-md-2 text-center">${list.suboffice}</td>
                                    <td class="col-md-2 text-center">${list.tel}</td>
                                    <td class="col-md-2 text-center">${list.email}</td>
                                        <%--<td class="col-md-2 text-center">${list.tel}</td>--%>
                                </tr>
                            </c:forEach>
                        </table>
                    </form>
                    <div style="float: right">
                        <button type="button" class="btn btn-primary" onclick="history.back(-1);">返回</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
