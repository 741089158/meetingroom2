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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议统计</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href=#"">历史报表</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">

                <div class="col-md-12">
                    <div>
                        <table class="table table-bordered">
                            <thead class="bg-light-grey">
                            <tr class="uppercase">
                                <th>名称</th>
                                <th>主持人</th>
                                <th>会议类型</th>
                                <th>开始时间</th>
                                <th>历时</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">超级管理员的视频会议</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 --><td data-ng-if="meeting.type == 0" class="ng-scope">视频会议</td><!-- end ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-12 03:20</td>
                                <td class="ng-binding">1 小时 </td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 --><a ng-if="meeting.type == 0 &amp;&amp; privilegeControllerConferenceVideo == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">超级管理员的视频会议</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 --><td data-ng-if="meeting.type == 0" class="ng-scope">视频会议</td><!-- end ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-11 09:51</td>
                                <td class="ng-binding">1 小时 </td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 --><a ng-if="meeting.type == 0 &amp;&amp; privilegeControllerConferenceVideo == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">33333</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 --><td data-ng-if="meeting.type == 0" class="ng-scope">视频会议</td><!-- end ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-08 07:46</td>
                                <td class="ng-binding">46 分钟</td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 --><a ng-if="meeting.type == 0 &amp;&amp; privilegeControllerConferenceVideo == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">33333</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 --><td data-ng-if="meeting.type == 0" class="ng-scope">视频会议</td><!-- end ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-08 07:13</td>
                                <td class="ng-binding">1 分钟</td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 --><a ng-if="meeting.type == 0 &amp;&amp; privilegeControllerConferenceVideo == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">超级管理员的视频会议</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 --><td data-ng-if="meeting.type == 0" class="ng-scope">视频会议</td><!-- end ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-08 06:18</td>
                                <td class="ng-binding">51 分钟</td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 --><a ng-if="meeting.type == 0 &amp;&amp; privilegeControllerConferenceVideo == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">超级管理员的视频会议</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 --><td data-ng-if="meeting.type == 0" class="ng-scope">视频会议</td><!-- end ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-08 06:10</td>
                                <td class="ng-binding">28 分钟</td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 --><a ng-if="meeting.type == 0 &amp;&amp; privilegeControllerConferenceVideo == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">超级管理员的视频会议</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 --><td data-ng-if="meeting.type == 0" class="ng-scope">视频会议</td><!-- end ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-08 03:19</td>
                                <td class="ng-binding">13 分钟</td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 --><a ng-if="meeting.type == 0 &amp;&amp; privilegeControllerConferenceVideo == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">超级管理员的本地会议</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 --><td data-ng-if="meeting.type == 1" class="ng-scope">本地会议</td><!-- end ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-08 02:29</td>
                                <td class="ng-binding">3 分钟</td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 --><a ng-if="meeting.type == 1 &amp;&amp; privilegeControllerConferenceVirtual == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">test</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 --><td data-ng-if="meeting.type == 0" class="ng-scope">视频会议</td><!-- end ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-04 09:50</td>
                                <td class="ng-binding">4 分钟</td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 --><a ng-if="meeting.type == 0 &amp;&amp; privilegeControllerConferenceVideo == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings --><tr class="tr_a ng-scope" data-ng-repeat="meeting in meetings">
                                <td><a href="#" data-target="#ConHistory_decs" ng-click="viewDecs(meeting)" data-toggle="modal" class="ng-binding">wode</a></td>
                                <td class="ng-binding">超级管理员</td>
                                <!-- ngIf: meeting.type == 0 --><td data-ng-if="meeting.type == 0" class="ng-scope">视频会议</td><!-- end ngIf: meeting.type == 0 -->
                                <!-- ngIf: meeting.type == 1 -->
                                <!-- ngIf: meeting.type == 2 -->
                                <!-- ngIf: meeting.type == 3 -->
                                <!--<td>22</td>-->
                                <td class="ng-binding">2019-04-04 06:52</td>
                                <td class="ng-binding">13 分钟</td>
                                <td>
                                    <div>
                                        <!-- ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 --><a ng-if="meeting.type == 0 &amp;&amp; privilegeControllerConferenceVideo == 0" data-ng-click="reserveAgain(meeting)" class="btn blue btn_shadow btn-sm ng-scope">再次预约</a><!-- end ngIf: meeting.type == 0 && privilegeControllerConferenceVideo == 0 -->
                                        <!-- ngIf: meeting.type == 1 && privilegeControllerConferenceVirtual == 0 -->
                                        <!-- ngIf: meeting.type == 2 && privilegeControllerConferencePhone == 0 -->
                                        <!-- ngIf: meeting.type == 3 && privilegeControllerConferenceUmeeting == 0 -->
                                        <a data-ng-hide="!meeting.meetingLoggers" href="#" data-ng-click="singleTotal(meeting)" class="btn btn_shadow btn-sm-sub grey">通话记录</a>
                                        <a data-ng-hide="!meeting.record" href="#" data-ng-click="initRecord(meeting)" class="btn  btn_shadow btn-sm-sub grey ng-hide">纪要</a>
                                    </div>
                                </td>
                            </tr><!-- end ngRepeat: meeting in meetings -->
                            </tbody>
                        </table>

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
                        <label for="username" class="control-label col-md-3">会议室名称:</label>
                        <div class="col-md-12">
                            <input type="text" id="username1" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="control-label col-md-3">会议室类型:</label>
                        <div class="col-md-12">
                            <input type="text" id="username" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password1" class="control-label col-md-3">会议室分组：</label>
                        <div class="col-md-12">
                            <input type="password" id="password1" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password2" class="control-label col-md-3">呼叫方式：</label>
                        <div class="col-md-12">
                            <input type="password" id="password2" class="form-control" />
                        </div>
                    </div>
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
<script type="text/javascript">
    var a = 1;
    $(document).ready(function(){
        $("#videomeet").click(function(){
            $("#locameets").hide();
            $("#voidemeets").show();
            $("#videomeet").toggleClass('active');
            $("#locameet").removeClass('active');
        });
        $("#locameet").click(function(){
            $("#locameets").show()
            $("#voidemeets").hide();
            $("#videomeet").removeClass('active');
            $("#locameet"). toggleClass('active');
        });
    });



</script>

</html>
