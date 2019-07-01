<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../page/common.jsp" %>
<body class="layui-form" style="background-color: white;padding: 10px">
<form id="deptForm" class="layui-form" style="background-color: white;padding: 10px">
    <input name="deptid" type="hidden" id="dictId" value="${dept.deptid}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">部门名称<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="deptname" placeholder="部门名称" type="text" class="layui-input" lay-verify="required"
                   required id="deptname" value="${dept.deptname}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门地址<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <%-- <input id="pid" name="pid" type="hidden">--%>
            <input id="deptaddr" name="deptaddr" placeholder="部门地址" type="text" class="layui-input"
                   lay-verify="required" value="${dept.deptaddr}" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门电话<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input id="depttel" name="depttel" placeholder="部门电话" type="tel" class="layui-input"
                   lay-verify="phone" value="${dept.depttel}" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门邮箱</label>
        <div class="layui-input-block">
            <input id="email" name="email" value="${dept.email}" placeholder="部门邮箱" type="text" lay-verify="email"
                   class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分公司</label>
        <div class="layui-input-block">
            <%--<input id="subid" name="subid" placeholder="公司" value="${dept.subid}" type="text" class="layui-input"/>--%>
            <select name="subId" lay-filter="subId" id="subId" lay-search="" lay-verify="select">
                <%-- <c:forEach items="${list}" var="list">
                     <option id="${list.subOfficeId}" value="${list.subOfficeId}">${list.subOfficeName}</option>
                 </c:forEach>--%>
            </select>
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
        form.render();
        var data = {};

        form.verify({
            phone: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字！'],
            title: function (value) {
                if (value.length < 1) {
                    return '标题至少得1个字符啊';
                }
            }, contact: function (value) {
                if (value.length < 1) {
                    return '内容请输入至少1个字符';
                }
            }, email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
        });

        //查询分部
        $.post("${pageContext.request.contextPath}/dept/findSub", data, function (result) {
            $(result).each(function () {
                $("#subId").append("<option value='" + this.subOfficeId + "' >" + this.subOfficeName + "</option>");
                form.render();
            });
        }, "json");

        form.on('submit(demo)', function (data) {
            //var deptid = $("#deptid").val();
            var deptid = data.field.deptid;
            var deptname = $("#deptname").val();
            var deptaddr = $("#deptaddr").val();
            var depttel = $("#depttel").val();
            var email = $("#email").val();
            var subId = $("#subId option:selected").val();
            data = {
                "deptid": deptid,
                "deptname": deptname,
                "deptaddr": deptaddr,
                "depttel": depttel,
                "email": email,
                "subid": subId
            };
            if (deptid == '') {
                add(data);
            }
            if (deptid != '') {
                update(data);
            }
            return false;
        });
        //监听提交
    });

    function add(data) {
        $.ajax({
            type: 'post',
            url: "${pageContext.request.contextPath}/dept/add",
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
            url: "${pageContext.request.contextPath}/dept/update",
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