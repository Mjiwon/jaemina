<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>판매자인증</title>
</head>
<body>
	<h2>판매자 인증</h2>
	<form action="${pageContext.servletContext.contextPath }/addseller.do"
		method="post" enctype="multipart/form-data">
		학력 : <input type="text" name="academy"> <br> 경력 : <input
			type="text" name="career"><br> 프로필 이미지 : <input
			type="file" name="imgpath"> <br> 자기소개 :<br>
		<textarea rows="30" cols="60" name="introuce"></textarea>
		<br>
		
		<select name="bankname" id="bankname">
			<option value="081">하나은행</option>
			<option value="011">농협은행</option>
			<option value="004">국민은행</option>
			<option value="088">신한은행</option>
			<option value="020">우리은행</option>
			<option value="003">기업은행</option>
			<option value="023">제일은행</option>
		</select>
				<label for="formGroupExampleInput">
				계좌번호</label> <input
					type="text" class="bank1" name="bank" id="bank"
					placeholder="계좌번호를 입력해주세요"onkeyup="bankcheck(this)">
					<small id="checkbank"></small><br />
		<small>계좌번호 양식</small><br> 
		<small>XX은행 /XXXX-XXXXX-XXXXXX(4자리-5자리-6자리)</small><br> 
		<small>XX은행/ 12자리</small><br/> 
		<br/>
		<!--  <b>판매자 인증</b><br/>
		신용카드 인증<br/>
		1원 결제후 판매자 인증이 되면 환불됩니다.<br/>
		<button id="sellerauth" type="button">판매자인증</button>
		 <input type="submit" value="다음 단계로"  /> -->
		<input hidden="" name="id" value="${loginId}"/>
		<button type="submit" id="bankauth">등록하기</button>
	</form>
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
	
	/* // DB에 판매자 등록 update
	var addseller = function(){
		var id = ${loginId};
		var bank = $("#bankname").val()+$("#bank").val();
		console.log("id : "+id+" / bank : "+bank);
		
		var param = {
			"id" : id ,
			"bank" : bank
		};
		
		$.post("${path}/addbank.do", param).done(function(rst){
			var obj = JSON.parse(rst);
			console.log("seller update : "+obj);
		});
		
		
	};
	
	// uid	
	var merchant_uid = new Date().getTime();

	
	// 판매자 등록 완료 이후 1원 환불
	var refunduid = "merchant_"+merchant_uid;
	
	
	//아임포트 라이브러리 파일이 로드되면 window.IMP 변수에 접근이 가능합니다.
	$("#sellerauth").on("click",function(){
				
		var IMP = window.IMP; // 생략가능
		IMP.init('imp81506411'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + merchant_uid,
		    id : '${loginId}',
		    amount : 1,
		    //seller_email : ${user.EMAIL},
		    m_redirect_url : '127.0.0.1:8080/jaemina/views/account/seller/addseller.jsp'
		}, function(rsp) {
		    
			if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        //msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        addseller();
		        console.log("결제 성공");
		        // 판매자 인증 후 1원 환불
		         $("#bankauth").prop("disabled",false);
		        // 결제 성공페이지로 보내기
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        console.log("결제 실패");
		        // 결제 실패 페이지로 보내기
		    }
		    alert(msg);
		})
	});
		$("#bankauth").on("click",function(){
			var refund = {
					"imp_uid" : refunduid,
					"pay_method" : 'card',
					'message' : 'bankauthpermitcheck',
					"amount" : 1
				}
		        $.post('https://api.iamport.kr/payments/cancel',param).done(function(rst){
		        	console.log(JSON.partse(rst));
		        });
		}); */
		</script>
</body>
</html>