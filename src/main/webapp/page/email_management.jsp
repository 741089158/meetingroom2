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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">系统管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">邮件管理</a>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-6 text-left">
                <h4> 我的通知</h4>
            </div>
           <!-- <div class="col-md-6 text-right">
                <form class="navbar-form">
                    <a href="email_writer.html" class="btn btn-primary">写邮件</a>
                </form>
            </div>-->
        </div>

        <div class="position-relative">
            <!--<div class="fa-pull-right">
                <a href="javascript:void(0)" class="btn fa-bluetooth">
                    <span></span>全部标记未已读
                </a>
            </div>-->
            <div class="position-relative">
                <div>
                    <table class="table table-bordered">
                        <tr>
                            <th>序号</th>
                            <th>通知</th>
                            <th>时间</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>[超级管理员的视频会议] 会议需要您参加!</td>
                            <td>2019-04-16 15:00</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>[超级管理员的视频会议] 会议需要您参加!</td>
                            <td>2019-04-16 15:00</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>[超级管理员的视频会议] 会议需要您参加!</td>
                            <td>2019-04-16 15:00</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>[超级管理员的视频会议] 会议需要您参加!</td>
                            <td>2019-04-16 15:00</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>[超级管理员的视频会议] 会议需要您参加!</td>
                            <td>2019-04-16 15:00</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>[超级管理员的视频会议] 会议需要您参加!</td>
                            <td>2019-04-16 15:00</td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>




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
