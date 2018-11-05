<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${chageok==0}">
	<script type="text/javascript">
		window.alert("비밀번호가 변경되었습니다.");
	</script>
</c:if>
<style>
.dropdown-submenu {
	position: relative;
}

.dropdown-submenu .dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -1px;
}
</style>
<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
	style="background-color: gray;">
	<div class="container">
		<a class="navbar-brand"
			href="${pageContext.servletContext.contextPath }/index.do">JAEMINA</a>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<form
				action="${pageContext.servletContext.contextPath }/board/searchList.do"
				method="post">
				<div class="row">
					<div class="col">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..." aria-label="Search for..."
								id="searchKey" name="searchKey"> <span
								class="input-group-btn">
								<button class="btn btn-secondary" type="submit">Go!</button>
							</span>
						</div>
					</div>
				</div>
			</form>
			<c:choose>
				<c:when test="${empty auth}">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							<button type="button" class="btn btn-light">
								<a style="color: black;" id="sellstart">판매시작</a>
							</button>
						</li>
						<li class="nav-item">
							<button type="button" class="btn btn-secondary">
								<a style="color: white;" id="login">로그인</a>
							</button>
						</li>
						<li class="nav-item">
							<button type="button" class="btn btn-primary">
								<a style="color: white;" id="join">회원가입</a>
							</button>
						</li>
					</ul>
				</c:when>
				<c:when test="${!empty adminmode}">
					<ul class="navbar-nav ml-auto">

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
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link disabled"
							href="${pageContext.servletContext.contextPath }/write.do"
							style="color: black;"><b>판매글올리기</b></a></li>
						<li class="nav-item"><a class="nav-link disabled"
							href="${pageContext.servletContext.contextPath }/addbank.do"
							style="color: black;"><b>판매</b></a></li>
						<li class="nav-item"><a class="nav-link disabled"
							href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=1&currentPage=1"
							style="color: black;"><b>구매</b></a></li>
						<li class="nav-item"><a class="nav-link disabled"
							href="${pageContext.servletContext.contextPath }/qalist.do"
							style="color: black;"><b>메세지</b></a></li>
						<li class="nav-item"><c:choose>
								<c:when test="${!empty newss}">
									<span class="badge badge-pill badge-primary">new</span>
								</c:when>
								<c:otherwise>
									<span id="news"> </span>
								</c:otherwise>
							</c:choose></li>
						<li class="nav-item dropdown">
							<button type="button" class="btn btn-secondary dropdown-toggle"
								data-toggle="dropdown" id="csbt">
								<b>${user.ID }</b><span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropright"
								style="background-color: white; background-color: white; justify-content: center;">
							<li>	<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath }/sellHistory.do"><b
									style="color: green;">${user.ID }</b>의 재미나</a> 
								<li><a class="dropdown-item"
									href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=1">나의
										블로그</a></li>
								<li class="dropdown-submenu"><a
									class="dropdown-item dropdown-toggle test"
									data-toggle="dropdown"> 관심 판매자 목록 <span class="caret"></span></a>
									<ul class="dropdown-menu dropright sub">
										<c:choose>
											<c:when test="${!empty wishlist}">
												<c:forEach var="l" items="${wishlist }">
													<li><a class="dropdown-item"
														href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${l.SELLER}&currentPage=1">${l.SELLER }</a></li>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<li><a class="dropdown-item">관심 등록한 판매자가 없습니다.</a></li>
											</c:otherwise>
										</c:choose>
									</ul></li>
								<li class="dropdown-submenu"><a
									class="dropdown-item dropdown-toggle test"
									data-toggle="dropdown">계정설정<span class="caret"></span></a>
									<ul class="dropdown-menu dropright sub">
										<li><a class="dropdown-item" id="changePass"
											href="javascript:changePass">비밀번호 변경</a></li>
										<li><a class="dropdown-item" id="deleteUser" href="javascript:deleteUser">회원 탈퇴</a></li>
									</ul> <a class="dropdown-item"
									href="${pageContext.servletContext.contextPath }/serviceqa.do">고객센터</a>
									<div class="dropdown-divider"></div> <a class="dropdown-item"
									href="javascript:goLogout();">로그아웃</a></li>
							</ul>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>
<script>
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
						"f", "width=500, height=500, left=700, top=200");
			});

	$("#login").on(
			"click",
			function() {
				window.open(
						"${pageContext.servletContext.contextPath }/login.do",
						"f", "width=500, height=500, left=700, top=200");
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
			boardQAHandle(obj);
			break;
		}

	};

	var boardQAHandle = function(evt) {
		var html = "<span class=\"badge badge-pill badge-primary\">new</span>";
		$("#news").html(html);
	}
</script>