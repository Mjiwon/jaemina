<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" >
	<link href="${pageContext.servletContext.contextPath }/css/index/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
	<link href="${pageContext.servletContext.contextPath }/css/index/flexslider.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${pageContext.servletContext.contextPath }/css/index/JiSlider.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath }/css/index/shop.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.servletContext.contextPath }/css/index/style.css" rel='stylesheet' type='text/css' media="all">
	
	<script src="${pageContext.servletContext.contextPath }/js/jquery-2.2.3.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://popper.js.org"></script>
	<script src="${pageContext.servletContext.contextPath }/js/bootstrap.min.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	
	
	

	<title>재능을 나누다 - 재미나</title>

</head>

<body>

	<div>
		<tiles:insertAttribute name="nav" />
	</div>
	<div>
		<tiles:insertAttribute name="center" />
	</div>

    <script src="${pageContext.servletContext.contextPath }/js/responsiveslides.min.js"></script> 
    <script src="${pageContext.servletContext.contextPath }/js/jquery.flexisel.js"></script>
    <script src="${pageContext.servletContext.contextPath }/js/move-top.js"></script>
    <script src="${pageContext.servletContext.contextPath }/js/easing.js"></script>
   
	
    <script>
       addEventListener("load", function () {
       	setTimeout(hideURLbar, 0);
       }, false);
       
       function hideURLbar() {
       	window.scrollTo(0, 1);
       }
    </script>
    
    <script>
       // You can also use "$(window).load(function() {"
       $(function () {
       	// Slideshow 4
       	$("#slider4").responsiveSlides({
       		auto: true,
       		pager:false,
       		nav:true ,
       		speed: 900,
       		namespace: "callbacks",
       		before: function () {
       			$('.events').append("<li>before event fired.</li>");
       		},
       		after: function () {
       			$('.events').append("<li>after event fired.</li>");
       		}
       	});
       
       });
    </script>
    
    <script>
       jQuery(document).ready(function ($) {
       	$(".scroll").click(function (event) {
       		event.preventDefault();
       		$('html,body').animate({
       			scrollTop: $(this.hash).offset().top
       		}, 900);
       	});
       });
    </script>


</body>
</html>