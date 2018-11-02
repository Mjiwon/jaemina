<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 6%;">
	<div class="row">
		<div class="col-md-1">
			<img
				src="${pageContext.servletContext.contextPath }${Seller.IMGPATH}"
				class="rounded-circle" height="75" width="75">

		</div>
		<div class="col-10">
			<ul class="nav">
								<li class="nav-item"><a class="nav-link active" href="${pageContext.servletContext.contextPath }/chart.do">판매관리</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">구매관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.servletContext.contextPath }/wishlist.do">내가 관심있는 판매자</a></li>
				<li class="nav-item"><a class="nav-link" href="#">메세지</a></li>
				<li class="nav-item"><a class="nav-link" href="chageuser.do">계정설정</a>
				</li>
			</ul>
		</div>
	</div>
</div>
