<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<!--
	Read Only by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Read Only by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />





</head>
<body class="is-preload">

	<!-- Header -->
	<section id="header">
		<header>
			<span class="image avatar"><img src="images/avatar.jpg" alt="" /></span>
			<h1 id="logo">
				<a href="#">${Seller.ID }</a>
			</h1>
				<p>${Seller.ONELINE }</p>
		</header>
		<nav id="nav">
			<ul>
				<li><a href="#one" class="active">소개</a></li>
				<li><a href="#two">평가</a></li>
				<li><a href="#three">포트폴리오</a></li>
			</ul>
		</nav>
		<footer>
			<ul class="icons">
				<li><a href="${pageContext.servletContext.contextPath }/qa/buyqa.do?writer=${Seller.ID}" class="icon fa-envelope">문의하기</a></li>
			</ul>
		</footer>
	</section>

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- One -->
			<section id="one">
				<div>
					<a href="${pageContext.servletContext.contextPath }/index.do">재미나11</a><br/>
				</div>
				<div class="image main" data-position="center">
					<img src="images/banner.jpg" alt="" />
				</div>
				
				<div class="container">
					<header class="major">
						<h3>정보</h3>
						
					</header>
					<div style="display: inline-block; margin-right: 200px;" >
						<h4>
							● 학력
							</h4>
								<p>${Seller.ACADEMY}</p>
					</div>
					<div style="display: inline-block; margin-right: 200px;" >
						<h4>● 자격증</h4>
						<p>${Seller.LICENCE }</p>
					</div>
					<div style="display: inline-block; margin-right: 200px;" >
						<h4>● 경력사항</h4>
						<p>${Seller.CAREER }</p>
					</div>
					<div>
						<h4>● 소개</h4>
						<p>${Seller.INTRODUCE }</p>
					</div>
					<div align="right">
					<c:if test="${Seller.ID == user.ID}">
					<button class="button primary small" onclick="modifyreply();"  >편집</button>
					</div>
					</c:if>
				</div>  
		</div>
		</section>
		
		<script type="text/javascript">
		var modifyreply =function() {
			window.open("${pageContext.servletContext.contextPath }/update_seller.do", "판매자 정보 수정", "width=500, height=600, left=700, top=200");
			
		};

		</script>


		<!-- Two -->
		<section id="two"> 
		
			<div class="container">
				<header class="major">
					<h3>평가</h3>
				</header>
				<ul class="feature-icons">
					<li class="fa-book">총 작업수 :${Seller.boardcount } 개</li>
					<li class="fa-coffee">만족도:${Seller.staravg} %</li>
					<li class="fa-users">관심수: ${Seller.wishcount } 명</li>
					<li class="fa-bolt">평균 응답시간:1시간이내</li>
				</ul>
			</div>
		</section>

		<!-- Three -->
		<section id="three">
			<div class="container">
				<header class="major">
					<h3>포트폴리오</h3>
				</header>
				<div class="features">
					<c:forEach var="i" items="${MyBoard }">
						<article>
							<a href="${pageContext.servletContext.contextPath }/board/detail.do?no=${i.NO}">
								<img src="${pageContext.servletContext.contextPath }${i.IMGPATH}">
							</a>
							<div class="inner">
								<h4>${i.TITLE }</h4>
								<p>
									<b><fmt:formatNumber>${i.PRICE }</fmt:formatNumber>원</b>
								</p>
							</div>
						</article>
					</c:forEach>
				</div>
			</div>
		</section>



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