<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>会议管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css">
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
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header bg-light">
							<span class="fa fa-home">>首页>我的会议>预约会议</span>
						</div>




						<div class=" container-fluid">
							<form role="form" action="${pageContext.request.contextPath }/meetroom/appointVideoMeet" method="post">
								<div class=" col-md-12 form-group row">
									<input name="id" value="${meetId}" hidden>
									<%--隐藏会议shiid--%>
									<input name="meetRoomId" value="${meetRoomId}" hidden> <label class=" form-control col-md-2 " style="border: 0px"><center>会议名称:</center></label> <input
										id="meetName" name="meetName" style="height: 35px" class="form-control col-5" type="text" class="form-control">
								</div>

								<div class=" col-md-12 form-group row">
									<label class=" form-control col-md-2 " style="border: 0px"><center>会议室名称:</center></label> <input readonly="readonly" name="meetRoomName" style="height: 35px"
										class="form-control col-5" type="text" class="form-control" value="${meetRoom.roomName}">
								</div>
								<div class=" col-md-12 form-group row">
									<label class=" form-control col-md-2 " style="border: 0px"><center>会议室类型:</center></label> <input readonly="readonly" name="meetType" style="height: 35px"
										class="form-control col-5" type="text" class="form-control" value="${meetRoom.roomType}">
								</div>

								<!--<div class=" col-md-12 form-group row">-->

								<!--<label  class=" form-control col-md-2 "style="border: 0px "><center>会议模式:</center></label>-->
								<!--<label  class=" form-control col-md-2 " style="border: 0px "><center><input  for="placeholder-input" id="speech" type="radio" name="model" value="no" checked="checked">演讲者模式</center></label>-->
								<!--<label  class=" form-control col-md-2" style="border: 0px "><center><input  for="placeholder-input" id="talk"   type="radio" name="model" value="everydays">讨论模式</center></label>-->
								<!--<label  class=" form-control col-md-2 " style="border: 0px "><center><input  for="placeholder-input" id="mute"   type="checkbox" name="model" value="everyweeks">入会静音</center></label>-->


								<!--</div>-->

								<div class=" col-md-12 form-group row">

									<label class=" form-control col-md-2 " style="border: 0px"><center>开始时间:</center></label> <input readonly="readonly" id="meetDate" value="${datetime}"
										name="meetDate" style="height: 35px" class="form-control col-2" type="text" class="form-control">

								</div>

								<div class=" col-md-12 form-group row">

									<label class=" form-control col-md-2 " style="border: 0px"><center>会议时长:</center></label> <input readonly="readonly" id="meetTime" value="${duration}"
										name="meetTime" style="height: 35px" class="form-control col-2" type="time" class="form-control">

								</div>

								<div class=" col-md-12 form-group row">

									<label class=" form-control col-md-2 " style="border: 0px"><center>邀请参会人:</center></label> <input readonly="readonly" name="UserId" style="height: 35px"
										class="form-control col-5" type="text" class="form-control"> <label class=" form-control col-md-2 " style="border: 0px"><center>
											<a href="${pageContext.request.contextPath }/addUser/findInternal?meetId=${meetId}">邀请参会人</a>
										</center></label>
								</div>

								<div class=" col-md-12 form-group row">

									<label class="  form-control col-md-2 " style="border: 0px"><center>会议标签:</center></label> <select name="meetLaber" style="height: 35px" class="form-control col-3">

										<option>普通会议</option>
										<option>重要会议</option>
										<option>高层会议</option>

									</select>


								</div>

								<%--重复周期--%>
								<%--<div class=" col-md-12 form-group row">--%>

								<%--<label  class=" form-control col-md-2 "style="border: 0px "><center>重复周期:</center></label>--%>


								<%--<label  class=" form-control col-md-2 bg-light"><center><input  for="placeholder-input" id="no" type="radio" name="day" value="no" checked="checked">无重复:</center></label>--%>
								<%--<label  class=" form-control col-md-2 bg-light"><center><input  for="placeholder-input" id="everydays"   type="radio" name="day" value="everydays">每日:</center></label>--%>
								<%--<label  class=" form-control col-md-2 bg-light"><center><input  for="placeholder-input" id="everyweeks"   type="radio" name="day" value="everyweeks">每周:</center></label>--%>
								<%--<label  class=" form-control col-md-2 bg-light"><center><input  for="placeholder-input" id="everymouths  "  type="radio" name="day" value="everymouths">每月:</center></label>--%>

								<%--</div>--%>
								<%--重复周期div--%>
								<%--  <div style="display: none" id="everyday">
                            <div class=" col-md-12 form-group row">

                                <label  class=" form-control col-md-3 bg-light"><center><input  for="placeholder-input"  type="radio" name="days">每天:</center></label>
                                <label  class=" form-control col-md-3 bg-light"><center><input  for="placeholder-input"  type="radio" name="days">每个工作日:</center></label>
                                <label  class=" form-control col-md-1" style="border: 0px"><center>结束日期:</center></label>

                                <input style="height: 35px" class="form-control col-2" type="date" class="form-control">


                            </div>

                        </div>
                        <div style="display: none" id="everyweek">
                            <div class=" col-md-12 form-group row">

                                <label  class=" form-control col-md-3 bg-light"><center><input  for="placeholder-input"  type="checkbox" name="weeks">星期一:</center></label>
                                <label  class=" form-control col-md-3 bg-light"><center><input  for="placeholder-input"  type="checkbox" name="weeks">星期二:</center></label>
                                <label  class=" form-control col-md-3 bg-light"><center><input  for="placeholder-input"  type="checkbox" name="weeks">星期三:</center></label>
                                <label  class=" form-control col-md-3 bg-light"><center><input  for="placeholder-input"  type="checkbox" name="weeks">星期四:</center></label>
                                <label  class=" form-control col-md-3 bg-light"><center><input  for="placeholder-input"  type="checkbox" name="weeks">星期五:</center></label>
                                <label  class=" form-control col-md-3 bg-light"><center><input  for="placeholder-input"  type="checkbox" name="weeks">星期六:</center></label>
                                <label  class=" form-control col-md-3 bg-light"><center><input  for="placeholder-input"  type="checkbox" name="weeks">星期日:</center></label>

                                <label  class=" form-control col-md-1 bg-light"><center>结束日期:</center></label>

                                <input style="height: 35px" class="form-control col-2" type="date" class="form-control">




                            </div>
                            <div class=" col-md-12 form-group row">




                            </div>
                        </div>
                        <div style="display: none" id="everymouth">
                            <div class=" col-md-12 form-group row">
                                <label class=" form-control col-md-1 bg-light"><center>每个月:</center></label>

                                <select class="form-control col-md-2 ">
                                    <option>第一个</option>
                                    <option>第二个</option><option>第三个</option>
                                    <option>第四个</option>
                                    <option>最后一个</option>

                                </select>
                                <label class=" form-control col-md-1 bg-light"><center>星期:</center></label>
                                <select class="form-control col-md-2 ">
                                    <option>星期一</option>
                                    <option>星期二</option>
                                    <option>星期三</option>
                                    <option>星期四</option>
                                    <option>星期五</option>
                                    <option>星期六</option>
                                    <option>星期日</option>
                                </select>
                                <label  class=" form-control col-md-1 bg-light"><center>结束日期:</center></label>

                                <input style="height: 35px" class="form-control col-2" type="date" class="form-control">

                            </div>

                        </div>
                        --%>

								<div class=" col-md-12 form-group row">

									<label class=" form-control col-md-2 " style="border: 0px"><center>会议描述:</center></label>
									<textarea name="meetDescription" id="meetDescription" class="col-md-10" style="height: 160px"></textarea>

								</div>

								<center>
									<input type="submit" class="btn btn-primary btn-lg" value="确定" onclick="if(confirm('确认预定会议？')==false)return false;"></input>&nbsp;
									<button type="button" class="btn btn-info btn-lg" onclick="window.history.back(-1)">返回</button>
								</center>
						</div>

					</div>


				</div>


			</div>
		</div>
	</div>

	</div>





	<div id="login" class="modal fade" style="position: absolute; top: 150px">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!--<h4 class="modal-title text-center">会议室名称:</h4>-->
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-md-12">姓名:</label>
							<div class="col-md-12">
								<input type="text" id="name" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-12">邮箱:</label>
							<div class="col-md-12">
								<input type="text" id="email" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-12">电话：</label>
							<div class="col-md-12">
								<input type="password" id="phone" class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-12">部门：</label>
							<div class="col-md-12">
								<input type="password" id="bumen" class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-2 text-center">
								<button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




	<script type="text/javascript">
		$(document).ready(function() {

			$("input").click(function() {
				var a = $("input[name='day']:checked").val();

				if (a == 'everymouths') {
					$("#everyday").hide();
					$("#everyweek").hide();
					$("#everymouth").show();
				}

				if (a == 'no') {
					$("#everyday").hide();
					$("#everyweek").hide();
					$("#everymouth").hide();
				}

				if (a == 'everyweeks') {
					$("#everyday").hide();
					$("#everyweek").show();
					$("#everymouth").hide();
				}

				if (a == 'everydays') {
					$("#everyday").show();
					$("#everyweek").hide();
					$("#everymouth").hide();
				}

			});
		});
	</script>

</body>
</html>
