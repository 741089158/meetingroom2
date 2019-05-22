<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../page/common.jsp" %>
<body>
<%@ include file="../../page/top.jsp" %>

<div class="layui-row row_black">
    <%@ include file="../../page/nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around" style="height: 30px">
                    <div class="layui-form-item" >
                        <div class="layui-inline">
                            <h2>查看邮件</h2>
                        </div>
                        <div class="layui-inline" style="float: right">
                            <div class="layui-input-inline">
                                <input class="layui-input" name="receivemailaccount" id="receivemailaccount"
                                       autocomplete="off"
                                >
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit="" data-type="getInfo" id="search">搜索</button>
                            </div>
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
<script type="text/html" id="barDemo">
    <%--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
    <%--<a class="layui-btn layui-btn-xs" lay-event="edit">未发送</a>--%>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">已发送</a>
</script>
<script>

    layui.use(['laydate', 'laypage', 'layer', 'table'], function () {
        var laypage = layui.laypage //分页
            // ,laydate = layui.laydate//日期
            // , layer = layui.layer //弹层
            , table = layui.table //表格
        ;
        var h = $(window).height()-155;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: h
            , url: '${pageContext.request.contextPath }/mail/findPage' //数据接口
            , page: true //开启分页
            //,toolbar: 'default'  //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            , totalRow: true //开启合计行
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 50, fixed: 'left'}
                , {field: 'receivemailaccount', title: '收件人邮箱', width: 150}
                , {field: 'mailtitle', title: '邮件标题', width: 150}
                , {field: 'mailsubject', title: '邮件主题', width: 150}
                , {field: 'mailcontent', title: '邮件内容', width: 120}
                , {field: 'createdate', title: '创建时间', width: 130}
                , {fixed: 'right', title: '状态', width: 130, align: 'center', toolbar: '#barDemo'}
            ]]
            , id: 'reload'
            /*, done: function (res, curr, count) {
                $("[data-field='isStart']").children().each(function () {
                    if ($(this).text() == '1') {
                        $(this).text("启用")
                    } else if ($(this).text() == '0') {
                        $(this).text("禁用")
                    }
                });
            }*/
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            // console.log(data.roomId)   //获取roomid
            if (obj.event === 'delete') {
               /* layer.confirm('真的删除行么', function (index) {
                    $.post("/meet/delete", {roomId: data.roomId}, function (response) {
                        /!* var message = response.message;
                         layer.open({
                             type:2
                             ,area: '300px;'
                             ,value:message
                         });*!/
                        location.reload();
                    });

                });*/
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 2
                    , area: ['700px', '500px']
                    , title: '修改用户'
                    , content: "${pageContext.request.contextPath}/meet/findOne?roomId=" + data.roomId
                });
            } else if (obj.event === 'detail') {
                layer.open({
                    type: 2
                    , area: ['700px', '500px']
                    , title: '查看用户'
                    , content: "${pageContext.request.contextPath}/meet/findOne?roomId=" + data.roomId
                });
            }
        });
    });
</script>
</body>
</html>