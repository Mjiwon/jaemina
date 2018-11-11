<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<c:if test="${!empty findidYes }">
		<script>
			window.alert("메일이 전송되었습니다."+"\n"+"메일을 확인해주세요.");
		</script>
	</c:if>
	
	<c:if test="${!empty findpassYes }">
		<script>
			window.alert("메일이 전송되었습니다."+"\n"+"메일을 확인해주세요.");
		</script>
	</c:if>

<html>
	<head>
	
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/signin.css">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/login/font-awesome.css" >
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/login/style.css" />
		<link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext" rel="stylesheet">
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
		
		<title>로그인</title>
		
		<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
		</script>
		
	</head>
	
	<body class="text-center" style="background-color:#000;">
	
		<!-- <h1>LOGIN</h1> -->
		
		<div class="w3ls-login box box--big" style="margin: 0 auto;">
		
			<!-- form starts here -->
			<form action="${pageContext.servletContext.contextPath }/login.do" method="post">
				<div class="agile-field-txt">
					<label><i class="fa fa-user" aria-hidden="true"></i> User_ID </label>
					<input type="text" name="getId" placeholder="Enter your name " required="" />
				</div>
				<div class="agile-field-txt">
					<label><i class="fa fa-envelope" aria-hidden="true"></i> Password </label>
					<input type="password" name="getPass" placeholder="Enter your password " required="" id="myInput" />
					<div class="agile_label">
						<input id="check3" name="check3" type="checkbox" value="show password" onclick="myFunction()">
						<label class="check" for="check3">Show password</label>
					</div>
				</div>

				<!-- script for show password -->
				<script>
					function myFunction() {
						var x = document.getElementById("myInput");
						if (x.type === "password") {
							x.type = "text";
						} else {
							x.type = "password";
						}
					}
				</script>
				
				<!-- //script ends here -->
				<div class="w3ls-bot">
					<div class="switch-agileits">
						<label class="switch">
							<input type="checkbox">
							<span class="slider round"></span>
							keep me signed in
						</label>
					</div>
					<div class="form-end">
						<input type="submit" value="LOGIN" >
						 <c:if test="${!empty err }">
					        <div class="alert alert-danger" role="alert">
					            등록되지 않은 아이디이거나,<br/> 아이디 또는 비밀번호를 잘못 입력하셨습니다.
					    	</div>
					    </c:if>
					    
					    <button class="" type="submit"><a href="${pageContext.servletContext.contextPath }/find_user.do">ID FIND</a></button>
					    
					    <button class="" type="submit"><a href="${pageContext.servletContext.contextPath }/find_pass.do"">PASS FIND</a></button>
					</div>
					<div class="clearfix"></div>
					<p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>
				</div>
				
				
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
			
		</div>
	
	</body>
	
</html>