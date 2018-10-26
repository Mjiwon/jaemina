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
	<h1>상세페이지</h1>
	<p>
	<img alt="" src="${pageContext.servletContext.contextPath }${detail.IMGPATH}"><br/>
	${detail.BIGCATE} | ${detail.SMALLCATE}<br/>
	title : ${detail.TITLE }<br/>
	작성 날짜 : ${detail.WRDATE} | 작성자 : ${detail.WRITER }<br/>
	금액 : ${detail.PRICE }<br/>
	</p>
	<hr/>
	내용<br/>
	<hr/>
	<p>
		${detail.CONTENT }
	</p>
	<hr/>
	<p>
		판매자에게 문의하기<br/>
	<a href="${pageContext.servletContext.contextPath }/qa/buyqa.do?no=${detail.NO }&writer=${detail.WRITER}"><button >문의</button></a>
	</p>
</body>
</html>