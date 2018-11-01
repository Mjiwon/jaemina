<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<div class="container">
<p></p>
<br/>
			<label for="content">${user.ID }</label> <select id="star">
				<option value="1">★☆☆☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="3">★★★☆☆</option>
				<option value="4">★★★★☆</option>
				<option value="5">★★★★★</option>
			</select>
			<form name="commentmodifyForm">
				<div class="input-group">
					<input type="hidden" name="bno" value="${detail.bno}"  />
					 <input type="textarea " class="form-control" id="content" name="content"
						placeholder="내용을 입력하세요."> <span class="input-group-btn">
						&nbsp;
						<button class="btn btn-default" name="replymobtn"
							id="replymobtn" type="button" onclick="modify();">수정완료</button>
					</span>
				</div>
			</form>
		</div>
		
		
<script type="text/javascript">

var modify=function() {
	console.log("들어오긴하니??");
	var content = $("#content").val();	
	var vstar=$("#star").val();
	var star;
	switch (vstar) {
	case "1":
		star="★☆☆☆☆";	
		break;
	case "2":
		star="★★☆☆☆";
		break;s
	case "3":
		star="★★★☆☆";
		break;
	case "4":
		star="★★★★☆";
		break;
	
	case "5":
		star="★★★★★";
		break;
	}
	console.log(star);	
	var param = {
		"bno" : "${bno}",
		"writer": "${user.ID}",
		"content":content,
		"star":star,
		"star_num":vstar
				}
	$.post("${pageContext.servletContext.contextPath }/ajax/modifyreply.do",param).done(function(rst) {
	var obj = rst;
		if(obj==1){
			$("#content").val("");
			window.alert("댓글 수정 완료");
			$(opener.document.getElementById("replylistbtn")).trigger("click");
			window.close();
		}else{
		window.alert("댓글 수정 실패했습니다 관리자에게 문의해주세요");	
	
		}
		});
}
		
</script>
</body>
</html>