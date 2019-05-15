<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html lang="en">
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
    <script src="${pageContext.request.contextPath }/js/carbon.js"></script>
    <script src="${pageContext.request.contextPath }/js/demo.js"></script>


</head>
<body class="sidebar-fixed header-fixed">
<div class="content">
    <div class="container-fluid">
        <div class="card-header bg-light">
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span>
            <a href="#">系统管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">邮件管理</a>
        </div>
        <hr>
        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-12">
                    <div>
                       <%-- <form class="navbar-form navbar-right">
                            <a href="javascript:sendMail('aa')"
                               class="btn btn-primary">发送</a>
                        </form>--%>
                    </div>
                    <div class="text-center">
                        <table class="table table-bordered text-center" id="dataList">
                            <thead>
                            <tr class="text-center" >
                                <th class="active text-center">
                                    <input type="checkbox" id="selectAll" value=""/>
                                </th>
                                <th class="text-center">收件人邮箱</th>
                                <th class="text-center">邮件标题</th>
                                <th class="text-center">邮件主题</th>
                                <th class="text-center">邮件内容</th>
                                <th class="text-center">创建时间</th>
                                <th class="text-center" style="width: 80px">状态</th>
                                <%--<th class="text-center">操作</th>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="list">
                                <tr >
                                    <td class="active">
                                        <input type="checkbox" name="mailIdBox" id="mailIdBox_${list.id}" value="${list.id}"/>
                                    </td>
                                    <td>${list.receivemailaccount}</td>
                                    <td>${list.mailtitle}</td>
                                    <td>${list.mailsubject}</td>
                                    <td>${list.mailcontent}</td>
                                    <td><fmt:formatDate value="${list.createdate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                    <td>
										<c:choose>
											<c:when test="${list.status== 1}">
										       待发送
										    </c:when>
										    <c:when test="${list.status== 2}">
										        已发送
										    </c:when>
										    <c:when test="${list.status== 3}">
										        发送失败
										    </c:when>
										    <c:otherwise>
										        --
										    </c:otherwise>
										</c:choose>
                                    </td>
                                    <%--<td class="text-center">
                                          <form class="navbar-form">
                                            <a href="javascript:sendMail(${list.id})"
                                               class="btn btn-default">发送</a>
                                        </form>
                                    </td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <%--分页查询--%>
                        <div class="form-group form-inline">
                            <div class="form-group form-inline">
                                总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页 10 条
                            </div>&nbsp;&nbsp;
                                <ul class="pagination">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}"
                                           aria-label="Previous">首页</a>
                                        <%-- <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> --%>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/mail/findPage?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a>
                                    </li>
                                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/mail/findPage?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                                        </li>
                                    </c:forEach>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/mail/findPage?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a>
                                    </li>
                                    <li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/mail/findPage?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
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
</body>
</html>

<script  type="text/javascript">
/*
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        location.href = "<%--${pageContext.request.contextPath}--%>/mail/findPage?page=1&size=" + pageSize;
    }*/

    $("#selectAll").click(function() {
        var clicks = $(this).is(':checked');
        if (!clicks) {
            $("#dataList td input[type='checkbox']").prop("checked",false);;
        } else {
            $("#dataList td input[type='checkbox']").prop("checked",true);;
        }
        $(this).data("clicks", !clicks);
    });
    function sendMail(flag){
    	var mailidArrStr;
    	if(flag=='aa'){
    		var chk_value =[];
	 		$('input[name="mailIdBox"]:checked').each(function(){
	            chk_value.push($(this).val());
	 		});
	 		if(chk_value.length==0){
	 			alert("你还没有选择任何内容！");
	 			return;
	 		}else{
	 			mailidArrStr = chk_value.join(",");
	 		}
    	}else{
    		mailidArrStr=flag;
    	}
		$.ajax({
			url: "${pageContext.request.contextPath}/mail/sendMail",
			type:"POST",
			dataType:"json",
			data: {
				mailidArrStr : mailidArrStr
	        },
			success:function(data){
				if(data.msgType==1){
					alert("操作成功");
				}else{
					alert("操作失败");
				}
				window.location.reload();
			},
			error:function(){
				console.log("失败");
			}
		});
 		
    }
</script>
