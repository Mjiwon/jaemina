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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>결재하기</title>
</head>
<body>
	<h3>결재선택</h3>
	<nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<a class="nav-item nav-link active" id="nav-home-tab"
				data-toggle="tab" href="#nav-home" role="tab"
				aria-controls="nav-home" aria-selected="true">신용카드</a> 
				
				<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
				href="#nav-profile" role="tab" aria-controls="nav-profile"
				aria-selected="false">무통장입금</a> 
		</div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			<br/>
			<select name="cardpay">
				<option>카드사를 선택해주세요</option>
				<option>삼성카드</option>
				<option>하나카드</option>
				<option>비씨카드</option>
				<option>KB국민</option>
				<option>신한카드</option>
				<option>롯데카드</option>
				<option>NH농협</option>
				<option>하나카드</option>
				<option>씨티카드</option>
			</select>	
					
		</div>
		
		<div class="tab-pane fade" id="nav-profile" role="tabpanel"	aria-labelledby="nav-profile-tab">

		</div>

	</div> 
<%-- 
	<form action="${pageContext.servletContext.contextPath }/">
		<input class="checkbox" type="checkbox" name="payment" onclick=""
			value="신용카드" checked>신용카드 <input class="checkbox"
			type="checkbox" name="payment" onclick="" value="무통장입금">
		무통장입금 <span id="card"></span> <span id="money"></span>
	</form>


	<script>
		$(".checkbox").on("click", function() {
			$(".checkbox").not(this).prop("checked", false);
		});
	</script>
 --%>
</body>
</html>