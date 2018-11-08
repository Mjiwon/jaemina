<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<br/>
<br/>

<br/><br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

판매관리<br/>
건수 : ${sellListCnt}<br/>
<div>
		
	<c:forEach var="selllist" items="${sellList }">
		<div class="card" style="width: 20rem;">
	  		<img class="card-img-top" src="..." alt="Card image cap">
	  		<p class="card-title"></p>
	  		<div class="card-body">
	  		<p class="card-buydate">${selllist.BUYDATE }</p>
	    	<h6 class="card-price">${selllist.PRICE }</h6>
	    	<c:choose>
	    		<c:when test="${selllist.SELLING ==  4}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->환불신청</p>
	    		</c:when>
	    		<c:when test="${selllist.SELLING ==  5}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->환불완료</p>
	    		</c:when>
	    		<c:when test="${selllist.SELLING ==  6}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->취소신청</p>
	    		</c:when>
	    		<c:when test="${selllist.SELLING ==  7}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->취소완료</p>
	    		</c:when>
	    		<c:otherwise>
	    			<p class="card-selling">
	    				<a href="${path }/managesellstate.do?postno=${sellist.POSTNO}" class="btn btn-primary">판매상태변경</a>
	    			</p>
	    		</c:otherwise>
	    	</c:choose>
	  </div>
	</div>


	</c:forEach>
</div>