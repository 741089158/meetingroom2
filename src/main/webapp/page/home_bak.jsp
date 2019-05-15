<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
    <link rel="stylesheet" href=""/>
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
<body class="sidebar-fixed header-fixed" id="body">
<div class="content">
    <div class="container-fluid">
        <div class="card-header bg-light">
            <div class="text-left">
                <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a
                    href="#">我的会议</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室预定</a>
                <a href="${pageContext.request.contextPath }/page/schedule/schedule.jsp"
                   <%--${pageContext.request.contextPath }/meetroom/calender--%>
                   class="btn btn-primary" style="float: right;margin-right: 10px"><span class="fa fa-list"></span>日程</a>
                <%--<a href="${pageContext.request.contextPath }/meetroom/calender"
                &lt;%&ndash;${pageContext.request.contextPath }/meetroom/calender&ndash;%&gt;
                   class="btn btn-primary" style="float: right;margin-right: 10px"><span class="fa fa-list"></span>日程2</a>--%>
            </div>
        </div>
        <hr>
        <div class="row">

            <div class="container-fluid">
                <div class="row">
                        <div class="col-md-12 bg-light">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group"  style="padding-top: 15px">
                                    <select class="form-control" style="height: 35px ">
                                            <span class="fa fa-home">
                                          <option selected="selected" id="c5539aa3-af34-463d-9415-1a7f8ae42727" value="c5539aa3-af34-463d-9415-1a7f8ae42727"> </span>WH</option>
                                        <c:forEach items="${meetRoomArea}" var="area">
                                                    <option id="${area.areaId}" value="${area.areaId}"> </span>${area.roomAreaName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group" style="padding-top: 15px">
                                    <select id="meetBuilding" class="form-control" style="height: 35px ">
                                        <option selected value="YMTC-OS1">YMTC-OS1</option>
                                    </select>
                                </div>
                            </div>
                            <%--当前日期--%>
                            <div class="col-md-2">
                                <div class="form-group" style="padding-top: 15px;width: 150px">
                                    <input id="date" type="date" class="form-control">
                                </div>
                            </div>
                            <script>
                                $(document).ready(function () {
                                    var time = new Date();
                                   // alert(time)
                                    var day = ("0" + time.getDate()).slice(-2);
                                    var month = ("0" + (time.getMonth() + 1)).slice(-2);
                                    var today = time.getFullYear() + "-" + (month) + "-" + (day);
                                    $('#date').val(today);
                                })
                            </script>
                            <%--选择时间--%>
                            <div class="col-md-2">
                                <div class="form-group" style="padding-top: 15px">
                                    <input id="time" type="time" class="form-control" >
                                </div>
                            </div>
                            <script>
                                //设置默认时间为当前时间
                                $(document).ready(function () {
                                    var date = new Date();
                                    var now = date.getHours()+":"+date.getMinutes();
                                    $('#time').val(now);
                                })
                            </script>
                            <%--时长--%>
                            <div class="col-md-1" style="padding: 20px">
                                <label class="control-label">时长:</label>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group" style="padding-top: 15px">
                                    <input id="duration" type="time" class="form-control">
                                </div>
                            </div>
                        </div>
                            <script>
                                $(document).ready(function () {
                                    $('#duration').val("01:00");
                                })

                            </script>
                        </div>

                        <div class="col-md-12 mb-2">
                            <ul class="nav nav-tabs" role="tablist" id="floor">
                                <li class="nav-item">
                                    <a class="nav-link active text-primary" data-toggle="tab" href="#home" role="tab"
                                       aria-controls="home">5</a>
                                </li>
                            </ul>

                            <div class="tab-content" >
                                <div class="tab-pane active" id="home" role="tabpanel">

                                    <div class="row" id="meetroom">
                                     <c:forEach items="${meetRoom}"  var="list">
                                        <div class="col-md-2">

                                                <div>
                                                    <img src="${pageContext.request.contextPath}/image/biaoqian.png" width="50px">
                                                    <div style="position: absolute;left: 15px;top: 0px;color: whitesmoke"><span class="h5">${list.personCount}</span></div>

                                                    <div style="float: right;" >
                                                        <button  style="background-color: #ffffff; width:25px;height:25px;border: none;">
                                                            <img src="${pageContext.request.contextPath}/image/xingxing 2.png" width="20px" height="20px"></button>
                                                    </div>
                                                    <div style="float: right;display: none" >
                                                        <button  style="background-color: #ffffff; width:25px;height:25px;border: none;">
                                                            <img src="${pageContext.request.contextPath}/image/xingxing1.png" width="20px" height="20px"></button>
                                                    </div>
                                                    <center><img class="text-center" src="${pageContext.request.contextPath}/image/meet1.jpg " width="100%";></center>
                                                    <div class="card-footer bg-light text-center">
                                                        <%--${pageContext.request.contextPath }/meetroom/remmet?id=${list.roomId}&date=2019-05-5&time=14:30&duration=01:00--%>
                                                        <a href="javascript:meeting('${list.roomId}')" class="h6 text-warning" id=${list.roomId}>${list.roomName}</a>
                                                    </div>
                                                </div>
                                        </div>
                                         </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">


    <%--跳转到预定会议页面--%>
    function meeting(roomId){
       // alert(roomId)
        var date = $("#date").val();
        var time = $("#time").val();
        var duration = $("#duration").val();
       // alert(date+"---"+time+"---"+duration);
        if (time==null||time==""||duration==null||duration==""){
            alert("请选择时间");
            return;
        }
       location.href="${pageContext.request.contextPath }/meetroom/remmet?id="+roomId+"&date="+date+"&time="+time+"&duration="+duration
    }



    $(document).ready(function () {
        $("select:first").click(function(){
            var url="meetbuilding";
            var key = $("select:first").val();
            if(key.length>0){
                var data = {"key":key};
                $("#meetBuilding").empty();
                $.post(url,data,function(result){
                    $(result).each(function(){
                        $("#meetBuilding").append("<option value='"+this.roomBuilding+"' >"+this.roomBuilding+"</option>")
                    })
                },"json");
            }
        });
        $("#meetBuilding").click(function() {
            var url = "meetfloor";
            var area = $("select:first").val();
            var building = $("#meetBuilding").val();

            var data = {"area":area,"building":building}
            $("#floor").empty();
            $.post(url, data, function (result) {
                $(result).each(function () {
                    $("#floor").append("<li class=\"nav-item\">\n" +
                        "                       <a class=\"nav-link   text-primary\" data-toggle=\"tab\" href=\"#"+this.roomFloor+"\" role=\"tab\"\n" +
                        "                    aria-controls=\""+this.roomFloor+"\">"+this.roomFloor+"</a>\n" +
                        "                        </li>")
                })

                $("ul li").click(function() {
                    var url = "meetroom";
                    var area = $("select:first").val();
                    var building = $("#meetBuilding").val();
                    var floor=$(this).text();
                    var date=$("#date").val();
                    var time=$("#time").val();
                    alert(date)
                    alert(time)
                    var duration=$("#duration").val();
                    var data = {"area":area,"building":building,"floor":floor,"date":date,"time":time,"duration":duration}
                    $("#meetroom").empty();
                    if(date.length==0||time.length==0||duration.length==0){
                        alert("请选择时间以及会议时长")
                        return;
                    }
                    $.post(url, data, function (result) {
                        $(result).each(function () {
                            $row = $("<div class=\"col-md-2\">\n" +
                                "<img src=\"${pageContext.request.contextPath}/image/biaoqian.png\" width=\"50px\">\n" +
                                "<div style=\"position: absolute;left: 15px;top: 0px;color: whitesmoke\"><span class=\"h5\">"+this.personCount+"</span></div></div>");
                            $row.append("<div style=\"float: right;\" >\n" +
                                "<button  style=\"background-color: #ffffff; width:25px;height:25px;border: none;\">\n" +
                                "\n" +
                                " <img src=\"${pageContext.request.contextPath}/image/xingxing 2.png\" width=\"20px\" height=\"20px\"></button>\n" +
                                "</div>")
                            //如果为视屏会议添加视屏小图标
                            if(this.roomType=="视屏会议室"){
                                $row.append("<div style=\"float: right;\" >\n" +
                                    " <img src=\"${pageContext.request.contextPath}/image/video.png\" width=\"28px\" height=\"18px\"></button>\n" +
                                    " </div>")
                            }
                            $row.append("   <center><img class=\"text-center\" src=\"${pageContext.request.contextPath}/image/meet1.jpg \" width=\"100%\";></center>")

                            if(this.roomType=="视屏会议室"){
                                $row.append(" <div class=\"card-footer bg-light text-center\">\n" +
                                    "<a href=\"${pageContext.request.contextPath }/meetroom/videoremeet?id="+this.roomId+"&date="+date+"&time="+time+"&duration="+duration+"\" class=\"h6 text-warning\">"+this.roomName+"</a>\n" +
                                    "</div>")
                            }else{

                                $row.append(" <div class=\"card-footer bg-light text-center\">\n" +
                                    "<a href=\"${pageContext.request.contextPath }/meetroom/remmet?id="+this.roomId+"&date="+date+"&time="+time+"&duration="+duration+"\" class=\"h6 text-warning\">"+this.roomName+"</a>\n" +
                                    "</div>")
                            }
                            $row.appendTo($("#meetroom"))
                        })
                    }, "json");
                })
            }, "json");
        })

        var a = 1;
        $("#shoucang1").click(function () {
            $("#xingxing1").hide();
            $("#xingxing2").show();
            alert("收藏成功")
        });
        $("#shoucang2").click(function () {
            $("#xingxing1").show()
            $("#xingxing2").hide();
            alert("取消收藏")
        });
    });


</script>
</html>
