<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${!empty joinYes }">
   <script>
      window.alert("회원가입에 성공하셨습니다." + "\n" + "이제부터 로그인이 가능합니다.");
      opener.location.href = "${pageContext.servletContext.contextPath }/index.do";
      window.close();
   </script>
</c:if>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
   href="${pageContext.servletContext.contextPath }/css/signin.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<title>회원가입</title>
</head>
<body class="text-center">
   <form action="${pageContext.servletContext.contextPath }/join.do"
      class="form-signin" method="post">
      <h1 class="h3 mb-3 font-weight-normal">재미나</h1>
      <label for="inputId" class="sr-only">아이디</label> <input type="text"
         id="inputId" class="form-control" name="getId" placeholder="아이디"
         onkeyup="getid(this);" required autofocus> <small
         id="checked"></small>
      <button type="button" id="useId" disabled="disabled">이 아이디 사용</button>
      <label for="inputPassword1" class="sr-only">비밀번호</label> <input
         type="password" id="inputPassword1" class="form-control"
         name="getPass" placeholder="비밀번호" onkeyup="getpass2(this);" required
         autofocus> <label for="inputPassword2" class="sr-only">
         비밀번호재입력</label> <input type="password" id="inputPassword2"
         class="form-control" name="getPass1" placeholder="비밀번호 재입력"
         onkeyup="getpass2(this);" required autofocus> <small
         id="checked2"></small>
      <button type="button" id="usePass" disabled="disabled">이 비밀번호
         사용</button>
      <label for="inputEmail" class="sr-only">이메일</label> <input
         type="email" id="inputEmail" class="form-control" name="getEmail"
         placeholder="이메일" onkeyup="getemail(this);" required autofocus>
      <small id="checked3"></small>
      <button type="button" id="emailauth" disabled="disabled">인증번호
         전송</button>
      <small id="checked5"> </small> <label for="inputId" class="sr-only">인증번호</label>
      <input type="text" id="confirm" class="form-control" name="confirm"
         placeholder="인증번호" disabled="disabled" required autofocus>
      <button type="button" id="confirmok" disabled="disabled">인증하기</button>
      <small id="checked4"></small><br/><br/>

<button type="button" id="agree" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong" disabled="disabled">이용약관 내용 동의</button><br/><br/>
<!-- Modal -->



<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">재미나 약관동의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <textarea rows="15" cols="60">   
     가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입 
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입 
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다. 
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다. 
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다. 
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다. 
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공 
- 생성정보 수집 툴을 통한 수집
</textarea>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="btnfalse">동의 하지 않음</button>
        <button type="button" class="btn btn-primary" id="btntrue"data-dismiss="modal" >동의</button>
      </div>
    </div>
  </div>
</div>
   


      <button class="btn btn-lg btn-primary btn-block" type="submit"
         id="btnsubmit" disabled="disabled">회원가입</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2018 Jaemina CORP</p>





   </form>
   <script type="text/javascript">
   $("#btnfalse").on("click", function() {
      window.alert("동의하셔야지만 회원가입이 가능합니다")
   $("#btnsubmit").prop(
            "disabled", true)
            
   });
   
   $("#btntrue").on("click", function() {
   $("#btnsubmit").prop(     
         "disabled", false);
   });

   
   
      $("#useId").on("click", function() {
         $("#inputId").prop("readonly", true);
         $("#useId").prop("disabled", true);
      });

      $("#usePass").on("click", function() {
         $("#inputPassword1").prop("readonly", true);
         $("#inputPassword2").prop("readonly", true);
         $("#usePass").prop("disabled", true);
      });
      $("#emailauth")
            .on(
                  "click",
                  function() {
                     var param = {
                        "email" : $("#inputEmail").val()
                     };
                     $("#confirm").prop("disabled", false);
                     $("#confirmok").prop("disabled", false);
                     $
                           .post(
                                 "${pageContext.servletContext.contextPath}/mail.do",
                                 param)
                           .done(
                                 function(rst) {
                                    document
                                          .getElementById("checked5").innerHTML = "전송";
                                    document
                                          .getElementById("checked5").style.color = "green";
                                    document
                                          .getElementById("checked4").innerHTML = "";
                                 });
                  });
      $("#confirmok")
            .on(
                  "click",
                  function() {
                     var param = {
                        "confirmkey" : $("#confirm").val()
                     };
                     $
                           .post(
                                 "${pageContext.servletContext.contextPath}/emailauth.do",
                                 param)
                           .done(
                                 function(rst) {
                                    console.log(rst);
                                    if (rst.includes("true") == true) {
                                       document.getElementById("checked4").innerHTML = "인증완료";
                                       document.getElementById("checked4").style.color = "green";
                                       $("#inputEmail").prop(
                                             "readonly", true);
                                       $("#emailauth").prop(
                                             "disabled", true);
                                       $("#confirm").prop(
                                             "disabled", true);
                                       $("#confirmok").prop(
                                             "disabled", true);
                                       $("#agree").prop(
                                             "disabled", false);
                                       $("#btnsubmit").prop(
                                             "disabled", true);
                                 
                                    } else {
                                       document
                                             .getElementById("checked4").innerHTML = "인증실패";
                                       document
                                             .getElementById("checked4").style.color = "red";
                                       $("#confirm").prop(
                                             "disabled", true);
                                       $("#confirmok").prop(
                                             "disabled", true);
                                       document
                                             .getElementById("emailauth").innerHTML = "재전송";
                                       document
                                             .getElementById("checked5").innerHTML = "";
                                    }
                                 });
                  });

      var r = new RegExp(/^[a-z]{1,1}\w{3,11}$/);
      var getid = function(target) {
         if (r.test(target.value) == true) {
            document.getElementById("checked").innerHTML = "사용가능한 ID입니다.";
            document.getElementById("checked").style.color = "green";
            $("#useId").prop("disabled", false);
            var req = new XMLHttpRequest();
            req.open("get", "joinid_check.do?w=" + target.value, true);
            req.onreadystatechange = function() {
               if (this.readyState == 4) {
                  var obj = JSON.parse(this.responseText);
                  var idd = obj.ID;
                  if (idd.includes(target.value) == true) {
                     document.getElementById("checked").innerHTML = "중복된 ID입니다.";
                     document.getElementById("checked").style.color = "red";
                     $("#useId").prop("disabled", true);
                  }
               }
            };
            req.send();
         } else {
            document.getElementById("checked").innerHTML = "4~12자 사이로 입력해주세요.";
            document.getElementById("checked").style.color = "red";
            $("#useId").prop("disabled", true);
         }
      };

      var r1 = new RegExp(/^[a-z0-9]\w{3,11}$/);
      var getpass2 = function(p) {
         var pass1 = document.getElementById("inputPassword1").value;
         var pass2 = document.getElementById("inputPassword2").value;
         if (r1.test(p.value) == true) {
            if (pass2 == pass1) {
               document.getElementById("checked2").innerHTML = "비밀번호가 일치합니다.";
               document.getElementById("checked2").style.color = "green";
               $("#usePass").prop("disabled", false);
            } else {
               document.getElementById("checked2").innerHTML = "비밀번호가 일치하지 않습니다.";
               document.getElementById("checked2").style.color = "red";
               $("#usePass").prop("disabled", true);
            }
         } else {
            document.getElementById("checked2").innerHTML = "4~12자 사이로 설정해주세요.";
            document.getElementById("checked2").style.color = "red"
            $("#usePass").prop("disabled", true);
         }
      };

      var r2 = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
      var getemail = function(target) {
         if (r2.test(target.value) == true) {
            document.getElementById("checked3").innerHTML = "사용 가능한 Email입니다.";
            document.getElementById("checked3").style.color = "green";
            $("#emailauth").prop("disabled", false);
            var req = new XMLHttpRequest();
            req.open("get", "joinemail_check.do?w=" + target.value, true);
            req.onreadystatechange = function() {
               if (this.readyState == 4) {
                  var obj = JSON.parse(this.responseText);
                  var idd = obj.EMAIL;
                  if (idd.includes(target.value) == true) {
                     document.getElementById("checked3").innerHTML = "이미 사용중인 Email입니다.";
                     document.getElementById("checked3").style.color = "red";
                     $("#emailauth").prop("disabled", true);
                  }
               }
            }
            req.send();
         } else {
            document.getElementById("checked3").innerHTML = "사용 불가능한 Email 형식입니다.";
            document.getElementById("checked3").style.color = "red";
            $("#emailauth").prop("disabled", true);
         }
      };
   </script>
</body>
</html>