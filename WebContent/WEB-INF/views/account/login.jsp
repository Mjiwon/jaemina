<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<c:if test="${!empty findidYes }">
	<script>
		window.alert("메일이 전송되었습니다." + "\n" + "메일을 확인해주세요.");
	</script>
</c:if>
<c:if test="${!empty findpassYes }">
	<script>
		window.alert("메일이 전송되었습니다." + "\n" + "메일을 확인해주세요.");
	</script>
</c:if>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/signin.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<title>로그인</title>
</head>
<body class="text-center">

	<form action="${pageContext.servletContext.contextPath }/login.do" class="form-signin" method="post">
		<h1 class="h3 mb-3 font-weight-normal">재미나</h1>
		<label for="inputId" class="sr-only">아이디</label> 
		<input type="text" id="inputId" class="form-control" name="getId" placeholder="아이디" required autofocus> 
		<label for="inputPassword" class="sr-only">비밀번호</label> 
		<input type="password" id="inputPassword" class="form-control" name="getPass" placeholder="비밀번호" required>
		<input type="checkbox" name="loginauth">로그인 유지
		<button class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button>
		<c:if test="${!empty err }">
			<div class="alert alert-danger" role="alert">
				등록되지 않은 아이디이거나,<br /> 아이디 또는 비밀번호를 잘못 입력하셨습니다.
			</div>
		</c:if>
		<a href="${pageContext.servletContext.contextPath }/find_user.do">아이디
			찾기</a><br /> <a
			href="${pageContext.servletContext.contextPath }/find_pass.do">비밀번호
			찾기</a>
			
		<p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
		<c:if test="${!empty loginYes }">
			<c:choose>
				<c:when test="${empty origin }">
					<script>
						window.alert("로그인에 성공하셨습니다.");
						opener.location.href = "${pageContext.servletContext.contextPath }/index.do";
						window.close();
					</script>
				</c:when>
				<c:otherwise>
					<script>
						window.alert("로그인에 성공하셨습니다.");
						opener.location.href = "${pageContext.servletContext.contextPath }${origin}";
						window.close();
					</script>
				</c:otherwise>
			</c:choose>
		</c:if>
	</form>
</body>
</html>