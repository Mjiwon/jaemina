<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>

<div class="container" style="margin-top: 5%;">

	<div class="row">
		<div class="col-2">
			<div class="nav flex-column nav-pills" id="v-pills-tab"
				role="tablist" aria-orientation="vertical">
				<a class="nav-link active alert-light" id="v-pills-home-tab" data-toggle="pill"
					href="#v-pills-home" role="tab" aria-controls="v-pills-home"
					aria-selected="true">판매관리</a> <a class="nav-link alert-light"
					id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile"
					role="tab" aria-controls="v-pills-profile" aria-selected="false">수익관리</a>
			</div>
		</div>
		<div class="col-9">
			<div class="tab-content" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="v-pills-home"
					role="tabpanel" aria-labelledby="v-pills-home-tab">
					<div align="right">
						<label class="alert-warning">총 판매 건수 : ${sellListCnt }건</label>
					</div>
					<div class="row"
						style="text-align: center; border: 1px solid gray; border-radius: 2px; padding-top: 3px;">
						<div class="col col-1" style="width: 45px;">
							<b>NO</b>
						</div>
						<div class="col col-lg-3 ">
							<b>제 목</b>
						</div>
						<div class="col col-lg-2">
							<b>날짜</b>
						</div>
						<div class="col col-lg-2">
							<b>금액</b>
						</div>
						<div class="col col-lg-2">
							<b>판매상태</b>
						</div>
						<div class="col">
							<b>상태변경</b>
						</div>

					</div>

					<c:forEach var="sell" items="${sellList }" varStatus="status">
						<div class="row"
							style="text-align: center; border: 1px solid gray; border-radius: 2px; padding-top: 3px;">
							<div class="col col-1" style="width: 45px;">${status.count}</div>
							<div class="col col-lg-3 ">${sell.TITLE }</div>
							<div class="col col-lg-2">
								<fmt:formatDate value="${sell.BUYDATE }"
									pattern="yy-MM-dd HH:mm" />
							</div>
							<div class="col col-lg-2">
								<fmt:formatNumber>${sell.PRICE }</fmt:formatNumber>원
							</div>
							<c:choose>
								<c:when test="${sell.SELLING==6 }">
									<div class="col col-lg-2">
												<p class="card-selling">판매취소</p>
											</div>
											<div class="col col-lg-2"></div>
								</c:when>
								<c:when test="${sell.BUYING == 2}">
									<c:choose>

										<c:when test="${sell.SELLING ==  1}">
											<!-- 구매자의 환불신청이나 취소 신청시 -->
											<div class="col col-lg-2">
												<p class="card-buying">구매상태 : 구매중</p>
											</div>
											<div class="col col-lg-2">
												<p class="card-selling">판매접수
													<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}&no=${sell.NO}&selling=2" class="btn btn-primary">판매중</a>
												</p>
												<p class="card-selling">판매접수
													<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}&no=${sell.NO}&selling=6" class="btn btn-primary">판매취소</a>
												</p>
											</div>
										</c:when>
										<c:when test="${sell.SELLING ==  2}">
											<div class="col col-lg-2">
												<p class="card-buying">구매상태 : 구매중</p>
											</div>
											<div class="col col-lg-2">
												<p class="card-selling">
													<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}&no=${sell.NO}&selling=3" class="btn btn-primary">판매완료</a>
												</p>
												<p class="card-selling">
													<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}&no=${sell.NO}&selling=6" class="btn btn-primary">판매취소</a>
												</p>
											</div>
										</c:when>
										<c:when test="${sell.SELLING ==  3}">
											<div class="col col-lg-2">
												<p class="card-selling">판매완료</p>
											</div>
											<div class="col col-lg-2"></div>
										</c:when>
										
									</c:choose>
								</c:when>
								
								<c:when test="${sell.BUYING==4 }">
									<c:choose>
										<c:when test="${sell.SELLING != 5 }">
										<div class="col col-lg-2">
											<p class="card-selling">구매상태 : 환불신청</p>
										</div>
										<div class="col col-lg-2">
										<p class="card-selling">
											<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}&no=${sell.NO}&selling=5" class="btn btn-primary">환불</a>
										</p>
										</div>
										</c:when>
			
									</c:choose>
								</c:when>
								<c:when test="${sell.SELLING==5 }">
									<div class="col col-lg-2">
										<p class="card-selling">환불완료</p>
									</div>
									<div class="col col-lg-2"></div>
								</c:when>
								
							</c:choose>
						</div>
					</c:forEach>
				</div>
				<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
					aria-labelledby="v-pills-profile-tab">
					<input type="date" id="date1">부터 <input type="date"
						id="date2">까지

					<!-- 월별 -->
					<button type="button" id="ybtn" value="year">연도별</button>
					<script type="text/javascript">
						$("#ybtn")
								.on(
										"click",
										function() {

											console.log(this.value)

											var date1 = $("#date1").val();
											var date2 = $("#date2").val();
											console.log(date1);
											console.log(date2);
											var param = {
												"seller" : "${user.ID}",
												"date_type" : this.value,
												"date1" : date1,
												"date2" : date2,
											}

											$
													.post(
															"${pageContext.servletContext.contextPath }/ajaxchart.do",
															param)
													.done(
															function(rst) {
																console
																		.log(rst);

																google.charts
																		.load(
																				'current',
																				{
																					'packages' : [ 'corechart' ]
																				});
																google.charts
																		.setOnLoadCallback(drawChart);

																function drawChart() {
																	var data = google.visualization
																			.arrayToDataTable(rst);

																	console
																			.log(data);
																	var options = {

																		title : '수입'
																	};

																	var chart = new google.visualization.AreaChart(
																			document
																					.getElementById('chart_div'));
																	chart
																			.draw(
																					data,
																					options);
																}
															});
											ytotal();
										});
						
						var ytotal = function(){
							var date1 = $("#date1").val();
							var date2 = $("#date2").val();
							var ty = $("#ybtn").val();
							console.log(date1);
							console.log(date2);
							var param = {
								"seller" : "${user.ID}",
								"date_type" : ty,
								"date1" : date1,
								"date2" : date2,
							}
							$
							.post(
									"${pageContext.servletContext.contextPath }/ajaxsum.do",
									param)
							.done(
									function(rst) {
										console.log(rst);
										
										var html = "";
										
										html+= "<div id=\"totalsum\" style=\"margin-top: 2%;\" class=\"alert-warning\"> 총 수입 : "+ rst.sum+"</div>";
										$("#totalsum").html(html); 
										
										
									});
						};
						
						var mtotal = function(){
							var date1 = $("#date1").val();
							var date2 = $("#date2").val();
							var ty = $("#ybtn").val();
							console.log(date1);
							console.log(date2);
							var param = {
								"seller" : "${user.ID}",
								"date_type" : ty,
								"date1" : date1,
								"date2" : date2,
							}
							$
							.post(
									"${pageContext.servletContext.contextPath }/ajaxsum.do",
									param)
							.done(
									function(rst) {
										console.log(rst);
										
										var html = "";
										
										html+= "<div id=\"totalsum\" style=\"margin-top: 2%;\" class=\"alert-warning\"> 총 수입 : "+ rst.sum+"</div>";
										$("#totalsum").html(html); 
										
										
									});
						};
						
						var dtotal = function(){
							var date1 = $("#date1").val();
							var date2 = $("#date2").val();
							var ty = $("#ybtn").val();
							console.log(date1);
							console.log(date2);
							var param = {
								"seller" : "${user.ID}",
								"date_type" : ty,
								"date1" : date1,
								"date2" : date2,
							}
							$
							.post(
									"${pageContext.servletContext.contextPath }/ajaxsum.do",
									param)
							.done(
									function(rst) {
										console.log(rst);
										
										var html = "";
										
										html+= "<div id=\"totalsum\" style=\"margin-top: 2%;\" class=\"alert-warning\"> 총 수입 : "+ rst.sum+"</div>";
										$("#totalsum").html(html); 
										
										
									});
						};
					</script>
					<!-- 월별 -->
					<button type="button" id="mbtn" value="moon">월별</button>
					<script type="text/javascript">
						$("#mbtn")
								.on(
										"click",
										function() {

											console.log(this.value)

											var date1 = $("#date1").val();
											var date2 = $("#date2").val();
											console.log(date1);
											console.log(date2);
											var param = {
												"seller" : "${user.ID}",
												"date_type" : this.value,
												"date1" : date1,
												"date2" : date2,
											}

											$
													.post(
															"${pageContext.servletContext.contextPath }/ajaxchart.do",
															param)
													.done(
															function(rst) {
																console
																		.log(rst);

																google.charts
																		.load(
																				'current',
																				{
																					'packages' : [ 'corechart' ]
																				});
																google.charts
																		.setOnLoadCallback(drawChart);

																function drawChart() {
																	var data = google.visualization
																			.arrayToDataTable(rst);

																	console
																			.log(data)
																	var options = {

																		title : '수입'
																	};

																	var chart = new google.visualization.AreaChart(
																			document
																					.getElementById('chart_div'));
																	chart
																			.draw(
																					data,
																					options);
																}
															});
											mtotal();
											
										});
					</script>

					<!-- 일별 -->
					<button type="button" id="dbtn" value="day">일별</button>
					<script type="text/javascript">
						$("#dbtn")
								.on(
										"click",
										function() {

											console.log(this.value)

											var date1 = $("#date1").val();
											var date2 = $("#date2").val();
											console.log(date1);
											console.log(date2);
											var param = {
												"seller" : "${user.ID}",
												"date_type" : this.value,
												"date1" : date1,
												"date2" : date2,
											}

											$
													.post(
															"${pageContext.servletContext.contextPath }/ajaxchart.do",
															param)
													.done(
															function(rst) {
																console
																		.log(rst);

																google.charts
																		.load(
																				'current',
																				{
																					'packages' : [ 'corechart' ]
																				});
																google.charts
																		.setOnLoadCallback(drawChart);

																function drawChart() {
																	var data = google.visualization
																			.arrayToDataTable(rst);

																	console
																			.log(data)
																			
																			console.log(rst + "rst");
																	var options = {
																		title : '수입'
																	};

																	var chart = new google.visualization.AreaChart(
																			document
																					.getElementById('chart_div'));
																	chart
																			.draw(
																					data,
																					options);
																}
															});
											dtotal();
										});
					</script>
					
					<div id="totalsum" class="alert-warning"></div>
					<div id="chart_div" style="width: 900px; height: 500px;">
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
