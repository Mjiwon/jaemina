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
		<div class="py-5 text-center" id="title">
			<img class="d-block mx-auto mb-4"
				src="../../assets/brand/bootstrap-solid.svg" alt="" width="72"
				height="72">
			<h2>제목 : ${detail.TITLE }</h2>
		</div>
		<div class="col-md-8 order-md-1">
			<h4 class="mb-3">카테고리 : ${cate.BIGCATE} : ${cate.SMALLCATE}</h4>
			<form class="needs-validation"
				action="${pageContext.servletContext.contextPath }/board/detailUpdate.do" method="post" id="modifybtn"
				novalidate>
				<div class="mb-3">
					<label for="username">작성 날짜</label>
					<div class="input-group" style="">
						<input type="text" class="form-control" id="date"
							value="${detail.WRDATE}" style="background-color: white;"
							readonly>
					</div>
				</div>

				<div class="mb-3">
					<label for="username">작성자</label>
					<div class="input-group">
						<input type="text" class="form-control" id="writer" name="writer"
							value="${detail.WRITER }" readonly="readonly"
							style="background-color: white;">
						<div class="invalid-feedback" style="width: 100%;">Your
							username is required.</div>
					</div>
				</div>
				
				<div class="mb-3">
							<label>Title이미지</label>
							<input 	type="file" class="form-control" id="img" name="imgpath">
						</div>
				

				<div class="mb-3">
					<label for="username">금액</label>
					<div class="input-group">
						<input type="number" class="form-control" id="price" name="price"
							value="${detail.PRICE }" required autofocus>
					</div>
				</div>

				<div class="mb-3">
					<label for="address">내용</label>
					<textarea rows="12" cols="81" class="form control" id="content"
						name="content" required autofocus>${detail.CONTENT }</textarea>
					<div class="invalid-feedback">내용을 입력해주세요.</div>
				</div>

				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="button" id="modify">수정
					완료</button>
			</form>
		</div>
	</div>

	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2018-2019 재미나</p>
	</footer>
	</div>
	
	<script type="text/javascript">
		$("#modify").on("click", function() {
			if(window.confirm("수정하시겠습니까?") == true) {
				window.alert("수정되었습니다.");
				$("#modifybtn").trigger("submit");				
			}else {
				return;
			}
		});
	</script>
</body>
</html>