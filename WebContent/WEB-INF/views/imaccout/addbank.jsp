<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var r1 = new RegExp(
			/([\d]{12}|([\d]{4}-[\d]{5}-[\d]{6}))$/);
	var bankcheck = function(p) {
		if (r1.test(p.value) == true) {
			document.getElementById("checkbank").innerHTML = "계좌번호 양식에 일치합니다";
			document.getElementById("checkbank").style.color = "green";
		} else {
			document.getElementById("checkbank").innerHTML = "계좌번호 양식에 맞게 작성해주세요";
			document.getElementById("checkbank").style.color = "red";
		}
	};
</script>
</head>
<body>
	<form action="${pageContext.servletContext.contextPath}/addbank.do"
		method="post">
		<select name="bankname">
		<option>하나은행</option>
		<option>농협은행</option>
		<option>국민은행</option>
		<option>신한은행</option>
		<option>우리은행</option>
		<option>국민은행</option>
		</select>
		계좌번호 입력:<input type="text" name="bank" id="bank1" onkeyup="bankcheck(this)"><br/>
		<small id="checkbank"></small><br/> 
		<small>계좌번호 양식</small><br>
		<small>XX은행 / XXXX-XXXXX-XXXXXX(4자리-5자리-6자리)</small><br>
		<small>XX은행/ 12자리</small></br>
		 <input type="submit" value="계좌 확인" />

	</form>
</body>
</html>