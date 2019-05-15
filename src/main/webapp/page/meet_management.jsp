<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp" %>
<body>
<%@ include file="../page/top.jsp" %>
<%--<div class="layui-body-header">
    <span class="layui-body-header-title">菜单管理</span>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-sm12 layui-col-md12 layui-col-lg12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <table id="demo" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>--%>
<div class="layui-row">
    <%@ include file="../page/nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <div class="layui-row block-bg-color block-border-top">
            <div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>会议室管理</cite></a>
					</span>
            </div>
            <div class="layui-col-md12 block-padding-around">
                <h2 class="block-bot-left">会议室维护</h2>
                <div class="block-bot-right">
                    <button class="layui-btn layui-btn-sm layui-btn-normal">
                        <i class="layui-icon layui-icon-add-1"></i> 添加会议室
                    </button>
                </div>
            </div>
        </div>
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around">
                    <div style="float: left">
                        <h3>会议室详情一览</h3>
                    </div>
                   <div style="float: right" class="layui-inline">
                      <%-- <input type="text" class="layui-input" style="float: right" value="搜索">--%>
                       <%--<button id="btnSearch" class="layui-btn icon-btn"><i class="layui-icon">&#xe615;</i>搜索</button>--%>
                   </div>
                </div>
                <hr/>
                <div class="layui-col-md12 block-padding-around">
                    <table id="demo" lay-filter="test"></table>

                </div>
            </div>
        </div>
       <%-- <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-sm12 layui-col-md12 layui-col-lg12">
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <table id="demo" lay-filter="test"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script>

    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'],function () {
        var  laypage = layui.laypage //分页
            // ,laydate = layui.laydate//日期
            // , layer = layui.layer //弹层
            , table = layui.table //表格
            // , carousel = layui.carousel //轮播
            // , upload = layui.upload //上传
            // , element = layui.element //元素操作
            // , slider = layui.slider //滑块
            ;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: 330
            , url: '${pageContext.request.contextPath }/meet/findAll' //数据接口

            , page: true //开启分页
            //,toolbar: 'default'  //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,totalRow: true //开启合计行
            , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                , {field: 'roomId', title: 'ID', width: 100, fixed: 'left'}
                , {field: 'roomName', title: '名称', width: 100}
                , {field: 'roomType', title: '类型', width: 100}
                , {field: 'personCount', title: '容纳人数', width: 80}
                , {field: 'roomAreaName', title: '地址', width: 80}
                , {field: 'callIp', title: '呼叫地址', width: 120}
                , {field: 'manager', title: '管理员', width: 80}
                , {field: 'isStart', title: '是否启用', width: 80}
                , {fixed: 'right',title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]
            , done: function (res, curr, count) {
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
               /* //分页
                laypage.render({
                    elem: 'laypage' //分页容器的id
                    ,count: count //总页数
                    ,skin: '#1E9FFF' //自定义选中色值
                    //,skip: true //开启跳页
                    ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                    ,jump: function(obj, first){
                        if(!first){
                            layer.msg('第'+ obj.curr +'页', {offset: 'b'});
                        }
                    }
                });*/


                $("[data-field='isStart']").children().each(function () {
                    if ($(this).text() == '1') {
                        $(this).text("启用")
                    } else if ($(this).text() == '0') {
                        $(this).text("禁用")
                    }
                });
            }
        });


    });
</script>
</body>
</html>