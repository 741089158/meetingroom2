<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/formSelects/formSelects-v4.css"></link>

<body class="layui-form" style="background-color: white;padding: 10px">
<%--<%@ include file="../page/top.jsp" %>--%>
<div class="layui-row row_black">
   <%-- <%@ include file="../page/nav.jsp" %>--%>
    <div class="layui-col-md10 main-bg-color">
       <%-- <div class="layui-row block-bg-color block-border-top">
            <div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>预约会议</cite></a>
					</span>
            </div>
        </div>--%>
       <%-- <div class="layui-fluid">--%>
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around" id="localmeet_content_container">
                    <form class="layui-form" action="">
                        <input name="id" value="${meetId}" type="hidden"/> <input name="meetRoomId"
                                                                                  value="${meetRoomId}" type="hidden"/>
                        <div class="layui-form-item">
                            <label class="layui-form-label">会议名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="meetName" required lay-verify="required" placeholder="请输入议题"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">会议室名称</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" disabled="disabled" name="meetRoomName"
                                           value="${meetRoom.roomName}"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">会议室类型</label>
                                <div class="layui-input-block">
                                    <input type="text" name="meetType" class="layui-input" disabled="disabled"
                                           value="${meetRoom.roomType}"/>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">日期</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" id="home_date" placeholder="yyyy年MM月dd日"
                                           lay-verify="required" value="${date}" name="date">
                                </div>
                                <%-- <div class="layui-input-block">
                                     <input type="text" class="layui-input" name="date"
                                            value="${date}"/>
                                 </div>--%>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">时间</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="time" id="home_time"
                                           value="${time}"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">会议时长</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="meetTime" id="home_duration"
                                           value="${meetTime}"/>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">参会人</label>
                            <div class="layui-input-block">
                                <input type="hidden" name="userId" class="layui-input" readonly="readonly"
                                       id="userId"/>
                                <input type="text" name="username" class="layui-input"
                                       id="username"/>
                            </div>
                        </div>
                        <%-- <div class="layui-form-item">
                            <label class="layui-form-label">参会人1</label>
                            <div class="layui-input-block">
                                <select name="city" xm-select="example4" xm-select-search="">
                                     <option value="1">北京</option>
                                     <option value="2">上海</option>
                                     <option value="3">广州</option>
                                     <option value="4">深圳</option>
                                     <option value="5">天津</option>
                                 </select>
                                <select name="city" xm-select="example9_1" xm-select-show-count="2" xm-select-search=""
                                        xm-select-search-type="dl">
                                    <option value="1">北京</option>
                                    <option value="2">上海</option>
                                    <option value="3">广州</option>
                                    <option value="4">深圳</option>
                                    <option value="5">天津</option>
                                    <option value="6">郑州</option>
                                    <option value="7">合肥</option>
                                    <option value="8">邯郸</option>
                                    <option value="9">舟山</option>
                                    <option value="10">海南</option>
                                    <option value="11">南京</option>
                                    <option value="12">哈尔滨</option>
                                </select>
                            </div>
                        </div>--%>
                        <div class="layui-form-item">
                            <label class="layui-form-label">会议标签</label>
                            <div class="layui-input-block">
                                <select name="meetLaber" lay-verify="required">
                                    <option value="普通会议">普通会议</option>
                                    <option value="重要会议">重要会议</option>
                                    <option value="高层会议">高层会议</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">重复周期</label>
                            <div class="layui-input-block">
                                <input type="radio" name="day" value="no" title="无重复" checked="checked"
                                       lay-filter="day"/>
                                <input type="radio" name="day" value="everydays" title="每日" lay-filter="day"/>
                                <input type="radio" name="day" value="everyworks" title="工作日" lay-filter="day"/>
                                <input type="radio" name="day" value="everyweeks" title="每周" lay-filter="day"/>
                                <input type="radio" name="day" value="everymonths" title="每月" lay-filter="day"/>
                            </div>
                        </div>
                        <div class="layui-form-item" id="createDiv">
                            <label class="layui-form-label">起始日期</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" id="createTime" placeholder="yyyy年MM月dd日"
                                       readonly="readonly" name="createTime">
                            </div>
                        </div>
                        <div class="layui-form-item" id="endDiv">
                            <label class="layui-form-label">截止日期</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input"
                                       id="endTime" <%--required lay-verify="required"--%>
                                       placeholder="yyyy-MM-dd HH:mm" name="endTime"
                                       readonly="readonly" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-form-item" id="localmeet_everyweeks_option" style="display:none">
                            <label class="layui-form-label">重复日期</label>
                            <div class="layui-input-block">
                                <input type="hidden" name="week" id="week">
                                <input type="checkbox" name="weeks" title="周一" value="周一" lay-filter="weeks">
                                <input type="checkbox" name="weeks" title="周二" value="周二" lay-filter="weeks">
                                <input type="checkbox" name="weeks" title="周三" value="周三" lay-filter="weeks">
                                <input type="checkbox" name="weeks" title="周四" value="周四" lay-filter="weeks">
                                <input type="checkbox" name="weeks" title="周五" value="周五" lay-filter="weeks">
                                <input type="checkbox" name="weeks" title="周六" value="周六" lay-filter="weeks">
                                <input type="checkbox" name="weeks" title="周日" value="周日" lay-filter="weeks">
                            </div>
                        </div>
                        <div class="layui-form-item" id="localmeet_everymonths_option" style="display:none">
                            <label class="layui-form-label">重复日期</label>
                            <div class="layui-input-block">
                                <input type="hidden" name="months" id="months">
                                <c:forEach var="i" begin="1" end="31" step="1">
                                    <input type="checkbox" name="selectDay" title="${i}号" value="${i}"
                                           lay-filter="selectDay">
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
      <%--  </div>--%>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/tableSelect.js"></script>
<script>
    //被选中的人
    var cbs = [];
    layui.use(['form', 'laydate', 'layer'], function () {
        //处理高度
        $("#localmeet_content_container").css("min-height", $(window).height() - 170);//.height();
        var laydate = layui.laydate;
        var form = layui.form;
        var layer = layui.layer;


        // 提交表单
        form.on('submit(formSubmit)', function (data) {
            if ($(data.elem).hasClass("layui-btn-disabled")) {
                return false; // 阻止重复提交
            }
            $(data.elem).addClass("layui-btn-disabled");
            // 普通会议提交
            if (data.field.day == "no") {
                $.post("${pageContext.request.contextPath }/meetroom/appointmeet", data.field, function (resp) {
                    layer.msg(resp.message);
                    setTimeout(function () {
                        location.href = "${pageContext.request.contextPath }/page/meeting/meettable.jsp"
                    }, 2000)
                });
            }
            // 非普通会议提交
            else {
                $.post("${pageContext.request.contextPath }/meetroom/reserve", data.field, function (resp) {
                    layer.msg(resp.message);
                    setTimeout(function () {
                        location.href = "${pageContext.request.contextPath }/page/meeting/meettable.jsp"
                    }, 2000)
                });
            }
            return false;
        });


        laydate.render({
            elem: '#createTime',
            format: 'yyyy-MM-dd',
            value: new Date(),
            done: function (value, date) {
                //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
            }
        });
        laydate.render({
            elem: '#endTime',
            format: 'yyyy-MM-dd HH:mm',
            //value: new Date(),
            done: function (value, date) {
                //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
            }
        });
        laydate.render({
            elem: '#home_date',
            format: 'yyyy-MM-dd'
        });
        laydate.render({
            elem: '#home_time',
            type: 'time',
            format: 'HH:mm',
            ready: formatMinutes
        });
        laydate.render({
            elem: '#home_duration',
            type: 'time',
            btns: ['confirm'],
            format: 'HH:mm',
            value: '01:00',
            ready: formatMinutes
        });

        form.on('checkbox(weeks)', function (data) {
            var week = [];
            var month = [];
            $("input[name='weeks']:checked").each(function () {
                week.push(this.value);
            });
            // console.log(week);
            $("#week").val(week)
        });

        form.on('checkbox(selectDay)', function (data) {
            var week = [];
            var month = [];
            $("input[name='selectDay']:checked").each(function () {
                month.push(this.value);
            });
            console.log(month);
            $("#months").val(month)
        });


        form.on('radio(day)', function (data) {
            if (data.value == "everyweeks") {
                $("#localmeet_everyweeks_option").show();
                $("#localmeet_everymonths_option").hide();
            } else if (data.value == "everymonths") {
                $("#localmeet_everyweeks_option").hide();
                $("#localmeet_everymonths_option").show();
            } else {
                $("#localmeet_everyweeks_option").hide();
                $("#localmeet_everymonths_option").hide();
            }
            if (data.value == 'no') {
                $("#createDiv").hide();
                $("#endDiv").hide();
            } else {
                $("#createDiv").show();
                $("#endDiv").show();
            }
        });
        // $("input").click(function () {
        var a = $("input[name='day']:checked").val();
        if (a == 'no') {
            $("#createDiv").hide();
            $("#endDiv").hide();
        }
        // });
    });
    //配置 layui 第三方扩展组件存放的基础目录
    layui.config({
        base: '${pageContext.request.contextPath}/js/'
    }).extend({
        tableSelect: 'tableSelect' //以 regionSelect 组件为例，定义该组件模块名
    }).use(['tableSelect','form'], function () {
        var tableSelect = layui.tableSelect,form=layui.form;
        //执行实例
        tableSelect.render({
            elem: '#username',	//定义输入框input对象 必填
            checkedKey: 'sAMAccountName', //表格的唯一建值，非常重要，影响到选中状态 必填
            searchKey: 'name',	//搜索输入框的name值 默认keyword
            searchPlaceholder: '关键词搜索',	//搜索输入框的提示文字 默认关键词搜索
            table: {	//定义表格参数，与LAYUI的TABLE模块一致，只是无需再定义表格elem
                url: '${pageContext.request.contextPath}/ldap/getUser',//addUser/findInternal.json
                method: 'post',
                cols: [[{type: 'checkbox'},
                    {field: 'sAMAccountName', title: 'ID', width: 80},
                    {field: 'name', title: '姓名', width: 100},
                    {field: 'department', title: '部门', width: 100},
                    {field: 'mail', title: '邮件', width: 100},
                    {field: 'mobile', title: '电话', width: 100}]]
            },
            done: function (elem, data) {
                //选择完后的回调，包含2个返回值 elem:返回之前input对象；data:表格返回的选中的数据 []
                var NEWJSON = [];
                cbs = [];
                layui.each(data.data, function (index, item) {
                    NEWJSON.push(item.name);
                    cbs.push(item.name);
                });
                elem.val(NEWJSON.join(","));
                $("#userId").val(cbs);
                $("#username").val(NEWJSON);
                //console.log(NEWJSON)
                //console.log(cbs)
            }
        });

        form.on('input(name)',function () {
            var name = $("input[name='name']").val;
            console.log(name);
        })
    });

</script>
<%--<script>
    layui.config({
        base: '${pageContext.request.contextPath}/js/layui/formSelects/' //此处路径请自行处理, 可以使用绝对路径
    }).extend({
        formSelects: 'formSelects-v4'
    });
    layui.use(['form', 'jquery', 'formSelects'], function () {
        var form = layui.form, layer = layui.layer, formSelects = layui.formSelects;
        /*formSelects.filter('example4', function (id, inputVal, val, isDisabled) {
            //id:           点击select的id
            //inputVal:     当前input搜索框中的数值
            //val:          格式: {"name":"上海","val":"2"}
            //isDisabled:   当前options是否被禁用
            //return true时该选项被过滤, 隐藏不显示
            if (
                PY.fullPY(val.name).toLowerCase().indexOf(inputVal) != -1 ||    //拼音全拼是否包含
                PY.fullPY(val.name, true).indexOf(inputVal) != -1 ||            //拼音简拼是否包含
                val.name.indexOf(inputVal) != -1                                //文本是否包含
            ) {
                return false;
            }
            return true;
        });*/
        layui.formSelects.render('example9_1', {
            template: function(name, value, selected, disabled){
                return name + '<span style="position: absolute; right: 0; color: #A0A0A0; font-size: 12px;">' + PY.fullPY(name) + '</span>';
            }
        });
    });
</script>--%>
</body>
</html>