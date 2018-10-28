<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/detail.css">
	<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="icon" href="../../../../favicon.ico">

<title>${detail.TITLE }</title>

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.photo {
    width: 100px; height: 100px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
}
</style>

</head>

<body class="bg-light">

	<div class="container">
		<div class="py-5 text-center" align="center">
			<img class=".photo"
				src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}" />

			<h2>${Seller.ID }</h2>
		</div>

		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
				</h4>


				<div class="card p-2">
					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<p>● 학력</p>
							<p>${Seller.ACADEMY}</p>
							<p>● 경력사항</p>
							<p>${Seller.CAREER }</p>
							<p>● 소개</p>
							<p>${Seller.INTRODUCE }</p>
							<form
								action="${pageContext.servletContext.contextPath}/update_seller.do"
								method="get">
								<input type="submit" value="정보수정">
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">${Seller.ID }님의서비스|포트폴리오</h4>
				<div class="album py-5 bg-light">
					<div class="container">
						<div class="row">
							<c:forEach var="i" items="${MyBoard }">
								<div class="col-md-4">
									<a
										href="${pageContext.servletContext.contextPath }/board/detail.do?no=${l.NO}">
										<div class="card mb-4 shadow-sm">
											<img class="card-img-top"
												src="${pageContext.servletContext.contextPath }${i.IMGPATH}"
												width="286" height="180">
											<div class="card-body">
												<p class="card-text">${i.TITLE }</p>
												<p class="card-text" style="color: red;">
													<b><fmt:formatNumber>${i.PRICE }</fmt:formatNumber>원</b>
												</p>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write(
								'<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/vendor/holder.min.js"></script>
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
						(
								function() {
									'use strict';

									window
											.addEventListener(
													'load',
													function() {
														// Fetch all the forms we want to apply custom Bootstrap validation styles to
														var forms = document
																.getElementsByClassName('needs-validation');

														// Loop over them and prevent submission
														var validation = Array.prototype.filter
																.call(
																		forms,
																		function(
																				form) {
																			form
																					.addEventListener(
																							'submit',
																							function(
																									event) {
																								if (form
																										.checkValidity() === false) {
																									event
																											.preventDefault();
																									event
																											.stopPropagation();
																								}
																								form.classList
																										.add('was-validated');
																							},
																							false);
																		});
													}, false);
								})();
	</script>

</body>
</html>
