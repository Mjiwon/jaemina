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
<div align="center">
	<ul class="nav justify-content-center">
		<c:forEach var="i" items="${bigcates }">
			<li class="nav-item" value="${i.NO }"><a class="nav-link disabled" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${i.NO}&currentPage=1"><b>${i.BIGCATE }</b></a></li>
		</c:forEach>
	</ul>

</div>
<div class="row" style="margin-top: 2%;">
	<div class="col-2">
		<ul class="list-group list-group-flush" style="text-align: center; margin-left: 2%;">
     		<c:forEach var="i" items="${smallcates}">
				 <a class="list-group-item list-group-item-action " id="v-pills-settings-tab" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${i.BIGNO}&smallcate=${i.SMALLNO}&currentPage=1" role="tab" aria-controls="v-pills-settings" >${i.SMALLCATE }</a>     		
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
		<c:if test="${!empty searchLog }">
			<c:if test="${currentPage != 1 }"><a id="firstbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=1" style="color: black;">[첫 페이지] | </a></c:if>
			<c:if test="${currentBlock == 1 }"><a id="prevbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${startNum-pageBlock+9 }" style="color: black;"> [이전] |</a></c:if>
			
			<c:forEach var="index" begin="${startNum }" end="${endNum }" varStatus="status">
				<c:choose>
					<c:when test="${index == currentPage }"><b>${index }</b></c:when>
					<c:otherwise><a id="pagebtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${index}" style="color: black;">${index }</a></c:otherwise>
				</c:choose>
				<c:if test="${!status.last }"> | </c:if>
			</c:forEach>
			<c:if test="${currentBlock != lastBlock }"><a id="nextbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${startNum+pageBlock }" style="color: black;"> | [다음]</a></c:if>
			<c:if test="${currentPage != totalPage && totalPage > 1}"><a id="lastbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${totalPage}" style="color: black;"> | [마지막 페이지]</a></c:if>
		</c:if>
		<c:if test="${!empty bigCate && empty smallCate }">
			<c:if test="${currentPage != 1 }"><a id="firstbtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=1" style="color: black;">[첫 페이지] | </a></c:if>
			<c:if test="${currentBlock == 1 }"><a id="prevbtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${startNum-pageBlock+9 }" style="color: black;"> [이전] |</a></c:if>
			
			<c:forEach var="index" begin="${startNum }" end="${endNum }" varStatus="status">
				<c:choose>
					<c:when test="${index == currentPage }"><b>${index }</b></c:when>
					<c:otherwise><a id="pagebtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${index}" style="color: black;">${index }</a></c:otherwise>
				</c:choose>
				<c:if test="${!status.last }"> | </c:if>
			</c:forEach>
			<c:if test="${currentBlock != lastBlock}"><a id="nextbtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${startNum+pageBlock }" style="color: black;"> | [다음]</a></c:if>
			<c:if test="${currentPage != totalPage && totalPage > 1}"><a id="lastbtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${totalPage}" style="color: black;"> | [마지막 페이지]</a></c:if>
		</c:if>
		<c:if test="${!empty smallCate }">
			<c:if test="${currentPage != 1 }"><a id="firstbtn" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=1" style="color: black;">[첫 페이지] | </a></c:if>
			<c:if test="${currentBlock == 1 }"><a id="prevbtn" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${startNum-pageBlock+9 }" style="color: black;"> [이전] |</a></c:if>
			<c:forEach var="index" begin="${startNum }" end="${endNum }" varStatus="status">
				<c:choose>
					<c:when test="${index == currentPage }"><b>${index }</b></c:when>
					<c:otherwise><a id="pagebtn" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${index}" style="color: black;">${index }</a></c:otherwise>
				</c:choose>
				<c:if test="${!status.last }"> | </c:if>
			</c:forEach>
			<c:if test="${currentBlock != lastBlock}"><a id="nextbtn" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${startNum+pageBlock }" style="color: black;"> | [다음]</a></c:if>
			<c:if test="${currentPage != totalPage && totalPage > 1}"><a id="lastbtn" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${totalPage}" style="color: black;"> | [마지막 페이지]</a></c:if>
		</c:if>
	</div>

</div>