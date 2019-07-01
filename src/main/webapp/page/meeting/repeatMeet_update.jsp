<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@ include file="../../page/common.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/formSelects/formSelects-v4.css"></link>
<body>
<%@ include file="../../page/top.jsp" %>
<div class="layui-row row_black">
    <%@ include file="../../page/nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both">
                <form id="meetForm" class="layui-form" style="background-color: white;padding: 10px"
                <%--action="${pageContext.request.contextPath}/meetroom/update"--%> method="post">
                    <input name="id" type="hidden" id="id" value="${repeatMeeting.id}"/>
                    <div class="layui-form-item">
                        <label class="layui-form-label">会议名称<span style="color: red;">*</span></label>
                        <div class="layui-input-block">
                            <input name="meetName" placeholder="会议名称" type="text" class="layui-input"
                                   lay-verify="required"
                                   required id="meetName" style="width: 550px" value="${repeatMeeting.meetName}"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">日期<span style="color: red;">*</span></label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" value="${date}" id="date" name="date"
                                       placeholder="yyyy-MM-dd" lay-verify="required" required autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">时间<span style="color: red;">*</span></label>
                            <div class="layui-input-inline">
                                <input id="time" name="time" placeholder="HH:mm" type="text" class="layui-input"
                                       lay-verify="required" value="${time}" required autocomplete="off"/>
                            </div>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">时长<span style="color: red;">*</span></label>
                        <div class="layui-input-block">
                            <input id="meetTime" name="meetTime" placeholder="时长" type="text" class="layui-input"
                                   lay-verify="required" style="width: 550px" value="${repeatMeeting.meetTime}" required
                                   autocomplete="off"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">会议标题</label>
                        <div class="layui-input-block">
                            <input id="meetLaber" name="meetLaber" value="${repeatMeeting.title}" placeholder="会议标题"
                                   type="text"
                                   class="layui-input" style="width: 550px"/>
                        </div>
                    </div>
                  <%--  <div class="layui-form-item" >
                        <label class="layui-form-label">重复周期</label>
                        <div class="layui-input-block">
                            <input type="radio" name="day" <c:if test="${repeatMeeting.repeatType=='everydays'}">checked</c:if> value="everydays" title="每日" lay-filter="day"/>
                            <input type="radio" name="day" <c:if test="${repeatMeeting.repeatType=='everyweeks'}">checked</c:if> value="everyweeks" title="每周" lay-filter="day"/>
                            <input type="radio" name="day" <c:if test="${repeatMeeting.repeatType=='everymonths'}">checked</c:if> value="everymonths" title="每月" lay-filter="day"/>
                        </div>
                    </div>--%>
                    <div class="layui-form-item" id="localmeet_everyweeks_option" style="display:none">
                        <label class="layui-form-label">重复日期</label>
                        <div class="layui-input-block">
                            <input type="hidden" name="week" id="week"  <c:if test="${repeatMeeting.repeatType=='everyweeks'}">value="${repeatMeeting.weeks}"</c:if>>
                            <input type="checkbox" name="weeks" title="周一" value="周一" lay-filter="weeks">
                            <input type="checkbox" name="weeks" title="周二" value="周二" lay-filter="weeks">
                            <input type="checkbox" name="weeks" title="周三" value="周三" lay-filter="weeks">
                            <input type="checkbox" name="weeks" title="周四" value="周四" lay-filter="weeks">
                            <input type="checkbox" name="weeks" title="周五" value="周五" lay-filter="weeks">
                            <input type="checkbox" name="weeks" title="周六" value="周六" lay-filter="weeks">
                            <input type="checkbox" name="weeks" title="周日" value="周日" lay-filter="weeks">
                        </div>
                    </div>
                    <div class="layui-form-item" id="localmeet_everymonths_option" style="display:none">
                        <label class="layui-form-label">重复日期</label>
                        <div class="layui-input-block">
                            <input type="hidden" name="months" id="months"  <c:if test="${repeatMeeting.repeatType=='everymonths'}">value="${repeatMeeting.weeks}"</c:if>>
                            <c:forEach var="i" begin="1" end="31" step="1">
                                <input type="checkbox" name="selectDay" title="${i}号" value="${i}"  lay-filter="selectDay">
                            </c:forEach>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">起始日期</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="createTime" placeholder="yyyy年MM月dd日"
                                       readonly="readonly" name="createTime" value="${repeatMeeting.createTime}" disabled>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">截止日期</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="endTime" required lay-verify="required"
                                       placeholder="yyyy年MM月dd日" name="endTime"
                                       autocomplete="off" value="${repeatMeeting.endTime}">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">描述</label>
                        <div class="layui-input-block">
                            <input id="description" name="description" placeholder="描述"
                                   value="${repeatMeeting.description}"
                                   type="text" class="layui-input" style="width: 550px"/>
                        </div>
                    </div>
                    <input name="roomId" type="hidden" id="roomId" value="${repeatMeeting.roomId}"/>
                    <div class="layui-form-item">
                        <label class="layui-form-label">会议室</label>
                        <div class="layui-input-block">
                            <input type="text" id="meetRoomName" name="meetRoomName"
                                   value="${repeatMeeting.meetRoomName}"
                                   lay-verify="title"
                                   autocomplete="off" class="layui-input" style="float: left;width: 550px"
                                   placeholder="会议室">
                            <button style="float: left;width: 100px" type="button" class="layui-btn" id="selectRoom">
                                选择会议室
                            </button>
                        </div>
                        <div class="layui-form-item" style="padding-top: 15px">
                            <label class="layui-form-label">类型</label>
                            <div class="layui-input-block">
                                <input id="type" name="type" placeholder="类型" value="${repeatMeeting.type}"
                                       type="text"
                                       class="layui-input" style="width: 550px"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">参会人员</label>
                            <div class="layui-inline">
                                <input id="userId" name="userId" placeholder="参会人员" value="${repeatMeeting.userId}"
                                       type="hidden"
                                       class="layui-input"/>
                            </div>
                            <div class="layui-inline" style="width: 535px">
                                <select name="internal" id="internal" xm-select="internal" lay-filter="internal">
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block" style="padding-top: 10px">
                               <%-- <button class="layui-btn" lay-submit="" lay-filter="demo">提交</button>--%>
                                <button type="reset" class="layui-btn layui-btn-primary" id="back">取消</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/js/layui/formSelects/' //此处路径请自行处理, 可以使用绝对路径
    }).extend({
        formSelects: 'formSelects-v4'
    });
    layui.use(['form', 'layer', 'laydate', 'jquery', 'formSelects'], function () {
        var layer = layui.layer
            , form = layui.form
            , laydate = layui.laydate
            , formSelects = layui.formSelects
        ;
        var day = $("input[name='day']:checked").val();
        days(day);
        form.on('radio(day)', function (data) {
           days(data.value);
        });

        var week = $("#week").val();
        var months = $("#months").val();
        $("input[name='weeks'][value='周一']").checked;
       if (week!=""){
           var splice=[];
           splice= week.split(",");
           splice.forEach(function (i,e) {
               // console.log(e);
               // console.log(i);
               //$("input[name='weeks'][value='"+i+"']").prop("checked",true);
               $("input[value='周一']").checked;
               /*$("input[name='weeks']:not(:checked)").each(function() {
                   if ($(this).val()==value){
                       console.log($(this).val());
                      $(this).checked;
                   }
                   //console.log($(this).val());
               });*/
              // $("input[name='weeks'][value='"+value+"']").attr("checked",true);
               //$("input[name='weeks'][value='"+value+"']").checked;
           });
           /*form.on('checkbox(weeks)',function (data) {
               // var week=[];
               // var month=[];

               $("input[name='weeks']:checked").each(function(){
                   week.push(this.value);
               });
               $("#week").val(week)
           });*/
       }
        if (months!="") {
            form.on('checkbox(selectDay)',function (data) {
                var week=[];
                var month=[];
                $("input[name='selectDay']:checked").each(function(){
                    month.push(this.value);
                });
                $("#months").val(month)
            });
        }



        formSelects.config('internal', {
            type: 'post',
            searchUrl: "${pageContext.request.contextPath}/user/selectInternal",
            keyName: 'name',            //自定义返回数据中name的key, 默认 name
            keyVal: 'id',               //自定义返回数据中value的key, 默认 value
            success: function () {
                var array = new Array($("#userId").val().split(','));
                var userId = array.join(',').split(',');
                formSelects.value('internal', userId);
            }
        }, true);

        /*  formSelects.on('internal', function (id, vals, val, varStr, isAdd, isDisabled) {
              //id:           点击select的id
              //vals:         当前select已选中的值   JSON.stringify(vals)
              //val:          当前select点击的值    JSON.stringify(val.id)
              //isAdd:        当前操作选中or取消
              //isDisabled:   当前选项是否是disabled
              //console.log(JSON.stringify(vals));
              // console.log(JSON.stringify(varStr));
          }, true);*/

        form.on('submit(demo)', function (data) {
            //表单直接提交
            var value = formSelects.value('internal', 'vals');
            var internal = [];
            for (var i in value) {
                var uid = value[i].id;
                internal.push(uid);
            }
            var id = data.field.id;
            var meetName = data.field.meetName;
            var date = data.field.date;
            var time = data.field.time;
            var meetTime = data.field.meetTime;
            var meetLaber = data.field.meetLaber;
            var meetDescription = data.field.meetDescription;
            var meetRoomId = data.field.meetRoomId;
            var meetRoomName = data.field.meetRoomName;
            var meetType = data.field.meetType;
            var userId = JSON.stringify(internal);
            data = {
                "id": id,
                "meetName": meetName,
                "date": date,
                "time": time,
                "meetTime": meetTime,
                "meetLaber": meetLaber,
                "meetDescription": meetDescription,
                "meetRoomId": meetRoomId,
                "meetRoomName": meetRoomName,
                "meetType": meetType,
                "userId": userId
            };
            console.log(data);
           // update(data);
            return false;
        });

        laydate.render({
            elem: '#time'
            , type: 'time'
            , format: 'HH:mm'
        });
        laydate.render({
            elem: '#meetTime'
            , type: 'time'
            , format: 'HH:mm'
        });
        //常规用法
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#createTime',
            format: 'yyyy-MM-dd HH:mm',
            // value: new Date(),
            done: function (value, date) {
                //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
            }
        });
        laydate.render({
            elem: '#endTime',
            format: 'yyyy-MM-dd',
            //value: new Date(),
            done: function (value, date) {
                //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
            }
        });
    });
    $("#back").click(function () {
        location.href = "${pageContext.request.contextPath}/page/meeting/repeatMeeting.jsp"
    });
    $("#selectRoom").click(function () {
        layer.open({
            type: 2
            , area: ['500px', '400px']
            , title: '选择会议室'
            , content: "${pageContext.request.contextPath}/page/meeting/selectRoom.jsp"
        });
    });
    $("#selectUser").click(function () {
        layer.open({
            type: 2
            , area: ['700px', '500px']
            , title: '参会人员'
            , content: "${pageContext.request.contextPath}/page/meeting/selectRoom.jsp"
        });
    });

    function update(data) {
        $.ajax({
            type: 'post',
            url: "${pageContext.request.contextPath}/meetroom/update",
            data: data,
            success: function (res) {
                // window.parent.layer.closeAll();
                layer.msg("修改成功");
                setTimeout(function () {
                    location.href = "${pageContext.request.contextPath}/page/meeting/meettable.jsp"
                }, 2000);
            }
        })
    }

    function days(data) {
        if (data == "everyweeks") {
            $("#localmeet_everyweeks_option").show();
            $("#localmeet_everymonths_option").hide();
        } else if (data== "everymonths") {
            $("#localmeet_everyweeks_option").hide();
            $("#localmeet_everymonths_option").show();
        } else {
            $("#localmeet_everyweeks_option").hide();
            $("#localmeet_everymonths_option").hide();
        }
    }
</script>
