<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="row">
		<c:forEach var="acnt" items="${account }">
			<div class="card col-2" style="margin-right: 1%;margin-bottom:1%;">
		    	<div class="card-body">
		    		<h2>${acnt.ID }</h2>
		    		<hr/>		    	
		    		<p> 
		    			PASS : ${acnt.PASS }<br/>
		    		</p>
		    		<div align="center">
		    			<a class="btn btn-primary btn-sm" href="#?no=${acnt.NO }" role="button" style="margin-right:15%;">삭제</a>
		    			<a class="btn btn-primary btn-sm" href="#?no=${acnt.NO }" role="button">PW변경</a>
		    		</div>
		    	</div>
		    	
		    	
		    	
		    </div>
	</c:forEach>
		</div>



