<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentPage">${currentPage }</c:set>
<c:set var="totalPage">${totalPage }</c:set>
<c:set var="pageBlock">5</c:set>

<fmt:parseNumber var="currentBlock" integerOnly="true"
	value="${currentPage/pageBlock }" />
<fmt:parseNumber var="lastBlock" integerOnly="true"
	value="${totalPage/pageBlock }" />
<c:if test="${currentPage%pageBlock == 0 }">
	<c:set var="currentBlock" value="${currentBlock -1 }" />
</c:if>
<c:set var="startNum" value="${currentBlock*pageBlock+1 }" />
<c:set var="endNum" value="${currentBlock*pageBlock+pageBlock }" />
<c:if test="${endNum > totalPage }">
	<c:set var="endNum" value="${totalPage }" />
</c:if>

<c:if test="${chageok==0}">
	<script type="text/javascript">
		window.alert("비밀번호가 변경되었습니다.");
	</script>
</c:if>

<style>
.dropdown-submenu {
	position: relative;
	/* left:-100px; */
}

.dropdown-submenu .dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -1px;
}

#right_sidebar {
	margin-left: 3%;
}

#id_button {
	background: none;
	padding: 0;
	margin-top: 10px;
	position: relative;
}

#id_button2 {
	background: none;
	padding: 0;
	margin-top: 10px;
	position: relative;
}

#id_button2 .btn {
	text-decoration: none;
	color: white;
}

#id_button2 .btn:hover {
	text-decoration: none;
	color: #ea1d5d;
}

#r_sidebar .navbar-nav .dropdown {
	border: 2px solid red;
	display: inline-block;
}

.drop_scroll .dropdown-menu a {
	display: inline-block;
	width: 250px;
}

.drop_scroll.dropdown:hover>div.dropdown-menu {
	display: block;
	margin: 0;
}
</style>

<div class="header-bar">
	<div class="container-fluid">
		<div class="hedder-up row">
			<div class="col-lg-3 col-md-3 logo-head">
				<h1>
					<a class="navbar-brand"
						href="${pageContext.servletContext.contextPath }/index.do">JAEMINA</a>
				</h1>
			</div>
			<div class="col-lg-5 col-md-6 search-right">
				<form class="form-inline my-lg-0"
					action="${pageContext.servletContext.contextPath }/board/searchList.do?currentPage=1"
					method="post">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" name="searchKey">
					<button class="btn" type="submit">Search</button>
				</form>
			</div>

			<c:choose>
				<c:when test="${empty auth}">
					<div class="col-lg-3 col-md-3 right-side-cart" id="right_sidebar">
						<div class="cart-icons">
							<ul>
								<li>
									<button style="margin-right: 20px;">
										<span class="" id="sellstart" style="color: #fff;">
											판매시작</span>
									</button>
								</li>
								<li>
									<button type="button" data-toggle="modal"
										data-target="#exampleModal" id="login" name="loginauth">
										<span class="" style="font-size: 16px;"> 로그인</span>
									</button>
								</li>
								<li class="toyscart toyscart2 cart cart box_1">
									<form action="#" method="post" class="last">
										<input type="hidden" name="cmd" value="_cart"> <input
											type="hidden" name="display" value="1">
										<button class="" type="submit" name="submit" value="">
											<span class="far fa-user" id="join" style="font-size: 16px;">
												회원가입</span>
										</button>
									</form>
								</li>
							</ul>
						</div>
					</div>
				</c:when>

				<c:when test="${!empty adminmode}">
					<ul class="navbar-nav ml-auto" style="position: absolute;">

						<li class="nav-item">
							<button type="button" class="btn btn-primary">
								<a
									href="${pageContext.servletContext.contextPath }/admin/index.do"
									style="color: white;">관리자페이지</a>
							</button>
						</li>
					</ul>
				</c:when>

				<c:otherwise>
					<nav class="navbar navbar-expand-lg navbar-light" id="id_button">
						<div class="collapse navbar-collapse justify-content-center"
							id="navbarSupportedContent">
							<ul class="navbar-nav ">

								<li class="nav-item dropdown" style="width: 20%; float: left;">
									<button type="button" class="btn btn-secondary dropdown-toggle"
										data-toggle="dropdown">
										<b>${user.ID }</b><span class="caret"></span>
									</button>
									<ul class="dropdown-menu dropright"
										style="background-color: white; background-color: white; justify-content: center;">
										<li><a class="dropdown-item"
											href="${pageContext.servletContext.contextPath }/history.do"><b
												style="color: green;">${user.ID }</b>의 재미나</a></li>
										<li><a class="dropdown-item" id="jamilog"
											href="javascript:jamilog">나의 재미로그</a></li>
										<li class="dropdown-submenu"><a
											class="dropdown-item dropdown-toggle test"
											data-toggle="dropdown" style="width: 200px; height: 100%;"> 관심 판매자 목록 <span class="caret"></span></a>
											<ul class="dropdown-menu dropright sub">
												<c:choose>
													<c:when test="${!empty wishlist}">
														<c:forEach var="l" items="${wishlist }">
															<li><a class="dropdown-item slog" id="${l.SELLER }">${l.SELLER }</a></li>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<li><a class="dropdown-item">관심 등록한 판매자가 없습니다.</a></li>
													</c:otherwise>
												</c:choose>
											</ul></li>
										<li class="dropdown-submenu"><a
											class="dropdown-item dropdown-toggle test"
											data-toggle="dropdown" style="width: 100%; height: 100%;">계정설정<span class="caret"></span></a>
											<ul class="dropdown-menu dropright sub">
												<li><a class="dropdown-item" id="changePass"
													href="javascript:changePass">비밀번호 변경</a></li>
												<li><a class="dropdown-item" id="deleteUser"
													href="javascript:deleteUser">회원 탈퇴</a></li>
											</ul> <a class="dropdown-item"
											href="${pageContext.servletContext.contextPath }/serviceqa.do">고객센터</a>
											<div class="dropdown-divider"></div> <a class="dropdown-item"
											href="javascript:goLogout();">로그아웃</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</nav>


					<nav class="navbar navbar-expand-lg navbar-light" id="id_button2">
						<div class="collapse navbar-collapse justify-content-center"
							id="navbarSupportedContent">
							<ul class="navbar-nav ">

								<li class="nav-item dropdown" style="color: white;">
									<button type="button" class="btn btn-link dropdown-toggle"
										data-toggle="dropdown">
										<b>메세지</b>
										<c:choose>
											<c:when test="${!empty newss}">
												<span class="badge badge-pill badge-primary">new</span>
											</c:when>
											<c:otherwise>
												<span id="news"> </span>
											</c:otherwise>
										</c:choose>
									</button>
									<ul class="dropdown-menu dropright">
										<li><c:choose>
												<c:when test="${!empty chatList }">
													<c:forEach var="i" items="${chatList }">
														<a
															href="${pageContext.servletContext.contextPath }/qa/buyqa.do?no=${i.no }&writer=${i.writer}&members=${i.member[0]}&members=${i.member[1]}"
															class="dropdown-item">${i.member }<span
															id="${i.room }" class="listnew"></span> <c:if
																test="${i.noCheck==true }">
																<span class="badge badge-pill badge-primary">new</span>
															</c:if>
														</a>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<span>메세지가 없습니다.</span>
												</c:otherwise>
											</c:choose></li>
									</ul>
								</li>


							</ul>
						</div>
					</nav>

					<div id="r_sidebar" style="width: 25%;">
						<ul class="navbar-nav "
							style="display: inline-block; width: 30%; margin-top: 9px; position: absolute; top: 0; right: -130px; margin-top: 27px">
							<c:if test="${sellerinfo != null }">
								<li class="nav-item"><a class="nav-link disabled"
								style="float: left;"
								href="${pageContext.servletContext.contextPath }/write.do"><b>판매글올리기</b></a></li>
							</c:if>
							<c:if test="${sellerinfo == null }">
								<li class="nav-item"><a class="nav-link disabled"
									style="float: left;"
									href="${pageContext.servletContext.contextPath }/addseller.do"><b>판매자
											등록하기</b></a></li>
							</c:if>
							<li class="nav-item"><a class="nav-link disabled"
								style="float: left;"
								href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=1&currentPage=1"><b>구매</b></a></li>
						</ul>

					</div>

				</c:otherwise>

			</c:choose>
		</div>
	</div>

	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarSupportedContent">


			<ul class="navbar-nav ">

				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.servletContext.contextPath }/index.do">Home <span class="sr-only">(current)</span></a></li>
				<c:forEach var="big"
						items="${bigcate }" varStatus="ss">
				<li class="nav-item dropdown drop_scroll">
						<a class="nav-link dropdown-toggle"
							href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${big.NO }&currentPage=1"
							id="navbarDropdown" role="button" data-toggle=""
							aria-haspopup="true" aria-expanded="false">${big.BIGCATE }</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
			
							<c:forEach var="small" items="${smallcate }" varStatus="stauts">
								<c:if test="${small.BIGNO==bigcate.get(ss.count-1).NO }">
								<a class="nav-link"
									href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigcate.get(ss.count-1).NO }&smallcate=${small.SMALLNO }&currentPage=1">${small.SMALLCATE }</a>								
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
				</li>
				<%-- <a class="nav-link dropdown-toggle" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=1&currentPage=1" id="navbarDropdown" role="button" data-toggle="" aria-haspopup="true" aria-expanded="false">IT·프로그래밍</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=1&smallcate=1&currentPage=1">워드프레스</a>
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=1&smallcate=2&currentPage=1">웹사이트 개발</a>
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=1&smallcate=3&currentPage=1">쇼핑몰/커머스</a>
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=1&smallcate=4&currentPage=1">프로그램 개발</a>
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=1&smallcate=5&currentPage=1">모바일앱/웹</a>
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=1&smallcate=6&currentPage=1">게임</a>
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=1&smallcate=7&currentPage=1">데이터베이스</a>						
                  	</div>
               	</li>
				<li class="nav-item dropdown drop_scroll">
					<a class="nav-link dropdown-toggle" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=2&currentPage=1" id="navbarDropdown" role="button" data-toggle="" aria-haspopup="true" aria-expanded="false">디자인</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=2&smallcate=1&currentPage=1">로고디자인</a>
						<a class="nav-link" href="typography.html">명함/인쇄물</a>
						<a class="nav-link" href="typography.html">배너/상세페이지</a>
						<a class="nav-link" href="typography.html">웹/모바일 디자인</a>
						<a class="nav-link" href="typography.html">PPT/인포그래픽</a>
                  	</div>
               	</li>
				<li class="nav-item dropdown drop_scroll">
					<a class="nav-link dropdown-toggle" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=3&currentPage=1" id="navbarDropdown" role="button" data-toggle="" aria-haspopup="true" aria-expanded="false">마케팅</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=3&smallcate=1&currentPage=1">SNS마케팅</a>
						<a class="nav-link" href="typography.html">바이럴마케팅</a>
						<a class="nav-link" href="typography.html">영상/PPL</a>
						<a class="nav-link" href="typography.html">상위노출/검색작업</a>
						<a class="nav-link" href="typography.html">검색최적화</a>
						<a class="nav-link" href="typography.html">키워드광고</a>
						<a class="nav-link" href="typography.html">카페/블로그</a>						
                  	</div>
               	</li>
				<li class="nav-item dropdown drop_scroll">
					<a class="nav-link dropdown-toggle" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=4&currentPage=1" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">문서작성</a>
	                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=4&smallcate=1&currentPage=1">자기소개서/이력서</a>
						<a class="nav-link" href="typography.html">카피라이팅</a>
						<a class="nav-link" href="typography.html">학문/논설</a>
						<a class="nav-link" href="typography.html">사업계획서/제안서</a>
						<a class="nav-link" href="typography.html">보고서/리포트</a>
	                </div>
				</li>
				<li class="nav-item dropdown drop_scroll">
					<a class="nav-link dropdown-toggle" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=5&currentPage=1" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">레슨</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=5&smallcate=1&currentPage=1">외국어</a>
						<a class="nav-link" href="product.html">입시/학업</a>
						<a class="nav-link" href="product.html">컴퓨터</a>
						<a class="nav-link" href="product.html">그래픽디자인</a>
						<a class="nav-link" href="product.html">사진</a>
						<a class="nav-link" href="product.html">영상</a>
						<a class="nav-link" href="product.html">공예</a>
						<a class="nav-link" href="product.html">음악</a>
					</div>
				</li>
				<li class="nav-item dropdown drop_scroll">
					<a class="nav-link dropdown-toggle" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=6&currentPage=1" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">핸드메이드</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="nav-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=6&smallcate=1&currentPage=1">리빙/오피스</a>
						<a class="nav-link" href="product.html">패션</a>
						<a class="nav-link" href="product.html">뷰티</a>
						<a class="nav-link" href="product.html">푸드</a>
					</div>
				</li> --%>
			</ul>
		</div>
	</nav>
</div>

<script>
	$("#jamilog")
			.on(
					"click",
					function() {
						if(${sellerinfo!=null}){
						window
								.open(
										"${pageContext.servletContext.contextPath }/jaemilog.do?currentPage=1",
										"f",
										"width=1000, height=700, left=700, top=200");
						}
						else
							window.alert("판매자 등록 후 이용 가능합니다")
						});

	$(".slog").on(
			"click",
			function() {
				console.log($(this).attr("id"));
				/*${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${l.SELLER}&currentPage=1" */
				window.open(

				"${pageContext.servletContext.contextPath }/sellerboardlist.do?seller="
						+ $(this).attr("id") + "&currentPage=1", "f",
						"width=1000, height=700, left=700, top=200");

			});

	$("#deleteUser")
			.on(
					"click",
					function() {
						window
								.open(
										"${pageContext.servletContext.contextPath }/deleteGo.do",
										"f",
										"width=500, height=500, left=700, top=200");
					});

	$("#changePass")
			.on(
					"click",
					function() {
						window
								.open(
										"${pageContext.servletContext.contextPath }/changeUser.do",
										"f",
										"width=500, height=500, left=700, top=200");
					});

	$(document).ready(function() {
		$('.dropdown-submenu a.test').on("mouseover", function(e) {
			$(".sub").hide();
			$(this).next('ul').show();
			e.stopPropagation();
			e.preventDefault();
		});
	});
	$("#csbt").on("click", function() {
		$(".sub").hide();
	});

	$("#sellstart").on(
			"click",
			function() {
				window.alert("로그인을 하셔야 이용하실 수 있습니다.");
				window.open(
						"${pageContext.servletContext.contextPath }/login.do",
						"f", "width=500, height=700, left=700, top=200");
			});

	$("#login").on(
			"click",
			function() {
				window.open(
						"${pageContext.servletContext.contextPath }/login.do",
						"f", "width=500, height=700, left=700, top=200");
			});

	var goLogout = function() {
		if (window.confirm("정말 로그아웃 하시겠습니까?")) {
			window.alert("로그아웃 되었습니다.");
			location.href = "${pageContext.servletContext.contextPath }/logout.do";
		} else {
			return;
		}
	}

	$("#join").on(
			"click",
			function() {
				window.open(
						"${pageContext.servletContext.contextPath }/join.do",
						"f", "width=500, height=700, left=700, top=200");
			});

	var ws = new WebSocket("ws://" + location.host
			+ "${pageContext.servletContext.contextPath}/waiting.do");

	ws.onmessage = function(got) {

		var obj = JSON.parse(got.data);
		switch (obj.mode) {
		case "boardQA":
			boardQAHandles(obj);
			break;
		}

	};

	var boardQAHandles = function(evt) {
		var html = "<span class=\"badge badge-pill badge-primary\">new</span>";
		$("#news").html(html);
		for (var i = 0; i < $(".listnew").length; i++) {
			if (evt.room == $(".listnew").eq(i).attr("id")) {
				$(".listnew").eq(i).html(html);
			}
		}

	}
</script>


