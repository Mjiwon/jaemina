<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.servletContext.contextPath }/chageuser.do" method="POST">
비밀번호:<input type="password" name="pass"><br/>
새비밀번호:<input type="password" name="npass"><br/>
새비밀빈호 확인:<input type="password" name="nppass"><br/>
<input type="submit" value="수정완료">
</form>
</body>
</html>