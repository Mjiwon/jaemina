<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${chageok==0}">
	<script type="text/javascript">
		window.alert("비밀번호가 변경되었습니다.");
	</script>
</c:if>


<div class="row">
	<div class="col">

		<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist">
			<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill"
				href="#v-pills-home" role="tab">나의정보</a> <a class="nav-link"
				id="v-pills-profile-tab"
				href="${pageContext.servletContext.contextPath }/chageuser.do"
				role="tab">비밀번호변경</a> <a class="nav-link" id="deleteUser"
				href="javascript:deleteUser" role="tab">회원탈퇴</a>
		</div>
	</div>
	<div class="col-10">
		<div class="tab-content" id="v-pills-tabContent">
			<div class="tab-pane fade show active" id="v-pills-home"
				role="tabpanel" aria-labelledby="v-pills-home-tab"></div>
			<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
				aria-labelledby="v-pills-profile-tab">...</div>
			<div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
				aria-labelledby="v-pills-messages-tab">...</div>
		</div>
	</div>

	<script>
		$("#deleteUser")
				.on(
						"click",
						function() {
							window
									.open(
											"${pageContext.servletContext.contextPath }/deleteGo.do",
											"f",
											"width=500, height=500, left=700, top=200");
						});

		$("#changePass")
				.on(
						"click",
						function() {
							window
									.open(
											"${pageContext.servletContext.contextPath }/changeUser.do",
											"f",
											"width=500, height=500, left=700, top=200");
						});
	</script>


</div>

