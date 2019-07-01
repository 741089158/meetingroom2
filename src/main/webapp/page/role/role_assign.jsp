<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../page/common.jsp" %>
<link href="${pageContext.request.contextPath }/js/layui/ztree/zTreeStyle.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath }/js/layui/ztree/jquery.ztree.all.min.js"></script>
<body class="layui-form" style="background-color: white;padding: 10px">
<div id="deptForm" class="layui-fluid">
    <div class="layui-row" style="margin-top:15px;background: #f2f7f8;padding: 20px;">
        <ul id="zTree" class="ztree"></ul>
    </div>
    <div class="layui-row" style="background: #CFD4D5;padding: 10px;">
        <div style="text-align: center;">
            <button class="layui-btn layui-btn-sm" id="saveButton">保存</button>
            <button class="layui-btn layui-btn-sm layui-btn-primary" type="button" id="back" ew-event="closeDialog">取消</button>
        </div>
    </div>
</div>
</body>
<%--<script>

    layui.use(['layer', 'form', 'tree'], function () {
        var layer = layui.layer;
        var form = layui.form;
        var tree = layui.tree;

        var string = location.search;//获取url中? 后面的字符串
        var id = string.split("=")[1];
        // console.log(id);
        var shuju = [
            {
            label: '江西'
            ,id: 1
            ,children: [{
                label: '南昌'
                ,id: 1000
                ,children: [{
                    label: '青山湖区'
                    ,id: 10001
                },{
                    label: '高新区'
                    ,id: 10002
                }]
            },{
                label: '九江'
                ,id: 1001
            },{
                label: '赣州'
                ,id: 1002
            }]
        },{
            label: '广西'
            ,id: 1
            ,children: [{
                label: '南宁'
                ,id: 2000
            },{
                label: '桂林'
                ,id: 2001
            }]
        },{
            label: '陕西'
            ,id: 3
            ,children: [{
                label: '西安'
                ,id: 3000
            },{
                label: '延安'
                ,id: 3001
            }]
        }];

        $.post("${pageContext.request.contextPath}/menu/menuTreeListByRoleId", {"id": id}, function (data) {
           // var s = JSON.stringify(data);
            console.log(data);
            tree.render({
                elem: '#demo' //默认是点击节点可进行收缩
                , data: shuju
            });

        });
    });
</script>--%>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/js/layui/'
    }).extend({
        ztree: 'ztree/ztree-object',
        ax: 'ax/ax'
    });
    layui.use(['ztree', 'layer'], function () {
        var layer = layui.layer;
        var $ZTree = layui.ztree;
        var string = location.search.split("=")[1];

        var setting = {
            check: {
                enable: true,
                chkboxType: {
                    "Y": "ps",
                    "N": "ps"
                }
            },
            data: {
                simpleData: {
                    enable: true
                }
            }
        };
        var ztree = new $ZTree("zTree", "${pageContext.request.contextPath}/menu/menuTreeListByRoleId?id="+string);
        ztree.setSettings(setting);
        ztree.init();

        $("#saveButton").bind("click", function () {
            var ids = zTreeCheckedNodes("zTree");
            console.log(ids);
            $.post("${pageContext.request.contextPath}/menu/setMenu",{"menuId":ids,"roleId":string},function (data) {
                if (data.code==200){
                    layer.msg("分配菜单成功!");
                    setTimeout(function () {
                        window.parent.layer.closeAll();
                    }, 2000);
                }
            });
        });

       /* $("#back").bind("click", function () {
            window.parent.layer.closeAll();
        });*/
    });

     function zTreeCheckedNodes(zTreeId) {
        var zTree = $.fn.zTree.getZTreeObj(zTreeId);
        var nodes = zTree.getCheckedNodes();
        var ids = "";
        for (var i = 0, l = nodes.length; i < l; i++) {
            ids += "," + nodes[i].id;
        }
        return ids.substring(1);
    };
</script>
