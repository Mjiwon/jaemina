<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매글</title>
</head>
<body>
	<h1>상세페이지</h1>
	<p>
	${detail.BIGCATE} | ${detail.SMALLCATE}<br/>
	title : ${detail.TITLE }<br/>
	작성 날짜 : ${detail.WRDATE} | 작성자 : ${detail.WRITER }<br/>
	금액 : ${detail.PRICE }<br/>
	</p>
	<hr/>
	내용<br/>
	<p>
		${detail.CONTENT }
	</p>
	<hr/>
	<p>
	<form action="${pageContext.servletContext.contextPath }/qa/buyqa.do?writer=${detail.WRITER }" method="get">
		
		<button type="submit">문의</button>
	</form>
	</p>
</body>
</html>