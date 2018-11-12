<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>재미나</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="ass/css/main.css" />
<noscript>
	<link rel="stylesheet" href="ass/css/noscript.css" />
</noscript>

<style>
input::placeholder {
	color:#ea1d5d;
	font-style: italic;
	font-weight: bold;
}

textarea::placeholder {
	color: #ea1d5d;
	font-style: italic;
	font-weight: bold;
}

#dd input {
	background-color: #fff;
}

#dd input:hover  {
	display:inline-block;
	background-color:#ea1d5d;
	color:#fff;
}
</style>



</head>
<body class="is-preload">

	<!-- Header -->
	<!-- <header id="header" style="background-color: #E78CA8;">
		<a href="index.do"><img src="images/hlogo1.png"
			title="The Anonymous Red" alt="" /> </a> <a class="image fit"></a>
	</header> -->

	<!-- Intro -->
	<section id="intro" class="main style1 dark fullscreen">
		<div class="content">
			<header>
				<h2>재미나 판매자 등록</h2>
			</header>
			<p>
				<B>재미나</B>에서 여러사람들의 <B>아름다운 재능</B>을 배우고 또 누군가에게 당신의 <B>아름다운 재능</B>을
				가르치는
			<P />
			<P>
				<B>선생님이 되어보세요.</B>
			</p>
			<footer>
				<a href="#one" class="button style2 down">More</a>
			</footer>
		</div>
	</section>

	<!-- One -->
	<section id="one" class="main style2 right dark fullscreen">
		<div class="content box style2">
			<header>
				<h3 style="color: #FF7171">STEP 1</h3>
				<h2>재능으로 수업을 개설하세요</h2>
			</header>
			<H3>
				<p>수업 커리큘럼 /수업 스타일 /가르쳐 본 경험 등을 적어주세요.고민하셔서 자세히 적어주신다면 신청 확률도
					늘어납니다. 특히 수업과 관련된 이미지 파일들을 적극적으로 올려주세요!</p>
			</H3>
		</div>
		<a href="#two" class="button style2 down anchored">Next</a>
	</section>

	<!-- Two -->
	<section id="two" class="main style2 left dark fullscreen">
		<div class="content box style2">
			<header>
				<h3 style="color: #FF7171">STEP 2</h3>
				<h2>신청자들을 항상 확인하세요!</h2>
			</header>
			<H3>
				<p>관심 있는 학생들의 신청을 항상 확인하세요!판매자님의 연락처로 재미나에서 직접 알려드립니다.연결 이후
					스케쥴이나 수강 레벨이 맞지 않는 경우 신청을 거절 할 수 있습니다.</p>
			</H3>
		</div>
		<a href="#three" class="button style2 down anchored">Next</a>
	</section>

	<!-- THREE -->
	<section id="three" class="main style2 right dark fullscreen">
		<div class="content box style2">
			<header>
				<h3 style="color: #FF7171">STEP 3</h3>
				<h2>최고의 경험을 만들어 주세요!</h2>
			</header>
			<H3>
				<p>신청자들에게 최고의 경험을 만들어 주세요! 입소문이 한 번 나면 끊이지 않고 신청자가 들어올거에요. 최고의
					스타 강사가 되어 보세요!</p>
			</H3>
		</div>
		<a href="#work" class="button style2 down anchored">Next</a>
	</section>


	<!-- Work -->
	<section id="work" class="main style3 primary">
		<div class="content">
			<header>
				<h2>재미나 후기</h2>
				<P>
					재미나에서는 자신의 재능을 강의로 등록하여 수업을 진행할 수 있고,<BR /> 다른 사람의 재능강의를 들을 수 도
					있습니다
				</P>
			</header>

			<!-- Gallery  -->
			<div class="gallery">
				<article class="from-left">
					<a class="image fit"><img src="images/thumbs/1.jpg"
						title="The Anonymous Red" alt="" /></a>
				</article>
				<article class="from-right">
					<a class="image fit"><img src="images/thumbs/2.jpg"
						title="Airchitecture II" alt="" /></a>
				</article>
				<article class="from-left">
					<a class="image fit"><img src="images/thumbs/3.jpg"
						title="Air Lounge" alt="" /></a>
				</article>
				<article class="from-right">
					<a class="image fit"><img src="images/thumbs/4.jpg"
						title="Carry on" alt="" /></a>
				</article>
				<article class="from-left">
					<a class="image fit"><img src="images/thumbs/5.jpg"
						title="The sparkling shell" alt="" /></a>
				</article>
				<article class="from-right">
					<a class="image fit"><img src="images/thumbs/6.jpg"
						title="Bent IX" alt="" /></a>
				</article>
			</div>

		</div>


	</section>

	<!-- Contact -->
	<section id="contact" class="main style3 secondary"
		style="background-color: #fff;">
		<div class="content">
			<header>
				<h2 style="color: #000;">판매자 등록하기</h2>
				<p style="color: white;"></p>
			</header>
			<div class="box" style="background-color: #fff">
				<form
					action="${pageContext.servletContext.contextPath }/addseller.do"
					method="post" enctype="multipart/form-data">
					<div class="fields">
						<div class="field half">
							<input type="text" name="academy" id="academy" placeholder="학력"
								lder="Name" style="color: black;" onkeyup="check();" maxlength="40">
						</div>
						<div class="field half">
							<input type="text" name="licence" id="licence" placeholder="자격증"
								onkeyup="check();" maxlength="40"/>
						</div>
						<div class="field">
							<input type="text" name="career" id="career" placeholder="경력"
								onkeyup="check();" /> 프로필 이미지 :<input type="file"
								name="imgpath" />
						</div>
						<div class="field">
							<select name="bankname" style="font-weight: bold; color:#ea1d5d;">
								<option>하나은행</option>
								<option>농협은행</option>
								<option>국민은행</option>
								<option>신한은행</option>
								<option>우리은행</option>
								<option>기업은행</option>
							</select> 
							<input type="text" name="bank" id="bank"
								placeholder="- 제외한 12자리" onkeyup="bankcheck(this)"
								onchange="check();" maxlength="12"/> 
								<small id="checkbank"></small>
						</div>
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


						<div class="field">
							<textarea name="introduce" placeholder="소개" id="introduce"
								rows="6" onkeyup="check();" maxlength="1000"></textarea>
						</div>
					</div>
					<ul>
						<li id="dd"><input type="submit" value="작성중" id="sellercommit"
							disabled="disabled"  onclick="success();"/></li>
					</ul>
				</form>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer"> since.JAEMINA </footer>

	<!-- Scripts -->
	<script type="text/javascript">
		var check = function() {
			if ($("#academy").val() != "") {
				if ($("#licence").val() != "") {
					if ($("#career").val() != "") {
							if ($("#introduce").val() != ""){
								$("#sellercommit").prop("disabled", false);
								$("#sellercommit").val("판매자 등록하기");
							}else{$("#sellercommit").prop("disabled",true);
							$("#sellercommit").val("작성중");}
						}else{$("#sellercommit").prop("disabled",true);
						$("#sellercommit").val("작성중");}
					}else {$("#sellercommit").prop("disabled",true);
					$("#sellercommit").val("작성중");}
				}else {$("#sellercommit").prop("disabled",true);
				$("#sellercommit").val("작성중");}
			}
		
		var success = function() {
				window.alert("판매자 등록 완료")
			};	
		
	</script>




	<script src="ass/js/jquery.min.js"></script>
	<script src="ass/js/jquery.poptrox.min.js"></script>
	<script src="ass/js/jquery.scrolly.min.js"></script>
	<script src="ass/js/jquery.scrollex.min.js"></script>
	<script src="ass/js/browser.min.js"></script>
	<script src="ass/js/breakpoints.min.js"></script>
	<script src="ass/js/util.js"></script>
	<script src="ass/js/main.js"></script>

</body>
</html>