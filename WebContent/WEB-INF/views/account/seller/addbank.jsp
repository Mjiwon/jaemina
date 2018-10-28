<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.media-body {
	float: left;
	width: 48%;
	height: 300px;
	margin-bottom: 30px;
	margin-left: 30px;
	
}
</style>
<script type="text/javascript">
	var r1 = new RegExp(/([\d]{12}|([\d]{4}-[\d]{5}-[\d]{6}))$/);
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
	<div class="jumbotron" align="center" style="background-color: gray;">
		<h1>판매자 등록</h1>
		<p>
			여러분들은 하루 평균 몇 명의 사람들과 마주치시나요?<br /> 그 속엔 반드시 나에게 무언가 가르쳐 줄 선생님이
			있습니다. 탈잉에서 여러분의 선생님을 찾고, 또 누군가의 선생님이 되어보세요
		</p>
	</div>
	<div align="center">
		<h2>어떻게 등록하나요?</h2>
	</div>

	<div class="media">
		<div class="media-body" style="background: green;">사진추가</div>
		<div class="media-body">
			<h2 class="media-heading" style="color: red;">Step 1</h2>
			<h2>당신의 재능으로 수업을 개설하세요</h2>
			<p>
				수업 커리큘럼 / 수업 스타일 / 가르쳐 본 경험 등을 적어주세요.<br /> 고민하셔서 자세히 적어주신다면 신청 확률도
				늘어납니다.<br /> 특히 판매자/ 수업과 관련된 이미지, 영상 파일들을<br /> 적극적으로 올려주세요!<br />
			</p>
		</div>
		<div class="media-body" style="background: blue;">사진추가</div>
		<div class="media-body" id="box">
			<h2 class="media-heading" style="color: red;">Step 2</h2>
			<h2>신청자들을 항상 확인하세요!</h2>
			<p>
				관심 있는 학생들의 신청을 항상 확인하세요!<br /> 판매자님의 연락처로 재미나에서 직접 알려드립니다.<br />
				연결 이후 스케쥴이나 수강 레벨이 맞지 않는 경우 <br /> 신청을 거절 할 수 있습니다.<br />
			</p>
		</div>
		<div class="media-body" style="background: red;">사진추가</div>
		<div class="media-body">
			<h2 class="media-heading" style="color: red;">Step 3</h2>
			<h2>최고의 경험을 만들어 주세요!</h2>
			<p>
				신청자들에게 최고의 경험을 만들어 주세요!<br /> 입소문이 한 번 나면 끊이지 않고<br /> 신청자가
				들어올거에요. <br /> 최고의 스타 강사가 되어 보세요!<br />
			</p>
		</div>
	</div>
	<div class="media">
		<div class="media-body" style="background: green;">사진추가</div>
		<div class="media-body">
		<h2>계좌 등록</h2>
	<form action="${pageContext.servletContext.contextPath}/addbank.do" method="post">
		<select name="bankname">
			<option>하나은행</option>
			<option>농협은행</option>
			<option>국민은행</option>
			<option>신한은행</option>
			<option>우리은행</option>
			<option>국민은행</option>
		</select>
				<label for="formGroupExampleInput">
				계좌번호</label> <input
					type="text" class="bank1" name="bank"
					placeholder="계좌번호를 입력해주세요"onkeyup="bankcheck(this)">
					<small id="checkbank"></small><br />
		<small>계좌번호 양식</small><br> 
		<small>XX은행 /XXXX-XXXXX-XXXXXX(4자리-5자리-6자리)</small><br> <small>XX은행/ 12자리</small></br> 
		<input type="submit" value="다음 단계로"  />
	</form>
	</div>
	</div>
</body>
</html>