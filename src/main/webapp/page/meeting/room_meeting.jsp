<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../page/common.jsp" %>
<body class="layui-form" style="background-color: white;padding: 10px">
<div class="layui-col-md12 block-padding-around">
    <table id="demo" lay-filter="test"></table>
</div>
</body>
<script>
    layui.use('table', function () {
        var table = layui.table;
        var id = location.search.split("=")[1]; //获取url中"?"符后的字串-->上个页面传参
        //第一个实例
        table.render({
            elem: '#demo',
            //height: 300,//'auto'
            url: '${pageContext.request.contextPath}/appointreet/findMeetingByRoomId?roomId='+id //数据接口
            , page: true //开启分页
            /*,cellMinWidth: 60*/
            ,cols: [[ //表头
               /* {field: 'id', title: 'ID', width: 60, fixed: 'left'}*/
                 {field: 'meetName', title: '本会议室相关会议'}
                , {field: 'meetDate', title: '会议时间'}
                ,{field: 'meetDescription', title: '会议描述'}
            ]]
        });
    })
</script>