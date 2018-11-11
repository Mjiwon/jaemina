
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<div class="container">
	<div class="row">
		<div class="col">구매 건수 : ${buyListCnt }</div>
		<div class="col">
			<c:forEach var="buy" items="${buyList }">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top" src="..." alt="Card image cap">
					<p class="card-title"></p>
					<div class="card-body">
						<p class="card-buydate">${buy.BUYDATE }</p>
						<h6 class="card-price">
							<fmt:formatNumber>${buy.PRICE }</fmt:formatNumber>
							원
						</h6>
						<c:choose>
							<c:when test="${buy.BUYING ==  2}">
								<p class="card-buying">
									<!-- 구매자의 환불신청이나 취소 신청시 -->
									구매중
								</p>
								<p class="card-selling">
									<a
										href="${path }/mypage/buychangestate.do?postno=${buy.POSTNO}&no=${buy.NO}"
										class="btn btn-primary">취소/환불신청</a>
								</p>
							</c:when>
							<c:when test="${buy.BUYING ==  3}">
								<p class="card-buying">
									<!-- 구매자의 환불신청이나 취소 신청시 -->
									구매완료
								</p>
							</c:when>
							<c:when test="${buy.BUYING ==  4}">
								<p class="card-buying">
									<!-- 구매자의 환불신청이나 취소 신청시 -->
									환불신청
								</p>
								<p class="card-selling">
									<a
										href="${path }/mypage/buychangestate.do?postno=${buy.POSTNO}&no=${buy.NO}"
										class="btn btn-primary">환불취소</a>
								</p>
							</c:when>
							<c:when test="${buy.BUYING ==  5}">
								<p class="card-buying">
									<!-- 구매자의 환불신청이나 취소 신청시 -->
									환불완료
								</p>
							</c:when>
							<c:when test="${buy.BUYING ==  6}">
								<p class="card-buying">
									<!-- 구매자의 환불신청이나 취소 신청시 -->
									취소신청
								</p>
								<p class="card-selling">
							</c:when>
							<c:otherwise>
								<p class="card-buying">
									<!-- 구매자의 환불신청이나 취소 신청시 -->
									취소완료
								</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>