<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>${detail.TITLE }</title>

<body class="bg-light">

	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4"
				src="../../assets/brand/bootstrap-solid.svg" alt="" width="72"
				height="72">
			<h2>제목 : ${detail.TITLE }</h2>
		</div>

		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">판매자 정보</span>
				</h4>


				<form class="card p-2">
					<div class="card" style="width: auto;">
						<img class="card-img-top"
							src="${pageContext.servletContext.contextPath }${writer.IMGPATH}"
							alt="Card image cap" style="height: 8cm;">
						<div class="card-body">
							<h5 class="card-title">${writer.WRITER }</h5>
							<p>판매자 : ${writer.ID }
							<p>학력 : ${writer.ACADEMY }</p>
							<p>경력 : ${writer.CAREER }</p>
							<p>소개 : ${writer.INTRODUCE }</p>
							<c:choose>
								<c:when test="${writer.ID == user.ID }">
									<a
										href="${pageContext.servletContext.contextPath }/board/modifyDetail.do?no=${detail.NO}"><button
											type="button">수정</button></a>
									<a href="javascript:goDelete(${detail.NO });"><button
											type="button">삭제</button></a>
									<script>
										var goDelete = function(no) {
											if (window.confirm("정말삭제하시겠습니까?") == true) {
												window.alert("삭제되었습니다.");
												location.href = "${pageContext.servletContext.contextPath }/board/deleteDetail.do?no="
														+ no;

											} else {
												return;
											}
										};
									</script>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.servletContext.contextPath }/qa/buyqa.do?no=${detail.NO }&writer=${detail.WRITER}"
										class="btn btn-primary" style="margin-bottom: 10px">판매자에게
										문의하기</a>
									<c:choose>
										<c:when test="${empty wishlistcheck}">
											<a
												href="${pageContext.servletContext.contextPath }/addWishlist.do?no=${detail.NO}&writer=${detail.WRITER}"
												class="btn btn-primary" id="addlike">관심 판매자로 등록</a>
										</c:when>
										<c:otherwise>
											<a
												href="${pageContext.servletContext.contextPath }/deleteWishlist.do?no=${detail.NO}&writer=${detail.WRITER}"
												class="btn btn-primary" id="deletelike">관심 판매자에서 제거</a>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">카테고리 : ${cate.BIGCATE} | ${cate.SMALLCATE}</h4>
				<form class="needs-validation"
					action="${pageContext.servletContext.contextPath }/buy.do"
					novalidate>
					<div class="mb-3">
						<label for="username">작성 날짜</label>
						<div class="input-group" style="">
							<input type="text" class="form-control" id="username"
								value="${detail.WRDATE}" style="background-color: white;"
								readonly>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">작성자</label> <input type="text"
								class="form-control" id="firstName" placeholder=""
								value="${detail.WRITER }" readonly="readonly"
								style="width: 610px; background-color: white;">
							<div class="invalid-feedback" style="width: 100%;">Valid
								first name is required.</div>
						</div>
					</div>



					<div class="mb-3">
						<label for="username">금액</label>
						<div class="input-group">
							<input type="text" class="form-control" id="username"
								value="<fmt:formatNumber>${detail.PRICE }</fmt:formatNumber>원"
								readonly="readonly" style="background-color: white;">
							<div class="invalid-feedback" style="width: 100%;">Your
								username is required.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="address">내용</label> <input type="text"
							class="form-control" id="address" value="${detail.CONTENT }"
							readonly="readonly"
							style="background-color: white; height: 514px;">
						<div class="invalid-feedback">Please enter your shipping
							address.</div>
					</div>

					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">구매하기</button>
				</form>
			</div>
		</div>
		<div class="container">
			<label for="content">${user.ID }</label> <select id="star">
				<option value="1">★☆☆☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="3">★★★☆☆</option>
				<option value="4">★★★★☆</option>
				<option value="5">★★★★★</option>
			</select>
			<form name="commentInsertForm">
				<div class="input-group">
					<input type="hidden" name="bno" value="${detail.bno}" /> <input
						type="textarea " class="form-control" id="content" name="content"
						placeholder="수정할 내용을 입력하세요." min="10"> <span
						class="input-group-btn"> &nbsp;
						<button class="btn btn-default" type="button" name="replybtn"
							id="replybtn">등록</button>
					</span>
				</div>
			</form>
		</div>

		<div class="container">
			<button class="btn btn-defaut" id="replylistbtn">댓글보기</button>
			<div class="commentList"></div>
		</div>



		<div id="reply"></div>


		<script type="text/javascript">	
		
		$("#addlike").on("click", function() {
			window.alert("등록되었습니다.");
		});
		
		$("#deletelike").on("click", function() {
			window.alert("삭제되었습니다.");
		});
		
		//댓글 삭제
		var deleteReply =function() {
				var param = {
								"writer" :"${user.ID}",
								"bno" : ${detail.NO}
				};
				console.log("삭제"+param);
				$.post("${pageContext.servletContext.contextPath }/ajax/deletereply.do",param).done(function(rst) {
					var obj = rst;
						if(obj==1){
							window.alert("댓글 삭제의 성공했습니다")
							ListReply();
						 }else 
							window.alert("댓글 삭제의 실패 하셨습니다 관리자에게 문의 해주세요");
						 
				});
		};
		
		//댓글  수정
		var modifyreply =function() {
			window.open("${pageContext.servletContext.contextPath }/modifyreply.do?bno=${detail.NO}", "댓글수정", "width=700, height=200, left=700, top=200");
			
		};
		
		
		
		$("#replylistbtn").on("click",function() {
				ListReply();
		});

			function ListReply(){
				var param = {"bno" : "${detail.NO}"};
				console.log(param);
				$.post("${pageContext.servletContext.contextPath }/ajax/replylist.do",param).done(function(rst) {
				var obj = rst;
				var html = "";
				if(obj.length>0){
				for (var i = 0; i < obj.length; i++) {
				console.log("누구누구있니?"+obj[i].WRITER);
	            html += "<div><div><table class=\"table\"><h6><strong>"+obj[i].WRITER+"</strong><small>"+obj[i].STAR+"</small><small>"+obj[i].RDATE+"</small></h6>";
	            html +=obj[i].CONTENT+"<br/><tr><td></td>";
	            
		         if(obj[i].WRITER==("${user.ID}")){
        		html+="<button class=\"btn btn-defaut\" onclick=\"modifyreply();\" >"+"수정"+"</button>&nbsp;" ;
        		html+="<button class=\"btn btn-defaut\" onclick=\"deleteReply();\" >"+"삭제"+"</button>";
              } 
	            html +="</tr></table></div></div>";
				}
				}else{
				window.alert("등록된 댓글이 없습니다")
				}
			$("#reply").html(html);
			});
			}
			

				
//--------------------------------------------------------------------


//작성
$("#replybtn").on("click",function() {
	if( ${loginOk!=null}){
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
		"bno" : ${detail.NO},
		"writer": "${user.ID}",
		"content":content,
		"star":star,
		"star_num":vstar
				}
	$.post("${pageContext.servletContext.contextPath }/ajax/replyWrite.do",param).done(function(rst) {
	var obj = rst;
		if(obj==1){
			$("#content").val("");
			ListReply();
		 }else 
			window.alert("이미 댓글 등록하셨습니다 댓글 수정을 이용 해주세요");
		 
	});
	}else
		{
		window.alert("로그인을 해주세요");
		}

});

		</script>


		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2018-2019 재미나</p>
		</footer>
	</div>

</body>