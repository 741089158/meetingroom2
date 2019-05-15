<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page isELIgnored="false"%>
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

</head>
<body class="sidebar-fixed header-fixed">
<div class="content">
    <div class="container-fluid">
        <div class="card-header bg-light">
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">系统管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href=#"">会议室管理</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">

                <div class="col-md-12">
                    <div >
                        <form class="navbar-form navbar-right">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login">添加会议室</button>
                        </form>
                    </div>
                    <div >
                        <table class="table table-bordered">
                            <tr class="active">
                                <th class="active">
                                    <input type="checkbox" name="" id="" value="" />
                                </th>
                                <th>名称</th>
                                <th>类型</th>
                                <th>容纳人数</th>
                                <th>分组</th>
                               <!-- <th>呼叫方式</th>-->
                                <th>呼叫地址</th>
                                <th>呼叫号码</th>
                                <th>是否启用</th>
                                <th>管理者</th>
                                <th>操作</th>
                            </tr>
                            <tr class="active">
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td><a href="#">mytest</a></td>
                                <td>视频会议室</td>
                                <td>-</td>
                                <td>总公司</td>
                               <!-- <td>H323</td>-->
                                <td>192.168.188.55</td>
                                <td></td>
                                <td><a href="#">启用</a></td>
                                <td>xx</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">修改</button>
                                        <a href="#" class="btn btn-default" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                            <tr class="active">
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td><a href="#">504</a></td>
                                <td>本地会议室</td>
                                <td>20</td>
                                <td>武汉分部</td>
                               <!-- <td>-</td>-->
                                <td>-</td>
                                <td>xxxxxxxxx</td>
                                <td><a href="#">启用</a></td>
                                <td>xx</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">修改</button>
                                        <a href="#" class="btn btn-default" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                            <tr class="active">
                                <td class="active">
                                    <input type="checkbox" name=""  value="" />
                                </td>
                                <td><a href="#">mytest</a></td>
                                <td>语音会议室</td>
                                <td>-</td>
                                <td>上海分部</td>
                                <!--<td>H323</td>-->
                                <td>192.168.188.55</td>
                                <td>-</td>
                                <td><a href="#">启用</a></td>
                                <td>xx</td>
                                <td class="text-center">
                                    <form class="navbar-form">
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">修改</button>
                                        <a href="#" class="btn btn-default" onclick="return confirm('你确认要删除')">删除</a>
                                    </form>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加修改对话框开始 -->
<div id="login" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center">添加会议室:</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>

            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="username" class="control-label col-md-3">会议室名称:</label>
                        <div class="col-md-12">
                            <input type="text" id="username" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="control-label col-md-3">会议室类型:</label>
                        <div class="col-md-12">
                            <input type="text"  class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="control-label col-md-3">容纳人数:</label>
                        <div class="col-md-12">
                            <input type="text"  class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password1" class="control-label col-md-3">会议室分组：</label>
                        <div class="col-md-12">
                            <input type="password" id="password1" class="form-control" />
                        </div>
                    </div>
                    <!--<div class="form-group">
                        <label for="password2" class="control-label col-md-3">呼叫方式：</label>
                        <div class="col-md-12">
                            <input type="password" id="password2" class="form-control" />
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label for="password3" class="control-label col-md-3">呼叫地址：</label>
                        <div class="col-md-12">
                            <input type="password" id="password3" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password4" class="control-label col-md-3">呼叫号码：</label>
                        <div class="col-md-12">
                            <input type="password" id="password4" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password4" class="control-label col-md-3">是否启用：</label>
                        <div class="col-md-12">
                            <input type="password" id="password5" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password5" class="control-label col-md-3">管理者：</label>
                        <div class="col-md-12">
                            <input type="password" id="password6" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 text-center">
                            <button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 添加修改对话框结束 -->


</body>


</html>
