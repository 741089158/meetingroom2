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
            <a >首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a >我的预定</a>&nbsp&nbsp >&nbsp&nbsp<a >参会人列表</a>
        </div>
        <hr>


         <div class="tab-content col-md-12" style="border: 0px  ">
                    <%--内部联系人--%>
                    <div class="tab-pane active" id="Internal" role="tabpanel">
                        <div class="col-md-12 mb-4">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home1" role="tab" aria-controls="home1">参会人列表</a>
                                </li>
                            </ul>
                            <div style="float: right;margin: 5px;">
                                <a class="btn btn-primary" href="javascript:void(0);" id="addSelected">移除</a>
                                <a class="btn btn-primary" href="javascript:void(0);" id="addUser">添加</a>
                            </div>
                            <%--联系人列表--%>
                            <div class="tab-content">
                                <div class="tab-pane active" id="home1" role="tabpanel">
                                   <form id="form" action="${pageContext.request.contextPath}/user/addSelected" method="post">
                                       <table class="table table-bordered" >
                                           <tr >
                                               <th class="col-md-1 active text-center" style="width: 30px">
                                                   <input type="checkbox" name="uid"  id="firstCb" />
                                               </th>
                                               <th class="col-md-2 text-center">姓名</th>
                                               <th class="col-md-2 text-center">部门</th>
                                               <th class="col-md-2 text-center">电话</th>
                                               <th class="col-md-2 text-center">E-mail</th>
                                               <th class="col-md-2 text-center">操作</th>
                                           </tr>

                                           <c:forEach items="${user}" var="list">
                                               <tr>
                                                   <td class="col-md-1 active text-center">
                                                       <input type="checkbox" name="uid" id="'${list.id}'" value=""/>
                                                   </td>
                                                   <td class="col-md-2 text-center" >${list.name}</td>
                                                   <td class="col-md-2 text-center" >${list.dept}</td>
                                                   <td class="col-md-2 text-center" >${list.tel}</td>
                                                   <td class="col-md-2 text-center" >${list.email}</td>
                                                   <td>
                                                     <a    href="javascript:deleteman(${list.id});"  class="text-right">
                                                         <center><span class="btn btn-primary">移除</span></center></a>
                                                   </td>
                                               </tr>
                                           </c:forEach>
                                       </table>
                                   </form>
                                </div>
                            <%--添加联系人--%>
                            </div>
                            <div style="float: right">
                            <button type="button" class="btn btn-primary" onclick="history.back(-1);">返回</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">




    function deleteman(id) {
        // alert(id);
        //用户安全提示
        if (confirm("是否移除？")) {
            //访问路径
            location.href = "${pageContext.request.contextPath}/addUser/deleteUser?userId="+id+"&remeetId=${meetId}";
        }
    }
    window.onload = function(){
        //给删除选中按钮添加单击事件
        document.getElementById("addSelected").onclick = function(){
            if(confirm("您确定要删除选中条目吗？")){
                var flag = false;
                //判断是否有选中条目
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    if(cbs[i].checked){
                        //有一个条目选中了
                        flag = true;
                        break;
                    }
                }
                if(flag){//有条目被选中
                    //表单提交
                    document.getElementById("form").submit();
                }
            }
        };
        //1.获取第一个cb
            document.getElementById("firstCb").onclick = function(){
            //2.获取下边列表中所有的cb
            var cbs = document.getElementsByName("uid");
            //3.遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                cbs[i].checked = this.checked;
            }
        };
    }
</script>
</html>
