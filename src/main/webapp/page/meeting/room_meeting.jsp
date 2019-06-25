<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../page/common.jsp" %>
<body class="layui-form" style="background-color: white;padding: 10px">
<div class="layui-col-md12 block-padding-around">
    <div class="layui-form-item">
        <div class="layui-inline">
            <span>主题:</span>
        </div>
        <div class="layui-inline" style="width: 500px">
            <input type="text" class="layui-input">
        </div>
    </div>
   <%-- <div class="layui-col-md12 block-padding-around">--%>
        <%--<div class="layui-form-item block-margin-both-15">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <blockquote class="layui-elem-quote" style="width: 450px;height: 10px">会议室提供的设备信息</blockquote>
                </div>
            </div>
        </div>--%>
        <div class="layui-col-md12 block-padding-around">
            <div class="layui-form-item">
                <div class="layui-form-item">
                    <div class="layui-inline" style="height: 13px">
                        <blockquote class="layui-elem-quote" style="width: 500px;height: 10px">本会议室相关会议</blockquote>
                    </div>
                </div>
            </div>

            <table id="demo" class="layui-table" lay-even lay-skin="nob" lay-filter="test" style="margin-top: 0px"></table>
        <%--</div>--%>
</body>
<script>

    layui.use('table', function () {
        var table = layui.table;
        var id = location.search.split("=")[1]; //获取url中"?"符后的字串-->上个页面传参
        //第一个实例
        table.render({
            elem: '#demo',
            //height: 300,//'auto'
            url: '${pageContext.request.contextPath}/appointreet/findMeetingByRoomId?roomId=' + id //数据接口
            , page: true //开启分页
            /*,cellMinWidth: 60*/
            , cols: [[ //表头
                /* {field: 'id', title: 'ID', width: 60, fixed: 'left'}*/
                {field: 'meetName', title: '本会议室相关会议',style:'display:none;'}
                , {field: 'meetDate', title: '会议时间'}
                , {field: 'meetDescription', title: '会议描述'}
            ]],done: function (res, curr, count) {
                $('th').hide();//表头隐藏的样式
            }
        });
    })
</script>