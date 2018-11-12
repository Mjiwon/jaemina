<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>고객센터</title>
</head>
<body>
	<div style="padding: 10px; margin-top: 120px;">
		<div style="padding-left: 25%; padding-right: 25%;">
			<div style="padding: 15px;">
				<h3>고객센터-문의하기</h3>
					안녕하세요, 재미나 고개센터입니다.<br /> 
					문의 내용을 상세히 작성해서 보내주시면 최대한 빠른 시일내에 답변
					드리겠습니다. 감사합니다!
			</div>
			<form action="${pageContext.servletContext.contextPath }/serviceqa.do"
				method="post" enctype="multipart/form-data">
				<div class="col">
					<div class="mb-3">
						<label>작성자</label>
						<div class="input-group">
							<input type="text" class="form-control" id="writer" name="sender"
								value="${user.ID }" readonly>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="mb-3">
						<label>제목</label>
						<div class="input-group">
							<input type="text" class="form-control" id="title" name="title" maxlength="50" required autofocus>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="mb-3">
						<label for="address2">상세내용</label>
						<textarea rows="10" cols="10" class="form-control" name="content" maxlength="1000" required autofocus></textarea>
					</div>
				</div>
				<div class="col" align="right">
					<button type="submit">문의하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>