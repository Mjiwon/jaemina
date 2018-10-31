<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>문의하기</h2>
<div>
	<div class="input-group">
		<div class="input-group">
			<img
				src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}"
				class="rounded-circle" height="75" width="75"> <input
				type="text" class="form-control" readonly
				style="background-color: white;" value="${Seller.ID }">
		</div>
	</div>
	<div style="height: 450px; overflow-y: scroll;" id="chatView">
		<c:forEach var="obj" items="${chatlog}">
			<c:choose>
				<c:when test="${obj.sender==user.ID}">
					<div class="alert alert-secondary" role="alert"
						style="padding: 3px; margin-bottom: 3px;">
						${obj.sender} : <br/>${obj.text}<%--<small> <fmt:formatDate value="${obj.senddate }"/></small> --%>
					</div>				
				</c:when>
				<c:otherwise>
					<div class="alert alert-info" role="alert"
						style="padding: 3px; margin-bottom: 3px;">
						${obj.sender} : <br/>${obj.text}
					</div>
				</c:otherwise>
				
			</c:choose>
		</c:forEach>
	</div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text" id="chatView">CHAT</span>
		</div>
		<input type="text" class="form-control"
			aria-describedby="basic-addon1" id="inputs">
	</div>
</div>

<script>
	var qaws = new WebSocket("ws://" + location.host
			+ "${pageContext.servletContext.contextPath}/boardqa.do");

	qaws.onmessage = function(evt) {
		console.log("채팅 데이터 " + evt.data);
		var obj = JSON.parse(evt.data);
		switch (obj.qamode) {
		case "${qamode}":
			boardQAHandle(obj);
			break;
		}
	};

	var boardQAHandle = function(evt) {
		console.log(evt)
		var html ="";
		if(evt.sender=="${user.ID}"){
			html = "<div class=\"alert alert-secondary\" role=\"alert\" style=\"padding:3px; margin-bottom:3px;\" >";
			html += evt.sender + " : <br/>" + evt.text;
			html += "</div>";			
		}else{
			html = "<div class=\"alert alert-info\" role=\"alert\" style=\"padding:3px; margin-bottom:3px;\" >";
			html += evt.sender + " : <br/>" + evt.text;
			html += "</div>";
		}
		document.getElementById("chatView").innerHTML += html;
		document.getElementById("chatView").scrollTop = document
				.getElementById("chatView").scrollHeight;
	};
	
	document.getElementById("inputs").onchange = function() {
		console.log("인풋 밸류 " + this.value);
		var msg = {
			"qamode" : "${qamode}",
			"text" : this.value,
			"writer" : "${Seller.ID }"
		};
		console.log(msg);
		qaws.send(JSON.stringify(msg));
		this.value = "";
	};
</script>