<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../common.jsp" %>
<body>
<%@ include file="../top.jsp" %>

<div class="layui-row row_black">
    <%@ include file="../nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <%--<div class="layui-row block-bg-color block-border-top">
            <div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>会议室管理</cite></a>
					</span>
            </div>
            <div class="layui-col-md12 block-padding-around">
                <h2 class="block-bot-left">会议室维护</h2>
                <div class="block-bot-right">
                    <button class="layui-btn layui-btn-sm layui-btn-normal" id="add">
                        <i class="layui-icon layui-icon-add-1"></i> 添加会议室
                    </button>
                </div>
            </div>
        </div>--%>
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around" style="height: 30px">
                    <div class="layui-form-item" >
                        <div class="layui-inline">
                            <h2>会议室详情一览</h2>
                        </div>
                        <div class="layui-inline" style="float: right">
                            <div class="layui-input-inline">
                                <input class="layui-input" name="roomName" id="roomName" autocomplete="off"
                                       placeholder="会议室名称">
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit="" data-type="getInfo" id="search">搜索</button>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit="" data-type="" id="add">添加</button>
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
   <%-- <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
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
        var MeetTable =table.render({
            elem: '#demo'
            , height: h
            , url: '${pageContext.request.contextPath }/meet/findAll' //数据接口
            , page: true //开启分页
            ,cellMinWidth: 60
            ,method:"post"
            //,toolbar: 'default'  //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
           // , totalRow: true //开启合计行
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'roomId', title: 'ID', width: 100, fixed: 'left'}
                , {field: 'roomName', title: '名称', width: 100}
                , {field: 'roomType', title: '类型'}
                , {field: 'personCount', title: '容纳人数'}
                , {field: 'roomAreaName', title: '地址'}
                , {field: 'roomFloor', title: '楼层'}
                , {field: 'manager', title: '管理员'}
                , {field: 'isStart', title: '是否启用'
                    ,templet: function(e){
                        if(e.isStart*1==1){
                            return "启用";
                        }
                        if(e.isStart*1==0){
                            return "禁用";
                        }
                        return e.isStart;
                    }}
                , {field: 'callIp', title: '呼叫地址'}
                , {fixed: 'right', title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
            ]], id:'table'
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //删除
            if (obj.event === 'delete') {
                layer.confirm('确定删除?', function (index) {
                    $.post("${pageContext.request.contextPath}/meet/delete", {roomId: data.roomId}, function (response) {
                        layer.msg("删除成功");
                        setTimeout(function () {
                            active.reload();
                        }, 800);
                    });
                });
                //修改
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 2
                    , area: ['700px', '500px']
                    ,offset: 'auto'//自动居中
                    , title: '修改会议室'
                    , content: "${pageContext.request.contextPath}/meet/findOne?roomId=" + data.roomId
                    ,end:function () {
                      // layer.msg("修改成功");
                         setTimeout(function () {
                             active.reload();
                         }, 100);
                    }
                });
                //查看
            } else if (obj.event === 'detail') {
                layer.open({
                    type: 2
                    , area: ['700px', '500px']
                    , title: '查看会议室'
                    , content: "${pageContext.request.contextPath}/meet/findOne?roomId=" + data.roomId
                });
            }
        });
        //添加
        $("#add").click(function () {
            layer.open({
                type: 2
                , area: ['700px', '500px']
                ,offset: 'auto'//自动居中
                , title: '添加会议室'
                , content: "${pageContext.request.contextPath}/page/meet_management/room_add.jsp"
                ,end:function () {
                    //layer.msg("添加成功");
                    setTimeout(function () {
                        active.reload();
                    }, 100);
                }
            });
        });

        var active ={
            reload:function(){
                var reload = $("#demo");
                var index= layer.msg('查询中...',{icon:16,time:false,shade:0});
                setTimeout(function () {
                    table.reload('table',{//执行重载
                        page:{curr:1},where:{name:reload.val()}});
                    layer.close(index);
                },500);
            }
        };//监听查询btn
        $('.demo .layui-btn').on('click',function () {
            var type=$(this).data('type');
            active[type]?active[type].call(this):'';
        });

        var Meet = {
            tableId: "table",
            condition: {
                roomName: ""
            }
        };
        Meet.search = function(){
            var queryData = {};
            queryData['roomName'] = $("#roomName").val();
            table.reload(Meet.tableId,{where:queryData});
        };

        // 搜索按钮点击事件
        $('#search').click(function () {
            Meet.search();
        });
    });
</script>
</body>
</html>