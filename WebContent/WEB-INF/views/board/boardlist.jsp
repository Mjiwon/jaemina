<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<h1>판매글 리스트</h1>
	<div class="album py-5 bg-light">
		<div class="container">
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
