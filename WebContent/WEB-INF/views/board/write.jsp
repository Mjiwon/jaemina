<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
 <meta name="viewport" content="initial-scale=1.0">
 <meta charset="utf-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			<form action="${path}/write.do" method="post" enctype="multipart/form-data">
				<div class="mb-3">
					<label>작성자</label>
					<div class="input-group">
						<input type="text" class="form-control" id="writer" name="writer"
							value="${user.ID }" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label>★대분류</label> <select id="bigcate" name="bigcate"
							class="form-control">
							<option>카테고리를 선택하세요</option>
							<c:forEach var="big" items="${bigcate }">
								<option value="${big.NO}">${big.NO }:${big.BIGCATE }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-6 mb-3">
						<label>★소분류</label> <select id="smallcate" name="smallcate"
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
					<label>★제목</label>
					<div class="input-group">
						<input type="text" class="form-control" id="title" name="title">
					</div>
				</div>

				<div class="mb-3">
					<label>★Title이미지</label> <input type="file" class="form-control"
						id="img" name="imgpath">
				</div>

				<div class="mb-3">
					<label>★금액</label> <input type="number" class="form-control"
						name="price" id="price">

				</div>

				<div class="mb-3">
					<label for="address2">★상세내용</label>
					<textarea rows="20" cols="20" class="form-control" name="content" id="content"></textarea>
				</div>

				<input type="text" id="addr" placeholder="주소" readonly="readonly" name="addr" style="width: 45%;"> <input
					type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map"
					style="width: 100%; height: 100%; margin-top: 10px;"></div>
			
			
			
				<!--  게시글 버튼 활성화 스크립트 -->			
				<script type="text/javascript">
					// 필수요소를 입력해야만 버튼이 활성화 되게 만들어 주기
					// 필수요소 6가지
					var abledbtn = [false, false, false, false, false, false];
					// 새로고칭등으로 필수요소 초기화 하기 일단은 생략, 해보다가 필요하면 주석 제거
					/* var abledbtn_init = function(){
						for(var i=0; i<abledbtn;i++){
							abledbtn[i]=false;
						}
					}; */
					
					// 게시글 작성 버튼을 활성화 하기 위한 함수
					var validate = function(){
						var cnt=0;
						for(var i=0;i<abledbtn.length;i++){
							if(abledbtn[i]==true){
								cnt+=1;
							}
						}
						if(cnt == 6){
							$("#writebtn").prop("disabled",false);
						}
						console.log("abledbtn : "+abledbtn + " / size : "+abledbtn.length);
					};
					
					
					// 1.bigcate 선택시 요소 하나 true로 바꿔주기
					$("#bigcate").on("change",function(){
						abledbtn[0]=true;
						validate();
					});
					
					// 2.smallcate 선택시 true 바꿔주기
					$("#smallcate").on("change",function(){
						abledbtn[1]=true;
						validate();
					});
					
					// 3.title 입력시 true 바꿪기
					$("#title").on("change",function(){
						abledbtn[2]=true;
						validate();
					});
					// 4. 이미지 선택시 true 바꾸기
					$("#img").on("change",function(){
						abledbtn[3]=true;
						validate();
					});
					// 5. 금액 입력시 true 바꾸기
					$("#price").on("change",function(){
						abledbtn[4]=true;
						validate();
					});
					// 6. 상세내용 입력시 true 바꾸기
					$("#content").on("change",function(){
						abledbtn[5]=true;
						validate();
					});
				</script>

				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e052486c871660466bd9c17d3ee084a7&libraries=services"></script>
				<script>
					var mapContainer = document.getElementById("map"), // 지도를 표시할 div
					mapOption = {
						center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
						level : 5
					// 지도의 확대 레벨
					};

					//지도를 미리 생성
					var map = new daum.maps.Map(mapContainer, mapOption);
					//주소-좌표 변환 객체를 생성
					var geocoder = new daum.maps.services.Geocoder();

					function sample5_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var fullAddr = data.address; // 최종 주소 변수
										var extraAddr = ''; // 조합형 주소 변수

										// 기본 주소가 도로명 타입일때 조합한다.
										if (data.addressType === 'R') {
											//법정동명이 있을 경우 추가한다.
											if (data.bname !== '') {
												extraAddr += data.bname;
											}
											// 건물명이 있을 경우 추가한다.
											if (data.buildingName !== '') {
												extraAddr += (extraAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
											fullAddr += (extraAddr !== '' ? ' ('
													+ extraAddr + ')'
													: '');
										}

										// 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById("addr").value = fullAddr;
										// 주소로 상세 정보를 검색
										geocoder
												.addressSearch(
														data.address,
														function(results,
																status) {
															// 정상적으로 검색이 완료됐으면
															if (status === daum.maps.services.Status.OK) {

																var result = results[0]; //첫번째 결과의 값을 활용

																// 해당 주소에 대한 좌표를 받아서
																var coords = new daum.maps.LatLng(
																		result.y,
																		result.x);
																// 지도를 보여준다.
																mapContainer.style.display = "block";
																map.relayout();
																// 지도 중심을 변경한다.
																map
																		.setCenter(coords);
																// 마커를 결과값으로 받은 위치로 옮긴다.
																marker
																		.setPosition(coords)
															}
														});
									}
								}).open();
					}
					var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
				    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

				// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);

				// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
				daum.maps.event.addListener(map, 'click', function(mouseEvent) {
				    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				        if (status === daum.maps.services.Status.OK) {
				            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
				            
				            var content = '<div class="bAddr">' +
				                            '<span class="title">법정동 주소정보</span>' + 
				                            detailAddr + 
				                        '</div>';

				            // 마커를 클릭한 위치에 표시합니다 
				            marker.setPosition(mouseEvent.latLng);
				            marker.setMap(map);
				            document.getElementById("addr").value=result[0].address.address_name;
				        }   
				    });
				});

				// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
				daum.maps.event.addListener(map, 'idle', function() {
				    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
				});

				function searchAddrFromCoords(coords, callback) {
				    // 좌표로 행정동 주소 정보를 요청합니다
				    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
				}

				function searchDetailAddrFromCoords(coords, callback) {
				    // 좌표로 법정동 상세 주소 정보를 요청합니다
				    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}

				// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
				function displayCenterInfo(result, status) {
				    if (status === daum.maps.services.Status.OK) {
				        var infoDiv = document.getElementById('centerAddr');

				        for(var i = 0; i < result.length; i++) {
				            // 행정동의 region_type 값은 'H' 이므로
				            if (result[i].region_type === 'H') {
				                infoDiv.innerHTML = result[i].address_name;
				                break;
				            }
				        }
				    }    
				}
				</script>

				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit" id="writebtn" disabled="disabled">게시글	올리기</button>
			</form>
			
		</div>
	</div>

</div>
