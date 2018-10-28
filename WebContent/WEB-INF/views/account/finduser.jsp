<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/signin.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<title>아이디 찾기</title>
</head>
<body>
	<form action="${pageContext.servletContext.contextPath }/find_user.do" class="form-signin" method="post">
		<h1 align="center" class="h3 mb-3 font-weight-normal">재미나</h1>
		<h3 align="center">아이디 찾기</h3>
		<label for="inputId" class="sr-only">이메일주소</label> <input
			type="email" id="inputId" class="form-control" name="email"
			placeholder="이메일" required autofocus> 
		<button class="btn btn-lg btn-primary btn-block" type="submit">아이디 찾기</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
	</form>
	
		<form action="${pageContext.servletContext.contextPath }/find_pass.do" class="form-signin" method="post">
		<h1 align="center" class="h3 mb-3 font-weight-normal">재미나</h1>
		<h3 align="center">비밀번호 찾기</h3>
			<label for="inputId" class="sr-only">아이디</label> <input
			type="txt" id="inputId" class="form-control" name="id"
			placeholder="아이디" required autofocus>
		<label for="inputId" class="sr-only">이메일주소</label> <input
			type="email" id="inputId" class="form-control" name="email"
			placeholder="이메일" required autofocus> 
		<button class="btn btn-lg btn-primary btn-block" type="submit">비밀번호 찾기</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
	</form>
</body>
</html>