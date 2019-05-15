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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">联系人管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">联系人添加</a>
        </div>
        <hr>
        <div >
            <div >
                <div class="row">
                    <div class="modal-body ">
                        <table class="table  table-light">
                            <form class="form-control-file" action="${pageContext.request.contextPath}/user/addInternal" method="post">
                                <div class="row form-group">
                                    <span class="col-sm-1 control-label"></span>
                                    <label for="name" class="col-sm-2 control-label">姓 名:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <span class="col-sm-1 control-label"></span>
                                    <label for="tel" class="col-sm-2 control-label">电话:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="tel" name="tel" placeholder="">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <span class="col-sm-1 control-label"></span>
                                    <label for="email" class="col-sm-2 control-label">邮 箱:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="email" name="email" placeholder="">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <span class="col-sm-1 control-label"></span>
                                    <label for="dept" class="col-sm-2 control-label">部 门:</label>
                                    <div class="col-sm-5">
                                        <select  id="dept" name="dept" class="form-control"
                                                 style="width: 150px;height:35px"
                                                 onchange="okIS(this.options[selectedIndex].value)" >
                                            <option value="武汉分部" >武汉分部</option>
                                            <option value="上海分部" >上海分部</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <span class="col-sm-1 control-label"></span>
                                    <label for="sex" class="col-sm-2 control-label">性 别:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sex" name="sex" placeholder="">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <span class="col-sm-1 control-label"></span>
                                    <label for="company" class="col-sm-2 control-label">公 司:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="company" name="company" placeholder="">
                                    </div>
                                </div>
                                <%-- <div class="row form-group">
                                     <span class="col-sm-1 control-label"></span>
                                     <label for="internal" class="col-sm-2 control-label">内/外联系人:</label>
                                     <div class="col-sm-8">
                                         <input type="text" class="form-control" id="internal" name="internal" placeholder="">
                                     </div>
                                 </div>--%>
                              <%--  <div class="row form-group">
                                    <label for="internal" class="col-sm-2 control-label" style="margin-left: 50px">联系人:</label>
                                    <div class="col-sm-5">
                                        <select  id="internal" name="internal" class="form-control"
                                                 style="width: 150px;height:35px"
                                                 onchange="okIS(this.options[selectedIndex].value)" >
                                            <option value="2" >内部</option>
                                            <option value="1" >外部</option>
                                        </select>
                                    </div>
                                </div>--%>
                                <div class="row form-group">
                                    <span class="col-sm-1 control-label"></span>
                                    <label for="internal" class="col-sm-2 control-label">联系人:</label>
                                    <div class="col-sm-5">
                                        <select  id="internal" name="internal" class="form-control"
                                                 style="width: 150px;height:35px"
                                                 onchange="okIS(this.options[selectedIndex].value)" >
                                            <option value="2" >内部</option>
                                            <option value="1" >外部</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <span class="col-sm-1 control-label"></span>
                                    <label for="status" class="col-sm-2 control-label">状态:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="status" name="status" placeholder="">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-sm-offset-2 col-sm-10 text-center">
                                        <button type="submit" class="btn btn-primary">确定</button>
                                        <button type="button" class="btn btn-default" onclick="history.back(-1);">取消</button>
                                    </div>
                                </div>
                            </form>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
