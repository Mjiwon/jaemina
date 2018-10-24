<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
</head>
<body>
 <form action="${pageContext.servletContext.contextPath}/addbank.do" method="post">
 ID:<input type="text" name="ID">
 계좌번호 입력:<input type="text" name="BANK">
 	<input type="button" value="계좌인증 확인"/>
 		
 </form>
 </body>
 </html>