<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../page/common.jsp" %>
<form id="form"  class="layui-form" style="background-color: white;padding: 10px" >
    <input name="id" type="hidden" id="id" value="${user.id}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">名称<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="name" placeholder="名称" type="text" class="layui-input" lay-verify="required"
                   required id="name" value="${user.name}" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别<span style="color: red;">*</span></label>
        <div class="layui-input-block">
           <%-- <input id="pid" name="pid" type="hidden">--%>
            <input id="sex" name="sex" placeholder="性别" type="text" class="layui-input"
                   lay-verify="required" value="${user.sex}" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input id="tel" name="tel" placeholder="电话" type="text" class="layui-input"
                   lay-verify="required" value="${user.tel}" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门</label>
        <div class="layui-input-block">
            <input name="dept" value="${user.dept}" placeholder="部门" type="text" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input name="email" placeholder="邮箱" value="${user.email}" type="text" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司</label>
        <div class="layui-input-block">
            <input name="company" value="${user.company}" placeholder="公司" type="text" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类</label>
        <div class="layui-input-block">
            <input name="internal" value="${user.internal}" placeholder="分类" type="text" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block" style="text-align: center">
            <button class="layui-btn" lay-submit lay-filter="demo">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary" id="back">取消</button>
        </div>
    </div>
</form>

<script>
    layui.use(['form', 'layer'], function () {
        var layer = layui.layer, form = layui.form,$ = layui.jquery;
        form.on('submit(demo)', function(data){
            var userId = data.field.id;
            if (userId==null||userId==''){
                add(data.field);
            }
            if (userId!=null||userId!=''){
                update(data.field);
            }
            return false;
        });
        //监听提交
    });
    function add(data) {
        $.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/user/add",
            data:data,
            success:function (res) {
                layer.msg("添加成功");
                setTimeout(function () {
                    window.parent.layer.closeAll();
                }, 2000);
            }
        })
    }
    function update(data) {
        $.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/user/update",
            data:data,
            success:function (res) {
                layer.msg("修改成功");
                setTimeout(function () {
                    window.parent.layer.closeAll();
                }, 2000);
            }
        })
    }
</script>