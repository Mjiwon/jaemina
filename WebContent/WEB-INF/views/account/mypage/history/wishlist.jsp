<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</head>

<body>
	<main role="main" class="container">
	<div class="row">
		<div class="col-md-8 blog-main">
			<h3 class="pb-3 mb-4 font-italic border-bottom">${sellerid}의 판매목록</h3>
		</div>
		
		<aside class="col-md-4 blog-sidebar">

			<div class="p-3">
				<h4 class="font-italic">Archives</h4>
				<ol class="list-unstyled mb-0">
					<li><a href="#">March 2014</a></li>
					<li><a href="#">February 2014</a></li>
					<li><a href="#">January 2014</a></li>
					<li><a href="#">December 2013</a></li>
					<li><a href="#">November 2013</a></li>
					<li><a href="#">October 2013</a></li>
					<li><a href="#">September 2013</a></li>
					<li><a href="#">August 2013</a></li>
					<li><a href="#">July 2013</a></li>
					<li><a href="#">June 2013</a></li>
					<li><a href="#">May 2013</a></li>
					<li><a href="#">April 2013</a></li>
				</ol>
			</div>
		</aside>
</body>
</html>
