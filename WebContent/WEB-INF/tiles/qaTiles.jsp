<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel=""
	href="${path }/css/admin.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>재미나 - 관리자</title>
</head>
<body>
	<div class="container">
		<tiles:insertAttribute name="nav" />
		<div class="bd-example-container bd-example-container-fluid">
			<div class="bd-example-container-header">
				<tiles:insertAttribute name="center" />
			</div>
			<div class="bd-example-container-sidebar">
				<tiles:insertAttribute name="rigth" />
			</div>
		</div>
	</div>

</body>
</html>