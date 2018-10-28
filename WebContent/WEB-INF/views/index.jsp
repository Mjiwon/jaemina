<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- JAEMINA_HOME -->
<link
	href="${pageContext.servletContext.contextPath }/css/home_css/bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath }/css/home_css/modern-business.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<style type="text/css">
u {
	text-decoration: none;
	border-bottom: 2px solid;
	padding-bottom: 2px;
}
</style>

<title>JAEMINA_HOME</title>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.html">JAEMINA</a>

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

	<header>
		<div id="carouselExampleIndicators" class="carousel"
			data-ride="carousel">
			<div class="carousel-inner" role="listbox">

				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('${pageContext.servletContext.contextPath }/images/home_images/2.jpeg'); background-size:cover;">
					<div class="carousel-caption d-none d-md-block">
						<div class="row">
							<div class="col">
								<u><b><font size="3">등록된 서비스</font></b></u> <br /> <b><font
									size="6">5건</font></b>
							</div>
							<div class="col">
								<u><b><font size="3">총 거래 건 수</font></b></u> <br /> <b><font
									size="6">5건</font></b>
							</div>
							<div class="col">
								<u><b><font size="3">의뢰인 평균 만족도</font></b></u> <br /> <b><font
									size="6">98%</font></b>
							</div>

						</div>
					</div>
				</div>

			<form action="${pageContext.servletContext.contextPath }/board/searchList.do" method="post">
				<div id="r" class="row">
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..." aria-label="Search for..." id="searchKey" name="searchKey">
							<span class="input-group-btn">
								<button class="btn btn-secondary" type="submit">Go!</button>
							</span>
						</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container" style="padding-bottom: 20px;">

		<div id="row_1" class="row">
			<div class="col-lg-3">
				<img class="rounded-circle"
					src="${pageContext.servletContext.contextPath }/images/home_images/web.svg"
					alt="Generic placeholder image" width="140" height="140">
				<h5>디자인</h5>
				<p>
					<a class="btn btn-secondary" href="#" role="button">View
						details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->

			<div class="col-lg-3	">
				<img class="rounded-circle"
					src="${pageContext.servletContext.contextPath }/images/home_images/ux.svg"
					alt="Generic placeholder image" width="140" height="140">
				<h5>IT·프로그래밍</h5>
				<p>
					<a class="btn btn-secondary" href="#" role="button">View
						details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->

			<div class="col-lg-3">
				<img class="rounded-circle"
					src="${pageContext.servletContext.contextPath }/images/home_images/motion.svg"
					alt="Generic placeholder image" width="140" height="140">
				<h5>콘텐츠 제작</h5>
				<p>
					<a class="btn btn-secondary" href="#" role="button">View
						details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->

			<div class="col-lg-3">
				<img class="rounded-circle"
					src="${pageContext.servletContext.contextPath }/images/home_images/mobile-ui.svg"
					alt="Generic placeholder image" width="140" height="140">
				<h5>마케팅</h5>
				<p>
					<a class="btn btn-secondary" href="#" role="button">View
						details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
		</div>
		<!-- /.row -->

		<!-- Portfolio Section -->
		<h3>마케팅 카테고리</h3>
		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="${pageContext.servletContext.contextPath }/images/home_images/post1.png"
						alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project One</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Two</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Three</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<h3>디자인 카테고리</h3>
		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Four</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Five</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Six</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
		<div align="center" style="border: 1px gray solid;">
			<br />
			<h4>카테고리별 전문가 랭킹</h4>
			<div class="row">
				<div class="col">
					<label>디자인</label>
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">1위</th>
								<td>꿈쏙에</td>
								<td><A href="#">saan</A></td>
							</tr>
							<tr>
								<th scope="row">2위</th>
								<td>Jacob</td>
								<td><A href="#">jiwoni</A></td>
							</tr>
							<tr>
								<th scope="row">3위</th>
								<td>Larry</td>
								<td><A href="#">hjhhjh</A></td>
							</tr>
							<tr>
								<th scope="row">4위</th>
								<td>Larry</td>
								<td><A href="#">hjhhjh</A></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col">
					<label>IT·프로그래밍</label>
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">1위</th>
								<td>꿈쏙에</td>
								<td><A href="#">saan</A></td>
							</tr>
							<tr>
								<th scope="row">2위</th>
								<td>Jacob</td>
								<td><A href="#">jiwoni</A></td>
							</tr>
							<tr>
								<th scope="row">3위</th>
								<td>Larry</td>
								<td><A href="#">hjhhjh</A></td>
							</tr>
							<tr>
								<th scope="row">4위</th>
								<td>Larry</td>
								<td><A href="#">hjhhjh</A></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col">
					<label>문서작성</label>
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">1위</th>
								<td>꿈쏙에</td>
								<td><A href="#">saan</A></td>
							</tr>
							<tr>
								<th scope="row">2위</th>
								<td>Jacob</td>
								<td><A href="#">jiwoni</A></td>
							</tr>
							<tr>
								<th scope="row">3위</th>
								<td>Larry</td>
								<td><A href="#">hjhhjh</A></td>
							</tr>
							<tr>
								<th scope="row">4위</th>
								<td>Larry</td>
								<td><A href="#">hjhhjh</A></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
	</footer>
</body>

</html>