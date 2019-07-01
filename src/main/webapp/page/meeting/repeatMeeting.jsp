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
                    <div class="layui-form-item" style="margin: 0px">
                        <div class="layui-inline">
                            <h2>循环会议详情一览</h2>
                        </div>
                        <div class="layui-inline" style="float: right">
                            <div class="layui-input-inline">
                                <input class="layui-input" name="meetName" id="meetName" autocomplete="off"
                                       placeholder="会议名称">
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit="" data-type="getInfo" id="search">搜索</button>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit="" data-type="getInfo" id="localMeeting">本地会议</button>
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
   <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" id="detail">查看</a>
   <%-- <a class="layui-btn layui-btn-xs" lay-event="edit" id="edit">编辑</a>
   <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>--%>
</script>
<script>

    layui.use(['laydate', 'laypage', 'layer', 'table'],function () {
        var  laypage = layui.laypage //分页
            , table = layui.table //表格
        ;
        var h = $(window).height()-155;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: h
            , url: '${pageContext.request.contextPath }/appointreet/findRepeatMeeting' //数据接口
            , page: true //开启分页
            ,cellMinWidth: 60
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 40, fixed: 'left'}
                , {field: 'meetName', title: '会议名称'}
                , {field: 'createTime', title: '开始时间'}
                , {field: 'endTime', title: '结束时间'}
                , {field: 'roomId', title: '会议室Id'}
                , {field: 'meetRoomName', title: '会议室'}
                , {field: 'meetTime', title: '时长'}
                , {field: 'description', title: '描述'}
                , {field: 'repeatType', title: '重复类型'}
                , {fixed: 'right',title: '操作', width: 155, align: 'center', toolbar: '#barDemo'}
            ]] ,id:'table'
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'delete'){
                layer.confirm('确定取消?', function(index){
                    /*$.post("/meet/delete",{roomId:data.roomId},function (response) {
                        layer.msg("删除成功");
                        setTimeout(function () {
                            active.reload();
                        }, 800);
                    });*/
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                location.href="${pageContext.request.contextPath}/meetroom/findRepeatMeeting?id="+data.id
            }else if(obj.event === 'detail'){
                location.href="${pageContext.request.contextPath}/meetroom/findRepeatMeeting?id="+data.id
            }
        });

        var active ={
            reload:function(){
                var reload = $("#demo");
                //var index= layer.msg('查询中...',{icon:16,time:false,shade:0});
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
                meetName: ""
            }
        };
        Meet.search = function(){
            var queryData = {};
            queryData['meetName'] = $("#meetName").val();
            table.reload(Meet.tableId,{where:queryData});
        };

        // 搜索按钮点击事件
        $('#search').click(function () {
            Meet.search();
        });

        $('#localMeeting').click(function () {
            location.href="${pageContext.request.contextPath}/page/meeting/meettable.jsp";
        });

    });
</script>
</body>
</html>