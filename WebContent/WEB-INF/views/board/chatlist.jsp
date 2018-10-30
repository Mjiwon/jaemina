<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p>
<br>
<br>
<br>

</p>

<h3>채팅목록</h3>
<div class="list-group">
	<c:forEach var="i" begin="1" end="5" step="1">
		<a href="#" class="list-group-item list-group-item-warning">${i }</a>
	</c:forEach>
</div>
