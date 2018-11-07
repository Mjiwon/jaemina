<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자인증</title>
</head>
<body>
	<h2>판매자 인증</h2>
	<form action="${pageContext.servletContext.contextPath }/addseller.do" method="post" enctype="multipart/form-data">
		학력 : <input type="text" name="academy"> <br>
		경력 : <input type="text" name="career"><br>	
		 프로필 이미지 : <input type="file" name="imgpath"> <br>
		자기소개 :<br>
		<textarea rows="30" cols="60" name="introuce"></textarea><br>
		<button type="submit">등록하기</button>
	</form>
</body>
</html>