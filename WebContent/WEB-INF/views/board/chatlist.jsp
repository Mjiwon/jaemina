<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<c:forEach var="i" begin="1" end="5" step="1">
		<li>${i }</li>
	</c:forEach>
</ul>
<script>
	var ws = new WebSocket("ws://"+location.host +"${pageContext.servletContext.contextPath}/boardQA.do");
	
	ws.onmessage = function(got){
		
	}
</script>