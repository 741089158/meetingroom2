<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../page/common.jsp" %>
<form id="userForm" class="layui-form" style="background-color: white;padding: 10px">
    <input name="id" type="hidden" id="dictId" value="${user.id}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="username" placeholder="用户名" type="text" class="layui-input" lay-verify="required"
                   required id="username" value="${user.username}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="password" placeholder="密码" type="text" class="layui-input" lay-verify="required"
                   required id="password" value="${user.password}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="uname" placeholder="姓名" type="text" class="layui-input" lay-verify="required"
                   required id="uname" value="${user.uname}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input id="sex" name="sex" placeholder="性别" type="text" class="layui-input"
                   lay-verify="required" value="${user.sex}" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <select name="deptname" lay-filter="deptname" id="deptname" lay-search="" lay-verify="select">
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input id="email" name="email" value="${user.email}" placeholder="部门邮箱" type="text"
                   class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input id="tel" name="tel" placeholder="电话" value="${user.tel}" type="text" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分公司</label>
        <div class="layui-input-block">
            <select name="subId" lay-filter="subId" id="subId" lay-search="" lay-verify="select">
            </select>
        </div>
    </div>

    <div class="layui-input-block" style="text-align: center">
        <button class="layui-btn" lay-submit="" lay-filter="demo">提交</button>
        <button type="reset" class="layui-btn layui-btn-primary" id="back">取消</button>
    </div>

</form>

<script>
    layui.use(['form', 'layer'], function () {
        var layer = layui.layer, form = layui.form, $ = layui.jquery;
        form.render();
        var data = {};
        //查询部门
        $.post("${pageContext.request.contextPath}/user/findDept", data, function (result) {
            $(result).each(function () {
                $("#deptname").append("<option value='" + this.deptid + "' >" + this.deptname + "</option>");
                form.render();
            });
        }, "json");
        //查询分部
        $.post("${pageContext.request.contextPath}/dept/findSub", data, function (result) {
            $(result).each(function () {
                $("#subId").append("<option value='" + this.subOfficeId + "' >" + this.subOfficeName + "</option>");
                form.render();
            });
        }, "json");

        form.on('submit(demo)', function (data) {
            var id = data.field.id;
            //var s = JSON.stringify(data.field);
            var username = $("#username").val();
            var password = $("#password").val();
            var uname = $("#uname").val();
            var sex = $("#sex").val();
            var deptid = $("#deptname option:selected").val();
            var email = $("#email").val();
            var tel = $("#tel").val();
            var subOfficeId = $("#subId option:selected").val();
            var subOfficeName = $("#subId option:selected").text();
            data = {
                "id": id,
                "username": username,
                "password": password,
                "uname": uname,
                "sex": sex,
                "deptid": deptid,
                "email": email,
                "tel": tel,
                "subofficeid": subOfficeId,
                "suboffice": subOfficeName
            };
            if (id == '') {
                add(data);
            } else {
                update(data);
            }
            return false;
        });
        //监听提交
    });

    function add(data) {
        $.ajax({
            type: 'post',
            url: "${pageContext.request.contextPath}/user/addUser",
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
            url: "${pageContext.request.contextPath}/user/updateUser",
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