<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
							href="${pageContext.servletContext.contextPath }/board/list.do"
							style="color: black;"><b>구매</b></a></li>
						<li class="nav-item"><a class="nav-link disabled"
							href="${pageContext.servletContext.contextPath }/qalist.do"
							style="color: black;"><b>메세지</b></a></li>
						<li class="nav-item">
						<c:choose>
								<c:when test="${!empty newss}">
									<span class="badge badge-pill badge-primary">new</span>
								</c:when>
								<c:otherwise>
									<span id="news"> </span>
								</c:otherwise>
							</c:choose></li>
						<li class="nav-item dropdown">
							<button type="button" class="btn btn-secondary dropdown-toggle"
								data-toggle="dropdown">
								<b>${user.ID }</b>
							</button>
							<div class="dropdown-menu dropright"
								style="background-color: white; background-color: white; justify-content: center;">
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath }/sellHistory.do"><b
									style="color: green;">${user.ID }</b>의 재미나</a> <a
									class="dropdown-item dropdown-toggle" data-toggle="dropdown">
									관심 판매자 목록 </a>
								<div class="dropdown-menu">
									<c:choose>
										<c:when test="${!empty wishlist}">
											<c:forEach var="l" items="${wishlist }">
												<a class="dropdown-item"
													href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${l.SELLER}">${l.SELLER }</a>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<a class="dropdown-item">관심 등록한 판매자가 없습니다.</a>
										</c:otherwise>
									</c:choose>
								</div>
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath }/myboard.do">나의
									블로그</a> <a class="dropdown-item"
									href="${pageContext.servletContext.contextPath }/modified.do">계정설정</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath }/serviceqa.do">고객센터</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="javascript:goLogout();">로그아웃</a>
							</div>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>
<script>
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

	var ws = new WebSocket("ws://"+location.host+"${pageContext.servletContext.contextPath}/waiting.do");
	
	ws.onmessage = function(got){
		
		var obj = JSON.parse(got.data);
		switch(obj.mode){
		case "boardQA":
			boardQAHandle(obj);
			break;
		}
		
	};
	
	var boardQAHandle = function(evt){
		var html = "<span class=\"badge badge-pill badge-primary\">new</span>";
		$("#news").html(html);
	}
</script>