<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
	<div class="row">
		<c:forEach var="board" items="${boardlist }">
			<div class="card col-2" style="margin-right: 1%;margin-bottom:1%;">
		    	<div class="card-body">
		    		<h2>${board.TITLE }</h2><br/>
		    		${board.NO }
		    		<hr/>		    	
		    		<p> 
		    			작성자 : ${board.WRITER }<br/>
		    		</p>
		    		<div align="center">
		    			<a class="btn btn-primary btn-sm" href="${path }/admin/delboard.do?no=${board.NO}" role="button" style="margin-right:15%;">삭제</a>
		    			<!-- <a class="btn btn-primary btn-sm" href="#?id=${acnt.ID }" role="button">PW변경</a> -->
		    		</div>
		    	</div>
		    	<script type="text/javascript">
		    	
		    	</script>   	
		    </div>
		</c:forEach>
	</div>