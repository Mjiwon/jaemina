<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>in</title>
</head>
<body>
	<form class="in" action="${pageContext.servletContext.contextPath }/read.do" method="post">
		<label> 번호 : </label><input type="text" name="no" />
		<label></label>
		
		<button>입력완료</button>
		
	</form>

</body>
</html>