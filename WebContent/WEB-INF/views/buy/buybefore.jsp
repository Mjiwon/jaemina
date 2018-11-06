<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>	
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
	<h1>구매하기</h1>
	
	<!-- 여기에 구매하는 정보 CSS 부탁드립니다.-->
	결제
	<form>
	<!-- 동의를 누르면 버튼이 활성되게부탁합니다. -->
		<input  hidden="" id="postno" name="postno" value="${buy.postno }"/><br/>
		<input  hidden="" id="seller" name="seller" value="${buy.seller }"/><br/>
		<input  hidden="" id="price" name="price" value="${buy.price  }"/><br/>
		<input  hidden="" id="buyer" name="buyer" value="${buy.buyer }"/><br/>
		<input  hidden="" id="buyeremail" name="buyeremail" value="${buy.buyeremail }"/><br/>
		<button id="buybtn" type="button">결제</button>
	</form>
	
	<script type="text/javascript">
	// 결제후 paydb insert
	var paydbinsert = function(){
		var postno = $("#postno").val();
		var seller = $("#seller").val();
		var price = $("#price").val();
		var buyer = $("#buyer").val();
		// ajax param 설정
		var param = {
			"postno":postno,
			"seller":seller,
			"price":price,
			"buyer":buyer
		};
		// ajax post 보내기
		$.post("${path}/ajax/buy.do",param,function(rst){
			var obj = JSON.parse(rst);
			console.log('obj : '+obj);
		});
		
	};
	
	//아임포트 라이브러리 파일이 로드되면 window.IMP 변수에 접근이 가능합니다.
	$("#buybtn").on("click",function(){
				
		var IMP = window.IMP; // 생략가능
		IMP.init('imp81506411'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : $("#seller").val()+'-'+$("#postno"),
		    amount : $("#price").val(),
		    buyer_email : 'iamport@siot.do',
		    buyer_name : $("#buyer").val(),
		    buyer_email : $("#buyeremail").val(),
		    //buyer_addr : '서울특별시 강남구 삼성동',
		    //buyer_postcode : '123-456',
		    m_redirect_url : '127.0.0.1:8080/jaemina/views/buy/buybefore.jsp'
		}, function(rsp) {
		    
			if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        //msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        paydbinsert();
		        console.log("결제 성공");
		        
		        // 결제 성공페이지로 보내기
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        console.log("결제 실패");
		        // 결제 실패 페이지로 보내기
		    }
		    alert(msg);
		});
	});
	</script>
