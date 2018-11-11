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

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath }/css/index/bootstrap.min.css"
	rel="stylesheet" type="text/css" media="all">
<link
	href="${pageContext.servletContext.contextPath }/css/index/flexslider.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.servletContext.contextPath }/css/index/shop.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.servletContext.contextPath }/css/index/style.css"
	rel='stylesheet' type='text/css' media="all">

<script
	src="${pageContext.servletContext.contextPath }/js/jquery-2.2.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://popper.js.org"></script>
<script
	src="${pageContext.servletContext.contextPath }/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>재능을 나누다 - 재미나</title>
</head>
<body>
	<div>
		<tiles:insertAttribute name="nav" />
	</div>
	<div>
		<tiles:insertAttribute name="secondnav" />
	</div>
	<div>
		<tiles:insertAttribute name="center" />
	</div>
</body>
</html>