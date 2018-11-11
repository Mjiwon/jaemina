<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.test {
	width: 40%;
	display: inline-block;
	white-space: pre-line;
}
</style>

<div class="row" style="margin-top: 8%;">
	
	<div class="col" style="margin-left: 4%;">
	
		<h2 style="margin-left: 2%;">문의하기</h2>
		<div class="input-group">
			<div class="input-group">
				<img
					src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}"
					class="rounded-circle" height="75" width="75"> <input
					type="text" class="form-control" readonly
					style="background-color: #D4DFE6; height: 75; font-size: 6mm;"
					value="${Seller.ID }">
			</div>
		</div>
		<div
			style="height: 450px; overflow-y: scroll; background-color: #D4DFE6;"
			id="chatView">
			<c:forEach var="obj" items="${chatlog}">
				<c:choose>
					<c:when test="${obj.sender==user.ID}">
						<div class="" align="right">
							<div class="col"
								style="right: 0px; bottom: 0px; vertical-align: bottom; margin-right: 1px;">
								<small>${obj.senddate }</small>
								<c:choose>
									<c:when test="${fn:length(obj.text)>30 }">
										<span class="badge test"
											style="text-align: left; font-size: 4mm; margin: 1%; background-color: yellow;">${obj.sender}
											: <br />${obj.text }</span>

									</c:when>
									<c:otherwise>
										<span class="badge"
											style="text-align: left; font-size: 4mm; margin: 1%; background-color: yellow;">${obj.sender}
											: <br />${obj.text }</span>

									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="" align="left" role="alert"
							style="padding: 3px; margin-bottom: 3px; width: 50%">
							<div class="col"
								style="right: 0px; bottom: 0px; vertical-align: bottom; margin-left: 1px;">
								<c:choose>
									<c:when test="${fn:length(obj.text)>30 }">
										<span class="badge test"
											style="text-align: left; font-size: 4mm; margin: 1%; background-color: white; color: black;">${obj.sender}
											: <br />${obj.text }</span>

									</c:when>
									<c:otherwise>
										<span class="badge"
											style="text-align: left; font-size: 4mm; margin: 1%; background-color: white; color: black;">${obj.sender}
											: <br />${obj.text }</span>

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
	<div class="col col-lg-3" style="margin-top: 3%; margin-right: 4%;">
		<form class="card p-2" style=" margin-left: 2%;">
			<div class="card" style="width: auto;">
				<a
					href="${pageContext.servletContext.contextPath }/sellerboardlist.do?seller=${Seller.ID }&currentPage=1"><img
					class="card-img-top"
					src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}"
					alt="Card image cap" style="height: 8cm;"></a>
				<div class="card-body">
					<h5 class="card-title">${Seller.WRITER }</h5>
					<p>판매자 : ${Seller.ID }</p>
					<p>학력 : ${Seller.ACADEMY }</p>
					<p>경력 : ${Seller.CAREER }</p>
					<p>소개 : ${Seller.INTRODUCE }</p>
				</div>
			</div>
		</form>

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
		var d = new Date();
		var html = "";
		if (evt.sender == "${user.ID}") {
			html += "<div align=\"right\">";
			html += "<div class=\"col\" style=\"right: 0px; bottom: 0px; vertical-align: bottom; margin-right: 1px; \">";
			html += "<small>" + d.getFullYear() + "-" + (d.getMonth() + 1)
					+ "-" + d.getDate() + " " + d.getHours() + ":"
					+ d.getMinutes() + "</small>";

			if (evt.text.length > 30) {
				html += "<span class=\"badge test\"	style=\"text-align: left; font-size: 4mm; margin: 1%; background-color: yellow;\">"
						+ evt.sender + " : <br/>" + evt.text + "</span>";
			} else {
				html += "<span class=\"badge\" style=\"text-align: left; font-size: 4mm; margin: 1%; background-color: yellow;\">"
						+ evt.sender + " : <br/>" + evt.text + "</span>";
			}
			/* html += "<div class=\"alert alert-info\" align=\"left\" role=\"alert\" style=\"padding: 3px; margin-bottom: 3px; width: 50%\">";
			html +=  evt.sender + " : <br/>" + evt.text;
			html += "</div>";
			 */
			html += "</div>";
		}else{
			html += "<div align=\"left\" role=\"alert\" style=\"padding: 3px; margin-bottom: 3px; width: 50%\">";
			html += "<div class=\"col\"	style=\"right: 0px; bottom: 0px; vertical-align: bottom; margin-left: 1px;\">";
			if (evt.text.length > 20) {
				html += "<span class=\"badge test\" style=\"text-align: left; font-size: 4mm; margin: 1%; background-color: white;\">"
						+ evt.sender + " : <br/>" + evt.text + "</span>";
			} else {
				html += "<span class=\"badge\" style=\"text-align: left; font-size: 4mm; margin: 1%; background-color: white;\">"
						+ evt.sender + " : <br/>" + evt.text + "</span>";
			}
			html += "<small>" + d.getFullYear() + "-" + (d.getMonth() + 1)
			+ "-" + d.getDate() + " " + d.getHours() + ":"
			+ d.getMinutes() + "</small>";
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