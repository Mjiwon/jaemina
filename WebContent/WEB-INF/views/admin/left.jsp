<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />

<div class="container-fluid">
      <div class="row">
        <nav class="col">
        <b>관리</b><hr/>
          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="${path }/admin/account.do">회원관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${path }/admin/board.do">게시글관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${path }/admin/permitsellerlist.do">판매자등록관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${path }/admin/qa.do">문의관리</a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="${path }/admin/managepay.do">거래관리</a>
            </li>
          </ul>
          <br/>
        </nav>
       </div>
      </div>



	
<!-- 알림 -->
<div id="alert" style="font-size: .75em">
	<a href="" class="alert-ling"></a>
</div>


