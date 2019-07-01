<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../page/common.jsp" %>
    <body class="layui-form" style="background-color: white;padding: 10px">
<form id="menuForm" lay-filter="menuForm" class="layui-form model-form">
    <input name="id" type="hidden"/>
    <div class="layui-form-item">
        <label class="layui-form-label">名称<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="menuName" value="${menu.menuName}" placeholder="请输入菜单名称" type="text" class="layui-input"
                   lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单编号<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="code" placeholder="请输入菜单编号" value="${menu.code}" readonly type="text" class="layui-input"
                   lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">父级编号<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input id="pid" name="pid" type="hidden">
            <input id="pName" name="pName" placeholder="请输入父级编号" value="${menu.pid}" type="text" class="layui-input"
                   lay-verify="required" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否是菜单<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input type="radio" name="isMenu" value="1" title="是" checked/>
            <input type="radio" name="isMenu" value="0" title="不是"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">排序<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input id="orderby" name="orderby" placeholder="排序" value="${menu.orderby}" type="text" class="layui-input"
                   autocomplete="off"/>
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
            var roomId = data.field.roomId;
            if (roomId == '') {
                add(data.field);
            }
            if (roomId != '') {
                update(data.field);
            }
            return false;
        });
        //监听提交
    });

    function add(data) {
        $.ajax({
            type: 'post',
            url: "${pageContext.request.contextPath}/meet/add",
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
            url: "${pageContext.request.contextPath}/meet/update",
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