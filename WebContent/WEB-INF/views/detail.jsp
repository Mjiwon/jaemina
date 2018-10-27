<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="icon" href="../../../../favicon.ico">

<title>${detail.TITLE }</title>

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4"
				src="../../assets/brand/bootstrap-solid.svg" alt="" width="72"
				height="72">
			<h2>제목 : ${detail.TITLE }</h2>
		</div>

		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">판매자 정보</span>
				</h4>


				<form class="card p-2">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="${pageContext.servletContext.contextPath }${writer.IMGPATH}" alt="Card image cap" 	>
						<div class="card-body">
							<h5 class="card-title">${writer.WRITER }</h5>
							<p>판매자 : ${writer.ID }
							<p>학력 : ${writer.ACADEMY }</p>
							<p>경력 : ${writer.CAREER }</p>
							<p>소개 : ${writer.INTRODUCE }</p>
							<a href="pageContext.servletContext.contextPath }/qa/buyqa.do?no=${detail.NO }&writer=${detail.WRITER}" class="btn btn-primary">판매자에게 문의하기</a>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">카테고리 : ${detail.BIGCATE} | ${detail.SMALLCATE}</h4>
				<form class="needs-validation"
					action="${pageContext.servletContext.contextPath }/buy.do"
					novalidate>
					<div class="mb-3">
						<label for="username">작성 날짜</label>
						<div class="input-group" style="">
							<input type="text" class="form-control" id="username"
								value="${detail.WRDATE}" style="background-color: white;"
								readonly>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">작성자</label> <input type="text"
								class="form-control" id="firstName" placeholder=""
								value="${detail.WRITER }" readonly="readonly"
								style="width: 610px; background-color: white;">
							<div class="invalid-feedback" style="width: 100%;">Valid
								first name is required.</div>
						</div>
					</div>



					<div class="mb-3">
						<label for="username">금액</label>
						<div class="input-group">
							<input type="text" class="form-control" id="username"
								value="${detail.PRICE }원" readonly="readonly"
								style="background-color: white;">
							<div class="invalid-feedback" style="width: 100%;">Your
								username is required.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="address">내용</label> <input type="text"
							class="form-control" id="address" value="${detail.CONTENT }"
							readonly="readonly"
							style="background-color: white; height: 514px;">
						<div class="invalid-feedback">Please enter your shipping
							address.</div>
					</div>

					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">구매하기</button>
				</form>
			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2018-2019 재미나</p>
		</footer>
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
