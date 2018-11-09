<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
    <br/><br/><br/>
    판매관리 변경 페이지<br/>
    ${mysell.POSTNO} | 구매자 : ${mysell.BUYER} | 가격 : ${mysell.PRICE} | 
    판매 상태 : ${mysell.SELLING} | 구매 상태 : ${mysell.BUYING}<br/>
    <form action="${path }/mypage/sellchangestate.do" method="post">
    	<input hidden="" name="no" value="${mysell.NO }" />
    	<input hidden="" name="postno" value="${mysell.POSTNO }"/>
    	<select name="selling">
    		<option>판매상태변경을 선택하세요</option>
    		<option value="2">판매중</option>
    		<option value="3">판매완료</option>
    		<option value="4">환불접수</option>
    		<option value="5">환불완료</option>
    		<option value="6">취소접수</option>
    		<option value="7">취소완료</option>
    	</select>
    	<button type="submit">변경</button>
    </form>