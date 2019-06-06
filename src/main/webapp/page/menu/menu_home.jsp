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
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <h2>菜单管理</h2>
                        </div>
                        <div class="layui-inline" style="float: right">
                            <div class="layui-input-inline">
                                <input class="layui-input" name="menuName" id="menuName" autocomplete="off"
                                       placeholder="名称">
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit="" data-type="getInfo" id="search">搜索</button>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn" lay-submit="" data-type="getInfo" id="add">添加</button>
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
    <%--  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
    <security:authorize access="hasAnyRole('ROLE_SYSTEM')">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
   <%-- <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>--%>
    </security:authorize>
</script>
<script>

    layui.use(['laydate', 'laypage', 'layer', 'table'], function () {
        var laypage = layui.laypage //分页
            , table = layui.table;
        var h = $(window).height() - 155;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: h
            , url: '${pageContext.request.contextPath }/menu/findAll' //数据接口
            , method: 'post'
            , page: true //开启分页
            , cellMinWidth: 60
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 60, fixed: 'left'}
                , {field: 'menuName', title: '菜单名称'}
                , {field: 'code', title: '菜单编号'}
                , {field: 'pid', title: '菜单父编号'}
                , {
                    field: 'isMenu', title: '是否是菜单', templet: function (e) {
                        if (e.isMenu * 1 == 1) {
                            return "是";
                        }
                        if (e.isMenu * 0 == 0) {
                            return "否";
                        }
                        return e.isMenu;
                    }
                }
                , {field: 'orderby', title: '排序'}
                , {field: 'operuser', title: '创建人'}
                , {fixed: 'right', title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
            ]], id: 'table'
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            // console.log(data.roomId) //获取roomid
            if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.post("${pageContext.request.contextPath}/menu/delete", {id: data.id}, function (response) {
                        layer.msg("删除成功");
                        setTimeout(function () {
                            active.reload();
                        }, 800);
                    });

                });
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 2
                    , area: ['600px', '400px']
                    , title: '修改菜单'
                    , content: "${pageContext.request.contextPath}/menu/findOne?id=" + data.id
                    , end: function () {
                        setTimeout(function () {
                            active.reload();
                        }, 100);
                    }
                });
            } else if (obj.event === 'detail') {
                layer.open({
                    type: 2
                    , area: ['600px', '400px']
                    , title: '查看菜单'
                    , content: "${pageContext.request.contextPath}/menu/findOne?id=" + data.id
                });
            }
        });

        $("#add").click(function () {
            layer.open({
                type: 2
                , area: ['600px', '400px']
                , title: '添加菜单'
                , content: "${pageContext.request.contextPath}/page/menu/menu_add.jsp"
                , end: function () {
                    setTimeout(function () {
                        active.reload();
                    }, 100);
                }
            });
        });


        var active = {
            reload: function () {
                var reload = $("#demo");
                var index = layer.msg('查询中...', {icon: 16, time: false, shade: 0});
                setTimeout(function () {
                    table.reload('table', {//执行重载
                        page: {curr: 1}, where: {name: reload.val()}
                    });
                    layer.close(index);
                }, 500);
            }
        };//监听查询btn
        $('.demo .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var Meet = {
            tableId: "table",
            condition: {
                username: ""
            }
        };
        Meet.search = function () {
            var queryData = {};
            queryData['menuName'] = $("#menuName").val();
            table.reload(Meet.tableId, {where: queryData});
        };

        // 搜索按钮点击事件
        $('#search').click(function () {
            Meet.search();
        });

    });
</script>
</body>
</html>