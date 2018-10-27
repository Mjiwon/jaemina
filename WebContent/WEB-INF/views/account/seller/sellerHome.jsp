<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>Insert title here</title>
</head>
<body>

<c:forEach var="i" items="${MyBoard }">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="${pageContext.servletContext.contextPath }${i.IMGPATH}" height="300" width="300">
  <div class="card-body">
    <h5 class="card-title">제목:${i.TITLE }</h5>
    <p class="card-text">작성자:${i.WRITER}</p>
    <a href="#" class="btn btn-primary">자세히 보기</a>
  </div>
</div>


</c:forEach>
</body>
</html>