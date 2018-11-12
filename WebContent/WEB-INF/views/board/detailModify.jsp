<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/detail.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>


<title>${detail.TITLE }</title>

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">


<body class="bg-light">

	<div class="container">
		<div class="py-5 text-center" id="title">
			<img class="d-block mx-auto mb-4"
				src="../../assets/brand/bootstrap-solid.svg" alt="" width="72"
				height="72">
			<h2>제목 : ${detail.TITLE }</h2>
		</div>
		<div class="col-md-8 order-md-1" style="margin: auto;">
			<h4 class="mb-3">카테고리 : ${cate.BIGCATE} : ${cate.SMALLCATE}</h4>
			<form class="needs-validation"
				action="${pageContext.servletContext.contextPath }/board/detailUpdate.do" method="post" id="modifybtn" enctype="multipart/form-data"
				novalidate>
				<div class="mb-3">
					<label for="username">작성 날짜</label>
					<div class="input-group" style="">
						<input type="text" class="form-control" id="date"
							value="${detail.WRDATE}" style="background-color: white;"
							readonly>
					</div>
				</div>

				<div class="mb-3">
					<label for="username">작성자</label>
					<div class="input-group">
						<input type="text" class="form-control" id="writer" name="writer"
							value="${detail.WRITER }" readonly="readonly"
							style="background-color: white;">
						<div class="invalid-feedback" style="width: 100%;">Your
							username is required.</div>
					</div>
				</div>
				
				<div class="mb-3">
							<label>Title이미지</label>
							<input 	type="file" class="form-control" id="imgpath" name="imgpath">
						</div>
				

				<div class="mb-3">
					<label for="username">금액</label>
					<div class="input-group">
						<input type="number" class="form-control" id="price" name="price"
							value="${detail.PRICE }" required autofocus>
					</div>
				</div>

				<div class="mb-3">
					<label for="address">내용</label>
					<textarea rows="12" cols="81" class="form control" id="content"
						name="content" maxlength="1000" required autofocus>${detail.CONTENT }</textarea>
					<div class="invalid-feedback">내용을 입력해주세요.</div>
				</div>
				<c:if test="${!empty detail.ADDR }">
					<div class="mb-3">
						<label for="address3">기존 주소 : ${detail.ADDR }</label>
					</div>
				</c:if>
				<input type="text" id="addr" placeholder="주소" readonly="readonly" name="addr" style="width: 45%;"> <input
					type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map"
					style="width: 100%; height: 600px; margin-top: 10px;"></div>
				
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b9a4dbed24071c798a9982657770a5f4&libraries=services"></script>
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

					// 주소로 좌표를 검색합니다
					geocoder.addressSearch("${detail.ADDR}", function(result, status) {
					
					    // 정상적으로 검색이 완료됐으면 
					     if (status === daum.maps.services.Status.OK) {

					        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new daum.maps.Marker({
					            map: map,
					            position: coords
					        });
					        
					     // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new daum.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">기존 장소</div>'
					        });
					        infowindow.open(map, marker);
					        
					     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					     } 
					});
					
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
																marker.setMap(map);
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
				<button class="btn btn-primary btn-lg btn-block" type="button" id="modify">수정
					완료</button>
			</form>
		</div>
	</div>

	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2018-2019 재미나</p>
	</footer>

	
	<script type="text/javascript">
		$("#modify").on("click", function() {
			if(window.confirm("수정하시겠습니까?") == true) {
				window.alert("수정되었습니다.");
				$("#modifybtn").trigger("submit");				
			}else {
				return;
			}
		});
	</script>

