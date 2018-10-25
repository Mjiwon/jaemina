<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<h3>결재선택</h3>
	<form action="${pageContext.servletContext.contextPath }/">
		<input class="checkbox" type="checkbox" name="payment" onclick="" value="신용카드" checked >신용카드
		<input class="checkbox" type="checkbox" name="payment" onclick="" value="무통장입금" >	무통장입금
		<span id="card"></span>
		<span id="money"></span>
	</form>
	<script>
		$(".checkbox").on("click", function(){
			$(".checkbox").not(this).prop("checked", false);
		});
	</script>
	
</body>
</html>