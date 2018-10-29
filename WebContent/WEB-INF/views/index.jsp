<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
									size="6">${boardCount }건</font></b>
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
			 <c:forEach var="big" items="${bigcate }">
				<div class="col-lg-2">
					<img class="rounded-circle"
						src="${pageContext.servletContext.contextPath }/images/home_images/${big.NO }.svg"
						alt="Generic placeholder image" width="100" height="140">
					<h5>${big.BIGCATE }</h5>
					<p>
						<a class="btn btn-secondary" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${big.NO}" role="button">View
							details &raquo;</a>
					</p>
				</div>
			</c:forEach>
		</div>

		<%-- <div id="row_1" class="row">
			<div class="col-lg-3">
				<img class="rounded-circle"
					src="${pageContext.servletContext.contextPath }/images/home_images/web.svg"
					alt="Generic placeholder image" width="140" height="140">
				<h5>디자인</h5>
				
				<p>
					<a class="btn btn-secondary" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=2" role="button">View
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
					<a class="btn btn-secondary" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=1" role="button">View
						details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->

			<div class="col-lg-3">
				<img class="rounded-circle"
					src="${pageContext.servletContext.contextPath }/images/home_images/motion.svg"
					alt="Generic placeholder image" width="140" height="140">
				<h5>레슨</h5>
				<p>
					<a class="btn btn-secondary" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=5" role="button">View
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
					<a class="btn btn-secondary" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=3" role="button">View
						details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
		</div> --%>
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
						src="${pageContext.servletContext.contextPath }/images/home_images/post2.png" alt=""></a>
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
						src="${pageContext.servletContext.contextPath }/images/home_images/post3.png" alt=""></a>
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