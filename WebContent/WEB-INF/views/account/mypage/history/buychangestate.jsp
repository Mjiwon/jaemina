<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
    <br/><br/><br/>
    판매관리 변경 페이지<br/>
    ${mybuy.POSTNO} | 구매자 : ${mybuy.BUYER} | 가격 : ${mybuy.PRICE} | 
    판매 상태 : ${mybuy.SELLING} | 구매 상태 : ${mybuy.BUYING}<br/>
    <form action="${path }/mypage/buychangestate.do" method="post">
    	<input hidden="" name="no" value="${mybuy.NO }" />
    	<input hidden="" name="postno" value="${mybuy.POSTNO }"/>
    	<select name="buying">
    		<option>구매상태변경을 선택하세요</option>
    		<option value="3">구매완료</option>
    		<option value="4">환불신청</option>
    	</select>
    	<button type="submit">변경</button>
    </form>