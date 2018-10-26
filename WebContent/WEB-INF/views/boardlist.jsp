<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매글</title>
</head>
<body>
	<h1>판매글 리스트</h1>
	<ul>
	<c:forEach var="l" items="${boardlist }">
		<li><a href="${pageContext.servletContext.contextPath }/board/detail.do?no=${l.NO}">No : ${l.NO } | 제목 : ${l.TITLE } | 날짜 : ${l.WRDATE } | 가격 : ${l.PRICE }</a></li>	
	</c:forEach>
	</ul>
</body>
</html>