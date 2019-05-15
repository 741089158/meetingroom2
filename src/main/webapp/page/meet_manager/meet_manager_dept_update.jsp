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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">管理后台</a><span>&nbsp&nbsp >&nbsp&nbsp
        </span><a href="#">部门修改</a>
        </div>
        <hr>
        <div >
            <div >
                <div class="row">
                    <div class="modal-body ">
                        <form class="form-horizontal" role="form"
                              action="${pageContext.request.contextPath}/dept/update"
                              method="post">
                            <div class="form-group">
                            <div class="col-md-6">
                                <input type="text"  name="deptid" value="${meetdept.deptid}"
                                       class="form-control" style="display:none;" />
                            </div>
                        </div>
                            <div class="form-group">
                                <div><label for="deptname" class="col-sm-2 control-label">部门名称:</label></div>
                                <div class="col-md-6">
                                    <input type="text" id="deptname" name="deptname" value="${meetdept.deptname}"
                                           class="form-control"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="deptaddr" class="col-sm-2 control-label">部门地址:</label>
                                <div class="col-md-6">
                                    <input type="text" id="deptaddr" name="deptaddr" value="${meetdept.deptaddr}"
                                           class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="depttel" class="col-sm-2 control-label">部门电话:</label>
                                <div class="col-md-6">
                                    <input type="text" id="depttel" name="depttel" value="${meetdept.depttel}"
                                           class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">部门邮箱:</label>
                                <div class="col-md-6">
                                    <input type="text"  id="email" name="email" value="${meetdept.email}"
                                           class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roomType" class="col-sm-2 control-label">部门所属分公司:</label>
                                <div class="col-sm-5">
                                <select  id="roomType" name="subid" class="form-control"
                                         style="width: 150px;height:35px"
                                         onchange="okIS(this.options[selectedIndex].value)" >
                                    <option value="1"
                                            <c:if test="${meetdept.subid=='1'}">selected='selected'</c:if>>武汉分部
                                    </option>
                                    <option value="2" <c:if test="${meetdept.subid=='2'}">selected='selected'</c:if>>上海分部</option>
                                </select>
                                </div>
                            </div>

                            <%--<div class="form-group">--%>
                                <%--<label for="meetingSubdept" class="control-label col-md-3">所属分部：</label>--%>
                                <%--<div class="col-md-6">--%>
                                    <%--<input type="text" id="meetingSubdept" name="meetingSubdept"  class="form-control" />--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="manager" class="control-label col-md-3">管理人：</label>--%>
                                <%--<div class="col-md-6">--%>
                                    <%--<input type="text" id="manager" name="manager"  class="form-control" />--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="callIp" class="control-label col-md-3">呼叫地址：</label>--%>
                                <%--<div class="col-md-6">--%>
                                    <%--<input type="text" id="callIp" name="callIp"  class="form-control" />--%>
                                <%--</div>--%>
                            <%--</div>--%>

                            <%--<div class="form-group">--%>
                                <%--<label for="isStart" class="control-label col-md-3">是否启用：</label>--%>
                                <%--<div class="col-md-6">--%>
                                    <%--<input type="text" id="isStart" name="isStart"  class="form-control" />--%>
                                <%--</div>--%>
                            <%--</div>--%>

                            <div class="col-sm-5 control-label">
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
    if ((String)request.getAttribute("addInfo") == "success") { %>
<script>
    alert("添加成功！");
    window.location.reload();
</script>
<%}%><%
    if ((String)request.getAttribute("deleteInfo") == "success") { %>
<script>
    alert("删除成功！");
    window.location.reload();
</script>
<%}%>



</html>
