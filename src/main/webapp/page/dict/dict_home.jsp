<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../page/common.jsp" %>
<body>
<%@ include file="../../page/top.jsp" %>

<div class="layui-row">
    <%@ include file="../../page/nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around" style="height: 35px">
                    <div class="layui-form-item" >
                        <div class="layui-inline">
                            <h2>参数字典</h2>
                        </div>
                        <div class="layui-inline" style="float: right">
                            <div class="layui-input-inline">
                                <input class="layui-input" name="name" id="name" autocomplete="off"
                                       placeholder="字典名称">
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit="" data-type="getInfo" id="search">搜索</button>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit="" data-type="getInfo" id="add">添加</button>
                            </div>
                        </div>
                    </div>
                       <%-- <div class="layui-form-item" style="margin: 0px">
                            <div class="layui-inline">
                                <h2>参数字典</h2>
                            </div>
                            <div class="layui-inline" style="float: right">
                                <div class="layui-input-inline">
                                    <input class="layui-input" name="name" id="name" autocomplete="off"
                                           placeholder="字典名称">
                                </div>
                                <div class="layui-inline">
                                    <button class="layui-btn" lay-submit="" data-type="getInfo" id="search">搜索</button>
                                </div>
                            </div>
                        </div>--%>
                </div>
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
            , table = layui.table //表格
        ;
        table.render({
            elem: '#demo'
            , height: 420
            , url: '${pageContext.request.contextPath }/dict/findPage' //数据接口
            , page: true //开启分页
            ,method:'post'
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'dictId', title: 'ID', width: 100, fixed: 'left'}
                , {field: 'name', title: '名称', width: 150}
                , {field: 'code', title: '字典编码', width: 150}
                , {field: 'description', title: '详情', width: 150}
                , {field: 'pid', title: '备注', width: 150}
                , {fixed: 'right',title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]  , id:'table'
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            // console.log(data.roomId)   //获取roomid
            if(obj.event === 'delete'){
                layer.confirm('真的删除行么', function(index){
                    $.post("${pageContext.request.contextPath}/dict/delete",{dictId:data.dictId},function (response) {
                        layer.msg("删除成功");
                        setTimeout(function () {
                            location.reload();
                        }, 2000);
                    });
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type:2
                    ,area: ['500px', '365px']
                    ,title: '修改'
                    ,content:"${pageContext.request.contextPath}/dict/findOne?dictId="+data.dictId
                     ,end:function () {
                        active.reload();
                   }
                });
            }else if(obj.event === 'detail'){
                layer.open({
                    type:2
                    ,area: ['500px', '365px']
                    ,title: '查看'
                    ,content:"${pageContext.request.contextPath}/dict/findOne?dictId="+data.dictId
                });
            }
        });

        $("#add").click(function () {
            layer.open({
                type:2
                ,area: ['500px', '365px']
                ,title: '添加'
                ,content:"${pageContext.request.contextPath}/page/dict/dict_add.jsp"
                 ,end:function () {
                    active.reload();
                  }
            });
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

        var Dict = {
            tableId: "table",
            condition: {
                name: ""
            }
        };

        Dict.search = function(){
            var queryData = {};
            queryData['name'] = $("#name").val();
            table.reload(Dict.tableId,{where:queryData});
        };

        // 搜索按钮点击事件
        $('#search').click(function () {
            Dict.search();
        });
    });
</script>
</body>
</html>