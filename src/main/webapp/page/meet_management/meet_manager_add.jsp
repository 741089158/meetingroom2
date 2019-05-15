<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta id="" name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室添加</a>
        </div>
        <hr>
        <div >
            <div >
                <div class="row">
                    <div class="modal-body ">
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/meet/add" method="post">
                            <div class="form-group">
                                <label for="roomName" class="col-sm-2 control-label">会议室名称:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="roomName" name="roomName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roomArea" class="col-sm-2 control-label">会议室区域:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="roomArea" name="roomArea" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roomAreaName" class="col-sm-2 control-label">会议室地址:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="roomAreaName" name="roomAreaName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roomFloor" class="col-sm-2 control-label">会议室楼层:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="roomFloor" name="roomFloor" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="personCount" class="col-sm-2 control-label">容纳人数:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="personCount" name="personCount" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roomType" class="col-sm-2 control-label">会议室类型:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="roomType" name="roomType" placeholder="">
                                </div>
                            </div>
                           <%-- <div class="form-group">
                                <label for="meetingSubdept" class="col-sm-2 control-label">所属分部:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="meetingSubdept" name="meetingSubdept" placeholder="">
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label for="meetingSubdept" class="col-sm-2 control-label">所属分公司:</label>
                                <div class="col-sm-5">
                                    <select  id="meetingSubdept" name="meetingSubdept" class="form-control"
                                             style="width: 150px;height:35px"
                                             onchange="okIS(this.options[selectedIndex].value)" >
                                        <option value="武汉分部" >武汉分部</option>
                                        <option value="上海分部" >上海分部</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="manager" class="col-sm-2 control-label">管理人:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="manager" name="manager" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="callIp" class="col-sm-2 control-label">呼叫地址:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="callIp" name="callIp" placeholder="">
                                </div>
                            </div>
                            <%--<div class="form-group">
                                <label for="isStart" class="col-sm-2 control-label">是否启用:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="isStart" name="isStart" placeholder="">
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label for="isStart" class="col-sm-2 control-label">是否启用:</label>
                                <div class="col-sm-5">
                                <select  id="isStart" name="isStart" class="form-control"
                                         style="width: 150px;height:35px"
                                         onchange="okIS(this.options[selectedIndex].value)" >
                                    <option value="1" >启用</option>
                                    <option value="0" >禁用</option>
                                </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">确定</button>
                                    <button type="button" class="btn btn-default" onclick="history.back(-1);">取消</button>
                                </div>
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
