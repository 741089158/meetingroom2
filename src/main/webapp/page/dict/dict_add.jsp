<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../page/common.jsp" %>
<form id="dictForm"  class="layui-form" style="background-color: white;padding: 10px">
    <input name="dictId" type="hidden" id="dictId" value="${dict.dictId}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">字典名称<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="name" placeholder="字典名称" type="text" class="layui-input" lay-verify="required"
                   required id="name" value="${dict.name}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">字典编码<span style="color: red;">*</span></label>
        <div class="layui-input-block">
           <%-- <input id="pid" name="pid" type="hidden">--%>
            <input id="code" name="code" placeholder="字典编码" type="text" class="layui-input"
                   lay-verify="required" value="${dict.code}" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input id="description" name="description" placeholder="描述" type="text" class="layui-input"
                   lay-verify="required" value="${dict.description}" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">排序</label>
        <div class="layui-input-block">
            <input id="orderby" name="orderby" value="${dict.orderby}" placeholder="排序" type="text"
                   class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input id="pid" name="pid" placeholder="备注" value="${dict.pid}" type="text" class="layui-input"/>
        </div>
    </div>

    <div class="layui-input-block" style="text-align: center">
        <button class="layui-btn" lay-submit="" lay-filter="demo">提交</button>
        <button type="reset" class="layui-btn layui-btn-primary" id="back">取消</button>
    </div>

</form>

<script>
    layui.use(['form', 'layer'], function () {
        var layer = layui.layer, form = layui.form,$ = layui.jquery;
        form.on('submit(demo)', function(data){
            var dictId = data.field.dictId;
            if (dictId==''){
                add(data.field);
            }
            if (dictId!=''){
                update(data.field);
            }
            return false;
        });
        //监听提交
    });
    function add(data) {
        $.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/dict/add",
            data:data,
            success:function (res) {
               /* layer.msg("添加成功");
                setTimeout(function () {
                    window.parent.layer.closeAll();
                }, 2000);*/
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
            type:'post',
            url:"${pageContext.request.contextPath}/dict/update",
            data:data,
            success:function (res) {
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