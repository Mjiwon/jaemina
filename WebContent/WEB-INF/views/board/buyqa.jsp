<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>문의하기</h2>
<div class="row" style="margin-top: 5%;">
	<div class="col-md-2 order-md-2 mb-2">
		<h3>채팅목록</h3>
		<div class="list-group">
			<c:forEach var="i" begin="1" end="5" step="1">
				<a href="#" class="list-group-item list-group-item-warning">${i }</a>
			</c:forEach>
		</div>
	</div>
	<div class="col-md-9 order-md-1">
		<div class="input-group">
			<div class="input-group">
				<img
					src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}"
					class="rounded-circle" height="75" width="75"> <input
					type="text" class="form-control" readonly
					style="background-color: white;" value="${writer }">
			</div>
		</div>
		<div style="height: 450px; overflow-y: scroll;" id="chatView"></div>
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
	var qaws = new WebSocket("ws://" + location.host
			+ "${pageContext.servletContext.contextPath}/boardqa.do");
	
	qaws.onmessage = function(evt) {
		console.log("채팅 데이터 "+evt.data);
		var obj = JSON.parse(evt.data);
		switch(obj.mode){
			case "${qamode}" :
				boardQAHandle(obj);
			break;
		}
	};
	
	var boardQAHandle = function(evt){
		console.log(evt)
		var html = "<div class=\"alert alert-secondary\" role=\"alert\" style=\"padding:3px; margin-bottom:3px;\" >";
		html += evt.sender + " : <br/>"+ evt.text;
		html +="</div>";
		document.getElementById("chatView").innerHTML += html;
		document.getElementById("chatView").scrollTop = document.getElementById("chatView").scrollHeight;
	};
	
	document.getElementById("inputs").onchange = function(){
		console.log("인풋 밸류 "+this.value);
		var msg = {
			"mode":"${qamode}",
			"text": this.value,
			"writer":"${writer}"
		};
		console.log(msg);
		qaws.send(JSON.stringify(msg));
		this.value="";
	};
</script>