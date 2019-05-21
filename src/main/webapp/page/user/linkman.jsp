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
                <div class="layui-col-md12 block-padding-around" style="height: 35px">
                    <div class="layui-form-item" >
                        <div class="layui-inline">
                            <h2>查看联系人</h2>
                        </div>
                        <div class="layui-inline" style="float: right">
                            <div class="layui-input-inline">
                                <input class="layui-input" name="name" id="name" autocomplete="off"
                                       placeholder="名称">
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
        var h = $(window).height()-155;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: h
            , url: '${pageContext.request.contextPath }/user/findInternal' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 50, fixed: 'left'}
                , {field: 'name', title: '名称', width: 60}
                , {field: 'sex', title: '性别', width: 50}
                , {field: 'tel', title: '电话', width: 100}
                , {field: 'dept', title: '部门', width: 100}
                , {field: 'email', title: '邮箱', width: 100}
                , {field: 'company', title: '公司', width: 100}
                , {field: 'internal', title: '分类', width: 100}
                , {fixed: 'right',title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]  ,id:'table'
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'delete'){
                layer.confirm('确定删除?', function (index) {
                    $.post("${pageContext.request.contextPath}/user/delete",{id:data.id},function (response) {
                        layer.msg("删除成功");
                        setTimeout(function () {
                            active.reload();
                        }, 800);
                    });

                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type:2
                    ,area: ['700px', '480px']
                    ,title: '修改联系人'
                    ,content:"${pageContext.request.contextPath}/user/findOne?id="+data.id
                    ,end:function () {
                        active.reload();
                    }
                });
            }else if(obj.event === 'detail'){
                layer.open({
                    type:2
                    ,area: ['700px', '480px']
                    ,title: '查看联系人'
                    ,content:"${pageContext.request.contextPath}/user/findOne?id="+data.id
                });
            }
        });

        $("#add").click(function () {
            layer.open({
                type:2
                ,area: ['700px', '480px']
                ,title: '添加联系人'
                ,content:"${pageContext.request.contextPath}/page/user/linkman_add.jsp"
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


        var Meet = {
            tableId: "table",
            condition: {
                name: ""
            }
        };
        Meet.search = function(){
            var queryData = {};
            queryData['name'] = $("#name").val();
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