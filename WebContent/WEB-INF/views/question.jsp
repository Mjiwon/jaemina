<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>재능을 나누다 - 재미나</title>
</head>
<body>
<body class="bg-light">

	<div class="container">
		<div class="py-5 text-center">
			<h2>문의하기</h2>
		</div>
		<div class="row">
			<!-- 판매내용 작성 -->
			<div class="col-md-8 order-md-1">
				<form action="" method="post" enctype="multipart/form-data">
					<div class="mb-3">
							<label>작성자</label>
							<div class="input-group">
								<input type="text" class="form-control" id="writer"
									name="writer" value="${user.ID }" readonly>
							</div>
						</div>
						
						<div class="mb-3">
							<label>제목</label>
							<div class="input-group">
								<input type="text" class="form-control" id="title"
									name="title">
							</div>
						</div>

						<div class="mb-3">
							<label>Title이미지</label>
							<input 	type="file" class="form-control" id="img">
						</div>

						<div class="mb-3">
							<label for="address2">상세내용</label>
							<textarea rows="20" cols="20" class="form-control" name="content"></textarea>
						</div>

						<hr class="mb-4">
						<button class="btn btn-primary btn-lg btn-block" type="submit">문의하기</button>
				</form>
			</div>
		</div>

	</div>

</body>
</html>