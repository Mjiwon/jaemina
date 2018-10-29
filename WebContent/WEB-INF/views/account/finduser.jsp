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
	<form action="${pageContext.servletContext.contextPath }/find_user.do" class="form-signin" method="post" id="findidybtn">
		<h1 align="center" class="h3 mb-3 font-weight-normal">재미나</h1>
		<h3 align="center">아이디 찾기</h3>
		<label for="inputId" class="sr-only">이메일주소</label> 
		<input type="email" id="inputId" class="form-control" onkeyup="getemail(this);"  name="email" placeholder="이메일" required autofocus > 
		<small id="checked1"></small>
		<button class="btn btn-lg btn-primary btn-block" type="submit" id="findid" disabled="disabled">아이디 찾기	</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
		
		<script type="text/javascript">
		$("#findid").on("click", function() {
			if(window.alert("회원님의 이메일에 전송되었습니다 \n이메일을 확인해주세요" ) == true) {
				$("#findidybtn").trigger("submit");				
			}else {
				return;
			}
		});
		
		
		 
	
		var r2 = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var getemail = function(target) {
			if (r2.test(target.value) == true) {
				document.getElementById("checked1").innerHTML = "등록되지 않은 이메일 입니다";
				document.getElementById("checked1").style.color = "red";
				$("#findid").prop("disabled", true);
				var req = new XMLHttpRequest();
				req.open("get", "joinemail_check.do?w=" + target.value, true);
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
	
		<form action="${pageContext.servletContext.contextPath }/find_pass.do" class="form-signin" method="post" id="findpwybtn">
		<h1 align="center" class="h3 mb-3 font-weight-normal">재미나</h1>
		<h3 align="center">비밀번호 찾기</h3>
			<label for="inputId" class="sr-only">아이디</label> 
			<input type="txt" id="inputId" class="form-control" name="getId"  onkeyup="getid(this);"
			placeholder="아이디" required autofocus>
				<small id="checked3"></small>

		<label for="inputId" class="sr-only">이메일주소</label> <input
			type="email" id="inputId" class="form-control" name="email" onkeyup="getemail2(this)"
			placeholder="이메일" required autofocus> 
			<small id="checked2"></small>
		<button class="btn btn-lg btn-primary btn-block" type="sumit" id="findpw" disabled="disabled">비밀번호 찾기</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
		
		<script type="text/javascript">
		$("#findpw").on("click", function() {
			if(window.alert("회원님의 이메일에 전송되었습니다\n 이메일을 확인해주세요" ) == true) {
				$("#findpwybtn").trigger("submit");				
			}else {
				return;
			}
		});
		
		
		//이메일 체크
		var r2 = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var getemail2 = function(target) {
			if (r2.test(target.value) == true) {
				document.getElementById("checked2").innerHTML = "등록되지 않은 이메일 입니다";
				document.getElementById("checked2").style.color = "red";
				$("#findpw").prop("disabled", true);
				var req = new XMLHttpRequest();
				req.open("get", "joinemail_check.do?w=" + target.value, true);
				req.onreadystatechange = function() {
					if (this.readyState == 4) {
						var obj = JSON.parse(this.responseText);
						var idd = obj.EMAIL;
						if (idd.includes(target.value) == true) {
							document.getElementById("checked2").innerHTML = "등록되어 있는 이메일 입니다";
							document.getElementById("checked2").style.color = "green";
							$("#findpw").prop("disabled", false);
						}
					}
				}
				req.send();
			} else {
				document.getElementById("checked2").innerHTML = "사용 불가능한 Email 형식입니다.";
				document.getElementById("checked2").style.color = "red";
				$("#findpw").prop("disabled", true);
			}
		};
	</script>
	</form>
</body>
</html>