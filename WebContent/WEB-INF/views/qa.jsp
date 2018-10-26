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
	<form action="${pageContext.servletContext.contextPath }/qa/sendmsg.do" method="post">
		<textarea rows="30" cols="100"></textarea><br/>
		<input id="qamsg"/>
		<button type="submit">전송</button>
	</form>

</body>
</html>