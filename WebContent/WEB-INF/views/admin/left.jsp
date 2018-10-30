<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />

<div class="container-fluid">
      <div class="row">
        <nav class="col">
        <b>관리</b><hr/>
          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="${path }/admin/account.do">회원관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">게시글관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">판매자등록관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">문의관리</a>
            </li>
          </ul>
          <br/>
          <b>채팅</b><hr/>
          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="#">전체채팅</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">부서채팅</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">1:1채팅</a>
            </li>
          </ul>
          <br/>
		   <b>쪽지</b><hr /> 
		   <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="#">전체쪽지함</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">안읽은쪽지함</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">쪽지보내기</a>
            </li>
          </ul>
        </nav>
       </div>
      </div>



	
<!-- 알림 -->
<div id="alert" style="font-size: .75em">
	<a href="" class="alert-ling"></a>
</div>







<!-- 
	<script>
		
		var ws = new WebSocket("ws://"+location.host+"${pageContext.servletContext.contextPath}/alert.do");
		ws.onmessage = function(evt) {
			console.log(evt.data);
			var obj = JSON.parse(evt.data);
			switch(obj.mode) {
			case "login":
				loginAlertHandle(obj);
				break;
			case "overlap":
				overlapAlertHandle(obj);
				break;
			case "message":
				messageAlertHandle(obj);
				break;
			case "public":
				publicAlertHandle(obj);
				break;
			case "depart":
				departAlertHandle(obj);
				break;
			}
		};
		
		
		var loginAlertHandle = function(obj) {
			var html = "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">";
			html += "<strong>【로그인】</strong><br/>" + obj.actor.NAME+"(" + obj.actor.DNAME+"/"+ obj.actor.PNAME+")";
			html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
			html += "<span aria-hidden=\"true\">&times;</span>";
			html += "</button>";
			html += "</div>";
			document.getElementById("alert").innerHTML += html;
		};
		
		var overlapAlertHandle = function(obj) {
			var html = "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">";
			html += "<strong>【중복로그인】</strong><br/>" + obj.actor+"(+"+obj.alert+")";
			html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
			html += "<span aria-hidden=\"true\">&times;</span>";
			html += "</button>";
			html += "</div>";
			document.getElementById("alert").innerHTML += html;
			document.getElementById("alert").innerHTML = "";
		};
		
		var messageAlertHandle = function(obj) {
			var html = "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">";
			html += "<a href=\"${pageContext.servletContext.contextPath}/readmessage.do?no="+obj.messageinfo.NO+"\">보러가기</a>";
			html += "<strong>【메세지】</strong><br/> from : " +obj.sender+"("+ obj.content+")";
			html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
			html += "<span aria-hidden=\"true\">&times;</span>";
			html += "</button>";
			html += "</div>";
			document.getElementById("alert").innerHTML += html;
		};
		
		var publicAlertHandle = function(obj){
			var html = "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">";
			html += "<strong>【전체채팅】</strong><br/>" + obj.talker+"(전체 채팅을 했습니다.)";
			html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
			html += "<span aria-hidden=\"true\">&times;</span>";
			html += "</button>";
			html += "</div>";
			document.getElementById("alert").innerHTML += html;
		};
		
		var departAlertHandle = function(obj){
			var html = "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">";
			html += "<strong>【부서채팅】</strong><br/>" + obj.talker+"(부서 채팅을 했습니다.)";
			html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
			html += "<span aria-hidden=\"true\">&times;</span>";
			html += "</button>";
			html += "</div>";
			document.getElementById("alert").innerHTML += html;
		};
		
		
	</script>
	 -->

