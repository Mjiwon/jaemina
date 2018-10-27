<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>판매글</title>
</head>
<body>
	<h1>판매글 리스트</h1>
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">
				<c:forEach var="l" items="${boardlist }">
					<div class="col-md-4">
						<a
							href="${pageContext.servletContext.contextPath }/board/detail.do?no=${l.NO}">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top"
									src="${pageContext.servletContext.contextPath }${l.IMGPATH}"
									width="286" height="180">
								<div class="card-body">
									<p class="card-text">${l.TITLE }</p>
									<p class="card-text" style="color: red;">
										<b><fmt:formatNumber>${l.PRICE }</fmt:formatNumber></b>
									</p>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>