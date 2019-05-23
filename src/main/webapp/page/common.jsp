<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/modules/laydate/default/laydate.css">--%>
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
    <title>会议管理系统</title>
</head>
<style type="text/css">
    body {
        background-color: #393D49

    }

    .row_black {
        background-color: #393D49
    }
   /* .row_black {
        background-color: #2c5ae4
    }

    .layui-nav {
        position: relative;
        padding: 0 20px;
        background-color: #2e54c5;
        color: #fff;
        border-radius: 2px;
        font-size: 0;
        box-sizing: border-box;
    }

    element.style {
        text-align: center;
        font-size: 20px;
        padding: 20px 0 20px 0;
        background-color: #445cd0;
        color: #fff;
    }*/

    .main-bg-color {
        background-color: #C0C0C0
    }

    .block-bg-color {
        background-color: #fff
    }

    .block-margin-top {
        margin: 5px 0 0 0
    }

    .block-margin-both {
        margin: 12px 0 12px 0
    }

    .block-margin-both-15 {
        margin: 17px 0 15px 0
    }

    .block-border-top {
        border-top: 1px solid grey
    }

    .block-padding-around {
        padding: 7px 12px 7px 12px
    }

    .block-bot-left {
        float: left
    }

    .block-bot-right {
        float: right
    }

    .box {
        box-shadow: 0px 0px 2px 0 rgba(25, 25, 25, 0.60);
    }

    .layui-card-footer-a {
        position: relative;
        height: 42px;
        line-height: 42px;
        padding: 0 15px;
        border-top: 1px solid #f6f6f6;
        color: #333;
        border-radius: 2px 2px 0 0;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        background-color: #f2f2f2;
    }

    .layui-card-footer-a:hover {
        background-color: #01AAED;
        color: #fff;
    }

    .home-point {
        float: left;
        width: 32px;
        height: 32px;
        line-height: 32px;
        text-align: center;
        background-color: #01AAED;
        border-radius: 50%;
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        margin: 5px 10px 0px 0px;
    }

    .home-point-label {
        float: left;
    }

    .home-point-body {
        background: url(${pageContext.request.contextPath}/image/img@2x.png) no-repeat 95% 80%;
        padding: 20px 55px;
        height: 72px;
        text-align: center;
    }
</style>
<script>
    $(function () {
        layui.use(['element'], function () {
            var element = layui.element;
        });
        var url = window.location.pathname;
        var mark = url.split("/meetingroom/");
        //console.log(mark);
        if (mark[1] != "") {
            var ths = $("[href*='" + url + "'],[data-set*='" + url + "']");
            ths.addClass("layui-this");
            ths.parents(".layui-nav-item").addClass("layui-nav-itemed");
        }

        //浏览器后退时刷新页面
        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                window.history.pushState('forward', null, '');
                window.history.forward(1);
                location.replace(document.referrer);//刷新
            });
        }
        window.history.pushState('forward', null, ''); //在IE中必须得有这两行
        window.history.forward(1);
    });
</script>