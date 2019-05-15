<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a
                href="#">管理后台</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">权限管理</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-2">
                    <div >
                        <div class="card-title">
                            <div class="caption">
                                <p class="modal-title"><span>角色编辑</span>&nbsp;&nbsp;
                                    <button  class="btn-primary" data-toggle="modal" data-target="#login">添加</button>
                            </div>
                            <hr>

                            <div style="width: 120px">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active " data-toggle="tab" href="#manager" role="tab" aria-controls="manager">管理员</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#review" role="tab" aria-controls="review">会议审批员</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#user" role="tab" aria-controls="user">普通用户</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#room" role="tab" aria-controls="room">会议室权限</a>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-content col-md-10">
                    <div class="tab-pane active" id="manager" role="tabpanel">
                        <div class="col-md-12 mb-4">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">用户列表</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#profile1" role="tab" aria-controls="profile1">权限列表</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="home1" role="tabpanel">
                                    <table class="table  table-light">
                                        <thead class="bg-light-grey">
                                        <tr class="uppercase">
                                            <th> <input  type="checkbox" >
                                            </th>
                                            <th>用户名</th>
                                            <th>职位</th>
                                            <th>邮箱</th>
                                            <th>手机号</th>
                                        </tr>
                                        <tr  class="ng-scope">
                                            <td width="20">
                                                <input type="checkbox" >
                                            </td>
                                            <td >张世</td>
                                            <td>技术部</td>
                                            <td>259@qq.com</td>
                                            <td>15758690685</td>
                                        </tr>
                                        <tr  class="ng-scope">
                                            <td width="20">
                                                <input type="checkbox" >
                                            </td>
                                            <td >张世</td>
                                            <td>技术部</td>
                                            <td>259@qq.com</td>
                                            <td>15758690685</td>
                                        </tr>
                                        <tr  class="ng-scope">
                                            <td width="20">
                                                <input type="checkbox" >
                                            </td>
                                            <td >张世</td>
                                            <td>技术部</td>
                                            <td>259@qq.com</td>
                                            <td>15758690685</td>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>

                                <div class="tab-pane" id="profile1" role="tabpanel">
                                    <table class="table table-hover table-light">
                                        <thead class="bg-light-grey">
                                        <tr class="uppercase">
                                            <th>
                                                <label class="ui-checkbox">
                                                    <input name="checkbox1" type="checkbox"></label>
                                            </th>
                                            <th>模块名称</th>
                                            <th>显示</th>
                                            <th>读</th>
                                            <th>写</th>
                                            <th>全部</th>
                                            <th>本部门</th>
                                            <th>下属部门</th>
                                            <th>本账号</th>
                                        </tr>

                                        </thead>
                                        <tbody>
                                        <!-- ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">我的会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"
                                                                                checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">所有会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">本地会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">视频会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_14"
                                                                               name="radio_14"

                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_14"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_14"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_14"

                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">电话会议</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">会议室权限</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">会议审批</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                data-ng-click="updatePrivilegeScope(roleListRoleId,privilege.id,2)"
                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                type="radio"
                                                                                checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">用户管理</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_10"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                                               name="radio_10"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_10"
                                                                               name="radio_10"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                                               name="radio_10"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_10"
                                                                               name="radio_10"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">会议室管理</td>
                                            <td><label class="ui-checkbox"><input
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                                               name="radio_13"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                                               name="radio_13"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                                               name="radio_13"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                                               name="radio_13"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">mcu管理</td>
                                            <td><label class="ui-checkbox"><input
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">资源管理</td>
                                            <td><label class="ui-checkbox"><input
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_1" name="radio_1"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_1" name="radio_1"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_1" name="radio_1"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_1" name="radio_1"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">权限管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_2"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_2"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_2"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_2" name="radio_2"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_2" name="radio_2"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_2" name="radio_2"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_2" name="radio_2"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">日志管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_5"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_5"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_5"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">权限管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_4"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_4"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_4"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">配置管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_7"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_7"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_7"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="review" role="tabpanel">
                        <div class="col-md-12 mb-4">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home2" role="tab" aria-controls="home2">用户列表</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#profile2" role="tab" aria-controls="profile2">权限列表</a>
                                </li>


                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="home2" role="tabpanel">
                                    <table class="table  table-light">
                                        <thead class="bg-light-grey">
                                        <tr class="uppercase">
                                            <th> <input  type="checkbox" >
                                            </th>
                                            <th>用户名</th>
                                            <th>职位</th>
                                            <th>邮箱</th>
                                            <th>手机号</th>
                                        </tr>
                                        <tr  class="ng-scope">
                                            <td width="20">
                                                <input type="checkbox" >
                                            </td>
                                            <td >张世</td>
                                            <td>技术部</td>
                                            <td>259@qq.com</td>
                                            <td>15758690685</td>
                                        </tr>
                                        <tr  class="ng-scope">
                                            <td width="20">
                                                <input type="checkbox" >
                                            </td>
                                            <td >张世</td>
                                            <td>技术部</td>
                                            <td>259@qq.com</td>
                                            <td>15758690685</td>
                                        </tr>

                                        </thead>
                                    </table>
                                </div>

                                <div class="tab-pane" id="profile2" role="tabpanel">
                                    <table class="table table-hover table-light">
                                        <thead class="bg-light-grey">
                                        <tr class="uppercase">
                                            <th>
                                                <label class="ui-checkbox">
                                                    <input name="checkbox1" type="checkbox"></label>
                                            </th>
                                            <th>模块名称</th>
                                            <th>显示</th>
                                            <th>读</th>
                                            <th>写</th>
                                            <th>全部</th>
                                            <th>本部门</th>
                                            <th>下属部门</th>
                                            <th>本账号</th>
                                        </tr>

                                        </thead>
                                        <tbody>
                                        <!-- ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">我的会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"
                                                                                checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">所有会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">本地会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">视频会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_14"
                                                                               name="radio_14"

                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_14"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_14"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_14"

                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">电话会议</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">会议室权限</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">会议审批</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                data-ng-click="updatePrivilegeScope(roleListRoleId,privilege.id,2)"
                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                type="radio"
                                                                                checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">用户管理</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_10"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_10"
                                                                               name="radio_10"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_10"
                                                                               name="radio_10"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_10"
                                                                               name="radio_10"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_10"
                                                                               name="radio_10"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">会议室管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_13"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_13"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_13"
                                                                               name="radio_13"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_13"
                                                                               name="radio_13"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_13"
                                                                               name="radio_13"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_13"
                                                                               name="radio_13"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">mcu管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_11"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_11"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_11"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_11"
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_11"
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_11"
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_11"
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">资源管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_1"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_1"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_1"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_1" name="radio_1"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_1" name="radio_1"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_1" name="radio_1"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_1" name="radio_1"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">权限管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_2"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_2"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_2"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_2" name="radio_2"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_2" name="radio_2"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_2" name="radio_2"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_2" name="radio_2"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">日志管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_5"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_5"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_5"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">权限管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_4"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_4"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_4"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">配置管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_7"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_7"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_7"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="user" role="tabpanel">
                        <div class="col-md-12 mb-4">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home3" role="tab" aria-controls="home3">用户列表</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#profile3" role="tab" aria-controls="profile3">权限列表</a>
                                </li>


                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="home3" role="tabpanel">
                                    <table class="table  table-light">
                                        <thead class="bg-light-grey">
                                        <tr class="uppercase">
                                            <th> <input  type="checkbox" >
                                            </th>
                                            <th>用户名</th>
                                            <th>职位</th>
                                            <th>邮箱</th>
                                            <th>手机号</th>
                                        </tr>
                                        <tr  class="ng-scope">
                                            <td width="20">
                                                <input type="checkbox" >
                                            </td>
                                            <td >张世</td>
                                            <td>技术部</td>
                                            <td>259@qq.com</td>
                                            <td>15758690685</td>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>

                                <div class="tab-pane" id="profile3" role="tabpanel">
                                    <table class="table table-hover table-light">
                                        <thead class="bg-light-grey">
                                        <tr class="uppercase">
                                            <th>
                                                <label class="ui-checkbox">
                                                    <input name="checkbox1" type="checkbox"></label>
                                            </th>
                                            <th>模块名称</th>
                                            <th>显示</th>
                                            <th>读</th>
                                            <th>写</th>
                                            <th>全部</th>
                                            <th>本部门</th>
                                            <th>下属部门</th>
                                            <th>本账号</th>
                                        </tr>

                                        </thead>
                                        <tbody>
                                        <!-- ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">我的会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_9"

                                                                                type="radio"
                                                                                checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">所有会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_17"

                                                    type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">本地会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_15"

                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">视频会议</td>
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input

                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_14"
                                                                               name="radio_14"

                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_14"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_14"

                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_14"

                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"

                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">电话会议</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_12"
                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">会议室权限</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input
                                                    name="radio_16"
                                                    type="radio"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">会议审批</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                data-ng-click="updatePrivilegeScope(roleListRoleId,privilege.id,2)"
                                                                                type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input  name="radio_8"
                                                                                type="radio"
                                                                                checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">用户管理</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_10"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_10"
                                                                               name="radio_10"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_10"
                                                                               name="radio_10"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_10"
                                                                               name="radio_10"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_10"
                                                                               name="radio_10"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">会议室管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_13"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_13"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_13"
                                                                               name="radio_13"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_13"
                                                                               name="radio_13"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_13"
                                                                               name="radio_13"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_13"
                                                                               name="radio_13"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">mcu管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_11"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_11"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_11"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_11"
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_11"
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_11"
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_11"
                                                                               name="radio_11"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">资源管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_1"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_1"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_1"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_1" name="radio_1"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_1" name="radio_1"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_1" name="radio_1"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_1" name="radio_1"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">权限管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_2"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_2"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"
                                                                                  checked="checked"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_2"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_2" name="radio_2"
                                                                               type="radio"
                                                                               checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_2" name="radio_2"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_2" name="radio_2"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_2" name="radio_2"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">日志管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_5"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_5"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_5"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_5" name="radio_5"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">权限管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_4"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_4"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_4"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_4" name="radio_4"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td>
                                            <td class="ng-binding">配置管理</td>
                                            <td><label class="ui-checkbox"><input id="isShow_7"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--显示/隐藏 -->
                                            <td><label class="ui-checkbox"><input id="isRead_7"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--读 -->
                                            <td><label class="ui-checkbox"><input id="isWrite_7"
                                                                                  name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"><span></span></label>
                                            </td><!--写-->
                                            <td><label class="ui-radio"><input id="scope0_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope1_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope2_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                            <td><label class="ui-radio"><input id="scope3_7" name="radio_7"
                                                                               type="radio"><span></span></label>
                                            </td>
                                        </tr><!-- end ngRepeat: privilege in privilegeList -->
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="room" role="tabpanel">
                        <div class="col-md-12 mb-4">
                            <ul class="nav nav-tabs" role="tablist">
                              <!--  <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home4" role="tab" aria-controls="home3">用户列表</a>
                                </li>-->
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#profile4" role="tab" aria-controls="profile3">权限列表</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <!--<div class="tab-pane active" id="home4" role="tabpanel">
                                    <table class="table  table-light">
                                        <thead class="bg-light-grey">
                                        <tr class="uppercase">
                                            <th> <input  type="checkbox" >
                                            </th>
                                            <th>用户名</th>
                                            <th>职位</th>
                                            <th>邮箱</th>
                                            <th>手机号</th>
                                        </tr>
                                        <tr  class="ng-scope">
                                            <td width="20">
                                                <input type="checkbox" >
                                            </td>
                                            <td >张世</td>
                                            <td>技术部</td>
                                            <td>259@qq.com</td>
                                            <td>15758690685</td>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>-->

                                <div class="tab-pane active" id="profile4" role="tabpanel">
                                    <table class="table table-hover table-light">
                                        <thead class="bg-light-grey">
                                        <tr class="uppercase">
                                            <th>
                                                <label class="ui-checkbox">
                                                    <input name="checkbox1" type="checkbox"></label>
                                            </th>
                                            <th>会议室号</th>
                                            <th>地区</th>
                                            <th>地址</th>
                                            <th>楼层</th>
                                            <th>所属部门</th>
                                            <th>全部</th>
                                            <th>本部门</th>
                                            <th>小组</th>
                                            <th>个人</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <!-- ngRepeat: privilege in privilegeList -->
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">5A1-02</td>
                                            <td>武汉</td>
                                            <td>世贸中心</td>
                                            <td>5</td>
                                            <td>综合管理部</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    ><span></span></label>
                                            </td>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                        </tr>
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">6C3-06</td>
                                            <td>武汉</td>
                                            <td>世贸中心</td>
                                            <td>6</td>
                                            <td></td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                        </tr>
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">Shanghai</td>
                                            <td>上海</td>
                                            <td>上海XXX</td>
                                            <td>2</td>
                                            <td>上海分部</td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td>
                                        </tr>
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">O6-1M10</td>
                                            <td>武汉</td>
                                            <td>世贸中心</td>
                                            <td>6</td>
                                            <td></td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                        </tr>
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">6C3-06</td>
                                            <td>武汉</td>
                                            <td>世贸中心</td>
                                            <td>6</td>
                                            <td></td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                        </tr>
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">6C3-06</td>
                                            <td>武汉</td>
                                            <td>世贸中心</td>
                                            <td>6</td>
                                            <td></td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                        </tr>
                                        <tr data-ng-repeat="privilege in privilegeList" class="ng-scope">
                                            <td width="20">
                                                <label class="ui-checkbox"><input name="checkbox1"
                                                                                  type="checkbox"
                                                                                  class="ng-pristine ng-untouched ng-valid"></label>
                                            </td>
                                            <td class="ng-binding">6C3-06</td>
                                            <td>武汉</td>
                                            <td>世贸中心</td>
                                            <td>6</td>
                                            <td></td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                                    checked="checked"><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                            <td><label class="ui-checkbox"><input
                                                    name="checkbox1"
                                                    type="checkbox"
                                                    class="ng-pristine ng-untouched ng-valid"
                                            ><span></span></label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加修改对话框开始 -->
<div id="login" class="modal fade" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <!--<h4 class="modal-title text-center">会议室名称:</h4>-->
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="username" class="control-label col-md-12">添加角色:</label>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" id="username" class="form-control" placeholder="角色名"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="password" id="password3" class="form-control" placeholder="描述"/>
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
