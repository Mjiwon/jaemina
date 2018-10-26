<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QA</title>
</head>
<body>
	
	<h1>문의하기</h1>
	<form action="${pageContext.servletContext.contextPath }/qa/buyqa.do" method="post">
	문의 : ${writer }
		<input hidden="" name="receiver" value="${writer }"/>
		<input hidden="" name="no" value="${no }"/>
		<input id="qamsg" name="content"/>
		<button type="submit">전송</button>
	</form>

</body>
</html>