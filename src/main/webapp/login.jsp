<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
    <style>
        body {
            background-image: url("${pageContext.request.contextPath }/image/bg_login.png");
            background-position: center 110px;
            background-repeat: no-repeat;
            background-size: 100%;
            background-color: #f0f2f5;
        }

        .login-header {
            color: rgba(0, 0, 0, .85) !important;
        }

        .login-footer {
            color: rgba(0, 0, 0, 0.7) !important;
        }

        .login-footer a {
            color: rgba(0, 0, 0, 0.7) !important;
        }

        .login-footer a:hover {
            color: rgba(0, 0, 0, 0.4) !important;
        }
    </style>
    <script>
        if (window != top)
            top.location.replace(location.href);
    </script>
</head>

<body>
<div class="login-wrapper">

    <div class="login-header">
        <img src="${pageContext.request.contextPath }/image/1.png" style="margin: 25px"> 会议管理系统
    </div>

    <div class=" login-body">
        <div class="layui-card">
            <div class="layui-card-header">
                <i class="layui-icon layui-icon-engine"></i>用户登录
            </div>
            <form class="layui-card-body layui-form layui-form-pane" action="${pageContext.request.contextPath}/login" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-block">
                        <input name="username" type="text" lay-verify="required" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input name="password" type="password" lay-verify="required" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <a href="javascript:;" class="layui-link">帐号注册</a>
                    <a href="javascript:;" class="layui-link pull-right">忘记密码？</a>
                </div>
                <div class="layui-form-item">
                    <%--<button lay-filter="login-submit" class="layui-btn layui-btn-fluid" lay-submit>登 录</button>--%>
                    <input type="submit" class="layui-btn layui-btn-fluid" value="登录" />

                </div>
            </form>
        </div>
    </div>
</div>

<script>
    layui.use(['layer', 'form'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;

	<%-- 登录失败提示 --%>
	if ("${param.login }" == "error") {
		layer.alert('帐号或密码错误，请重新登录！'); 
	}
        // 表单提交
        form.on('submit(login-submit)', function (obj) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/login",
                data: obj.field,
                error: function (result) {
                  /* layer.msg("用户名或密码错误!");
                    setTimeout(function () {
                        window.parent.layer.closeAll();
                    },2000)*/
                    layer.msg("用户名或密码错误", {icon: 5, anim: 6});
                }
            });
            return false;
        });

        // 图形验证码
        // $('.login-captcha').click(function () {
        //     this.src = this.src + '?t=' + (new Date).getTime();
        // });

      /*  var errorMsg = "";
        if (errorMsg) {
            layer.msg(errorMsg, {icon: 5, anim: 6});
        }*/

    });
</script>


</body>
</html>