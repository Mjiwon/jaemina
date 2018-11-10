ㅅㄽ<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
	style="background-color: gray;">
	<div class="container">
		<a class="navbar-brand"
			href="${pageContext.servletContext.contextPath }/index.do">JAEMINA</a>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><b>[${admin.ID }] - </b></li>
				<li class="nav-item"><b>${depart } -  </b></li>
				<li class="nav-item"><b> ${position }</b></li>
				
				
			</ul>
		</div>
	</div>
</nav>
<script>

	var goLogout = function() {
		if(window.confirm("정말 로그아웃 하시겠습니까?")) {
			window.alert("로그아웃 되었습니다.");
			location.href= "${pageContext.servletContext.contextPath }/logout.do";
		}else {
			return;
		}
	}

	var ws = new WebSocket("ws://"+location.host+"${pageContext.servletContext.contextPath}/waiting.do");
	
	ws.onmessage = function(got){
		
	};
</script>