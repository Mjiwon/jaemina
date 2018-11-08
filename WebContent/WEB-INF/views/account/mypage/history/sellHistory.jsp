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
								<li class="nav-item"><a class="nav-link active" href="${path}/sellmanagement.do">판매관리</a> <!-- chart.do -->
				</li>
				<li class="nav-item"><a class="nav-link" href="#">구매관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${path}/wishlist.do">내가 관심있는 판매자</a></li>
				<li class="nav-item"><a class="nav-link" href="${path }/changeUser.do">계정설정</a>
				</li>
			</ul>
		</div>
	</div>
</div>
