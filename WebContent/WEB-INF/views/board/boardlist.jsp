<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<div class="col-8" style="margin-left: 5%;">
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
	</div>
</div>