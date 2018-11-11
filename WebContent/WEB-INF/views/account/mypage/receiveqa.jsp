<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	pageContext.setAttribute("newLineChar", "\n");
%>
<div class="container">
	<h5>고객센터 문의내역</h5>
	<c:choose>
		<c:when test="${empty receive }">
			문의 내역이 없습니다.
		</c:when>

		<c:otherwise>
			<div class="row"
				style="text-align: center; border: 1px solid gray; border-radius: 2px; padding-top: 3px;">
				<div class="col">
					<b>제 목</b>
				</div>
				<div class="col-md-auto"">
					<b>날짜</b>
				</div>
				<div class="col col-lg-2">
					<b>답변상태</b>
				</div>
				<button type="button" class="btn" data-toggle="modal"
					data-target="#exampleModalLong"
					style="height: 36px; background-color: white; color: white;">보기</button>
			</div>
			<c:forEach var="re" items="${receive }" varStatus="status">
				<div class="row" style="padding-top: 4px;">
					<div class="col ">${re.TITLE }</div>
					<div class="col-md-auto">
						<fmt:formatDate value="${re.SENDDATE }" pattern="yyyy-MM-dd HH:mm" />
					</div>
					<div class="col col-lg-2" style="text-align: center;">${re.REPLTCONTENT==null ? "답변준비중":"답변완료"  }</div>
					<button type="button" class="btn" data-toggle="modal"
						data-target="#exampleModalLong${status.index }"
						style="height: 36px;">보기</button>
				</div>

				<div class="modal fade" id="exampleModalLong${status.index }"
					tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">제목 :
									${re.TITLE }</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							v
							<div class="modal-body">
								<label><b>문의내용 : </b></label>
								<div>${fn:replace(re.SENDCONTENT,newLineChar,"<br/>") }</div>
								<hr />
								<div>
									<label><b>문의결과 : </b></label><br /> ${re.REPLTCONTENT==null? "답변준비중":fn:replace(re.REPLTCONTENT,newLineChar,"<br/>") }
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>