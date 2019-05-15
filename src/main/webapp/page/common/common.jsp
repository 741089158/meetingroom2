<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>会议管理系统</title>
<link rel="stylesheet" href="" />
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
<body class="sidebar-fixed header-fixed" id="body">
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 text-center">
					<button class="btn btn-primary btn-lg" onclick="window.location.href=''">
						<span class="fa fa-list"></span>日程
					</button>
					<button class="btn btn-success btn-lg">
						<span class="fa fa-arrow-circle-down"></span>资源
					</button>
					<button class="btn btn-primary btn-sm" style="background-color: darkblue">空闲</button>
					<button class="btn btn-secondary btn-sm">占用</button>
					<br /> <br /> <br />
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12 bg-light">
							<div class="row">
								<div class="col-md-2">
									<div class="form-group">
										<select class="form-control" style="height: 35px">
											<span class="fa fa-home"> <c:forEach items="${meetRoomArea}" var="area">
													<option id="${area.areaId}" value="${area.areaId}"></span>${area.roomAreaName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<select id="meetBuilding" class="form-control" style="height: 35px">
										</select>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<input id="date" type="date" class="form-control">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<input id="time" type="time" class="form-control">
									</div>
								</div>
								<div class="col-md-1" style="padding: 10px">
									<label class="control-label">会议时长： </label>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<input id="duration" type="time" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-md-12 mb-2">
								<ul class="nav nav-tabs" role="tablist" id="floor">
									<li class="nav-item"><a class="nav-link active text-primary" data-toggle="tab" href="#home" role="tab" aria-controls="home">floor5</a></li>
									<li class="nav-item"><a class="nav-link text-primary" data-toggle="tab" href="#profile" role="tab" aria-controls="profile">floor6</a></li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane active" id="home" role="tabpanel">

										<div class="row" id="meetroom">

											<div class="col-md-2">
												<div class="card ">
													<div>
														<img src="${pageContext.request.contextPath}/image/biaoqian.png" width="50px">
														<div style="position: absolute; left: 15px; top: 0px; color: whitesmoke">
															<span class="h5">12</span>
														</div>

														<div style="float: right;">
															<button style="background-color: #ffffff; width: 25px; height: 25px; border: none;">

																<img src="${pageContext.request.contextPath}/image/xingxing 2.png" width="20px" height="20px">
															</button>
														</div>
														<div style="float: right; display: none">
															<button style="background-color: #ffffff; width: 25px; height: 25px; border: none;">

																<img src="${pageContext.request.contextPath}/image/xingxing1.png" width="20px" height="20px">
															</button>
														</div>
														<center>
															<img class="text-center" src="${pageContext.request.contextPath}/image/meet1.jpg " width="100%";>
														</center>


														<div class="card-footer bg-light text-center">
															<a href="${pageContext.request.contextPath }/meetroom/remmet" class="h6 text-warning">B栋05014</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
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
	$(document)
			.ready(
					function() {

						$("select:first")
								.click(
										function() {
											var url = "meetbuilding";
											var key = $("select:first").val();
											if (key.length > 0) {

												var data = {
													"key" : key
												}
												$("#meetBuilding").empty();
												$
														.post(
																url,
																data,
																function(result) {
																	$(result)
																			.each(
																					function() {
																						$(
																								"#meetBuilding")
																								.append(
																										"<option value='"+this.roomBuilding+"' >"
																												+ this.roomBuilding
																												+ "</option>")
																					})
																}, "json");
											}

										});
						$("#meetBuilding")
								.click(
										function() {
											var url = "meetfloor";
											var area = $("select:first").val();
											var building = $("#meetBuilding")
													.val();

											var data = {
												"area" : area,
												"building" : building
											}
											$("#floor").empty();
											$
													.post(
															url,
															data,
															function(result) {
																$(result)
																		.each(
																				function() {
																					$(
																							"#floor")
																							.append(
																									"<li class=\"nav-item\">\n"
																											+ "                        <a class=\"nav-link   text-primary\" data-toggle=\"tab\" href=\"#"+this.roomFloor+"\" role=\"tab\"\n" +
                        "                    aria-controls=\""+this.roomFloor+"\">"
																											+ this.roomFloor
																											+ "</a>\n"
																											+ "                        </li>")
																				})

																$("ul li")
																		.click(
																				function() {
																					var url = "meetroom";
																					var area = $(
																							"select:first")
																							.val();
																					var building = $(
																							"#meetBuilding")
																							.val();
																					var floor = $(
																							this)
																							.text();
																					var date = $(
																							"#date")
																							.val();
																					var time = $(
																							"#time")
																							.val();
																					var duration = $(
																							"#duration")
																							.val();
																					var data = {
																						"area" : area,
																						"building" : building,
																						"floor" : floor,
																						"date" : date,
																						"time" : time,
																						"duration" : duration
																					}
																					$(
																							"#meetroom")
																							.empty();
																					if (date.length == 0
																							|| time.length == 0
																							|| duration.length == 0) {
																						alert("请选择时间以及会议时长")
																						return;
																					}
																					$
																							.post(
																									url,
																									data,
																									function(
																											result) {
																										$(
																												result)
																												.each(
																														function() {
																															$row = $("<div class=\"col-md-2\">\n"
																																	+ "<img src=\"${pageContext.request.contextPath}/image/biaoqian.png\" width=\"50px\">\n"
																																	+ "<div style=\"position: absolute;left: 15px;top: 0px;color: whitesmoke\"><span class=\"h5\">"
																																	+ this.personCount
																																	+ "</span></div></div>");
																															$row
																																	.append("<div style=\"float: right;\" >\n"
																																			+ "<button  style=\"background-color: #ffffff; width:25px;height:25px;border: none;\">\n"
																																			+ "\n"
																																			+ " <img src=\"${pageContext.request.contextPath}/image/xingxing 2.png\" width=\"20px\" height=\"20px\"></button>\n"
																																			+ "</div>")
																															/*被收藏的星星*/
																															/*   $row.append("<div style=\"float: right;\" >\n" +
																															       "<button  style=\"background-color: #ffffff; width:25px;height:25px;border: none;\">\n" +
																															       "\n" +
																															       " <img src=\"/image/xingxing1.png\" width=\"20px\" height=\"20px\"></button>\n" +
																															       "</div>")*/
																															//如果为视屏会议添加视屏小图标
																															if (this.roomType == "视屏会议室") {
																																$row
																																		.append("<div style=\"float: right;\" >\n"
																																				+ " <img src=\"${pageContext.request.contextPath}/image/video.png\" width=\"28px\" height=\"18px\"></button>\n"
																																				+ " </div>")
																															}
																															$row
																																	.append("   <center><img class=\"text-center\" src=\"${pageContext.request.contextPath}/image/meet1.jpg \" width=\"100%\";></center>")

																															if (this.roomType == "视屏会议室") {
																																$row
																																		.append(" <div class=\"card-footer bg-light text-center\">\n"
																																				+ "<a href=\"${pageContext.request.contextPath }/meetroom/videoremeet?id="
																																				+ this.roomId
																																				+ "&date="
																																				+ date
																																				+ "&time="
																																				+ time
																																				+ "&duration="
																																				+ duration
																																				+ "\" class=\"h6 text-warning\">"
																																				+ this.roomName
																																				+ "</a>\n"
																																				+ "</div>")
																															} else {

																																$row
																																		.append(" <div class=\"card-footer bg-light text-center\">\n"
																																				+ "<a href=\"${pageContext.request.contextPath }/meetroom/remmet?id="
																																				+ this.roomId
																																				+ "&date="
																																				+ date
																																				+ "&time="
																																				+ time
																																				+ "&duration="
																																				+ duration
																																				+ "\" class=\"h6 text-warning\">"
																																				+ this.roomName
																																				+ "</a>\n"
																																				+ "</div>")
																															}
																															$row
																																	.appendTo($("#meetroom"))

																														})
																									},
																									"json");

																				})

															}, "json");

										})

						var a = 1;

						$("#shoucang1").click(function() {
							$("#xingxing1").hide();
							$("#xingxing2").show();
							alert("收藏成功")

						});
						$("#shoucang2").click(function() {
							$("#xingxing1").show()
							$("#xingxing2").hide();
							alert("取消收藏")

						});

					});
</script>
</html>
