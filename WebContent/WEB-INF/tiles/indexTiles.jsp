<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


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

<title>재미나 - 관리자</title>
</head>
<body>
	<div>
		<tiles:insertAttribute name="nav" />
	</div>
	<div>
		<tiles:insertAttribute name="center" />
	</div>

</body>
</html>