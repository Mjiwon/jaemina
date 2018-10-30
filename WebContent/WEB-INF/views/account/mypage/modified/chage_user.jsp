<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:if test="${chageok==1}">
	<script type="text/javascript">
		window.alert("바꾸시려는 비밀번호가 일치하지 않습니다.");
	</script>
</c:if>
<c:if test="${chageok==2}">
	<script type="text/javascript">
		window.alert("기존 비밀번호가 일치하지 않습니다.");
	</script>
</c:if>
<c:if test="${chageok==3}">
	<script type="text/javascript">
		window.alert("기존 비밀번호가 일치하지 않고,\n 바꾸시려는 비밀번호도 둘다 일치하지 않습니다.");
	</script>
</c:if>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>재미나-비밀번호 변경</title>

</head>
<body>
	<form action="${pageContext.servletContext.contextPath }/chageuser.do" method="post">
		<div style="border: 1px solid; padding: 10px;">
			<div>
				<b>현재 비밀번호</b>
				<hr size="5" noshade>
			</div>
			<div class="form-group">
				<label for="formGroupExampleInput">현재비밀번호</label> <input
					type="password" class="form-control" name="pass"
					placeholder="기존 비밀번호를 입력하세요.">
			</div>
			<div>
				<b>변경 비밀번호</b>
				<hr size="5" noshade>
			</div>
			<div class="form-row">
				<div class="col">
					<label>변경할 비밀번호</label> <input type="password" class="form-control"
						placeholder="변경할 비밀번호를 입력해 주세요." name="npass">
				</div>
				<div class="col">
					<label>한번 더 입력</label> <input type="password" class="form-control"
						placeholder="변경할 비밀번호를 한번 더 입력해 주세요." name="nppass">
				</div>
			</div>
		</div>
		<br>
		<div align="right">
			<button type="submit" style="width: 25%;" class="btn btn-secondary btn-lg">변경하기</button>
		</div>
	</form>
</body>
</html>