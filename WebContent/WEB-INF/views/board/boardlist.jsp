<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentPage">1</c:set>
<c:set var="totalPage" value="${totalPage }"></c:set>
<c:set var="pageBlock">10</c:set>

<fmt:parseNumber var="currentBlock" integerOnly="true" value="${currentPage/pageBlock }"/>
<fmt:parseNumber var="lastBlock" integerOnly="true" value="${totalPage/pageBlock }"/>

<c:set var="startNum" value="${currentBlock*pageBlock+1 }"/>
<c:set var="endNum" value="${currentBlock*pageBlock+pageBlock }"/>
<c:if test="${endNum > totalPage }"><c:set var="endNum" value="${totalPage }"/></c:if>
<div align="center">
	<ul class="nav justify-content-center">
		<c:forEach var="i" items="${bigcates }">
			<li class="nav-item" value="${i.NO }"><a class="nav-link disabled" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${i.NO}"><b>${i.BIGCATE }</b></a></li>
		</c:forEach>
	</ul>

</div>
<div class="row" style="margin-top: 2%;">
	<div class="col-2">
		<ul class="list-group list-group-flush" style="text-align: center; margin-left: 2%;">
     		<c:forEach var="i" items="${smallcates}">
				 <a class="list-group-item list-group-item-action " id="v-pills-settings-tab" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${i.BIGNO}&smallcate=${i.SMALLNO}" role="tab" aria-controls="v-pills-settings" >${i.SMALLCATE }</a>     		
     		</c:forEach>
		</ul>
	</div>
	<div class="col-9">
		<div class="row">
				<c:forEach var="l" items="${boardlist }">
					<div class="col-md-4">
						<a
							href="${pageContext.servletContext.contextPath }/board/detail.do?no=${l.NO}">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top"
									src="${pageContext.servletContext.contextPath }${l.IMGPATH}"
									width="286" height="180">
								<div class="card-body">
									<p class="card-text">${l.TITLE }</p>
									<p class="card-text" style="color: red;">
										<b><fmt:formatNumber>${l.PRICE }</fmt:formatNumber>원</b>
									</p> 
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		<c:if test="${currentPage != 1 }">[첫 페이지][이전 페이지] | </c:if>
		<c:forEach var="index" begin="${startNum }" end="${endNum }" varStatus="status">
			<c:choose>
				<c:when test="${index == currentPage }"><a id="pagebtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${l.NO }&currentPage=${index}"><b>${index }</b></a></c:when>
				<c:otherwise><a id="pagebtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${l.NO }&currentPage=${index}">${index }</a></c:otherwise>
			</c:choose>
			<c:if test="${!status.last }"> | </c:if>
		</c:forEach>
		<c:if test="${currentPage != totalPage }"> | <button type="button" id="nextbtn">[다음 페이지]</button>[마지막 페이지]</c:if>
	</div>

</div>

<script>
	$("#nextbtn").on("click", function(){
		location.href = "${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${i.NO}&current";
	});
</script>