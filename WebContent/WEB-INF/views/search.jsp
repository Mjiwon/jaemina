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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<style type="text/css">
u {
	text-decoration: none;
	border-bottom: 1px solid;
	padding-bottom: 2px;
}
</style>
<title>재미나</title>
</head>
<body>
	<div class="container">
			<h1 class="display-4">재미나</h1>
			<p class="lead">아름다운 재능을 나누다</p>
			<form action="${pageContext.servletContext.contextPath }/searchList.do" class="form-inline my-2 my-lg-0" method="post">
				<input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchKey" name="searchKey"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit" >Search</button>
			</form>
	</div>
	
	<script type="text/javascript">
		var $("#searchKey")
	</script>
</body>
</html>