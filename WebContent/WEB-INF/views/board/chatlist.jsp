<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
<h3>채팅목록</h3>
	<c:choose>
		<c:when test="${!empty chatList }">
			<c:forEach var="i" items="${chatList }">
				<a href="${pageContext.servletContext.contextPath }/qa/buyqa.do?no=${i.no }&writer=${i.writer}" class="list-group-item list-group-item-warning">${i.member }
				<c:if test="${i.noCheck==true }">
					<span class="badge badge-pill badge-primary">new</span>
				</c:if>
				</a>
			</c:forEach>		
		</c:when>
		<c:otherwise>
			<span>메세지가 없습니다.</span>
		</c:otherwise>
	</c:choose>
	
</div>
