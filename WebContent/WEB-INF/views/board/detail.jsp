<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />

<title>${detail.TITLE }</title>

 <body class="bg-light">
   <div class="container" style="margin-top: 5%;">
      <div class="py-5 text-center">
         <img class="d-block mx-auto mb-4"
            src="${path }${detail.IMGPATH}" width="300" height="300" >

         <c:forEach begin="1" end="${detail.avg }" step="1">
            <img src="${path }/images/star1.png" width="25" height="25">
         </c:forEach>
         <c:forEach begin="1" end="${5-detail.avg }" step="1">
            <img src="${path}/images/star2.png" width="25" height="25">
         </c:forEach>
         [평점 : ${detail.avg }점]
         <h2>제목 : ${detail.TITLE }</h2>
      </div>

      <div class="row">
         <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
               <span class="text-muted">판매자 정보</span>
            </h4>


            <form class="card p-2">
               <div class="card" style="width: auto;">
                  <a
                     href="${path }/sellerboardlist.do?seller=${writer.ID }&currentPage=1">
                     <img class="card-img-top" src="${path }${writer.IMGPATH}"
                     alt="Card image cap" style="height: 8cm;">
                  </a> <a onclick="paging();" class="replygaing" id="${l }"></a>
                  <div class="card-body">
                     <h5 class="card-title">${writer.WRITER }</h5>
                     <p>판매자 : ${writer.ID }</p>
                     <p>학력 : ${writer.ACADEMY }</p>
                     <p>경력 : ${writer.CAREER }</p>
                     <p>소개 : ${writer.INTRODUCE }</p>
                     <c:choose>
                        <c:when test="${writer.ID == user.ID }">
                           <a href="${path }/board/modifyDetail.do?no=${detail.NO}"><button
                                 type="button">수정</button></a>
                           <a href="javascript:goDelete(${detail.NO });"><button
                                 type="button">삭제</button></a>

                           <script>
                              var goDelete = function(no) {
                                 if (window.confirm("정말삭제하시겠습니까?") == true) {
                                    window.alert("삭제되었습니다.");
                                    location.href = "${pageContext.servletContext.contextPath }/board/deleteDetail.do?no="
                                          + no;

                                 } else {
                                    return;
                                 }
                              };
                              
                           </script>
                        </c:when>
                        <c:otherwise>
                           <c:choose>
                              <c:when test="${empty user }">
                                 <a class="btn btn-primary notLog"
                                    style="margin-bottom: 10px; color: white;">판매자에게 문의하기</a>
                              </c:when>
                              <c:otherwise>
                                 <a
                                    href="${path }/qa/buyqa.do?no=${detail.NO }&writer=${detail.WRITER}&members=${detail.WRITER}&members=${user.ID}"
                                    class="btn btn-primary" style="margin-bottom: 10px">판매자에게
                                    문의하기</a><br/>
                              </c:otherwise>
                           </c:choose>
                           <c:choose>
                              <c:when test="${empty user }">
                                 <a class="btn btn-primary notLog" style="color: white;">관심
                                    판매자로 등록</a>
                              </c:when>
                              <c:otherwise>
                                 <c:choose>
                                    <c:when test="${empty wishlistcheck}">
                                       <a
                                          href="${pageContext.servletContext.contextPath }/addWishlist.do?no=${detail.NO}&writer=${detail.WRITER}"
                                          class="btn btn-primary" id="addlike">관심 판매자로 등록</a>
                                    </c:when>
                                    <c:otherwise>
                                       <a
                                          href="${pageContext.servletContext.contextPath }/deleteWishlist.do?no=${detail.NO}&writer=${detail.WRITER}"
                                          class="btn btn-primary" id="deletelike">관심 판매자에서 제거</a>
                                    </c:otherwise>
                                 </c:choose>
                              </c:otherwise>
                           </c:choose>
                        </c:otherwise>
                     </c:choose>
                  </div>
               </div>

            </form>
         </div>
         <div class="col-md-8 order-md-1">
            <h4 class="mb-3">카테고리 : ${cate.BIGCATE} | ${cate.SMALLCATE}</h4>
            <form class="needs-validation" novalidate>
               <div class="mb-3">
                  <label for="username">작성 날짜</label>
                  <div class="input-group" style="">
                     <input type="text" class="form-control" id="username"
                        value="${detail.WRDATE}" style="background-color: white;"
                        readonly>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6 mb-3">
                     <label for="firstName">작성자</label> <input type="text"
                        class="form-control" id="firstName" placeholder=""
                        value="${detail.WRITER }" readonly="readonly"
                        style="width: 730; background-color: white;">
                  </div>
               </div>



               <div class="mb-3">
                  <label for="username">금액</label>
                  <div class="input-group">
                     <input type="text" class="form-control" id="username"
                        value="<fmt:formatNumber>${detail.PRICE }</fmt:formatNumber>원"
                        readonly="readonly" style="background-color: white;">
                     <div class="invalid-feedback" style="width: 100%;">Your
                        username is required.</div>
                  </div>
               </div>

               <div class="mb-3">

                  <label for="address">내용</label> 
                  <textarea rows="20" cols="20" class="form-control" name="content" id="content" readonly="readonly" style="background-color: white;" required autofocus><c:out value=" ${detail.CONTENT }" /></textarea>

                  <div class="invalid-feedback">Please enter your shipping
                     address.</div>
               </div>

               <div class="mb-3">
                  <label for="address2">주소 : ${detail.ADDR }</label>
               </div>
               <c:if test="${!empty detail.ADDR }">
                  <div id="map" style="width: 100%; height: 350px;"></div>

                  <script type="text/javascript"
                     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b9a4dbed24071c798a9982657770a5f4&libraries=services"></script>
                  <script>
                     var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
                      mapOption = {
                          center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                          level: 3 // 지도의 확대 레벨
                      };  

                     // 지도를 생성합니다    
                     var map = new daum.maps.Map(mapContainer, mapOption); 

                     // 주소-좌표 변환 객체를 생성합니다
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
                                 content: '<div style="width:150px;text-align:center;padding:6px 0;">거래 장소</div>'
                             });
                             infowindow.open(map, marker);
                             
                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                             map.setCenter(coords);
                             
                          } 
                     });
                  </script>
               </c:if>

               <hr class="mb-4">
               <input hidden="" id="postno" name="postno" value="${detail.NO }" /><br />
               <input hidden="" id="seller" name="seller"
                  value="${detail.WRITER }" /><br /> <input hidden="" id="price"
                  name="price" value="${detail.PRICE}" /><br /> <input hidden=""
                  id="buyer" name="buyer" value="${user.ID}" /><br />
               <button class="btn btn-primary btn-lg btn-block" type="button"
                  id="buybtn">구매하기</button>
            </form>
            <script
               src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script type="text/javascript"
               src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
            <script type="text/javascript">
               // 결제후 paydb insert
               var paydbinsert = function(){
                  var postno = $("#postno").val();
                  var seller = $("#seller").val();
                  var price = $("#price").val();
                  var buyer = $("#buyer").val();
               // ajax param 설정
                  var param = {
                     "postno":postno,
                     "seller":seller,
                     "price":price,
                     "buyer":buyer
                  };
               // ajax post 보내기
                  $.post("${path}/ajax/buy.do",param,function(rst){
                     var obj = JSON.parse(rst);
                     console.log('obj : '+obj);
                  });
            
               };
         
               //아임포트 라이브러리 파일이 로드되면 window.IMP 변수에 접근이 가능합니다.
               $("#buybtn").on("click",function(){
                  if( ${loginOk!=null}){
                  var IMP = window.IMP; // 생략가능
                  IMP.init('imp81506411'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
         
                  IMP.request_pay({
                      pg : 'inicis', // version 1.1.0부터 지원.
                      pay_method : 'card',
                      merchant_uid : 'merchant_' + new Date().getTime(),
                      name : $("#seller").val()+'-'+$("#postno"),
                      amount : $("#price").val(),
                       //  buyer_email : 'iamport@siot.do',
                      buyer_name : $("#buyer").val(),
                        // buyer_email : $("#buyeremail").val(),
                      //buyer_addr : '서울특별시 강남구 삼성동',
                      //buyer_postcode : '123-456',
                      m_redirect_url : '127.0.0.1:8080/jaemina/views/board/detail.jsp'
                  }, function(rsp) {
                
                     if ( rsp.success ) {
                          var msg = '결제가 완료되었습니다.';
                          msg += '고유ID : ' + rsp.imp_uid;
                          //msg += '상점 거래ID : ' + rsp.merchant_uid;
                          msg += '결제 금액 : ' + rsp.paid_amount;
                          msg += '카드 승인번호 : ' + rsp.apply_num;
                          paydbinsert();
                          console.log("결제 성공");
                          $("#buybtn").prop("disabled",true);
                      } else {
                          var msg = '결제에 실패하였습니다.';
                          msg += '에러내용 : ' + rsp.error_msg;
                          console.log("결제 실패");
                      }
                      alert(msg);
                  });
                  }else{
                     window.alert("로그인을 해주세요");
                  }
               });
               
   
   
   
   
   
   
   </script>
         </div>
      </div>
      <!-- -------------------------------------------------------------------------------------------------------------------------------- -->
      <div class="container">
         <label for="content">${user.ID }</label> <select id="star">
            <option value="1">★☆☆☆☆</option>
            <option value="2">★★☆☆☆</option>
            <option value="3">★★★☆☆</option>
            <option value="4">★★★★☆</option>
            <option value="5">★★★★★</option>
         </select>
         <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${detail.bno}" /> <input
                  type="textarea " class="form-control" id="content" name="content"
                  placeholder="댓글 내용을 입력하세요." min="10"> <span
                  class="input-group-btn"> &nbsp;
                  <button class="btn btn-default" type="button" name="replybtn"
                     id="replybtn">등록</button>
               </span>
            </div>
         </form>
      </div>

      <div class="container">
         <button class="btn btn-defaut" id="replylistbtn">댓글보기</button>
         <div class="commentList"></div>
      </div>



      <div id="reply"></div>


      <script type="text/javascript">   
      
      $(".notLog").on("click",function(){
         window.alert("로그인 후 이용해주세요.");
      });
      
      $("#addlike").on("click", function() {
         window.alert("등록되었습니다.");
      });
      
      $("#deletelike").on("click", function() {
         window.alert("삭제되었습니다.");
      });
      
      
      //댓글 삭제
      var deleteReply =function() {
            var param = {
                        "writer" :"${user.ID}",
                        "bno" : ${detail.NO}
            }
            console.log("삭제"+param);
            $.post("${pageContext.servletContext.contextPath }/ajax/deletereply.do",param).done(function(rst) {
               var obj = rst;
                  if(obj==1){
                     window.alert("댓글 삭제의 성공했습니다")
                     ListReply();
                   }else 
                     window.alert("댓글 삭제의 실패 하셨습니다 관리자에게 문의 해주세요");
                   
            });
      };
      
      //댓글  수정
      var modifyreply =function() {
         window.open("${pageContext.servletContext.contextPath }/modifyreply.do?bno=${detail.NO}", "댓글수정", "width=700, height=200, left=700, top=200");
         
      };
      
      
      
      $("#replylistbtn").on("click",function() {
            ListReply();
      });

         function ListReply(){
            var param = {"bno" : "${detail.NO}"};
            console.log(param);
            $.post("${pageContext.servletContext.contextPath }/ajax/replylist.do",param).done(function(rst) {
            var obj = rst;
            var html = "";
            if(obj.length>0){
            for (var i = 0; i < obj.length; i++) {
            console.log("누구누구있니?"+obj[i].WRITER);
               html += "<div><div><table class=\"table\"><h6><strong>"+obj[i].WRITER+"</strong><small>"+obj[i].STAR+"</small><small>"+obj[i].RDATE+"</small></h6>";
               html +=obj[i].CONTENT+"<br/><tr><td></td>";
               
               if(obj[i].WRITER==("${user.ID}")){
              html+="<button class=\"btn btn-defaut\" onclick=\"modifyreply();\" >"+"수정"+"</button>&nbsp;" ;
              html+="<button class=\"btn btn-defaut\" onclick=\"deleteReply();\" >"+"삭제"+"</button>";
              } 
               html +="</tr></table></div></div>";
            }
            }else{
            window.alert("등록된 댓글이 없습니다")
            }
         $("#reply").html(html);
         });
         }
         

            
//--------------------------------------------------------------------


//작성
$("#replybtn").on("click",function() {
   if( ${loginOk!=null}){
      if(${isBuyer==true}){
         var content = $("#content").val();   
         var vstar=$("#star").val();
         var star;
         switch (vstar) {
         case "1":
            star="★☆☆☆☆";   
            break;
         case "2":
            star="★★☆☆☆";
            break;s
         case "3":
            star="★★★☆☆";
            break;
         case "4":
            star="★★★★☆";
            break;
         
         case "5":
            star="★★★★★";
            break;
         }
         console.log(별);   
         var param = {
            "bno" : ${detail.NO},
            "writer": "${user.ID}",
            "content":content,
            "star":star,
            "star_num":vstar
                  }
         $.post("${pageContext.servletContext.contextPath }/ajax/replyWrite.do",param).done(function(rst) {
         var obj = rst;
            if(obj==1){
               $("#content").val("");
               window.alert("댓글이 등록되었습니다.");
               ListReply();
             }else 
               window.alert("이미 댓글 등록하셨습니다 댓글 수정을 이용 해주세요");
             
         });   
      }else{
         document.getElementById("content").value = "";
         window.alert("구매자만 댓글등록 가능합니다.");
      }
   }else
      {
      window.alert("로그인을 해주세요");
      }

});

</script>


      <div class="my-5 pt-5 text-muted text-center text-small">
         <p class="mb-1">&copy; 2018-2019 재미나</p>
      </div>
   </div> 
<%--    <body class="bg-light">
   <div class="container">
      <div class="row">
      <div class="py-5 text-center col">
         <img class="d-block mx-auto mb-4"
            src="${path }${detail.IMGPATH}" width="300" height="300" >

         <c:forEach begin="1" end="${detail.avg }" step="1">
            <img src="${path }/images/star1.png" width="25" height="25">
         </c:forEach>
         <c:forEach begin="1" end="${5-detail.avg }" step="1">
            <img src="${path}/images/star2.png" width="25" height="25">
         </c:forEach>
         [평점 : ${detail.avg }점]
         <h2>제목 : ${detail.TITLE }</h2>
      </div>
      <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
               <span class="text-muted">판매자 정보</span>
            </h4>


            <form class="card p-2">
               <div class="card" style="width: auto;">
                  <a
                     href="${path }/sellerboardlist.do?seller=${writer.ID }&currentPage=1">
                     <img class="card-img-top" src="${path }${writer.IMGPATH}"
                     alt="Card image cap" style="height: 8cm;">
                  </a> <a onclick="paging();" class="replygaing" id="${l }"></a>
                  <div class="card-body">
                     <h5 class="card-title">${writer.WRITER }</h5>
                     <p>판매자 : ${writer.ID }</p>
                     <p>학력 : ${writer.ACADEMY }</p>
                     <p>경력 : ${writer.CAREER }</p>
                     <p>소개 : ${writer.INTRODUCE }</p>
                     <c:choose>
                        <c:when test="${writer.ID == user.ID }">
                           <a href="${path }/board/modifyDetail.do?no=${detail.NO}"><button
                                 type="button">수정</button></a>
                           <a href="javascript:goDelete(${detail.NO });"><button
                                 type="button">삭제</button></a>

                           <script>
                              var goDelete = function(no) {
                                 if (window.confirm("정말삭제하시겠습니까?") == true) {
                                    window.alert("삭제되었습니다.");
                                    location.href = "${pageContext.servletContext.contextPath }/board/deleteDetail.do?no="
                                          + no;

                                 } else {
                                    return;
                                 }
                              };
                              
                           </script>
                        </c:when>
                        <c:otherwise>
                           <c:choose>
                              <c:when test="${empty user }">
                                 <a class="btn btn-primary notLog"
                                    style="margin-bottom: 10px; color: white;">판매자에게 문의하기</a>
                              </c:when>
                              <c:otherwise>
                                 <a
                                    href="${path }/qa/buyqa.do?no=${detail.NO }&writer=${detail.WRITER}&members=${detail.WRITER}&members=${user.ID}"
                                    class="btn btn-primary" style="margin-bottom: 10px">판매자에게
                                    문의하기</a>
                              </c:otherwise>
                           </c:choose>
                           <c:choose>
                              <c:when test="${empty user }">
                                 <a class="btn btn-primary notLog" style="color: white;">관심
                                    판매자로 등록</a>
                              </c:when>
                              <c:otherwise>
                                 <c:choose>
                                    <c:when test="${empty wishlistcheck}">
                                       <a
                                          href="${pageContext.servletContext.contextPath }/addWishlist.do?no=${detail.NO}&writer=${detail.WRITER}"
                                          class="btn btn-primary" id="addlike">관심 판매자로 등록</a>
                                    </c:when>
                                    <c:otherwise>
                                       <a
                                          href="${pageContext.servletContext.contextPath }/deleteWishlist.do?no=${detail.NO}&writer=${detail.WRITER}"
                                          class="btn btn-primary" id="deletelike">관심 판매자에서 제거</a>
                                    </c:otherwise>
                                 </c:choose>
                              </c:otherwise>
                           </c:choose>
                        </c:otherwise>
                     </c:choose>
                  </div>
               </div>

            </form>
         </div>
      </div>

      <div class="container">
         
         <div class="order-md-1">
            <h4 class="mb-3">카테고리 : ${cate.BIGCATE} | ${cate.SMALLCATE}</h4>
            <form class="needs-validation" novalidate>
               <div class="mb-3">
                  <label for="username">작성 날짜</label>
                  <div class="input-group" style="">
                     <input type="text" class="form-control" id="username"
                        value="${detail.WRDATE}" style="background-color: white;"
                        readonly>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6 mb-3">
                     <label for="firstName">작성자</label> <input type="text"
                        class="form-control" id="firstName" placeholder=""
                        value="${detail.WRITER }" readonly="readonly"
                        style="width: 610px; background-color: white;">
                     <div class="invalid-feedback" style="width: 100%;">Valid
                        first name is required.</div>
                  </div>
               </div>



               <div class="mb-3">
                  <label for="username">금액</label>
                  <div class="input-group">
                     <input type="text" class="form-control" id="username"
                        value="<fmt:formatNumber>${detail.PRICE }</fmt:formatNumber>원"
                        readonly="readonly" style="background-color: white;">
                     <div class="invalid-feedback" style="width: 100%;">Your
                        username is required.</div>
                  </div>
               </div>

               <div class="mb-3">
                  <label for="address">내용</label> <input type="text"
                     class="form-control" id="address" value="${detail.CONTENT }"
                     readonly="readonly"
                     style="background-color: white; height: 514px;">
                  <div class="invalid-feedback">Please enter your shipping
                     address.</div>
               </div>

               <div class="mb-3">
                  <label for="address2">주소 : ${detail.ADDR }</label>
               </div>
               <c:if test="${!empty detail.ADDR }">
                  <div id="map" style="width: 100%; height: 350px;"></div>

                  <script type="text/javascript"
                     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e052486c871660466bd9c17d3ee084a7&libraries=services"></script>
                  <script>
                     var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
                      mapOption = {
                          center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                          level: 3 // 지도의 확대 레벨
                      };  

                     // 지도를 생성합니다    
                     var map = new daum.maps.Map(mapContainer, mapOption); 

                     // 주소-좌표 변환 객체를 생성합니다
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
                                 content: '<div style="width:150px;text-align:center;padding:6px 0;">거래 장소</div>'
                             });
                             infowindow.open(map, marker);
                             
                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                             map.setCenter(coords);
                             
                          } 
                     });
                  </script>
               </c:if>

               <hr class="mb-4">
               <input hidden="" id="postno" name="postno" value="${detail.NO }" /><br />
               <input hidden="" id="seller" name="seller"
                  value="${detail.WRITER }" /><br /> <input hidden="" id="price"
                  name="price" value="${detail.PRICE}" /><br /> <input hidden=""
                  id="buyer" name="buyer" value="${user.ID}" /><br />
               <button class="btn btn-primary btn-lg btn-block" type="button"
                  id="buybtn">구매하기</button>
            </form>
            <script
               src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script type="text/javascript"
               src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
            <script type="text/javascript">
               // 결제후 paydb insert
               var paydbinsert = function(){
                  var postno = $("#postno").val();
                  var seller = $("#seller").val();
                  var price = $("#price").val();
                  var buyer = $("#buyer").val();
               // ajax param 설정
                  var param = {
                     "postno":postno,
                     "seller":seller,
                     "price":price,
                     "buyer":buyer
                  };
               // ajax post 보내기
                  $.post("${path}/ajax/buy.do",param,function(rst){
                     var obj = JSON.parse(rst);
                     console.log('obj : '+obj);
                  });
            
               };
         
               //아임포트 라이브러리 파일이 로드되면 window.IMP 변수에 접근이 가능합니다.
               $("#buybtn").on("click",function(){
                  if( ${loginOk!=null}){
                  var IMP = window.IMP; // 생략가능
                  IMP.init('imp81506411'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
         
                  IMP.request_pay({
                      pg : 'inicis', // version 1.1.0부터 지원.
                      pay_method : 'card',
                      merchant_uid : 'merchant_' + new Date().getTime(),
                      name : $("#seller").val()+'-'+$("#postno"),
                      amount : $("#price").val(),
                       //  buyer_email : 'iamport@siot.do',
                      buyer_name : $("#buyer").val(),
                        // buyer_email : $("#buyeremail").val(),
                      //buyer_addr : '서울특별시 강남구 삼성동',
                      //buyer_postcode : '123-456',
                      m_redirect_url : '127.0.0.1:8080/jaemina/views/board/detail.jsp'
                  }, function(rsp) {
                
                     if ( rsp.success ) {
                          var msg = '결제가 완료되었습니다.';
                          msg += '고유ID : ' + rsp.imp_uid;
                          //msg += '상점 거래ID : ' + rsp.merchant_uid;
                          msg += '결제 금액 : ' + rsp.paid_amount;
                          msg += '카드 승인번호 : ' + rsp.apply_num;
                          paydbinsert();
                          console.log("결제 성공");
                          $("#buybtn").prop("disabled",true);
                      } else {
                          var msg = '결제에 실패하였습니다.';
                          msg += '에러내용 : ' + rsp.error_msg;
                          console.log("결제 실패");
                      }
                      alert(msg);
                  });
                  }else{
                     window.alert("로그인을 해주세요");
                  }
               });
               
   
   
   
   
   
   
   </script>
         </div>
      </div>
      <!-- -------------------------------------------------------------------------------------------------------------------------------- -->
      <div class="container">
         <label for="content">${user.ID }</label> <select id="star">
            <option value="1">★☆☆☆☆</option>
            <option value="2">★★☆☆☆</option>
            <option value="3">★★★☆☆</option>
            <option value="4">★★★★☆</option>
            <option value="5">★★★★★</option>
         </select>
         <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${detail.bno}" /> <input
                  type="textarea " class="form-control" id="content" name="content"
                  placeholder="수정할 내용을 입력하세요." min="10"> <span
                  class="input-group-btn"> &nbsp;
                  <button class="btn btn-default" type="button" name="replybtn"
                     id="replybtn">등록</button>
               </span>
            </div>
         </form>
      </div>

      <div class="container">
         <button class="btn btn-defaut" id="replylistbtn">댓글보기</button>
         <div class="commentList"></div>
      </div>



      <div id="reply"></div>
      
      <div class="container">
         <button class="btn btn-defaut" id="replylistbtn1" hidden="hidden">댓글접기</button>
         <div class="commentList"></div>
      </div>


      <script type="text/javascript">   
      
      $(".notLog").on("click",function(){
         window.alert("로그인 후 이용해주세요.");
      });
      
      $("#addlike").on("click", function() {
         window.alert("등록되었습니다.");
      });
      
      $("#deletelike").on("click", function() {
         window.alert("삭제되었습니다.");
      });
      
      
      //댓글 삭제
      var deleteReply =function() {
            var param = {
                        "writer" :"${user.ID}",
                        "bno" : ${detail.NO}
            }
            console.log("삭제"+param);
            $.post("${pageContext.servletContext.contextPath }/ajax/deletereply.do",param).done(function(rst) {
               var obj = rst;
                  if(obj==1){
                     window.alert("댓글 삭제의 성공했습니다")
                     ListReply();
                   }else 
                     window.alert("댓글 삭제의 실패 하셨습니다 관리자에게 문의 해주세요");
                   
            });
      };
      
      //댓글  수정
      var modifyreply =function() {
         window.open("${pageContext.servletContext.contextPath }/modifyreply.do?bno=${detail.NO}", "댓글수정", "width=700, height=200, left=700, top=200");
         
      };
      
      
      
      $("#replylistbtn").on("click",function() {
         $("#replylistbtn").prop("hidden", true);
         $("#replylistbtn1").prop("hidden", false);
         ListReply();
      });

      function ListReply(){
         var param = {"bno" : "${detail.NO}"};
         $.post("${pageContext.servletContext.contextPath }/ajax/replylist.do",param).done(function(rst) {
         var obj = rst;
         var html = "";
         if(obj.length>0){
         for (var i = 0; i < obj.length; i++) {
         console.log("누구누구있니?"+obj[i].WRITER);
            html += "<div><div><table class=\"table\"><h6><strong>"+obj[i].WRITER+"</strong><small>"+obj[i].STAR+"</small><small>"+obj[i].RDATE+"</small></h6>";
            html +=obj[i].CONTENT+"<br/><tr><td></td>";
            
            if(obj[i].WRITER==("${user.ID}")){
             html+="<button class=\"btn btn-defaut\" onclick=\"modifyreply();\" >"+"수정"+"</button>&nbsp;" ;
             html+="<button class=\"btn btn-defaut\" onclick=\"deleteReply();\" >"+"삭제"+"</button>";
             } 
            html +="</tr></table></div></div>";
         }
         }else{
         window.alert("등록된 댓글이 없습니다")
         }
      $("#reply").html(html);
      });
      };

      $("#replylistbtn1").on("click",function() {
         $("#replylistbtn").prop("hidden", false);
         $("#replylistbtn1").prop("hidden", true);
         ListReply1();
      });
      
      function ListReply1() {
         var html = "";
         $("#reply").html(html);
      };
      
         

            
//--------------------------------------------------------------------


//작성
$("#replybtn").on("click",function() {
   if( ${loginOk!=null}){
      if(${isBuyer==true}){
         var content = $("#content").val();   
         var vstar=$("#star").val();
         var star;
         switch (vstar) {
         case "1":
            star="★☆☆☆☆";   
            break;
         case "2":
            star="★★☆☆☆";
            break;s
         case "3":
            star="★★★☆☆";
            break;
         case "4":
            star="★★★★☆";
            break;
         
         case "5":
            star="★★★★★";
            break;
         }
         console.log;   
         var param = {
            "bno" : ${detail.NO},
            "writer": "${user.ID}",
            "content":content,
            "star":star,
            "star_num":vstar
                  }
         $.post("${pageContext.servletContext.contextPath }/ajax/replyWrite.do",param).done(function(rst) {
         var obj = rst;
            if(obj==1){
               $("#content").val("");
               window.alert("댓글이 등록되었습니다.");
               ListReply();
             }else 
               window.alert("이미 댓글 등록하셨습니다 댓글 수정을 이용 해주세요");
             
         });   
      }else{
         document.getElementById("content").value = "";
         window.alert("구매자만 댓글등록 가능합니다.");
      }
   }else
      {
      window.alert("로그인을 해주세요");
      }

});

</script>


      <footer class="my-5 pt-5 text-muted text-center text-small">
         <p class="mb-1">&copy; 2018-2019 재미나</p>
      </footer>
   </div> --%>
</body>