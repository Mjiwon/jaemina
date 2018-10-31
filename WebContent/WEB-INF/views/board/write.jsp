<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

		<h2 align="center">판매 글올리기</h2>
	<div class="row">
		<!-- 판매내용 작성 -->
		<div class="col-md-8 order-md-1" style="margin: auto;">
			<form action="${pageContext.servletContext.contextPath }/write.do"
				method="post" enctype="multipart/form-data">
				<div class="mb-3">
					<label>작성자</label>
					<div class="input-group">
						<input type="text" class="form-control" id="writer" name="writer"
							value="${user.ID }" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label>대분류</label> <select id="bigcate" name="bigcate"
							class="form-control">
							<option>카테고리를 선택하세요</option>
							<c:forEach var="big" items="${bigcate }">
								<option value="${big.NO}">${big.NO }:${big.BIGCATE }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-6 mb-3">
						<label>소분류</label> <select id="smallcate" name="smallcate"
							class="form-control">
							<option>카테고리를 선택하세요</option>
						</select>
					</div>
					<script type="text/javascript">
						$("#bigcate")
								.on(
										"change",
										function() {
											console.log("??");
											var bigno = $("#bigcate").val();

											var param = {
												"bigno" : bigno
											};
											$
													.post(
															"${pageContext.servletContext.contextPath }/ajax/cate.do",
															param)
													.done(
															function(rst) {
																var obj = rst;
																var html = "";
																for (var i = 0; i < obj.length; i++) {
																	html += "<option value=\""+obj[i].SMALLNO+"\">"
																			+ obj[i].SMALLNO
																			+ " : "
																			+ obj[i].SMALLCATE
																			+ "</option>";
																}
																$("#smallcate")
																		.html(
																				html);
															});
										});
					</script>
				</div>

				<div class="mb-3">
					<label>제목</label>
					<div class="input-group">
						<input type="text" class="form-control" id="title" name="title">
					</div>
				</div>

				<div class="mb-3">
					<label>Title이미지</label> <input type="file" class="form-control"
						id="img" name="imgpath">
				</div>

				<div class="mb-3">
					<label>금액</label> <input type="number" class="form-control"
						name="price">

				</div>

				<div class="mb-3">
					<label for="address2">상세내용</label>
					<textarea rows="20" cols="20" class="form-control" name="content"></textarea>
				</div>

				<!-- <div class="row">
							<div class="col-md-5 mb-3">
								<label for="country">Country</label> <select
									class="custom-select d-block w-100" id="country" required>
									<option value="">Choose...</option>
									<option>United States</option>
								</select>
								<div class="invalid-feedback">Please select a valid
									country.</div>
							</div>
							<div class="col-md-4 mb-3">
								<label for="state">State</label> <select
									class="custom-select d-block w-100" id="state" required>
									<option value="">Choose...</option>
									<option>California</option>
								</select>
								<div class="invalid-feedback">Please provide a valid
									state.</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="zip">Zip</label> <input type="text"
									class="form-control" id="zip" placeholder="" required>
								<div class="invalid-feedback">Zip code required.</div>
							</div>
						</div>		 -->
				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit">게시글
					올리기</button>
			</form>
		</div>
	</div>

</div>
