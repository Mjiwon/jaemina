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
<title>회원 탈퇴</title>
</head>
<body class="text-center">
   
   <form action="${pageContext.servletContext.contextPath }/deleteuser.do" id="deletebtn2" class="form-signin" method="post">
      <h1 class="h3 mb-3 font-weight-normal">재미나</h1>
      <h2 class="h3 mb-3 font-weight-normal">회원 탈퇴</h2>
      <label for="inputId" class="sr-only">아이디</label> <input
         type="text" id="inputId" class="form-control" name="getId"
         placeholder="아이디" value="${userId.ID }" readonly="readonly" required autofocus> <label
         for="inputPass" class="sr-only">비밀번호</label> <input
         type="password" id="inputPassword" class="form-control" name="getPass"
         placeholder="비밀번호" required>
      <button class="btn btn-lg btn-primary btn-block" type="button" id="deletebtn">회원 탈퇴</button>
      <c:if test="${!empty deleteErr }">
         <script>
         	window.alert("회원정보가 일치하지 않습니다.");
         </script>
      </c:if>
      <c:if test="${!empty deleteYes }">
         <script>
         	window.alert("성공적으로 탈퇴하셨습니다.");
         	opener.location.href="${pageContext.servletContext.contextPath }/logout.do";
         	window.close();
         </script>
      </c:if>
      <p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
   </form>
   <script>
   		$("#deletebtn").on("click", function() {
   			if(window.confirm("정말로 탈퇴하시겠습니까?") == true) {
   				$("#deletebtn2").trigger("submit");
   			}else {
   				return;
   			}
   		});
   </script>
</body>
</html>