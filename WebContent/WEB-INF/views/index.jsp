<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<style type="text/css">
u {
	text-decoration: none;
	border-bottom: 1px solid;
	padding-bottom: 2px;
}
</style>

<title>재미나</title>
</head>
<body>
	<div class="jumbotron jumbotron-fluid" align="center"
		style="background-color: #CCFFCC; padding-top: 10px; padding-bottom: 30px;">
		<div align="left">


			<c:choose>
				<c:when test="${!empty auth}">
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link disabled" href="#"><b>판매</b></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"><b>구매</b></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"><b>메세지</b></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"><b>찜한선물</b></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"><b>${user.ID }</b></a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link disabled" href="#"><b>판매시작하기</b></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"><b>로그인</b></a></li>
						<li class="nav-item"><a class="nav-link active" href="#"><b>회원가입</b></a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			

			<ul class="nav">
		</div>
		<div class="container">
			<h1 class="display-4">재미나</h1>
			<p class="lead">아름다운 재능을 나누다</p>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<br>
		<div class="row">
			<div class="col">
				<u>등록된 서비스</u> <br /> <b><font size="6">5건</font></b>
			</div>
			<div class="col">
				<u>총 거래 건 수</u> <br /> <b><font size="6">5건</font></b>
			</div>
			<div class="col">
				<u>의뢰인 평균 만족도</u> <br /> <b><font size="6">98%</font></b>
			</div>

		</div>
	</div>
	<div align="left">
		<nav class="nav" style="background-color: #e3f2fd;">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="#">디자인</a></li>
				<li class="nav-item"><a class="nav-link" href="#">IT·프로그래밍</a></li>
				<li class="nav-item"><a class="nav-link" href="#">마케팅</a></li>
				<li class="nav-item"><a class="nav-link" href="#">문서작성</a></li>
				<li class="nav-item"><a class="nav-link" href="#">레슨</a></li>
				<li class="nav-item"><a class="nav-link" href="#">핸드메이드</a></li>
			</ul>
		</nav>
	</div>

	<div align="center">
		<br />
		<h4>카테고리별 전문가 랭킹</h4>
		<div class="row">
			<div class="col">
				<label>디자인</label>
				<table class="table">
					<tbody>
						<tr>
							<th scope="row">1위</th>
							<td>꿈쏙에</td>
							<td><A href="#">saan</A></td>
						</tr>
						<tr>
							<th scope="row">2위</th>
							<td>Jacob</td>
							<td><A href="#">jiwoni</A></td>
						</tr>
						<tr>
							<th scope="row">3위</th>
							<td>Larry</td>
							<td><A href="#">hjhhjh</A></td>
						</tr>
						<tr>
							<th scope="row">4위</th>
							<td>Larry</td>
							<td><A href="#">hjhhjh</A></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col">
				<label>IT·프로그래밍</label>
				<table class="table">
					<tbody>
						<tr>
							<th scope="row">1위</th>
							<td>꿈쏙에</td>
							<td><A href="#">saan</A></td>
						</tr>
						<tr>
							<th scope="row">2위</th>
							<td>Jacob</td>
							<td><A href="#">jiwoni</A></td>
						</tr>
						<tr>
							<th scope="row">3위</th>
							<td>Larry</td>
							<td><A href="#">hjhhjh</A></td>
						</tr>
						<tr>
							<th scope="row">4위</th>
							<td>Larry</td>
							<td><A href="#">hjhhjh</A></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col">
				<label>문서작성</label>
				<table class="table">
					<tbody>
						<tr>
							<th scope="row">1위</th>
							<td>꿈쏙에</td>
							<td><A href="#">saan</A></td>
						</tr>
						<tr>
							<th scope="row">2위</th>
							<td>Jacob</td>
							<td><A href="#">jiwoni</A></td>
						</tr>
						<tr>
							<th scope="row">3위</th>
							<td>Larry</td>
							<td><A href="#">hjhhjh</A></td>
						</tr>
						<tr>
							<th scope="row">4위</th>
							<td>Larry</td>
							<td><A href="#">hjhhjh</A></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>