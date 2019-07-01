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
        var ztree = new $ZTree("zTree", "${pageContext.request.contextPath}/role/roleTreeListByUserId?id="+string);
        ztree.setSettings(setting);
        ztree.init();
        $("#saveButton").bind("click", function () {
            var ids = zTreeCheckedNodes("zTree");
            console.log(ids);
            $.post("${pageContext.request.contextPath}/role/setRole",{"roleId":ids,"userId":string},function (data) {
                if (data.code==200){
                    layer.msg("分配角色成功!");
                    setTimeout(function () {
                        window.parent.layer.closeAll();
                    }, 2000);
                }
            });

        });

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
