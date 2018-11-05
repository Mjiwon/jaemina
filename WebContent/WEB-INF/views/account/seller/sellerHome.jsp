<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="currentPage">${currentPage }</c:set>
<c:set var="totalPage">${totalPage }</c:set>
<c:set var="pageBlock">10</c:set>

<fmt:parseNumber var="currentBlock" integerOnly="true" value="${currentPage/pageBlock }"/>
<fmt:parseNumber var="lastBlock" integerOnly="true" value="${totalPage/pageBlock }"/>
<c:if test="${currentPage%pageBlock == 0 }"><c:set var="currentBlock" value="${currentBlock -1 }"/></c:if>
<c:set var="startNum" value="${currentBlock*pageBlock+1 }"/>
<c:set var="endNum" value="${currentBlock*pageBlock+pageBlock }"/>
<c:if test="${endNum > totalPage }"><c:set var="endNum" value="${totalPage }"/></c:if>
<div class="container">
	<div class="py-5 text-center" align="center">
		<img class="rounded-circle"
			src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}"
			height="75" width="75" />

		<h2>${Seller.ID }</h2>
		<h4 class="mb-3">${Seller.ID }님의서비스|포트폴리오</h4>
	</div>

	<div class="row">
		<div class="col-md-4 order-md-2 mb-4">
			<div class="card" style="width: 18rem;">
				<div class="card-body">
					<p>● 학력</p>
					<p>${Seller.ACADEMY}</p>
					<p>● 경력사항</p>
					<p>${Seller.CAREER }</p>
					<p>● 소개</p>
					<p>${Seller.INTRODUCE }</p>
					<c:if test="${loginId == Seller.ID }">
						<form
							action="${pageContext.servletContext.contextPath}/update_seller.do"
							method="get">
							<input type="submit" value="정보수정">
						</form>
					</c:if>
				</div>
			</div>

		</div>
		<div class="col-md-8 order-md-1">


			<div class="container">
				<div class="row">
					<c:forEach var="i" items="${MyBoard }">
						<div class="col-md-4">
							<a
								href="${pageContext.servletContext.contextPath }/board/detail.do?no=${i.NO}">
								<div class="card mb-4 shadow-sm">
									<img class="card-img-top"
										src="${pageContext.servletContext.contextPath }${i.IMGPATH}"
										width="286" height="180">
									<div class="card-body">
										<p class="card-text">${i.TITLE }</p>
										<p class="card-text" style="color: red;">
											<b><fmt:formatNumber>${i.PRICE }</fmt:formatNumber>원</b>
										</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<c:if test="${!empty Myck }">
					<c:if test="${currentPage != 1 }"><a id="firstbtn" href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=1" style="color: black;">[첫 페이지] | </a></c:if>
					<c:if test="${currentBlock == 1 }"><a id="prevbtn" href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=${startNum-pageBlock+9 }" style="color: black;"> [이전] |</a></c:if>
				
					<c:forEach var="index" begin="${startNum }" end="${endNum }" varStatus="status">
						<c:choose>
							<c:when test="${index == currentPage }"><b>${index }</b></c:when>
							<c:otherwise><a id="pagebtn" href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=${index}" style="color: black;">${index }</a></c:otherwise>
						</c:choose>
						<c:if test="${!status.last }"> | </c:if>
					</c:forEach>
					<c:if test="${currentBlock != lastBlock}"><a id="nextbtn" href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=${startNum+pageBlock }" style="color: black;"> | [다음]</a></c:if>
					<c:if test="${currentPage != totalPage }"><a id="lastbtn" href="${pageContext.servletContext.contextPath }/myboard.do?currentPage=${totalPage}" style="color: black;"> | [마지막 페이지]</a></c:if>
				</c:if>
				<c:if test="${!empty Sellerck }">
					<c:if test="${currentPage != 1 }"><a id="firstbtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=1" style="color: black;">[첫 페이지] | </a></c:if>
					<c:if test="${currentBlock == 1 }"><a id="prevbtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=${startNum-pageBlock+9 }" style="color: black;"> [이전] |</a></c:if>
				
					<c:forEach var="index" begin="${startNum }" end="${endNum }" varStatus="status">
						<c:choose>
							<c:when test="${index == currentPage }"><b>${index }</b></c:when>
							<c:otherwise><a id="pagebtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=${index}" style="color: black;">${index }</a></c:otherwise>
						</c:choose>
						<c:if test="${!status.last }"> | </c:if>
					</c:forEach>
					<c:if test="${currentBlock != lastBlock}"><a id="nextbtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=${startNum+pageBlock }" style="color: black;"> | [다음]</a></c:if>
					<c:if test="${currentPage != totalPage }"><a id="lastbtn" href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID}&currentPage=${totalPage}" style="color: black;"> | [마지막 페이지]</a></c:if>
				</c:if>
			</div>

		</div>
	</div>

</div>

