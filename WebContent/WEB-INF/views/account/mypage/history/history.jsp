<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
<div class="container">
	<div class="row">
		<div class="col-md-1">
			<img
				src="${path}${Seller.IMGPATH}"
				class="rounded-circle" height="75" width="75">

		</div>
		<div class="col-10">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link active" href="${path}/mypage/managesell.do">판매관리</a> <!-- chart.do -->
				</li>
				<li class="nav-item"><a class="nav-link" href="${path }/mypage/managebuy.do">구매관리</a></li><!-- chart.do -->
				</li>
				<li class="nav-item"><a class="nav-link" href="${path }/receiveqa.do">고객센터 문의내역</a> </li>
			</ul>
		</div>
	</div>
</div>
