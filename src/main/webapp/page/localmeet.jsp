<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp"%>
<body>
	<%@ include file="../page/top.jsp"%>
	<div class="layui-row row_black">
		<%@ include file="../page/nav.jsp"%>
		<div class="layui-col-md10 main-bg-color">
			<div class="layui-row block-bg-color block-border-top">
				<div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>我的会议</cite></a>
					</span>
				</div>
				<div class="layui-col-md12 block-padding-around">
					<h2 class="block-bot-left">预约会议</h2>
				</div>
			</div>
			<div class="layui-fluid">
				<div class="layui-row block-bg-color block-margin-both">
					<div class="layui-col-md12 block-padding-around" id="localmeet_content_container">
						<form class="layui-form" action="">
							<input name="id" value="${meetId}" type="hidden" /> <input name="meetRoomId" value="${meetRoomId}" type="hidden" />
							<div class="layui-form-item">
								<label class="layui-form-label">会议名称</label>
								<div class="layui-input-block">
									<input type="text" name="meetName" required lay-verify="required" placeholder="请输入议题" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">会议室名称</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" disabled="disabled" value="${meetRoom.roomName}" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">会议室类型</label>
								<div class="layui-input-block">
									<input type="text" name="text" class="layui-input" disabled="disabled" value="${meetRoom.roomType}" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">开始时间</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" disabled="disabled" value="${date} ${time}" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">会议时长</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" disabled="disabled" value="${duration}" />
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">参会人</label>
								<div class="layui-input-block">
									<input type="text" name="text" class="layui-input" readonly="readonly" id="peopleInMeeting"/>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">会议标签</label>
								<div class="layui-input-block">
									<select name="meetLaber" lay-verify="required">
										<option value="0">普通会议</option>
										<option value="1">重要会议</option>
										<option value="2">高层会议</option>
									</select>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">重复周期</label>
								<div class="layui-input-block">
									<input type="radio" name="day" value="no" title="无重复" checked="checked" lay-filter="day"/>
									<input type="radio" name="day" value="everydays" title="每日"  lay-filter="day"/>
									<input type="radio" name="day" value="everyweeks" title="每周"  lay-filter="day"/>
									<input type="radio" name="day" value="everymonths" title="每月"  lay-filter="day"/>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">起始日期</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" id="localmeet_start" placeholder="yyyy年MM月dd日" readonly="readonly">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">截止日期</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" id="localmeet_end" placeholder="yyyy年MM月dd日" readonly="readonly">
								</div>
							</div>
							<div class="layui-form-item" id="localmeet_everyweeks_option" style="display:none">
								<label class="layui-form-label">重复日期</label>
								<div class="layui-input-block">
									<input type="checkbox" name="weeks" title="周一" value="周一"> 
									<input type="checkbox" name="weeks" title="周二" value="周二"> 
									<input type="checkbox" name="weeks" title="周三" value="周三">
									<input type="checkbox" name="weeks" title="周四" value="周四">
									<input type="checkbox" name="weeks" title="周五" value="周五">
									<input type="checkbox" name="weeks" title="周六" value="周六">
									<input type="checkbox" name="weeks" title="周日" value="周日">
								</div>
							</div>
							<div class="layui-form-item" id="localmeet_everymonths_option" style="display:none">
								<label class="layui-form-label">重复日期</label>
								<div class="layui-input-block">
									<c:forEach var="i" begin="1" end="31" step="1">
									<input type="checkbox" name="weeks" title="${i}号" value="${i}">
									</c:forEach>
								</div>
							</div>
							<div class="layui-form-item layui-form-text">
								<label class="layui-form-label">会议描述</label>
								<div class="layui-input-block">
									<textarea name="meetDescription" class="layui-textarea" style="width:100%"></textarea>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit lay-filter="formSubmit">立即提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/tableSelect.js"></script>
	<script>
		//被选中的人
		var cbs = [];
		layui.use([ 'form', 'laydate', 'layer'], function() {
			//处理高度
			$("#localmeet_content_container").css("min-height",$(window).height() - 170);//.height();
			var laydate = layui.laydate;
			var form = layui.form;
			var layer = layui.layer;
			laydate.render({
				elem : '#localmeet_start',
				format : 'yyyy年MM月dd日',
				value: new Date(),
				done: function(value, date){
					//layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
				}
			});
			laydate.render({
				elem : '#localmeet_end',
				format : 'yyyy年MM月dd日',
				value: new Date(),
				done: function(value, date){
					//layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
				}
			});
			form.on('radio(day)', function(data){
				//console.log(data);
				if (data.value == "everyweeks"){
					$("#localmeet_everyweeks_option").show();
					$("#localmeet_everymonths_option").hide();
				}
				else if (data.value == "everymonths") {
					$("#localmeet_everyweeks_option").hide();
					$("#localmeet_everymonths_option").show();
				}
				else {
					$("#localmeet_everyweeks_option").hide();
					$("#localmeet_everymonths_option").hide();
				}
			});
		});
		//配置 layui 第三方扩展组件存放的基础目录
		layui.config({
			base : '${pageContext.request.contextPath }/js/' 
		}).extend({
			tableSelect : 'tableSelect' //以 regionSelect 组件为例，定义该组件模块名
		}).use([ 'tableSelect' ], function() {
			var tableSelect = layui.tableSelect;
			//执行实例
			tableSelect.render({
				elem: '#peopleInMeeting',	//定义输入框input对象 必填
				checkedKey: 'id', //表格的唯一建值，非常重要，影响到选中状态 必填
				searchKey: 'name',	//搜索输入框的name值 默认keyword
				searchPlaceholder: '关键词搜索',	//搜索输入框的提示文字 默认关键词搜索
				table: {	//定义表格参数，与LAYUI的TABLE模块一致，只是无需再定义表格elem
					url:'${pageContext.request.contextPath}/addUser/findInternal.json',
					cols: [[{ type: 'checkbox' },
						{ field: 'id', title: 'ID', width: 100 },
						{ field: 'name', title: '姓名', width: 100 },
						{ field: 'company', title: '公司', width: 100 },
						{ field: 'dept', title: '部门', width: 100 },
						{ field: 'email', title: '邮件', width: 100 }]]
				},
				done : function(elem, data) {
					//选择完后的回调，包含2个返回值 elem:返回之前input对象；data:表格返回的选中的数据 []
					var NEWJSON = [];
					cbs = [];
					layui.each(data.data, function(index, item) {
						NEWJSON.push(item.name);
						cbs.push(item.id);
					});
					elem.val(NEWJSON.join(","));
				}
			});
		});
	</script>
</body>
</html>