<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="currentPage">${currentPage }</c:set>
<c:set var="totalPage">${totalPage }</c:set>
<c:set var="pageBlock">5</c:set>

<fmt:parseNumber var="currentBlock" integerOnly="true" value="${currentPage/pageBlock }"/>
<fmt:parseNumber var="lastBlock" integerOnly="true" value="${totalPage/pageBlock }"/>
<c:if test="${currentPage%pageBlock == 0 }"><c:set var="currentBlock" value="${currentBlock -1 }"/></c:if>
<c:set var="startNum" value="${currentBlock*pageBlock+1 }"/>
<c:set var="endNum" value="${currentBlock*pageBlock+pageBlock }"/>
<c:if test="${endNum > totalPage }"><c:set var="endNum" value="${totalPage }"/></c:if>

<div class="row" style="margin-top: 8%;">
   <div class="col-2">
      <ul class="list-group list-group-flush" style="text-align: center; margin-left: 2%;">
           <c:forEach var="i" items="${smallcates}">
             <a class="list-group-item list-group-item-action " id="v-pills-settings-tab" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${i.BIGNO}&smallcate=${i.SMALLNO}&currentPage=1" role="tab" aria-controls="v-pills-settings" >${i.SMALLCATE }</a>           
           </c:forEach>
      </ul>
   </div>
   <div class="col-9">
      <div class="row">
            <c:forEach var="l" items="${boardlist }">
               <div class="col-md-4">
                  <a
                     href="${pageContext.servletContext.contextPath }/board/detail.do?no=${l.NO}">
                     <div class="card mb-4 shadow-sm">
                        <img class="card-img-top"
                           src="${pageContext.servletContext.contextPath }${l.IMGPATH}"
                           width="286" height="180">
                        <div class="card-body">
                           <p class="card-text" style="color: black;">${fn:substring(l.TITLE, 0, 16) }<c:if test="${fn:length(l.TITLE) >16 }">...</c:if></p>
                           <p class="card-text" style="color: red;">
                              <b><fmt:formatNumber>${l.PRICE }</fmt:formatNumber>원</b>
                           </p> 
                        </div>
                     </div>
                  </a>
               </div>
            </c:forEach>
         </div>
            <nav aria-label="Page navigation example">
         <ul class="pagination justify-content-center">
            <c:if test="${!empty searchLog }">
               <c:if test="${currentPage != 1 }">
                  <%-- 
         <a id="firstbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=1" style="color: black;">[첫 페이지] | </a> --%>
                  <li class="page-item">
                     <a class="page-link" id="firstbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=1" tabindex="-1">첫 페이지</a>
                  </li>
               </c:if>
               <c:if test="${currentBlock == 1 }">
                  <%-- <a id="prevbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${startNum-pageBlock+9 }" style="color: black;"> [이전] |</a> --%>
                  <li class="page-item" >
                     <a   class="page-link" id="prevbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${startNum-pageBlock+4 }" tabindex="-1">이전</a>
                  </li>
               </c:if>

               <c:forEach var="index" begin="${startNum }" end="${endNum }"
                  varStatus="status">
                  <c:choose>
                     <c:when test="${index == currentPage }">
                        <li class="page-item">
                              <a id="pagebtn" class="page-link" href="#">${index }</a>
                           </li>
                     </c:when>
                     <c:otherwise>
                        <%-- <a id="pagebtn"
                           href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${index}"
                           style="color: black;">${index }</a> --%>
                           
                           <li class="page-item">
                              <a id="pagebtn" class="page-link" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${index}">${index }</a>
                           </li>
                     </c:otherwise>
                  </c:choose>
                  <c:if test="${!status.last }"> | </c:if>
               </c:forEach>
               <c:if test="${currentBlock != lastBlock }">
                  <%-- <a id="nextbtn"
                     href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${startNum+pageBlock }"
                     style="color: black;"> | [다음]</a> --%>
                     <li class="page-item">
                        <a class="page-link" id="nextbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${startNum+pageBlock }">다음</a>
                      </li>
                     
               </c:if>
               <c:if test="${currentPage != totalPage && totalPage > 1}">
                  <%-- <a id="lastbtn"
                     href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${totalPage}"
                     style="color: black;"> | [마지막 페이지]</a> --%>
                     
                     <li class="page-item">
                        <a class="page-link" id="lastbtn" href="${pageContext.servletContext.contextPath }/board/searchList.do?searchKey=${searchLog }&currentPage=${totalPage}">마지막페이지</a>
                      </li>
               </c:if>
            </c:if>
            <c:if test="${!empty bigCate && empty smallCate && empty searchLog}">
               <c:if test="${currentPage != 1 }">
                  <%-- <a id="firstbtn"
                     href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=1"
                     style="color: black;">[첫 페이지] | </a> --%>
                     
                     <li class="page-item">
                     <a class="page-link" id="firstbtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=1" tabindex="-1">첫 페이지</a>
                  </li>
               </c:if>
               <c:if test="${currentBlock == 1 }">
                  <%-- <a id="prevbtn"
                     href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${startNum-pageBlock+9 }"
                     style="color: black;"> [이전] |</a> --%>
                     
                     <li class="page-item" >
                     <a   class="page-link" id="prevbtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${startNum-pageBlock+4 }" tabindex="-1">이전</a>
                  </li>
               </c:if>

               <c:forEach var="index" begin="${startNum }" end="${endNum }"
                  varStatus="status">
                  <c:choose>
                     <c:when test="${index == currentPage }">
                     
                     <li class="page-item">
                              <a id="pagebtn" class="page-link" href="#">${index }</a>
                           </li><%-- 
                        <b>${index }</b> --%>
                     </c:when>
                     <c:otherwise>
                        <%-- <a id="pagebtn"
                           href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${index}"
                           style="color: black;">${index }</a> --%>
                           
                           <li class="page-item">
                              <a id="pagebtn" class="page-link" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${index}">${index }</a>
                           </li>
                     </c:otherwise>
                  </c:choose><%-- 
                  <c:if test="${!status.last }"> | </c:if> --%>
               </c:forEach>
               <c:if test="${currentBlock != lastBlock}">
                  <%-- <a id="nextbtn"
                     href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${startNum+pageBlock }"
                     style="color: black;"> | [다음]</a> --%>
                     
                     <li class="page-item">
                        <a class="page-link" id="nextbtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${startNum+pageBlock }">다음</a>
                      </li>
               </c:if>
               <c:if test="${currentPage != totalPage && totalPage > 1}">
                  <%-- <a id="lastbtn"
                     href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${totalPage}"
                     style="color: black;"> | [마지막 페이지]</a> --%>
                     <li class="page-item">
                        <a class="page-link" id="lastbtn" href="${pageContext.servletContext.contextPath }/board/lists.do?bigcate=${bigCate }&currentPage=${totalPage}">마지막페이지</a>
                      </li>
               </c:if>
            </c:if>
            <c:if test="${!empty smallCate }">
               <c:if test="${currentPage != 1 }">
                  <%-- <a id="firstbtn"
                     href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=1"
                     style="color: black;">[첫 페이지] | </a> --%>
                     
                     <li class="page-item">
                     <a class="page-link" id="firstbtn" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=1" tabindex="-1">첫 페이지</a>
                  </li>
               </c:if>
               <c:if test="${currentBlock == 1 }">
                  <%-- <a id="prevbtn"
                     href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${startNum-pageBlock+9 }"
                     style="color: black;"> [이전] |</a> --%>
                     
                     <li class="page-item" >
                     <a   class="page-link" id="prevbtn" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${startNum-pageBlock+4 }" tabindex="-1">이전</a>
                  </li>
               </c:if>
               <c:forEach var="index" begin="${startNum }" end="${endNum }"
                  varStatus="status">
                  <c:choose>
                     <c:when test="${index == currentPage }">
                        <%-- <b>${index }</b> --%>
                        <li class="page-item">
                              <a id="pagebtn" class="page-link" href="href="#">${index }</a>
                           </li>
                     </c:when>
                     <c:otherwise>
                        <%-- <a id="pagebtn"
                           href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${index}"
                           style="color: black;">${index }</a> --%>
                           <li class="page-item">
                              <a id="pagebtn" class="page-link" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${index}">${index }</a>
                           </li>
                     </c:otherwise>
                  </c:choose>
                  <c:if test="${!status.last }"> | </c:if>
               </c:forEach>
               <c:if test="${currentBlock != lastBlock}">
                  <%-- <a id="nextbtn"
                     href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${startNum+pageBlock }"
                     style="color: black;"> | [다음]</a> --%>
                     <li class="page-item">
                        <a class="page-link" id="nextbtn" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${startNum+pageBlock }">다음</a>
                      </li>
               </c:if>
               <c:if test="${currentPage != totalPage && totalPage > 1}">
                  <%-- <a id="lastbtn"
                     href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${totalPage}"
                     style="color: black;"> | [마지막 페이지]</a> --%>
                     <li class="page-item">
                        <a class="page-link" id="lastbtn" href="${pageContext.servletContext.contextPath }/board/list.do?bigcate=${bigCate }&smallcate=${smallCate }&currentPage=${totalPage}">마지막페이지</a>
                      </li>
               </c:if>
            </c:if>
         </ul>
      </nav>
   </div>

</div>