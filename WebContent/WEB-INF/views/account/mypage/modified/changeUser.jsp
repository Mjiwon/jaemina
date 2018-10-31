<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>로그인</title>
</head>
<body class="text-center">
   
   <form action="${pageContext.servletContext.contextPath }/changeUser.do" class="form-signin" method="post">
      <h1 class="h3 mb-3 font-weight-normal">재미나</h1>
      <label for="inputPass1" class="sr-only">기존 비밀번호</label> <input
         type="password" id="inputPass1" class="form-control" name="getPass1"
         placeholder="기존 비밀번호" required autofocus> <label
         for="inputPass2" class="sr-only">변경할 비밀번호</label> <input
         type="password" id="inputPass2" class="form-control" name="getPass2" onkeyup="getpass(this)"
         placeholder="변경할 비밀번호" required> <label
         for="inputPass3" class="sr-only">비밀번호 재입력</label> <input
         type="password" id="inputPass3" class="form-control" name="getPass3" onkeyup="getpass(this)"
         placeholder="비밀번호 재입력" required> <small id="checked2"></small>
      <button class="btn btn-lg btn-primary btn-block" type="submit" id="submitbtn" disabled="disabled">비밀번호 변경</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
      <c:if test="${!empty changePassYes }">
      	<script>
	      	window.alert("비밀번호가 변경되었습니다.");
	      	window.close();
      	</script>
      </c:if>
      <c:if test="${!empty changePassNo }">
      	<script>
	      	window.alert("기존 비밀번호가 틀렸습니다.");
      	</script>
      </c:if>
      
      <script>
      var r1 = new RegExp(/^[a-z0-9]\w{3,11}$/);
		var getpass = function(p) {
			var pass2 = document.getElementById("inputPass2").value;
			var pass3 = document.getElementById("inputPass3").value;
			if (r1.test(p.value) == true) {
				if (pass3 == pass2) {
					document.getElementById("checked2").innerHTML = "비밀번호가 일치합니다.";
					document.getElementById("checked2").style.color = "green";
					$("#submitbtn").prop("disabled", false);
				} else {
					document.getElementById("checked2").innerHTML = "비밀번호가 일치하지 않습니다.";
					document.getElementById("checked2").style.color = "red";
					$("#submitbtn").prop("disabled", true);
				}
			} else {
				document.getElementById("checked2").innerHTML = "4~12자 사이로 설정해주세요.";
				document.getElementById("checked2").style.color = "red"
					$("#submitbtn").prop("disabled", true);
			}
		};
      </script>
   </form>
</body>
</html>