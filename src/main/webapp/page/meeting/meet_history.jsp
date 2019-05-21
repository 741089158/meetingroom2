<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../common.jsp" %>
<body>
<%@ include file="../top.jsp" %>
<div class="layui-row row_black">
    <%@ include file="../nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both" >
                <div class="layui-col-md12 block-padding-around" style="height: 30px">
                    <div class="layui-form-item" >
                        <div class="layui-inline">
                            <h2>历史会议一览</h2>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12 block-padding-around">
                    <table id="demo" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
   table{
        display:table-cell;
        vertical-align: middle;
    }
</style>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
 <%--   <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>--%>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        var h = $(window).height()-155;
        //第一个实例
        table.render({
            elem: '#demo',
            height: h,
            url: '${pageContext.request.contextPath }/appointreet/history' //数据接口
            ,
            page: true //开启分页
            ,
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: 'ID', width: 100, fixed: 'left'}
                , {field: 'meetName', title: '会议名称', width: 150}
                , {field: 'meetType', title: '会议类型', width: 150}
                , {field: 'starttime', title: '开始时间', width: 240}
                , {field: 'duration', title: '时长', width: 100}
                , {fixed: 'right', title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
                ]],id:'table'
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
          if (obj.event === 'detail') {
                layer.open({
                    type: 2
                    , area: ['700px', '500px']
                    , title: '查看参会人员'
                    , content:'${pageContext.request.contextPath}/page/meeting/history_user.jsp?id=' + data.id
                    ,success:function () {
                    }
                });
            }
        });
    });
</script>
</body>
</html>