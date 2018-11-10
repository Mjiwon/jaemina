<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<c:forEach var="sell" items="${sellList }">
		<div class="card" style="width: 20rem;">
	  		<img class="card-img-top" src="..." alt="Card image cap">
	  		<p class="card-title"></p>
	  		<div class="card-body">
	  		<p class="card-buydate">${sell.BUYDATE }</p>
	    	<h6 class="card-price"><fmt:formatNumber>${sell.PRICE }</fmt:formatNumber>원</h6>
	    	<c:choose>
	    		<c:when test="${sell.BUYING == 2}">
		    		<c:choose>
		    		<c:when test="${sell.SELLING ==  1}">
			    			<p class="card-selling"><!-- 구매자의 환불신청이나 취소 신청시 -->구매신청</p>
			    			<p class="card-selling">
			    			<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}& ${sell.SELLING}" class="btn btn-primary">구매접수</a>
			    		</p>
			    	</c:when>
			    	<c:when test="${sell.SELLING ==  2}">
			    			<p class="card-selling"><!-- 구매자의 환불신청이나 취소 신청시 -->판매중</p>
			    			<p class="card-selling">
			    			<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}& ${sell.SELLING}" class="btn btn-primary">판매완료</a>
			    		</p>
			    	</c:when>
			    	<c:when test="${sell.SELLING ==  3}">
			    			<p class="card-selling"><!-- 구매자의 환불신청이나 취소 신청시 -->판매완료</p>
			    	</c:when>
			    	</c:choose>
	    		</c:when>
				<c:otherwise>			    	
			    	<p class="card-selling"><!-- 구매자의 환불신청이나 취소 신청시 -->환불접수</p>
			    	<p class="card-selling">
			    		<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}& refund=${sell.SELLING}" class="btn btn-primary">환불</a>
			    	</p>		    
			    </c:otherwise>
	    	</c:choose>
	  		</div>
		</div>
	</c:forEach>
</div>
