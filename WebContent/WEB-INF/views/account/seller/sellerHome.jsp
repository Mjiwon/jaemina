<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentPage">${currentPage }</c:set>
<c:set var="totalPage">${totalPage }</c:set>
<c:set var="pageBlock">10</c:set>

<fmt:parseNumber var="currentBlock" integerOnly="true" value="${currentPage/pageBlock }"/>
<fmt:parseNumber var="lastBlock" integerOnly="true" value="${totalPage/pageBlock }"/>
<c:if test="${currentPage%pageBlock == 0 }"><c:set var="currentBlock" value="${currentBlock -1 }"/></c:if>
<c:set var="startNum" value="${currentBlock*pageBlock+1 }"/>
<c:set var="endNum" value="${currentBlock*pageBlock+pageBlock }"/>
<c:if test="${endNum > totalPage }"><c:set var="endNum" value="${totalPage }"/></c:if>
<!DOCTYPE HTML>
<!--
	Read Only by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>재미나</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />





</head>
<body class="is-preload">

	<!-- Header -->
	<section id="header" style="background: #ea1d5d;">
		<header>
			<span class="image avatar"><img src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}"/></span>
			<h1 id="logo">
				<a href="#">${Seller.ID }</a>
			</h1>
				<p style="color: white;">${Seller.ONELINE }</p>
		</header>
		<nav id="nav" style="color: #ea1d5d">
			<ul>
				<li><a href="#one" class="active">소개</a></li>
				<li><a href="#two">평가</a></li>
				<li><a href="#three">포트폴리오</a></li>
			</ul>
		</nav>
		<footer style="background-color: #ea1d5d">
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
				<div class="image main" data-position="center">
					<img src="images/banner.jpg" alt="" />
				</div>
				
				<div class="container">
					<header class="major">
						<h3 style="color: #ea1d5d">정보</h3>
						
					</header>
					<div style="display: inline-block; margin-right: 100px;" >
						<h4>● 학력</h4>
								<p>${Seller.ACADEMY}</p>
					</div>
					<div style="display: inline-block; margin-right: 100px;" >
						<h4>● 경력사항</h4>
						<p>${Seller.CAREER }</p>
					</div>
					<div style="display: inline-block; margin-right: 100px;" >
					<c:if test="${Seller.LICENCE !=null}">
						<h4>● 자격증</h4>
						<p>${Seller.LICENCE }</p>
					</c:if>
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
					<h3  style="color: #ea1d5d">평가</h3>
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
					<h3  style="color: #ea1d5d">포트폴리오</h3>
				</header>
	<div class="col-9">
		<div class="row">
				<c:forEach var="l" items="${MyBoard }">
					<div class="col-md-4">
						<a href="${pageContext.servletContext.contextPath }/board/detail.do?no=${l.NO}">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top"
									src="${pageContext.servletContext.contextPath }${l.IMGPATH}"
									width="286" height="180">
								<div class="card-body">
									<p class="card-text">${l.TITLE }</p>
									<p class="card-text" style="color: red;">
										<b><fmt:formatNumber>${l.PRICE }</fmt:formatNumber>원</b>
									</p> 
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
						<c:if test="${!empty Myck }">
               <c:if test="${currentPage != 1 }"><a id="firstbtn" href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=1" style="color: black;">[첫 페이지] | </a></c:if>
               <c:if test="${currentBlock == 1 }"><a id="prevbtn" href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=${startNum-pageBlock+9 }" style="color: black;"> [이전] |</a></c:if>
            
               <c:forEach var="index" begin="${startNum }" end="${endNum }" varStatus="status">
                  <c:choose>
                     <c:when test="${index == currentPage }"><b>${index }</b></c:when>
                     <c:otherwise><a id="pagebtn" href="${pageContext.servletContext.contextPath }/jaemilog.do?currentPage=${index}" style="color: black;">${index }</a></c:otherwise>
                  </c:choose>
                  <c:if test="${!status.last }"> | </c:if>
               </c:forEach>
               <c:if test="${currentBlock != lastBlock}"><a id="nextbtn" href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=${startNum+pageBlock }" style="color: black;"> | [다음]</a></c:if>
               <c:if test="${currentPage != totalPage }"><a id="lastbtn" href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=${totalPage}" style="color: black;"> | [마지막 페이지]</a></c:if>
            </c:if>
            <c:if test="${!empty Sellerck }">
               <c:if test="${currentPage != 1 }"><a id="firstbtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=1" style="color: black;">[첫 페이지] | </a></c:if>
               <c:if test="${currentBlock == 1 }"><a id="prevbtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=${startNum-pageBlock+9 }" style="color: black;"> [이전] |</a></c:if>
            
               <c:forEach var="index" begin="${startNum }" end="${endNum }" varStatus="status">
                  <c:choose>
                     <c:when test="${index == currentPage }"><b>${index }</b></c:when>
                     <c:otherwise><a id="pagebtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=${index}" style="color: black;">${index }</a></c:otherwise>
                  </c:choose>
                  <c:if test="${!status.last }"> | </c:if>
               </c:forEach>
               <c:if test="${currentBlock != lastBlock}"><a id="nextbtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=${startNum+pageBlock }" style="color: black;"> | [다음]</a></c:if>
               <c:if test="${currentPage != totalPage }"><a id="lastbtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=${totalPage}" style="color: black;"> | [마지막 페이지]</a></c:if>
            </c:if>
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