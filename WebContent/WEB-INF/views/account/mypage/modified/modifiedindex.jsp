<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:if test="${chageok==0}">
	<script type="text/javascript">
		window.alert("비밀번호가 변경되었습니다.");
	</script>
</c:if>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<div class="container" style="margin-top: 6%;">
	<div class="row" >

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>

</head>
<body>
<div class="row">

  <div class="col-3">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" >
      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" >나의정보</a>
      <a class="nav-link" id="changePass" href="javascript:changePass" role="tab">비밀번호변경</a>
      <a class="nav-link" id="deleteUser" href="javascript:deleteUser" role="tab">회원탈퇴</a>
    </div>
  </div>
  <div class="col-9">
    <div class="tab-content" id="v-pills-tabContent">
      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
      </div>
      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">...</div>
      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">...</div>
    </div>
  </div>

		<div class="col-3">
			<div class="nav flex-column nav-pills" id="v-pills-tab"
				role="tablist">
				<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill"
					href="#v-pills-home" role="tab">나의정보</a> <a class="nav-link"
					id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile"
					role="tab">비밀번호변경</a> <a class="nav-link"
					id="v-pills-messages-tab" data-toggle="pill"
					href="#v-pills-messages" role="tab">회원탈퇴</a>
			</div>
		</div>
		<div class="col-9">
			<div class="tab-content" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="v-pills-home"
					role="tabpanel" aria-labelledby="v-pills-home-tab">타일즈껴서 만들어야
					할듯</div>
				<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
					aria-labelledby="v-pills-profile-tab">...</div>
				<div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
					aria-labelledby="v-pills-messages-tab">...</div>
			</div>
		</div>
	</div>
</div>

<script>
	$("#deleteUser").on("click", function() {
		window.open("${pageContext.servletContext.contextPath }/deleteGo.do", "f", "width=500, height=500, left=700, top=200");
	});
	
	$("#changePass").on("click", function() {
		window.open("${pageContext.servletContext.contextPath }/changeUser.do", "f", "width=500, height=500, left=700, top=200");
	});
		
</script>
</body>
</html>
