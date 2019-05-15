<%@ page import="com.bcsd.entity.MeetRoom" %>
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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室修改</a>
        </div>
        <hr>
        <div >
            <div >
                <div class="row">
                    <div class="modal-body ">
                       <%-- <%
                            MeetRoom meetRoom =(MeetRoom) request.getAttribute("meetRoom");
                        %>--%>
                       <%-- <form class="form-control-file" action="${pageContext.request.contextPath}/meet/update" method="post">

                            <div class="form-group" id="room">
                                <div class="col-md-8">
                                    <input type="text" id="roomId"  name="roomId" value="${meetRoom.roomId}" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div><label for="roomName" class="control-label col-md-3">会议室名称:</label></div>
                                <div class="col-md-8">
                                    <input type="text" id="roomName" name="roomName" value="${meetRoom.roomName}" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roomArea" class="control-label col-md-3">会议室区域:</label>
                                <div class="col-md-8">
                                    <input type="text" id="roomArea" name="roomArea" value="${meetRoom.roomArea}" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roomFloor" class="control-label col-md-3">会议室楼层:</label>
                                <div class="col-md-8">
                                    <input type="text" id="roomFloor" name="roomFloor" value="${meetRoom.roomFloor}" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="personCount" class="control-label col-md-3">容纳人数:</label>
                                <div class="col-md-8">
                                    <input type="text"  id="personCount" name="personCount" value="${meetRoom.personCount}" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roomType" class="control-label col-md-3">会议室类型:</label>
                                <div class="col-md-8">
                                    <input type="text" id="roomType" name="roomType" value="${meetRoom.roomType}"  class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="meetingSubdept" class="control-label col-md-3">所属分部：</label>
                                <div class="col-md-8">
                                    <input type="text" id="meetingSubdept" name="meetingSubdept" value="${meetRoom.meetingSubdept}" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="manager" class="control-label col-md-3">管理人：</label>
                                <div class="col-md-8">
                                    <input type="text" id="manager" name="manager" value="${meetRoom.manager}" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="callIp" class="control-label col-md-3">呼叫地址：</label>
                                <div class="col-md-8">
                                    <input type="text" id="callIp" name="callIp" value="${meetRoom.callIp}" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="isStart" class="control-label col-md-3">是否启用：</label>
                                <div class="col-md-8">
                                    <input type="text" id="isStart" name="isStart" value="${meetRoom.isStart}" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <input type="submit" class="btn btn-primary" />
                                <button type="button" class="btn btn-default" onclick="history.back(-1);">取消</button>
                            </div>
                        </form>--%>
                           <form class="form-horizontal" action="${pageContext.request.contextPath}/meet/update" method="post">
                               <div class="form-group" id="room">
                                   <label for="roomName" class="col-sm-2 control-label"></label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="roomId" name="roomId" value="${meetRoom.roomId}" placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="roomName" class="col-sm-2 control-label">会议室名称:</label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="roomName" name="roomName" value="${meetRoom.roomName}" placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="roomArea" class="col-sm-2 control-label">会议室区域:</label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="roomArea" name="roomArea" value="${meetRoom.roomArea}" placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="roomAreaName" class="col-sm-2 control-label">会议室地址:</label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="roomAreaName" name="roomAreaName" value="${meetRoom.roomAreaName}" placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="roomFloor" class="col-sm-2 control-label">会议室楼层:</label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="roomFloor" name="roomFloor" value="${meetRoom.roomFloor}"  placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="personCount" class="col-sm-2 control-label">容纳人数:</label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="personCount" name="personCount" value="${meetRoom.personCount}" placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="roomType" class="col-sm-2 control-label">会议室类型:</label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="roomType" name="roomType" value="${meetRoom.roomType}" placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="meetingSubdept" class="col-sm-2 control-label">所属分部:</label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="meetingSubdept" name="meetingSubdept" value="${meetRoom.meetingSubdept}" placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="manager" class="col-sm-2 control-label">管理人:</label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="manager" name="manager" value="${meetRoom.manager}" placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="callIp" class="col-sm-2 control-label">呼叫地址:</label>
                                   <div class="col-sm-5">
                                       <input type="text" class="form-control" id="callIp" name="callIp" value="${meetRoom.callIp}" placeholder="">
                                   </div>
                               </div>
                               <div class="form-group">
                                   <label for="isStart" class="col-sm-2 control-label">是否启用:</label>
                                  <%-- <div class="col-sm-5">
                                       <input type="text" class="form-control" id="isStart" name="isStart" value="${meetRoom.isStart}" placeholder="启用1/禁用0">
                                   </div>--%>
                                   <div class="col-sm-5">
                                       <select  id="isStart" name="isStart" class="form-control"
                                                style="width: 150px;height:35px"
                                                onchange="VV(this.options[selectedIndex].value)" >
                                           <option value="1" <c:if test="${meetRoom.isStart=='1'}">selected='selected
                                        '</c:if>>启用</option>
                                           <option value="0" <c:if test="${meetRoom.isStart=='0'}">selected='selected
                                        '</c:if> >禁用</option>
                                       </select>
                                   </div>
                               </div>
                               <div class="form-group">
                                   <div class="col-sm-offset-2 col-sm-10">
                                       <button type="submit" class="btn btn-primary">修改</button>
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
</body>
<script>
    document.getElementById("room").style.display="none";
</script>

</html>
