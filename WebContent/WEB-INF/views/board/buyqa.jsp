<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</style>
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
					<div class="row" align="right">
						<div class="col" style="right: 0px; bottom: 0px; vertical-align: bottom; margin-right: 1px;" >
						
							<small>${obj.senddate }</small>
						</div>
						<div class="alert alert-secondary col-md-5" style="text-align: left;">  
							${obj.sender} : <br />${obj.text} 
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row" align="left" role="alert"
						style="padding: 3px; margin-bottom: 3px; width: 50%">
						<div class="alert alert-info col-md-9" >  
							${obj.sender} : <br />${obj.text} 
						</div>
						<div class="col" style="right: 0px; bottom: 0px; vertical-align: bottom; margin-left: 1px;" >
						
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

<script>
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
		console.log(evt)
		var d = new Date();
		var html ="";
		if(evt.sender=="${user.ID}"){
			html += "<div class=\"row\" align=\"right\">";
			html += "<div class=\"col\" style=\"right: 0px; bottom: 0px; vertical-align: bottom; margin-right: 1px;\">";
			html +=  "<small>"+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+"</small>";
			html += "</div>";
			html += "<div class=\"alert alert-secondary col-md-5\" style=\"text-align: left;\">";
			html +=  evt.sender + " : <br/>" + evt.text;
			html += "</div>";
			html += "</div>";
			
			/* html += "<div align=\"right\">";
			html += "<div class=\"alert alert-secondary\" role=\"alert\" style=\"padding: 3px; margin-bottom: 3px; width: 50%; text-align: left;\">";
			html +=  evt.sender + " : <br/>" + evt.text;
			html += "</div>";
			html += "</div>"; */		
		}else{
			html += "<div class=\"row\" align=\"left\" role=\"alert\" style=\"padding: 3px; margin-bottom: 3px; width: 50%\">";
			html += "<div class=\"alert alert-info col-md-9\">";
			html +=  evt.sender + " : <br/>" + evt.text;	
			html += "</div>";
			html +=	"<div class=\"col\" style=\"right: 0px; bottom: 0px; vertical-align: bottom; margin-left: 1px;\">";
			html +=  "<small>"+d.getFullYear()+"-"+(d.getMoth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+"</small>";
			html += "</div>";
			html += "</div>";
			/* html += "<div class=\"alert alert-info\" align=\"left\" role=\"alert\" style=\"padding: 3px; margin-bottom: 3px; width: 50%\">";
			html +=  evt.sender + " : <br/>" + evt.text;
			html += "</div>";
			 */
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