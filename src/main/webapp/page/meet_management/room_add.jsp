<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../page/common.jsp" %>
<form id="roomForm" lay-filter="roomForm" class="layui-form" style="background-color: white;padding: 10px"  method="post">
    <input name="roomId" type="hidden" id="roomId" value="${meetRoom.roomId}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">名称<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input name="roomName" placeholder="会议室名称" type="text" class="layui-input" lay-verify="required"
                   required id="roomName" value="${meetRoom.roomName}" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类型<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input id="pid" name="pid" type="hidden">
            <input id="roomType" name="roomType" placeholder="会议室类型" type="text" class="layui-input"
                   lay-verify="required" value="${meetRoom.roomType}" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">区域<span style="color: red;">*</span></label>
        <div class="layui-input-block">
            <input id="roomArea" name="roomArea" placeholder="会议室区域" type="text" class="layui-input"
                   lay-verify="required" value="${meetRoom.roomArea}" required autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <input name="roomAreaName" value="${meetRoom.roomAreaName}" placeholder="会议室地址" type="text" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">楼层</label>
        <div class="layui-input-block">
            <input name="roomFloor" placeholder="会议室楼层" value="${meetRoom.roomFloor}" type="text" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">容纳人数</label>
        <div class="layui-input-block">
            <input name="personCount" value="${meetRoom.personCount}" placeholder="容纳人数" type="text" class="layui-input"/>
        </div>
    </div>

    <div class="layui-form-item">
       <div class="layui-inline">
           <label class="layui-form-label">公司</label>
           <div class="layui-input-inline">
               <select name="meetingSubdept">
                   <option value="武汉分部" <c:if test="${meetRoom.isStart=='武汉分部'}">selected='selected'</c:if>>武汉分部</option>
                   <option value="上海分部" <c:if test="${meetRoom.isStart=='上海分部'}">selected='selected'</c:if>>上海分部</option>
               </select>
           </div>
       </div>
        <div class="layui-inline">
            <label class="layui-form-label">是否启用</label>
            <div class="layui-input-inline">
                <select  name="isStart" >
                    <option value="1" <c:if test="${meetRoom.isStart=='1'}">selected='selected'</c:if>>启用</option>
                    <option value="0" <c:if test="${meetRoom.isStart=='0'}">selected='selected'</c:if>>禁用</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">管理人</label>
        <div class="layui-input-block">
            <input name="manager" placeholder="管理人" value="${meetRoom.manager}" type="text" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">呼叫地址</label>
        <div class="layui-input-block">
            <input name="callIp" placeholder="呼叫地址" value="${meetRoom.callIp}" type="text" class="layui-input"/>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block" style="text-align: center">
            <button class="layui-btn" lay-submit lay-filter="demo1">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script>
    layui.use([ 'form' ], function() {
        var form = layui.form ;
        //监听提交
        form.on('submit(demo1)', function(data){
            var roomId=data.field.roomId;
            //alert(JSON.stringify(data.field));
            if (roomId!=null ||roomId !=""){
                $("#roomForm").attr("action","${pageContext.request.contextPath }/meet/update");
            }
            if (roomId==null||roomId ==""){
                $("#roomForm").attr("action","${pageContext.request.contextPath }/meet/add");
            }
            return true;
        }
        );
    });
</script>