<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="padding: 10px;">
		<div style="padding-left: 25%; padding-right: 25%;">
			<div style="padding: 15px;">
				<h3>고객센터-답변하기</h3>
					<!--  안녕하세요, 재미나 고개센터입니다.<br /> 
					문의 내용을 상세히 작성해서 보내주시면 최대한 빠른 시일내에 답변
					드리겠습니다. 감사합니다!-->
			</div>
			<form action="${pageContext.servletContext.contextPath }/admin/replyqa.do"
				method="post">
				<input hidden="" name="no" value="${adminqa.NO }"/>
				<div class="col">
					<div class="mb-3">
						<label>문의자</label>
						<div class="input-group">
							<input type="text" class="form-control" id="writer" name="sender"
								value="${adminqa.SENDER }" readonly>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="mb-3">
						<label>문의제목</label>
						<div class="input-group">
							<input type="text" class="form-control" id="title" name="title" value="${adminqa.TITLE }">
						</div>
					</div>
				</div>
				<div class="col">
					<div class="mb-3">
						<label for="address2">문의내용</label>
						<textarea rows="10" cols="10" class="form-control" name="sendcontent" readonly="readonly">${adminqa.SENDCONTENT }</textarea>
					</div>
				</div>
				<div class="col">
					<div class="mb-3">
						<label for="address2">답변하기</label>
						<textarea rows="10" cols="10" class="form-control" name="replycontent"></textarea>
					</div>
				</div>
				
				<div class="col" align="right">
					<button type="submit">답변하기</button>
				</div>
			</form>
		</div>
	</div>