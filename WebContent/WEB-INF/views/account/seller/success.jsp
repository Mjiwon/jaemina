<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${user.ID}님 계좌인증 성공 하셨습니다!!
<form action="${pageContext.servletContext.contextPath }/addseller.do">
<input type="submit" value="다음단계로">
</form>
</body>
</html>