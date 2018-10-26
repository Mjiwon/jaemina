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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<title>회원가입</title>
</head>
<body class="text-center">
	<form action="${pageContext.servletContext.contextPath }/join.do"
		class="form-signin" method="post">
		<h1 class="h3 mb-3 font-weight-normal">재미나</h1>
		<label for="inputId" class="sr-only">아이디</label> <input type="text"
			id="inputId" class="form-control" name="getId" placeholder="아이디"
			onkeyup="getid(this);" required autofocus> <small
			id="checked"></small> <button type="button" id="useId" disabled="disabled">이 아이디 사용</button> 
			<label for="inputPassword1" class="sr-only">비밀번호</label>
		<input type="password" id="inputPassword1" class="form-control"
			name="getPass" placeholder="비밀번호" onkeyup="getpass2(this);" required
			autofocus> <label for="inputPassword2" class="sr-only">
			비밀번호재입력</label> <input type="password" id="inputPassword2"
			class="form-control" name="getPass1" placeholder="비밀번호 재입력"
			onkeyup="getpass2(this);" required autofocus> <small
			id="checked2"></small> <button type="button" id="usePass" disabled="disabled">이 비밀번호 사용</button> 
			<label for="inputEmail" class="sr-only">이메일</label>
		<input type="email" id="inputEmail" class="form-control"
			name="getEmail" placeholder="이메일" onkeyup="getemail(this);" required
			autofocus> <small id="checked3"></small>
		<button type="button" id="emailauth" disabled="disabled">인증번호 전송</button> <small id="checked5"> </small>
		<label for="inputId" class="sr-only">인증번호</label> <input type="text"
			id="confirm" class="form-control" name="confirm" placeholder="인증번호"
			disabled="disabled" required autofocus>
		<button type="button" id="confirmok" disabled="disabled">인증하기</button>
		<small id="checked4"></small>
		<button class="btn btn-lg btn-primary btn-block" type="submit" id="btnsubmit" disabled="disabled">회원가입</button>
		<a href="${pageContext.servletContext.contextPath }/login.do">로그인</a>
		<p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
	</form>
	<script type="text/javascript">
		$("#useId").on("click", function() {
			$("#inputId").prop("readonly", true);
			$("#useId").prop("disabled", true);
		});
		
		$("#usePass").on("click", function() {
			$("#inputPassword1").prop("readonly", true);
			$("#inputPassword2").prop("readonly", true);
			$("#usePass").prop("disabled", true);
		});
		$("#emailauth").on("click", function() {
			var param = 
				{"email":$("#inputEmail").val()};
			$("#confirm").prop("disabled", false);
			$("#confirmok").prop("disabled", false);
			$.post("${pageContext.servletContext.contextPath}/mail.do", param).done(function(rst) {
				document.getElementById("checked5").innerHTML = "전송";
				document.getElementById("checked5").style.color = "green";
				document.getElementById("checked4").innerHTML = "";
			});
		});
		$("#confirmok").on("click", function() {
			var param = 
				{"confirmkey":$("#confirm").val()};
			$.post("${pageContext.servletContext.contextPath}/emailauth.do", param).done(function(rst) {
				console.log(rst);
				if(rst.includes("true") == true) {
					document.getElementById("checked4").innerHTML = "인증완료";
					document.getElementById("checked4").style.color = "green";
					$("#inputEmail").prop("readonly", true);
					$("#emailauth").prop("disabled", true);	
					$("#confirm").prop("disabled", true);
					$("#confirmok").prop("disabled", true);
					$("#btnsubmit").prop("disabled", false);
				}else {
					document.getElementById("checked4").innerHTML = "인증실패";
					document.getElementById("checked4").style.color = "red";
					$("#confirm").prop("disabled", true);
					$("#confirmok").prop("disabled", true);
					document.getElementById("emailauth").innerHTML = "재전송";
					document.getElementById("checked5").innerHTML = "";
				}
			});
		});
		
		var r = new RegExp(/^[a-z]{1,1}\w{3,11}$/);
		var getid = function(target) {
			if (r.test(target.value) == true) {
				document.getElementById("checked").innerHTML = "사용가능한 ID입니다.";
				document.getElementById("checked").style.color = "green";
				$("#useId").prop("disabled", false);
				var req = new XMLHttpRequest();
				req.open("get", "joinid_check.do?w=" + target.value, true);
				req.onreadystatechange = function() {
					if (this.readyState == 4) {
						var obj = JSON.parse(this.responseText);
						var idd = obj.ID;
						if (idd.includes(target.value) == true) {
							document.getElementById("checked").innerHTML = "중복된 ID입니다.";
							document.getElementById("checked").style.color = "red";
							$("#useId").prop("disabled", true);
						}
					}
				};
				req.send();
			} else {
				document.getElementById("checked").innerHTML = "4~12자 사이로 입력해주세요.";
				document.getElementById("checked").style.color = "red";
				$("#useId").prop("disabled", true);
			}
		};

		var r1 = new RegExp(/^[a-z0-9]\w{3,11}$/);
		var getpass2 = function(p) {
			var pass1 = document.getElementById("inputPassword1").value;
			var pass2 = document.getElementById("inputPassword2").value;
			if (r1.test(p.value) == true) {
				if (pass2 == pass1) {
					document.getElementById("checked2").innerHTML = "비밀번호가 일치합니다.";
					document.getElementById("checked2").style.color = "green";
					$("#usePass").prop("disabled", false);
				} else {
					document.getElementById("checked2").innerHTML = "비밀번호가 일치하지 않습니다.";
					document.getElementById("checked2").style.color = "red";
					$("#usePass").prop("disabled", true);
				}
			} else {
				document.getElementById("checked2").innerHTML = "4~12자 사이로 설정해주세요.";
				document.getElementById("checked2").style.color = "red"
					$("#usePass").prop("disabled", true);
			}
		};

		var r2 = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var getemail = function(target) {
			if (r2.test(target.value) == true) {
				document.getElementById("checked3").innerHTML = "사용 가능한 Email입니다.";
				document.getElementById("checked3").style.color = "green";
				$("#emailauth").prop("disabled", false);
				var req = new XMLHttpRequest();
				req.open("get", "joinemail_check.do?w=" + target.value, true);
				req.onreadystatechange = function() {
					if (this.readyState == 4) {
						var obj = JSON.parse(this.responseText);
						var idd = obj.EMAIL;
						if (idd.includes(target.value) == true) {
							document.getElementById("checked3").innerHTML = "이미 사용중인 Email입니다.";
							document.getElementById("checked3").style.color = "red";
							$("#emailauth").prop("disabled", true);
						}
					}
				}
				req.send();
			} else {
				document.getElementById("checked3").innerHTML = "사용 불가능한 Email 형식입니다.";
				document.getElementById("checked3").style.color = "red";
				$("#emailauth").prop("disabled", true);
			}
		};
	</script>
</body>
</html>