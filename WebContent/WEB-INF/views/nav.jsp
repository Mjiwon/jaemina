<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.servletContext.contextPath }/index.do">JAEMINA</a>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<c:choose>
					<c:when test="${empty auth}">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item">
								<button type="button" class="btn btn-light">
									<a href="${pageContext.servletContext.contextPath }/login.do"
										style="color: black;">판매시작</a>
								</button>
							</li>
							<li class="nav-item">
								<button type="button" class="btn btn-secondary">
									<a href="${pageContext.servletContext.contextPath }/login.do"
										style="color: white;">로그인</a>
								</button>
							</li>
							<li class="nav-item">
								<button type="button" class="btn btn-primary">
									<a href="${pageContext.servletContext.contextPath }/join.do"
										style="color: white;">회원가입</a>
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
							<li class="nav-item"><a class="nav-link disabled" href="#"
								style="color: black;"><b>메세지</b></a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle btn-primary"
								data-toggle="dropdown" href="#" role="button"
								aria-haspopup="true" aria-expanded="false"
								style="color: white; border-radius: 10px;">
									<button type="button" class="btn btn-primary">
										<b>${user.ID }</b>
									</button>
							</a>
								<div class="dropdown-menu btn btn-ligh btn btn-primary">
									<a class="dropdown-item"
										href="${pageContext.servletContext.contextPath }/sellHistory.do"><b
										style="color: green;">${user.ID }</b>의 재미나</a> <a
										class="dropdown-item"
										href="${pageContext.servletContext.contextPath }/myboard.do">프로필</a>
									<a class="dropdown-item"
										href="${pageContext.servletContext.contextPath }/modified.do">계정설정</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item"
										href="${pageContext.servletContext.contextPath }/serviceqa.do">고객센터</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">로그아웃</a>
								</div></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>