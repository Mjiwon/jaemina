<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<h2>관리자 등록</h2>
<br />

<form action="${pageContext.servletContext.contextPath }/admin/join.do" method="post">
	<div class="form-group">
		<label>이름</label><input name="name" type="text" class="form-control" placeholder="이름 입력"><br />
		<div class="row">
			<div class="col">
				<label>ID(아이디)</label><input name="id" type="text" class="form-control" placeholder="아이디 입력"><br />
			</div>
			<div class="col">
				<label>PW(비밀번호)</label><input name="pass" type="password" class="form-control" placeholder="비밀번호 입력"><br />
			</div>
		</div>	
	</div>
	<div class="form-group">
		<label>부서 및 직책</label>
		<div class="row">
			<div class="col">
				<select class="form-control" name="did">
					<c:forEach var="d" items="${adp }">
						<option value="${d.DID }">${d.DEPART }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col">
				<select class="form-control" name="pid">
					<c:forEach var="p" items="${aps }">
						<option value="${p.PID }">${p.PNAME }</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
	<br />
	<div class="form-group">
		<label>E-mail</label><input type="email" class="form-control" name="email">
	</div>
	<br />
	<div class="form-group">
		<button type="submit"  class="form-control btn btn-outline-primary">관리자 회원 등록</button>
	</div>
</form>




