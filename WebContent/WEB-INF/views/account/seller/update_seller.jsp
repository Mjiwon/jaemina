<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>Read Only by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
	<!-- Four -->
	<section id="four">
		<div class="container">
			<h3 style="color: #ea1d5d;">판매자 정보 수정</h3>
			<form
				action="${pageContext.servletContext.contextPath }/update_seller.do"
				method="post" enctype="multipart/form-data">
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input type="text" min="10" name="academy" id="name" placeholder="학력" value="${Seller.ACADEMY}" />
					</div>
					<div class="col-6 col-12-xsmall">
						<input type="text" min="10" name="career" id="career" placeholder="경력" value="${Seller.CAREER }" />
					</div>
					<div class="col-12"><input type="text"min="10" name="licence" id="licence" placeholder="자격증" value="${Seller.LICENCE }" /></div>
					<div class="col-12"> 
					프로필 이미지 : <input type="file" name="imgpath" value="${l.IMGPATH}"> <br>
					</div>
					<div class="col-12"><input type="text"min="10" name="oneline" id="oneline" placeholder="한줄소개" value="${Seller.ONELINE }" /></div>
					<div class="col-12">
						<textarea name="introduce" min="10" id="introduce" placeholder="소개"
							rows="6">${Seller.INTRODUCE }</textarea>
					</div>
					<div class="col-12">
						<ul class="actions">
							<li><input type="submit" class="primary"
								value="수정완료"/></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</section>

	</div>
	
	

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>