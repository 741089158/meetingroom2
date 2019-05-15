<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Carbon - Admin Template</title>
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
            <div class="text-left">
                <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a
                    href="#">我的会议</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">我的预定会议</a>
                <button class="btn btn-primary" style="float: right;margin-right: 10px" id="delSelected">取消选中</button>
            </div>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-12">
                    <form action="${pageContext.request.contextPath }/meetroom/myappointmeet" method="post">
                        <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px"
                               placeholder="搜索" name="meetName" value="${meetName}">
                        <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索
                        </button>
                    </form>
                    <form method="post" action="${pageContext.request.contextPath}/addUser/deleteUser"
                          id="form"><%--批量取消会议--%>
                        <%-- <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px" placeholder="搜索">
                         <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索</button>--%>
                        <a href="${pageContext.request.contextPath }/appointreet/findRepeatMeeting"
                           class="btn btn-default" style="width: 100px;float: right;margin: 5px">循环会议</a>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="active text-center"><input type="checkbox" id="firstCb"/></th>
                                <th class="text-center">会议名称</th>
                                <th class="text-center">会议类型</th>
                                <th class="text-center">开始时间</th>
                                <th class="text-center">会议室</th>
                                <th class="text-center">距离开会时间:</th>
                                <th class="text-center">操作:</th>
                            </tr>
                            </thead>
                            <div class="CollagePeople-bot">
                                <tbody>
                                <c:forEach items="${pageInfo.list}" var="list">
                                    <c:if test="${list.state==1}">
                                        <tr>
                                            <td class="active">
                                                <center><input type="checkbox" name="id" value="${list.id}"/></center>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath }/addUser/finduser?meetid=${list.id}"
                                                   style="color: #0c87eb">${list.meetName}</a>

                                            </td>
                                            <td class="text-center">${list.meetType}</td>
                                            <td class="text-center">${list.meetDate}</td>
                                            <td class="text-center">${list.meetRoomName}</td>
                                            <td class="text-center" style="width:200px;color: red"  id="long"><span
                                                    class="intDifftime" startTime="${list.meetDate}" >会议正在进行</span></td>
                                            <td class="text-center">
                                                <form class="navbar-form">
                                                    <a class="btn btn-default"
                                                       href="${pageContext.request.contextPath}/meetroom/findOne?id=${list.id}">修改</a>
                                                    <a class="btn btn-danger btn-sm"
                                                       href="javascript:deleteMeet(${list.id});">取消</a>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </div>
                        </table>

                    </form>
                    <%--分页查询--%>
                    <div class="form-group form-inline">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页 10 条
                        </div>&nbsp;&nbsp;
                        <ul class="pagination">
                            <li>
                                <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=1&size=${pageInfo.pageSize}"
                                   aria-label="Previous">首页</a>
                                <%-- <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> --%>
                            </li>
                            <c:if test="${pageInfo.pageNum!=1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageInfo.pages!=pageInfo.pageNum}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a>
                                </li>
                            </c:if>
                            <li>
                            <li>
                                <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                                   aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    function deleteMeet(id) {
        //用户安全提示
        if (confirm("您确定要取消吗？")) {
            alert("取消成功!");
            //location.href = "${pageContext.request.contextPath}/addUser/deleteUser?id="+id;
        }
    }

    window.onload = function () {
        //给删除选中按钮添加单击事件
        document.getElementById("delSelected").onclick = function () {
            if (confirm("您确定要删除选中条目吗？")) {

                var flag = false;
                //判断是否有选中条目
                var cbs = document.getElementsByName("id");
                for (var i = 0; i < cbs.length; i++) {
                    if (cbs[i].checked) {
                        //alert(cbs[i]);
                        //有一个条目选中了
                        flag = true;
                        break;
                    }
                }
                if (flag) {//有条目被选中
                    //表单提交
                    document.getElementById("form").submit();
                } else {
                    alert("没有选中项")
                }
            }
        };
        //1.获取第一个cb
        document.getElementById("firstCb").onclick = function () {
            //2.获取下边列表中所有的cb
            var cbs = document.getElementsByName("id");
            //3.遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                cbs[i].checked = this.checked;
            }
        };

    }
</script>
<script type="text/javascript">



    $(function () {
        updateEndTime();
    });

    function updateEndTime() {
        var NowTime = new Date();
        var time = NowTime.getTime();//当前时间
       // alert(NowTime)
        $(".intDifftime").each(function (I) {
            var startTime = this.getAttribute("startTime").replace(new RegExp("-","gm"),"/");//开始时间
            var startTime1 = (new Date(startTime)).getTime();//开始时间毫秒值
            //alert(startTime1);
           /* var endDate1 = eval('new Date(' + startTime.replace(/\d+(?=-[^-]+$)/, function (a) {
                return parseInt(a, 10) - 1;
            }).match(/\d+/g) + ')');
            var endTime = endDate1.getTime();//结束时间*/
            //alert(endDate1)
            var lag = Math.floor((startTime1 - time) / 1000);
            //console.log("秒数",endTime);
            //			判断计时是否停止
            if (lag > 0) {
                var day = Math.floor(lag / (60 * 60 * 24));
                var h = Math.floor(lag / 3600 % 24);
                var d = Math.floor(h / 24);
                var m = Math.floor(lag / 60 % 60);
                var s = lag % 60;
                $(this).html(day + '天' + h + "小时" + m + "分钟" + s + '秒');
            } else {
                //console.log("倒计时结束");
                $(this).html("会议已结束");
            }
            /*if (time>startTime1 && time < endTime){
                $(this).html("会议正在进行");
            }
            if (time>endTime){
                $(this).html("会议已结束");
            }*/
        });
        setTimeout("updateEndTime()", 1000);
    }

</script>
</html>
