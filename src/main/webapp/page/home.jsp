<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp" %>
<body>
<%@ include file="../page/top.jsp" %>
<div class="layui-row row_black">
    <%@ include file="../page/nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <%--<div class="layui-row block-bg-color block-border-top">
            <div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>我的会议</cite></a>
					</span>
            </div>
            <div class="layui-col-md12 block-padding-around">
                <h2 class="block-bot-left">会议室预订</h2>
                <div class="block-bot-right">
                    <a class="layui-btn layui-btn-sm layui-btn-normal"
                       href="${pageContext.request.contextPath}/page/schedule/schedule.jsp">
                        <i class="layui-icon layui-icon-date"></i> 日程
                    </a>
                </div>
            </div>
        </div>--%>
        <div class="layui-row block-bg-color block-border-top">
            <div class="layui-col-md12 block-padding-around">
                <span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>会议室预订</cite></a>
                </span>
            </div>
        </div>
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around">
                    <form class="layui-form" action="">
                        <div class="layui-form-item block-margin-both-15">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">地区</label>
                                    <div class="layui-input-inline">
                                        <select id="home_area" lay-filter="home_area" lay-verify="required">
                                            <%--<c:forEach items="${meetRoomArea}" var="area">
                                                <option id="${area.areaId}"
                                                        value="${area.areaId}">${area.roomAreaName}</option>
                                            </c:forEach>--%>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">区域</label>
                                    <div class="layui-input-inline">
                                        <select id="home_building" lay-filter="home_building" lay-verify="required">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline" style="float: right;margin-right: 100px">
                                    <a class="layui-btn layui-btn-sm layui-btn-normal"
                                       href="${pageContext.request.contextPath}/page/schedule/schedule.jsp">
                                        <i class="layui-icon layui-icon-date"></i> 日程
                                    </a>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">日期</label>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id="home_date" placeholder="yyyy年MM月dd日"
                                               lay-verify="required" onchange="checkTime()">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">时间</label>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id="home_time" placeholder="HH:mm"
                                               lay-verify="required" onchange="checkTime()">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">时长</label>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" id="home_duration" placeholder="HH:mm"
                                               lay-verify="required" onchange="checkTime()">
                                    </div>
                                </div>
                            </div>
                            <!--
                            <div class="layui-inline">
                                <label class="layui-form-label"></label>
                                <div class="layui-input-inline">
                                    <button class="layui-btn" lay-submit="" lay-filter="home_search">查询</button>
                                </div>
                            </div>
                             -->
                        </div>
                    </form>
                </div>
            </div>
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around">
                    <div class="layui-tab layui-tab-brief" lay-filter="home_floor">
                        <ul class="layui-tab-title" id="home_floor">
                            <li class="layui-this">全部</li>
                        </ul>
                        <div class="layui-tab-content" style="height: 100px;" id="home_tab_content_container">
                            <div class="layui-tab-item layui-show" id="home_card_container_parent">
                                <div class="layui-row layui-col-space20" id="home_card_container">
                                    <div class="layui-col-md3">
                                        <!--
                                        <div class="layui-card box">
                                            <div class="layui-card-header">
                                                <div class="home-point">F25</div>
                                                <div class="home-point-label">
                                                    <h3>
                                                        <strong>卡片面板</strong>
                                                    </h3>
                                                </div>
                                            </div>
                                            <div class="layui-card-body home-point-body">
                                                可容纳人数
                                                <h3>
                                                    <strong>111人</strong>
                                                </h3>
                                            </div>
                                            <div class="layui-card-footer-a">卡片面板</div>
                                        </div>
                                         -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var layer;//层
    layui.use(['form', 'laydate', 'layer'], function () {
        //处理高度
        $("#home_tab_content_container").height($(window).height() - $("#home_card_container").offset().top - 50);
        var laydate = layui.laydate;
        var form = layui.form;
        layer = layui.layer;

        //显示所有会议室
        $.post("${pageContext.request.contextPath}/meet/findList", {}, function (result) {
            $("#home_floor").empty();
            $("#home_floor").append("<li data-floor='all' class='layui-this'>全部</li>");
            $("#home_card_container_parent").siblings().remove();
            $("#home_card_container").empty();
            $.each(result.data, function (k, v) {
                var top_tmp = $('<div class="layui-tab-item"></div>');
                var tmp = $('<div class="layui-row layui-col-space20"></div>');
                top_tmp.append(tmp);
                $("#home_tab_content_container").append(top_tmp);
                var card = $('<div class="layui-col-md2" >' +
                    '<div class="layui-card box">' +
                    '<div class="layui-card-header">' +
                    '<div class="home-point">' + this.roomFloor + 'F</div>' +
                    '<div class="home-point-label">' +
                    '<h4>' +
                    '<strong>' + this.roomName + '</strong>' +
                    '</h4>' +
                    '</div>' +
                    '</div>' +
                    '<div class="layui-card-body home-point-body" style="height: 30px">' +
                    /*'可容纳人数'+*/
                    '<h4>' +
                    '<strong>' + this.personCount + '人</strong>' +
                    '</h4>' +
                    '</div>' +
                    '<div class="layui-card-footer-a ' + this.roomId + '" data-roomType="' + this.roomName +
                    '" data-roomId="' + this.roomId +
                    '" onclick="cardFooterAClick(this)" id="' + this.roomId + '" style="background-color: #1E9FFF" name="remeet">预约</div>' +
                    '</div>' +
                    '</div>');
                $("#home_card_container").append(card.clone());
                tmp.append(card);
            });
        }, "json");

        laydate.render({
            elem: '#home_date',
            format: 'yyyy-MM-dd',
            value: new Date(),
            done: function (value, date) {
                var home_time = $("#home_time").val();             //时间
                var check_duration = $("#home_duration").val();     //时长
                var data = {
                    "date": value,
                    "time": home_time,
                    "duration": check_duration
                };
                if (home_time == "" || check_duration == "") {
                    return;
                }
                console.log(data);
                checkTime(data);
            }
        });
        laydate.render({
            elem: '#home_time',
            type: 'time',
            format: 'HH:mm',
            ready: formatMinutes,
            //value: new Date(),
            done: function (value, date) {
                var check_date = $("#home_date").val();             //日期
                var check_duration = $("#home_duration").val();     //时长
                var data = {
                    "date": check_date,
                    "time": value,
                    "duration": check_duration
                };
                if (check_date == "" || check_duration == "") {
                    return;
                }
                console.log(data);
                checkTime(data);
            }
        });
        laydate.render({
            elem: '#home_duration',
            type: 'time',
            btns: ['confirm'],
            format: 'HH:mm',
            value: '01:00',
            ready: formatMinutes,
            done: function (value, date) {
                var check_date = $("#home_date").val();             //日期
                var check_time = $("#home_time").val();     //时间
                var data = {
                    "date": check_date,
                    "time": check_time,
                    "duration": value
                };
                if (check_date == "" || check_time == "") {
                    return;
                }
                console.log(data);
                checkTime(data);
            }
        });

        $.post("${pageContext.request.contextPath}/meetroom/meetarea", {}, function (result){
            $(result).each(
                function () {
                    $("#home_area").append(
                        "<option value='" + this.areaId + "'>"
                        + this.roomAreaName
                        + "</option>");
                });
            form.render('select');
        },"json");

        //地区联动选楼
        form.on('select(home_area)', function (data) {
            url = "${pageContext.request.contextPath}"
                + "/meetroom/meetbuilding";
            var str = "";
            $("#home_building").empty();
            $.post(url, {
                "key": data.value
            }, function (result) {
                $(result).each(
                    function () {
                        $("#home_building").append(
                            "<option value='" + this.roomBuilding + "'>"
                            + this.roomBuilding
                            + "</option>");
                    });
                form.render('select');
            }, "json");
        });
        //楼联动楼层
        form.on('select(home_building)', function (e) {
            url = "${pageContext.request.contextPath}"
                + "/meetroom/meetfloor";
            var data = {
                "area": $("#home_area").val(),
                "building": e.value
            };
            $("#home_time").val("");
            $.post(url, data, function (result) {
                $("#home_floor").empty();
                $("#home_floor").append("<li data-floor='all' class='layui-this'>全部</li>");
                //$("ul>li").not(":eq(0)").remove();
                //$("ul>li").not(":first").remove();//保留第一个,其他删除
                $("#home_card_container_parent").siblings().remove();
                $("#home_card_container").empty();
                $.each(result, function (k, v) {
                    $("#home_floor").append("<li data-floor='" + k + "'>" + k + "F</li>");
                    var top_tmp = $('<div class="layui-tab-item"></div>');
                    var tmp = $('<div class="layui-row layui-col-space20"></div>');
                    top_tmp.append(tmp);
                    $("#home_tab_content_container").append(top_tmp);
                    $.each(v, function (i, n) {
                        //console.log(n);
                        var card = $('<div class="layui-col-md2" >' +
                            '<div class="layui-card box">' +
                            '<div class="layui-card-header">' +
                            '<div class="home-point">' + k + 'F</div>' +
                            '<div class="home-point-label">' +
                            '<h4>' +
                            '<strong>' + n.roomName + '</strong>' +
                            '</h4>' +
                            '</div>' +
                            '</div>' +
                            '<div class="layui-card-body home-point-body " style="height: 30px">' +
                            /*'可容纳人数'+*/
                            '<h4>' +
                            '<strong>' + n.personCount + '人</strong>' +
                            '</h4>' +
                            '</div>' +   /*  class="layui-card-footer-a 191y9y9y13eihiaodh"    */
                            '<div class="layui-card-footer-a ' + this.roomId + '" data-roomType="' + n.roomName +
                            '" data-roomId="' + n.roomId +
                            '" onclick="cardFooterAClick(this)" id="' + this.roomId + '" style="background-color: #1E9FFF" name="' + this.roomId + '">预约</div>' +
                            '</div>' +
                            '</div>');
                        $("#home_card_container").append(card.clone());
                        tmp.append(card);
                    });
                });
            }, "json");
        });



        form.on('submit(home_search)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });
            return false;
        });

    });

    //footer下面的点击事件
    function cardFooterAClick(e) {
        var roomId = $(e).attr("data-roomId");
        var roomType = $(e).attr("data-roomType");
        var d = $("#home_date").val();
        d = d.replace("年", "-");
        d = d.replace("月", "-");
        d = d.replace("日", "");
        var t = $("#home_time").val();
        t = t.replace("点", ":");
        t = t.replace("分", "");
        var meetTime = $("#home_duration").val();
        var startTime = $("#home_time").val();
        // meetTime = meetTime.replace("小时",":");
        // meetTime = meetTime.replace("分","");
        if (roomId == undefined || roomType == undefined || d == undefined || t == undefined || meetTime == undefined || startTime == "") {
            layer.alert("您缺少重要参数");
            return false;
        }
        if (roomType == "视屏会议室") {
            /*window.location.href = "/meetroom/videoremeet?id="+roomId+"&date="+d+"&time="+t+"&duration="+duration;*/
            window.location.href = "${pageContext.request.contextPath }/meetroom/remmet?id=" + roomId + "&date=" + d + "&time=" + t + "&meetTime=" + meetTime;
        } else {
            window.location.href = "${pageContext.request.contextPath }/meetroom/remmet?id=" + roomId + "&date=" + d + "&time=" + t + "&meetTime=" + meetTime;
        }
    }

    //删除时间控件秒   分钟间隔显示
    function formatMinutes(date) {
        var aa = $(".laydate-time-list li ol")[1];
        var showtime = $($(".laydate-time-list li ol")[1]).find("li");
        for (var i = 0; i < showtime.length; i++) {
            var t00 = showtime[i].innerText;
            if (t00 != "00" && t00 != "15" && t00 != "30" && t00 != "45") {
                //分进行过滤 只保留0 15 30 45  一次性显示六十个太多没必要
                showtime[i].remove()
            }
        }
        $($(".laydate-time-list li ol")[2]).find("li").remove();  //清空秒
    }

    //冲突检查
    function checkTime(data) {
        //预定会议冲突检查  根据地区,建筑,日期,时间,时长
        $.post("${pageContext.request.contextPath}/appointreet/checkTime", data, function (resp) {
            console.log(resp);
            $.each(resp, function () {
                if ((document.getElementById(this.meetRoomId)) != null) {
                    $("." + this.meetRoomId).hide();
                    //$(".layui-card-footer-a "+this.meetRoomId+"").removeAttr("style");
                    //document.getElementById(this.meetRoomId).style.display = "none";
                }
            })
        });
    }

</script>
<%--时间控件css 去掉秒,时间以15分钟间隔--%>
<style type="text/css">
    .layui-laydate-content > .layui-laydate-list {
        padding-bottom: 0px;
        overflow: hidden;
    }

    .layui-laydate-content > .layui-laydate-list > li {
        width: 50%
    }

    .merge-box .scrollbox .merge-list {
        padding-bottom: 5px;
    }
</style>
</body>
</html>