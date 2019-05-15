<%@ page import="com.bcsd.entity.MeetRoom" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a
                href="#">会议管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议修改</a>
        </div>
        <hr>
        <div>
            <div>
                <div class="row">
                    <div class="modal-body ">

                        <form class="form-horizontal" action="${pageContext.request.contextPath}/meetroom/update"
                              method="post">
                            <div class="form-group" id="room">
                                <label for="id" class="col-sm-2 control-label"></label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="id" name="id" value="${remeet.id}"
                                           placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="meetName" class="col-sm-2 control-label">会议名称:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="meetName" name="meetName"
                                           value="${remeet.meetName}" placeholder="">
                                </div>
                            </div>
                            <div class="form-group" id="roomId">
                                <label for="meetRoomId" class="col-sm-2 control-label">会议室id:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="meetRoomId" id="meetRoomId"
                                           value="${remeet.meetRoomId}" placeholder="">
                                </div>
                            </div>
                            <%--选择会议室--%>
                            <div class="form-group">
                                <label class=" form-control col-md-2 " style="border: 0px ">
                                    <center>会议室:</center>
                                </label>
                                <label class=" form-control col-md-2">
                                    <center><input for="placeholder-input" id="no" type="radio" name="day" value="no"
                                                   checked="checked">不变:
                                    </center>
                                </label>
                                <label class=" form-control col-md-2">
                                    <center><input for="placeholder-input" id="everydays" type="radio" name="day"
                                                   value="everydays">修改:
                                    </center>
                                </label>
                            </div>
                            <div class="form-group" style="display: none" id="everyday">
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <%--选择地区--%>
                                        <select class="form-control" style="height: 35px" id="roomArea" name="roomArea" onchange="changeArea();">
                                           <%-- <option selected="selected" id="c5539aa3-af34-463d-9415-1a7f8ae42727" value="c5539aa3-af34-463d-9415-1a7f8ae42727"> </span>WH1</option>--%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <%--选择建筑--%>
                                        <select id="meetBuilding" class="form-control" style="height: 35px" onchange="changeBuilding();">
                                           <%-- <option selected value="YMTC-OS1" >YMTC-OS2</option>--%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <%--选择楼层--%>
                                        <select id="floor" class="form-control" style="height: 35px" onchange="changeFloor();">
                                           <%-- <option selected value="5A2-05">5</option>--%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <%--选择会议室--%>
                                        <select id="meetRoom" class="form-control" style="height: 35px" onchange="changeMeetRoom();">
                                            <%--<option selected value="5A2-05">5A2-05</option>--%>
                                        </select>
                                    </div>
                                </div>
                                <a href="#" id="ok">确定</a>
                            </div>
                            <div class="form-group">
                                <label for="meetRoomName" class="col-sm-2 control-label">会议室:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="meetRoomName" name="meetRoomName"
                                           value="${remeet.meetRoomName}" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Date" class="col-sm-2 control-label">会议日期:</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="date" name="date" value="${date}"
                                           placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="time" class="col-sm-2 control-label">会议时间:</label>
                                <div class="col-sm-5">
                                    <input type="time" class="form-control" id="time" name="time" value="${time}"
                                           placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="meetTime" class="col-sm-2 control-label">时长:</label>
                                <div class="col-sm-5">
                                    <input type="time" class="form-control" id="meetTime" name="meetTime"
                                           value="${remeet.meetTime}" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="meetLaber" class="col-sm-2 control-label">会议标签:</label>
                                <div class="col-sm-5">
                                    <select name="meetLaber" style="height: 35px" class="form-control" id="meetLaber"
                                            name="meetLaber">
                                        <option value="普通会议"
                                                <c:if test="${remeet.meetLaber=='普通会议'}">selected='selected'</c:if>>普通会议
                                        </option>
                                        <option value="重要会议"
                                                <c:if test="${remeet.meetLaber=='重要会议'}">selected='selected'</c:if>>重要会议
                                        </option>
                                        <option value="高层会议"
                                                <c:if test="${remeet.meetLaber=='高层会议'}">selected='selected'</c:if>>高层会议
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="meetDescription" class="col-sm-2 control-label">描述:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="meetDescription" name="meetDescription"
                                           value="${remeet.meetDescription}" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="meetType" class="col-sm-2 control-label">会议室类型:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="meetType" name="meetType"
                                           value="${remeet.meetType}" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">修改</button>
                                    <button type="button" class="btn btn-default" onclick="history.back(-1);">取消
                                    </button>
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
    document.getElementById("room").style.display = "none";
    document.getElementById("roomId").style.display = "none";

    $("#ok").click(function () {
        var value1 = $("#meetRoom").val();
        var value2 = $("#meetRoom option:selected").text();
        //alert(value2)
        $("#meetRoomId").val(value1);
        $("#meetRoomName").val(value2);
    });


    /*获取建筑*/
    function meetbuilding(data){
        $("#meetBuilding").empty();
        $.post("meetbuilding", {"key":data}, function (result) {
            //alert(result[0].roomBuilding);
            $(result).each(function () {
            $("#meetBuilding").append("<option value='"+this.roomBuilding+"' >"+this.roomBuilding+"</option>")
            });
            var value1 = $("#roomArea option:selected").val();
            var value2 = $("#meetBuilding option:selected").val();
            var data={"area":value1,"building":value2};
           floor(data);
        }, "json");
    }
    /*获取楼层*/
    function floor(data){
        $("#floor").empty();
        $.post("meetfloor", data, function (result) {
            $(result).each(function () {
               // alert(this.roomFloor);
                $("#floor").append("<option value='"+this.roomFloor+"' >"+this.roomFloor+"</option>")
            });
            var value1 = $("#roomArea option:selected").val();
            var value2 = $("#meetBuilding option:selected").val();
            var value3 = $("#floor option:selected").val();
            var value4 = $("#meetRoomId").val();
            //alert(value1+"----"+value2+"----"+value3+"----"+value4)
            var data={"areaId":value1,"building":value2,"floor":value3,"roomId":value4};
            meetRoom(data);
        }, "json");
    }
    /*获取会议室*/
    function meetRoom(data){
        $("#meetRoom").empty();
        $.post("updateMeetRoom", data, function (result) {
            //alert(result.roomName);
            $(result).each(function () {
                $("#meetRoom").append("<option value='"+this.roomId+"' >"+this.roomName+"</option>")
            });
        }, "json");
    }

   /* $("#meetBuilding").click(function () {
        var area = $("select:first").val();
        var building = $("#meetBuilding").val();
        var data = {"area": area, "building": building};
        $.post("meetfloor", data, function (result) {
            $(result).each(function () {
                $("#floor").append("<option value='" + this.roomFloor + "'>" + this.roomFloor + "</option>")
            })
           // alert(result[0].roomFloor);
            floor(result[0].roomFloor);
        }, "json");
    });*/


    function changeArea(){
        var value = $("#roomArea option:selected").val();
        meetbuilding(value);
    }
    function changeBuilding(){
        var value1 = $("#roomArea option:selected").val();
        var value2 = $("#meetBuilding option:selected").val();
        var data={"area":value1,"building":value2};
        floor(data);
    }
    function changeFloor(){
        var value1 = $("#roomArea option:selected").val();
        var value2 = $("#meetBuilding option:selected").val();
        var value3 = $("#floor option:selected").val();
        var value4 = $("#meetRoomId").val();
        //alert(value1+"----"+value2+"----"+value3+"----"+value4)
        var data={"areaId":value1,"building":value2,"floor":value3,"roomId":value4};
        meetRoom(data);
    }
    function changeMeetRoom(){
        var value = $("#roomArea option:selected").val();
    }

    $(document).ready(function () {
        $("input").click(function () {
            var a = $("input[name='day']:checked").val();
            if (a == 'everydays') {
                $("#everyday").show();
            }
            if (a == 'no') {
                $("#everyday").hide();
            }
        });
        var data = {};
        $("#roomArea").empty();
        $.post("meetarea", data, function (result) {
           // alert(result[0].roomAreaName)
           // alert(result[0].areaId);
            $(result).each(function () {
                var append = $("#roomArea").append("<option value='" + this.areaId + "' >" + this.roomAreaName + "</option>");
            });
            meetbuilding(result[0].areaId);
        }, "json");
    });

</script>
</html>
