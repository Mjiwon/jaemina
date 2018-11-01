<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <meta name="viewport" content="initial-scale=1.0">
 <meta charset="utf-8">
  <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
 </style>
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
						$("#bigcate").on("change", function() {
							console.log("??");
							var bigno = $("#bigcate").val();

							var param = {
								"bigno" : bigno
							};
							$.post("${pageContext.servletContext.contextPath }/ajax/cate.do",param).done(function(rst) {
								var obj = rst;
								var html = "";
								for (var i = 0; i < obj.length; i++) {
									html += "<option value=\""+obj[i].SMALLNO+"\">"
										+ obj[i].SMALLNO
										+ " : "
										+ obj[i].SMALLCATE
										+ "</option>";
								}
							$("#smallcate").html(html);
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
					 <div id="map"></div>
					 <script>
					  function initMap() {
						  // The location of Uluru
						  var uluru = {lat: -25.344, lng: 131.036};
						  // The map, centered at Uluru
						  var map = new google.maps.Map(
						      document.getElementById('map'), {zoom: 4, center: uluru});
						  // The marker, positioned at Uluru
						  var marker = new google.maps.Marker({position: uluru, map: map});
						}
    				</script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7C70eDgiFuCJxARG90CV5l4to9BlLBNk&callback=initMap">
    </script>
				</div>
				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit">게시글	올리기</button>
			</form>
		</div>
	</div>

</div>
