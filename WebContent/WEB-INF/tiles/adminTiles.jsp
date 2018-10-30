<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	href="${path}/css/admin/*.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>재미나 - 관리자</title>
</head>
<body>

	<nav>
		<tiles:insertAttribute name="nav" />
	</nav>

	<div class="container-fluid" style="margin-top: 5%;">
		<div class="row">
			<div class="col-2" style="margin-left: 1%;" >
				<tiles:insertAttribute name="left" />
			</div>
			<div class="col">
				<tiles:insertAttribute name="center" />
			</div>
		</div>
	</div>
		
	

</body>
</html>