<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../page/common.jsp" %>
<body>
<%@ include file="../../page/top.jsp" %>

<div class="layui-row">
    <%@ include file="../../page/nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <div class="layui-row block-bg-color block-border-top">
            <div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>我的会议</cite></a>
					</span>
            </div>
            <div class="layui-col-md12 block-padding-around">
                <h2 class="block-bot-left">我的预订</h2>

            </div>
        </div>
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around">
                       <div class="layui-form-item" style="margin: 0px">
                           <div class="layui-inline">
                               <h2>预定详情一览</h2>
                           </div>
                          <%-- <div class="layui-inline" style="float: right">
                               <div class="layui-input-inline">
                                   <input class="layui-input" name="name" id="name" autocomplete="off"
                                          placeholder="名称">
                               </div>
                               <div class="layui-inline">
                                   <button class="layui-btn" lay-submit="" data-type="getInfo" id="search">搜索</button>
                               </div>
                           </div>--%>
                       </div>
                </div>
                <hr/>
                <div class="layui-col-md12 block-padding-around">
                    <table id="demo" lay-filter="test"></table>
                </div>
            </div>
        </div>

    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script>

    layui.use(['laydate', 'laypage', 'layer', 'table'],function () {
        var  laypage = layui.laypage //分页
            // ,laydate = layui.laydate//日期
            // , layer = layui.layer //弹层
            , table = layui.table //表格
        ;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: 330
            , url: '${pageContext.request.contextPath }/meetroom/myappointmeet' //数据接口
            , page: true //开启分页
            //,toolbar: 'default'  //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,totalRow: true //开启合计行
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 50, fixed: 'left'}
                , {field: 'meetName', title: '会议名称', width: 130}
                , {field: 'meetRoomName', title: '会议室', width: 80}
                , {field: 'meetDate', title: '开始时间', width: 150}
                , {field: 'meetTime', title: '时长', width: 80}
                , {field: 'meetType', title: '会议类型', width: 100}
                , {field: 'time', title: '距离开会时间', width: 150,
                    templet:function (e) {
                       //alert( e.meetDate);
                        //return e.meetDate;
                    }}
                , {fixed: 'right',title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            // console.log(data.roomId)   //获取roomid
            if(obj.event === 'delete'){
                layer.confirm('真的删除行么', function(index){
                    $.post("${pageContext.request.contextPath}/meet/delete",{roomId:data.roomId},function (response) {
                        /* var message = response.message;
                         layer.open({
                             type:2
                             ,area: '300px;'
                             ,value:message
                         });*/
                        location.reload();
                    });

                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type:2
                    ,area: ['700px', '500px']
                    ,title: '修改用户'
                    ,content:"${pageContext.request.contextPath}/meet/findOne?roomId="+data.roomId
                });
            }else if(obj.event === 'detail'){
                layer.open({
                    type:2
                    ,area: ['700px', '500px']
                    ,title: '查看用户'
                    ,content:"${pageContext.request.contextPath}/meet/findOne?roomId="+data.roomId
                });
            }
        });

        $("#add").click(function () {
            layer.open({
                type:2
                ,area: ['700px', '500px']
                ,title: '添加用户'
                ,content:"${pageContext.request.contextPath}/page/meet_management/room_add.jsp"
            });
        });



    });
</script>
</body>
</html>