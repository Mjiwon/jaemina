<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>판매글 쓰기</title>
</head>
<body>
	<h1>판매글</h1>
	<form action="${pageContext.servletContext.contextPath }/write.do" method="post">
		<!-- 
			no : number(6,0)
			bigcate : number(1,0)
			smallcate : number(1,0)
			title : varhcar2(300)
			imgpath : varchar2(500)
			price : number(10,0)
			writer : varchar2(60)
			wrdate : date
			content : varchar2(3000)
		 -->
		 <select>
		 <option>카테고리를 선택하세요</option>
		 <c:forEach var="big" items="${bigcate }">		 
		 	<option id="bigcate" onclick="value(this)">${big.NO } : ${big.BIGCATE } </option>
		 </c:forEach>
		 </select>
		 <select id="smallcate">
		 
		 </select>
		 <input name="title" type="text"/>
		 <script type="text/javascript">
		 	var value = function(target){
		 		console.log(this.value);
		 	}
		 	//bigcate에서 smallcatelist 뽑아내는 ajax 
/* 		 	$("#bigcate").on("click",function(target){
		 		$.ajax({
		 			"url":"${pageContext.servletContext.contextPath}/ajax/cate.do",
		 			"data":target.val()
		 		}).done(function(rst){
		 			var obj = JSON.parse(rst);
		 			var html = "";
		 			console.log(obj);
		 			 	for(var i=0; i<obj.SMALLNO.size();i++){
		 				html +="<option>"+obj.scatelist.SMALLCATE.get(i)+" : "+obj.scatelist.SMALLCATE.get(i)+"</option>";
		 				console.log(obj.scatelist.SMALLCATE.get(i)+" / "+obj.scatelist.SMALLCATE.get(i));
		 			}
		 		 
		 			$("#smallcate").html() = html;
		 			
		 		});
		 	}); */
		 	</script>
	
		<button type="submit">확인</button>
	</form>
</body>
</html>