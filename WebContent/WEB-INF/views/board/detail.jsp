<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>${detail.TITLE }</title>

<body class="bg-light">

	<div class="container" style="margin-top: 5%;">
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
					<div class="card" style="width: 18rem;">
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
										}
									</script>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.servletContext.contextPath }/qa/buyqa.do?no=${detail.NO }&writer=${detail.WRITER}"
										class="btn btn-primary" style="margin-bottom: 10px">판매자에게 문의하기</a>
										<a
											href="${pageContext.servletContext.contextPath }/addWishlist.do?writer=${detail.WRITER}"
											class="btn btn-primary">관심 판매자로 등록</a>
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

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2018-2019 재미나</p>
		</footer>
	</div>