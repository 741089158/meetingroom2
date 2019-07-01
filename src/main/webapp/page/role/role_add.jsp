<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../page/common.jsp" %>
<body class="layui-form" style="background-color: white;padding: 10px">
<form id="roleForm" lay-filter="menuForm" class="layui-form model-form">
    <input name="id" id="id" value="${role.id}" type="hidden"/>
    <div class="layui-form-item">
        <label class="layui-form-label">角色名称<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="roleName" value="${role.roleName}" placeholder="角色名称" type="text" class="layui-input"
                   lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="roleDesc" placeholder="描述" value="${role.roleDesc}" type="text" class="layui-input"
                   lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">排序<span style="color: red;">*</span></label>
        <div class="layui-input-block">

            <input id="priority" name="priority" value="${role.priority}" placeholder="排序" type="text" class="layui-input"
                   lay-verify="required" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">状态<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="status" placeholder="填写状态 必须是 1" value="${role.status}" type="text" class="layui-input"
                   lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上级id<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input id="pid" name="pid" type="hidden">
            <input name="pid" placeholder="请输入上级id" value="${role.pid}" type="text" class="layui-input"
                   lay-verify="required" required/>
        </div>
    </div>

    <div class="layui-input-block" style="text-align: center">
        <button class="layui-btn" lay-submit="" lay-filter="demo">提交</button>
        <button type="reset" class="layui-btn layui-btn-primary" id="back">取消</button>
    </div>
</form>
</body>
<script>
    layui.use(['form', 'layer'], function () {
        var layer = layui.layer, form = layui.form, $ = layui.jquery;
        form.on('submit(demo)', function (data) {
            var id = data.field.id;

            if (id == '') {
                add(data.field);
            }
            if (id != '') {
                update(data.field);
            }
            return false;
        });
        //监听提交
    });

    function add(data) {
        $.ajax({
            type: 'post',
            url: "${pageContext.request.contextPath}/role/add",
            data: data,
            success: function (res) {
                if (res.code==404){
                    layer.msg(res.message);
                }
                if (res.code ==200){
                    layer.msg(res.message);
                    setTimeout(function () {
                        window.parent.layer.closeAll();
                    },2000);
                }
            }
        })
    }

    function update(data) {
        $.ajax({
            type: 'post',
            url: "${pageContext.request.contextPath}/role/update",
            data: data,
            success: function (res) {
                if (res.code==404){
                    layer.msg(res.message);
                }
                if (res.code ==200){
                    layer.msg(res.message);
                    setTimeout(function () {
                        window.parent.layer.closeAll();
                    },2000);
                }
            }
        })
    }
</script>