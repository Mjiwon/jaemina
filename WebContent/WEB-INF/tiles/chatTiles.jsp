<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>재능을 나누다 - 재미나</title>
</head>
<body>
	<div>
		<div>
			<tiles:insertAttribute name="nav" />
		</div>
		<div class="row">
			<div class="col-md-8 order-md-1" style="margin-top: 6%; margin-left: 3%;">
				<tiles:insertAttribute name="center" />
			</div>
			<div class="col-md-3 order-md-2 mb-3" style="margin-top: 6%;">
				<tiles:insertAttribute name="rigth" />
			</div>
		</div>
	</div>
</body>
</html>