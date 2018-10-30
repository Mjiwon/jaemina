<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body class="text-center">
   <form action="${pageContext.servletContext.contextPath }/find_user.do"
      class="form-signin" method="post" id="findidybtn">
      <h1 align="center" class="h3 mb-3 font-weight-normal">재미나</h1>
      <h3 align="center">아이디 찾기</h3>
      <label for="inputId" class="sr-only">이메일주소</label> <input type="email"
         id="inputId" class="form-control" onkeyup="getemail(this);"
         name="email" placeholder="이메일" required autofocus> <small
         id="checked1"></small>
      <button class="btn btn-lg btn-primary btn-block" type="submit"
         id="findid" disabled="disabled">아이디 찾기</button>
         <a href="${pageContext.servletContext.contextPath }/login.do">로그인</a><br/>
         <a href="${pageContext.servletContext.contextPath }/find_pass.do">비밀번호 찾기</a>
      <p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
      <script type="text/javascript">
         var r2 = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
         var getemail = function(target) {
            if (r2.test(target.value) == true) {
               document.getElementById("checked1").innerHTML = "존재하지 않은 이메일 입니다.";
               document.getElementById("checked1").style.color = "red";
               $("#findid").prop("disabled", true);
               var req = new XMLHttpRequest();
               req.open("get", "joinemail_check.do?w=" + target.value,
                     true);
               req.onreadystatechange = function() {
                  if (this.readyState == 4) {
                     var obj = JSON.parse(this.responseText);
                     var idd = obj.EMAIL;
                     if (idd.includes(target.value) == true) {
                        document.getElementById("checked1").innerHTML = "등록되어 있는 이메일 입니다";
                        document.getElementById("checked1").style.color = "green";
                        $("#findid").prop("disabled", false);
                     }
                  }
               }
               req.send();
            } else {
               document.getElementById("checked1").innerHTML = "사용 불가능한 Email 형식입니다.";
               document.getElementById("checked1").style.color = "red";
               $("#findid").prop("disabled", true);
            }
         };
      </script>

   </form>
   </body>
</html>