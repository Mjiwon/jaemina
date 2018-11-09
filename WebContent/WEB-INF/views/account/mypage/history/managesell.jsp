<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
<%-- <fmt:formatNumber></fmt:formatNumber ---%>
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
	    	<h6 class="card-price"><fmt:formatNumber>${sell.PRICE }</fmt:formatNumber></h6>
	    	<c:choose>
	    		<c:when test="${sell.SELLING ==  1}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->판매접수</p>
	    			<p class="card-selling">
	    			<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}" class="btn btn-primary">판매상태변경</a>
	    		</p>
	    		</c:when>
	    		<c:when test="${sell.SELLING ==  2}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->판매중</p>
	    			<p class="card-selling">
	    			<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}" class="btn btn-primary">판매상태변경</a>
	    		</p>
	    		</c:when>
	    		<c:when test="${sell.SELLING ==  3}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->판매완료</p>
	    		</c:when>
	    		<c:when test="${sell.SELLING ==  4}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->환불신청</p>
	    			<p class="card-selling">
	    			<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}" class="btn btn-primary">판매상태변경</a>
	    		</p>
	    		</c:when>
	    		<c:when test="${sell.SELLING ==  5}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->환불완료</p>
	    		</c:when>
	    		<c:when test="${sell.SELLING ==  6}">
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->취소신청</p>
	    			<p class="card-selling">
	    			<a href="${path }/mypage/sellchangestate.do?postno=${sell.POSTNO}" class="btn btn-primary">판매상태변경</a>
	    		</p>
	    		</c:when>
	    		<c:otherwise>
	    			<p class="card-buying"><!-- 구매자의 환불신청이나 취소 신청시 -->취소완료</p>
	    		</c:otherwise>	    		
	    	</c:choose>
	    		
	    		
	    		<script type="text/javascript">
	    		
	    		</script>
	  </div>
	</div>


	</c:forEach>
</div>
