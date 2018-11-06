<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	.test{
		width: 40%;
		display: inline-block;
		white-space: pre-line;
		
	}
</style>

<div >
<div style="width: 60%; padding-left: 2%;">
<h2>문의하기</h2>
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
					<div class="" align="right">
						<div class="col" style="right: 0px; bottom: 0px; vertical-align: bottom; margin-right: 1px;">
							<small>${obj.senddate }</small>
							<c:choose>
								<c:when test="${fn:length(obj.text)>=30 }">
									<span class="badge badge-secondary test" style="text-align: left; font-size: 4mm; margin: 1%;">${obj.sender} : <br />${obj.text }</span>
							
								</c:when>
								<c:otherwise>
									<span class="badge badge-info " style="text-align: left; font-size: 4mm; margin: 1%;">${obj.sender} : <br />${obj.text }</span>
							
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="" align="left" role="alert"
						style="padding: 3px; margin-bottom: 3px; width: 50%">
						<div class="col" style="right: 0px; bottom: 0px; vertical-align: bottom; margin-left: 1px;">
							<c:choose>
								<c:when test="${fn:length(obj.text)>=30 }">
									<span class="badge badge-info test" style="text-align: left; font-size: 4mm; margin: 1%;">${obj.sender} : <br />${obj.text }</span>
							
								</c:when>
								<c:otherwise>
									<span class="badge badge-info" style="text-align: left; font-size: 4mm; margin: 1%;">${obj.sender} : <br />${obj.text }</span>
							
								</c:otherwise>
							</c:choose>
							<small>${obj.senddate }</small>
						</div>
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
</div>
<script>
	document.getElementById("chatView").scrollTop = document
			.getElementById("chatView").scrollHeight;

	var qaws = new WebSocket("ws://" + location.host
			+ "${pageContext.servletContext.contextPath}/boardqa.do");

	qaws.onmessage = function(evt) {
		console.log("채팅 데이터 " + evt.data);
		var obj = JSON.parse(evt.data);
		switch (obj.mode) {
		case "${mode}":
			boardQAHandle(obj);
			break;
		}
	};

	var boardQAHandle = function(evt) {
		console.log(evt);
		console.log(evt.text + " / "+evt.text.length + " / " +evt.text.length>=30);
		var d = new Date();
		var html = "";
		if (evt.sender == "${user.ID}") {
				html += "<div align=\"right\">";
				html += "<div class=\"col\" style=\"right: 0px; bottom: 0px; vertical-align: bottom; margin-right: 1px;\">";
				html += "<small>" + d.getFullYear() + "-" + (d.getMonth() + 1)
						+ "-" + d.getDate() + " " + d.getHours() + ":"
						+ d.getMinutes() + "</small>";
				
			if(evt.text.length>=30){
				html += "<span class=\"badge badge-secondary test\" style=\"text-align: left; font-size: 4mm; margin: 1%;\">"+evt.sender + " : <br/>" + evt.text+"</span>";				
			}else{
				html +="<span class=\"badge badge-secondary\" style=\"text-align: left; font-size: 4mm; margin: 1%;\">"+evt.sender + " : <br/>" + evt.text+"</span>";
			}
			/* html += "<div class=\"alert alert-info\" align=\"left\" role=\"alert\" style=\"padding: 3px; margin-bottom: 3px; width: 50%\">";
			html +=  evt.sender + " : <br/>" + evt.text;
			html += "</div>";
			 */
			html += "</div>";
		}
		document.getElementById("chatView").innerHTML += html;
		document.getElementById("chatView").scrollTop = document
				.getElementById("chatView").scrollHeight;
	};

	document.getElementById("inputs").onchange = function() {
		console.log("인풋 밸류 " + this.value);
		var msg = {
			"mode" : "${mode}",
			"text" : this.value,
			"writer" : "${Seller.ID }"
		};
		console.log(msg);
		qaws.send(JSON.stringify(msg));
		this.value = "";
	};
</script>