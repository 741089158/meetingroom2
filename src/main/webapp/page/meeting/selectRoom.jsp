<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../page/common.jsp" %>
<form class="layui-form" action="" >
    <div class="layui-form-item block-margin-both-15">
        <div class="layui-inline" style="padding-top: 20px">
            <label class="layui-form-label">地区</label>
            <div class="layui-input-inline">
                <select id="roomArea" name="roomArea" lay-verify="required"  lay-filter="roomArea">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-inline" style="padding-top: 20px">
            <label class="layui-form-label">区域</label>
            <div class="layui-input-inline">
                <select id="meetBuilding" name="meetBuilding" lay-filter="meetBuilding" lay-verify="required">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-inline" style="padding-top: 20px">
            <label class="layui-form-label">楼层</label>
            <div class="layui-input-inline">
                <select id="meetFloor"  name="meetFloor" lay-filter="meetFloor" lay-verify="required">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-inline" style="padding-top: 20px">
            <label class="layui-form-label">会议室</label>
            <div class="layui-input-inline">
                <select id="meetRoom"  name="meetRoom" lay-filter="meetRoom" lay-verify="required">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="layui-input-block" style="padding-top: 20px">
            <button class="layui-btn" lay-submit="" lay-filter="demo" id="demo">确定</button>
            <button type="reset" class="layui-btn layui-btn-primary" onclick="back()">取消</button>
        </div>
    </div>
</form>
<script>
    layui.use([ 'form' ], function() {
        var form = layui.form;
        var data = {};
        form.render();
        $.post("${pageContext.request.contextPath}/meetroom/meetarea", data, function (result) {
            $(result).each(function () {
                $("#roomArea").append("<option value='" + this.areaId + "' >" + this.roomAreaName + "</option>");
                form.render();
            });
        }, "json");

        $("#demo").click(function () {
            var meetRoomId = $("#meetRoom").val();
            console.log(meetRoomId);
            var roomName = $("#meetRoom option:selected").text();
            //alert(roomName)
            window.parent.document.getElementById("meetRoomId").value = meetRoomId;
            window.parent.document.getElementById("meetRoomName").value = roomName;
            window.parent.layer.closeAll();
        });

        form.on('select(roomArea)',function (data) {
            var id={key:data.value};
            $("#meetBuilding").empty();
            $("#meetFloor").empty();
            $("#meetRoom").empty();
            $.post("${pageContext.request.contextPath}/meetroom/meetbuilding", id, function (result) {
                $(result).each(function () {
                    $("#meetBuilding").append("<option value='" + this.roomBuilding + "' >" + this.roomBuilding + "</option>");
                    form.render();
                });
            }, "json");
        });

        form.on('select(meetBuilding)',function (data) {
            var id={"area": $("#roomArea").val(),
                    "building" : data.value
            };
            $("#meetFloor").empty();
            $("#meetRoom").empty();
            $.post("${pageContext.request.contextPath}/meetroom/floor", id, function (result) {
                $(result).each(function () {
                    $("#meetFloor").append("<option value='" + this.roomFloor + "' >" + this.roomFloor + "</option>");
                    form.render();
                });
            }, "json");
        });

        form.on('select(meetFloor)',function (data) {
            var id={"areaId": $("#roomArea").val(),
                "building" : $("#meetBuilding").val(),
                "floor" : data.value
            };
            $("#meetRoom").empty();
            $.post("${pageContext.request.contextPath}/meetroom/findRoom", id, function (result) {
                $(result).each(function () {
                    $("#meetRoom").append("<option value='" + this.roomId + "' >" + this.roomName + "</option>");
                    form.render();
                });
            }, "json");
        })
    });

    function back() {
        window.parent.layer.closeAll();
    }
</script>