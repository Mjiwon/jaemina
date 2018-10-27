<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>QA</title>
</head>
<body>
<h2>문의하기</h2>
	<div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<img src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}" alt="" class="rounded-circle" height="75" width="75">
			</div>
			<input type="text" class="form-control" readonly style="background-color: white;" value="${Seller.ID }">
		</div>
		<%-- <div class="row">
			<div class="col mb-5">
				<img src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}"
					alt="" class="rounded-circle" height="75" width="75"> 			
			</div>
			<div class="col mb-10"> 
				<input type="text" class="form-control" readonly style="background-color: white;" value="${Seller.ID }">			
			</div>
		
		</div> --%>
	</div>
	<div style="height: 520px; overflow-y: scroll;" id="chatView"></div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text" id="chatView">CHAT</span>
		</div>
		<input type="text" class="form-control"
			aria-describedby="basic-addon1" id="input">
	</div>
	
	

</body>
</html>