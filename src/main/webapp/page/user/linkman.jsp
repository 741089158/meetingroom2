<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/popper.js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/chart.js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/carbon.js"></script>
    <script src="${pageContext.request.contextPath }/js/demo.js"></script>


</head>
<body class="sidebar-fixed header-fixed">
<div class="content">
    <div class="container-fluid">

        <div class="card-header bg-light">
            <a href="#"><span class="glyphicon glyphicon-refresh">刷新</span></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">通讯录</a>

            <a class="btn btn-primary" href="javascript:void(0);" style="float: right;margin-right: 10px"
               id="delSelected">删除选中</a>
            <a href="${pageContext.request.contextPath }/page/user/linkman_add.jsp"
            class="btn btn-primary" style="float: right;margin-right: 10px">添加联系人</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-12 mb-4">
                    <%--联系人列表--%>
                    <div class="tab-content">
                        <form action="${pageContext.request.contextPath}/user/findInternal" method="post">
                            <div style="width: 200px;float: right;margin-top: 10px">
                                <span>内部联系人: </span>
                                <input type="radio" name="internal" value="2" <c:if test="${internal=='2'}">checked="checked"</c:if>>&nbsp;&nbsp;
                                <span>外部联系人: </span>
                                <input type="radio"  name="internal" value="1"<c:if test="${internal=='1'}">checked="checked"</c:if>>
                            </div>
                            <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px" placeholder="搜索" name="name" value="${name}">
                            <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索</button>
                        </form>
                        <form id="form" action="${pageContext.request.contextPath}/user/deleteInternals" method="post">

                            <table class="table table-bordered">
                                <tr>
                                    <th class="active text-center" style="width: 50px">
                                        <input type="checkbox" id="firstCb"/>
                                    </th>
                                    <th class="text-center" style="width: 130px">姓名</th>
                                    <th class="text-center" style="width: 130px">部门</th>
                                    <th class="text-center" style="width: 130px">电话</th>
                                    <th class="text-center" style="width: 130px">E-mail</th>
                                    <th class="text-center" style="width: 130px">公司</th>
                                    <th class="text-center" style="width: 200px">操作</th>
                                </tr>
                                <c:forEach items="${pageInfo.list}" var="list">
                                    <tr>
                                        <td class="active text-center" style="width: 50px">
                                            <input type="checkbox" name="id" value="${list.id}"/>
                                        </td>
                                        <td class="text-center">${list.name}</td>
                                        <td class="text-center">${list.dept}</td>
                                        <td class="text-center">${list.tel}</td>
                                        <td class="text-center">${list.email}</td>
                                        <td class="text-center">${list.company}</td>
                                        <td class="text-center" style="width: 200px">
                                            <a href="${pageContext.request.contextPath}/user/findOne?id=${list.id}">
                                            <span class="btn btn-default">修改</span></a>
                                            <%--样式glyphicon glyphicon-search text-left--%>
                                            <a href="javascript:deleteLinkman(${list.id});" class="text-right">
                                                <span class="btn btn-danger">删除</span> </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                        <%--分页查询--%>
                        <div class="form-group form-inline">
                            <div class="form-group form-inline">
                                总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页 10 条
                            </div>&nbsp;&nbsp;
                            <ul class="pagination ">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/findInternal?page=1&size=${pageInfo.pageSize}"
                                       aria-label="Previous">首页</a>
                                    <%-- <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> --%>
                                </li>
                                <c:if test="${pageInfo.pageNum!=1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/findInternal?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/findInternal?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageInfo.pages!=pageInfo.pageNum}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/findInternal?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a>
                                    </li>
                                </c:if>

                                <li>
                                    <a href="${pageContext.request.contextPath}/user/findInternal?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                                       aria-label="Next">尾页</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
<script>
    function deleteLinkman(id) {
        //alert(id);
        //用户安全提示
        if (confirm("您确定要删除吗？")) {
            //访问路径
            location.href = "${pageContext.request.contextPath}/user/deleteInternal?id=" + id;
        }
    }

    window.onload = function () {
        //给删除选中按钮添加单击事件
        document.getElementById("delSelected").onclick = function () {
            if (confirm("您确定要删除选中条目吗？")) {

                var flag = false;
                //判断是否有选中条目
                var cbs = document.getElementsByName("id");
                for (var i = 0; i < cbs.length; i++) {
                    if (cbs[i].checked) {
                        //alert(cbs[i]);
                        //有一个条目选中了
                        flag = true;
                        break;
                    }
                }
                if (flag) {//有条目被选中
                    //表单提交
                    document.getElementById("form").submit();
                }
            }
        };
        //1.获取第一个cb
        document.getElementById("firstCb").onclick = function () {
            //2.获取下边列表中所有的cb
            var cbs = document.getElementsByName("id");
            //3.遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                cbs[i].checked = this.checked;
            }
        };

    }
</script>