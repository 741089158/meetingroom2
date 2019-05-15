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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a
                href="#">系统管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">MCU管理</a>
            <a href="${pageContext.request.contextPath }/page/common/common.jsp"
               class="btn btn-primary" style="float: right;margin-right: 10px">添加MCU</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-12">
                    <form>
                        <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px" placeholder="搜索">
                        <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索</button>
                        <table class="table table-bordered">
                            <tr class="active">
                                <th class="active text-center" style="width: 50px">
                                    <input type="checkbox" name="" id="" value=""/>
                                </th>
                                <th>设备名称</th>
                                <th>型号</th>
                                <th>服务器主机名/IP地址</th>
                                <th>登录账号</th>
                                <th>会议号</th>
                                <th>是否启用</th>
                                <th>操作</th>
                            </tr>
                            <tr class="active">
                                <td class="active text-center" style="width: 50px">
                                    <input type="checkbox" name="" value=""/>
                                </td>
                                <td><a href="#">mytest</a></td>
                                <td>CISCO_CMS</td>
                                <td>192.168.188.141</td>
                                <td>admin</td>
                                <td>66666</td>
                                <td>启用</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal"
                                                data-target="#login">修改
                                        </button>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                            <tr class="active">
                                <td class="active text-center" style="width: 50px">
                                    <input type="checkbox" name="" value=""/>
                                </td>
                                <td><a href="#">mytest</a></td>
                                <td>CISCO_CMS</td>
                                <td>192.168.188.141</td>
                                <td>admin</td>
                                <td>66666</td>
                                <td>启用</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal"
                                                data-target="#login">修改
                                        </button>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                            <tr class="active">
                                <td class="active text-center" style="width: 50px">
                                    <input type="checkbox" name="" value=""/>
                                </td>
                                <td><a href="#">mytest</a></td>
                                <td>CISCO_CMS</td>
                                <td>192.168.188.141</td>
                                <td>admin</td>
                                <td>66666</td>
                                <td>启用</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal"
                                                data-target="#login">修改
                                        </button>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <%--分页查询--%>
                    <div class="form-group form-inline">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页 10 条
                        </div>&nbsp;&nbsp;
                       <%-- <ul class="pagination ">
                            <li>
                                <a href="${pageContext.request.contextPath}/meet/findAll?page=1&size=${pageInfo.pageSize}"
                                   aria-label="Previous">首页</a>
                                &lt;%&ndash; <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> &ndash;%&gt;
                            </li>
                            <c:if test="${pageInfo.pageNum!=1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meet/findAll?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meet/findAll?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageInfo.pages!=pageInfo.pageNum}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meet/findAll?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a>
                                </li>
                            </c:if>

                            <li>
                                <a href="${pageContext.request.contextPath}/meet/findAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                                   aria-label="Next">尾页</a>
                            </li>
                        </ul>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
