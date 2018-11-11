<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Slideshow 4 -->
<div class="slider text-center">
	<div class="callbacks_container">
		<ul class="rslides" id="slider4">
			<li>
				<div class="slider-img one-img">
					<div class="container">
						<div class="slider-info ">
							<h5>
								프리랜서 마켓<br> 재미냥
							</h5>
						</div>
					</div>
				</div>
			</li>

			<li>
				<div class="slider-img two-img">
					<div class="container">
						<div class="slider-info ">
							<h5>
								아름다운 재능을 나누다<br>재미냥
							</h5>
							<!-- <div class="bottom-info">
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
									elit.Aenean commodo ligula eget dolorL orem ipsum dolor sit
									amet eget dolor</p>
							</div>
							<div class="outs_more-buttn">
								<a href="#">Read More</a>
							</div> -->
						</div>
					</div>
				</div>
			</li>

			<li>
				<div class="slider-img three-img">
					<div class="container">
						<div class="slider-info">
							<h5>
								나만의 선생님을 만나다 <br>재미냥
							</h5>
							<!-- <div class="bottom-info">
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
									elit.Aenean commodo ligula eget dolorL orem ipsum dolor sit
									amet eget dolor</p>
							</div>
							<div class="outs_more-buttn">
								<a href="#">Read More</a>
							</div> -->
						</div>
					</div>
				</div>
			</li>
		</ul>

		<div class="carousel-caption d-none d-md-block" style="z-index: 20000">
			<div class="row">
				<div class="col">
					<u><b><font size="3" style="text-decoration: none;">등록된
								서비스</font></b></u><br /> <b><font size="6">${boardCount }건</font></b>
				</div>
				<div class="col">
					<u><b><font size="3">총 거래 건 수</font></b></u><br /> <b><font
						size="6">${payCount }건</font></b>
				</div>
				<div class="col">
					<u><b><font size="3">의뢰인 평균 만족도</font></b></u><br /> <b><font
						size="6">${payPercent==null? 0 : payPercent }%</font></b>
				</div>
			</div>
		</div>
		<div
			style="position: absolute; bottom: 0; width: 100%; height: 150px; z-index: 200; background-color: #fff; opacity: 0.7;"></div>

	</div>
	<div class="clearfix"></div>
</div>
<!-- // header -->



<!-- Session_01 -->
<section style="height: 570px;"
	class="about py-lg-4 py-md-3 py-sm-3 py-3" id="about">
	<div class="container py-lg-5 py-md-5 py-sm-4 py-4">
		<h3 class="title text-center mb-lg-5 mb-md-4  mb-sm-4 mb-3">CATEGORI</h3>
		<div class="row banner-below-w3l">

			<c:forEach var="big" items="${bigcate }">

				<div class="col-lg-2  text-center banner-agile-flowers">
					<a href="#" id="test"> <img class=""
						src="${pageContext.servletContext.contextPath }/images/images/${big.NO=1 }.svg"
						onmouseover="this.src='${pageContext.servletContext.contextPath }/images/images/${big.NO=2 }.svg'"
						onmouseout="this.src='${pageContext.servletContext.contextPath }/images/images/${big.NO=1 }.svg'" />
					</a>

					<div class="banner-right-icon">
						<h4 class="pt-4">${big.BIGCATE }</h4>
					</div>
				</div>


			</c:forEach>

			<!-- <div class="col-lg-2 text-center banner-agile-flowers">
				<a href=""></a>
				<div class="banner-right-icon">
					<h4 class="pt-4">Soft Toys</h4>
				</div>
			</div> -->
		</div>
	</div>
</section>
<!-- // Session_01 -->


<!-- Session_02 -->
<section class="clients py-lg-4 py-md-3 py-sm-3 py-3" id="clients">
	<div class="container py-lg-5 py-md-5 py-sm-4 py-3">
		<h3 class="title clr text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">BEST
			???</h3>
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">

			<!-- All Slide -->
			<div class="carousel-inner">

				<!-- Slide_01 -->
				<div class="carousel-item active">
					<div class="row">
						<div class="col-lg-4 clients-w3layouts-row">
							<div class="least-w3layouts-text-gap">
								<div class="row">
									<div class="col-md-4 col-sm-4 news-img">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/t1.jpg"
											alt="" class="image-fluid">
									</div>
									<div class="col-md-8 col-sm-8 clients-says-w3layouts">
										<h4>Milky Deo</h4>
										<span class="mt-2">Duis posuere</span>
									</div>
									<div class="mt-3 news-agile-text">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/tt1.jpg"
											alt="" class="image-fluid">
										<p class="mt-3">
											<span class="fas fa-quote-left"></span> velit sagittis
											vehicula. Duis posuere ex in mollis iaculis. Suspendisse
											tincidunt velit sagittis vehicula. Duis posuere velit
											sagittis vehicula. Duis posuere <span
												class="fas fa-quote-right"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 clients-w3layouts-row">
							<div class="least-w3layouts-text-gap">
								<div class="row">
									<div class="col-md-4 col-sm-4 news-img">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/t2.jpg"
											alt="" class="image-fluid">
									</div>
									<div class="col-md-8 col-sm-8 clients-says-w3layouts">
										<h4>Sam Deo</h4>
										<span class="mt-2">Duis posuere</span>
									</div>
									<div class="mt-3 news-agile-text">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/tt2.jpg"
											alt="" class="image-fluid">
										<p class="mt-3">
											<span class="fas fa-quote-left"></span> velit sagittis
											vehicula. Duis posuere ex in mollis iaculis. Suspendisse
											tincidunt velit sagittis vehicula. Duis posuere velit
											sagittis vehicula. Duis posuere <span
												class="fas fa-quote-right"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 clients-w3layouts-row">
							<div class="least-w3layouts-text-gap">
								<div class="row">
									<div class="col-md-4 col-sm-4 news-img">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/t2.jpg"
											alt="" class="image-fluid">
									</div>
									<div class="col-md-8 col-sm-8 clients-says-w3layouts">
										<h4>Sam Deo</h4>
										<span class="mt-2">Duis posuere</span>
									</div>
									<div class="mt-3 news-agile-text">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/tt2.jpg"
											alt="" class="image-fluid">
										<p class="mt-3">
											<span class="fas fa-quote-left"></span> velit sagittis
											vehicula. Duis posuere ex in mollis iaculis. Suspendisse
											tincidunt velit sagittis vehicula. Duis posuere velit
											sagittis vehicula. Duis posuere <span
												class="fas fa-quote-right"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- // Slide_01 -->

				<!-- Slide_02 -->
				<div class="carousel-item">
					<div class="row">
						<div class="col-lg-4 clients-w3layouts-row">
							<div class="least-w3layouts-text-gap">
								<div class="row">
									<div class="col-md-4 col-sm-4 news-img">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/t1.jpg"
											alt="" class="image-fluid">
									</div>
									<div class="col-md-8 col-sm-8 clients-says-w3layouts">
										<h4>Milky Deo</h4>
										<span class="mt-2">Duis posuere</span>
									</div>
									<div class="mt-3 news-agile-text">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/tt1.jpg"
											alt="" class="image-fluid">
										<p class="mt-3">
											<span class="fas fa-quote-left"></span> velit sagittis
											vehicula. Duis posuere ex in mollis iaculis. Suspendisse
											tincidunt velit sagittis vehicula. Duis posuere velit
											sagittis vehicula. Duis posuere <span
												class="fas fa-quote-right"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 clients-w3layouts-row">
							<div class="least-w3layouts-text-gap">
								<div class="row">
									<div class="col-md-4 col-sm-4 news-img">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/t2.jpg"
											alt="" class="image-fluid">
									</div>
									<div class="col-md-8 col-sm-8 clients-says-w3layouts">
										<h4>Sam Deo</h4>
										<span class="mt-2">Duis posuere</span>
									</div>
									<div class="mt-3 news-agile-text">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/tt2.jpg"
											alt="" class="image-fluid">
										<p class="mt-3">
											<span class="fas fa-quote-left"></span> velit sagittis
											vehicula. Duis posuere ex in mollis iaculis. Suspendisse
											tincidunt velit sagittis vehicula. Duis posuere velit
											sagittis vehicula. Duis posuere <span
												class="fas fa-quote-right"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 clients-w3layouts-row">
							<div class="least-w3layouts-text-gap">
								<div class="row">
									<div class="col-md-4 col-sm-4 news-img">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/t2.jpg"
											alt="" class="image-fluid">
									</div>
									<div class="col-md-8 col-sm-8 clients-says-w3layouts">
										<h4>Sam Deo</h4>
										<span class="mt-2">Duis posuere</span>
									</div>
									<div class="mt-3 news-agile-text">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/tt2.jpg"
											alt="" class="image-fluid">
										<p class="mt-3">
											<span class="fas fa-quote-left"></span> velit sagittis
											vehicula. Duis posuere ex in mollis iaculis. Suspendisse
											tincidunt velit sagittis vehicula. Duis posuere velit
											sagittis vehicula. Duis posuere <span
												class="fas fa-quote-right"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- // Slide_02 -->

				<!-- Slide_03 -->
				<div class="carousel-item">
					<div class="row">
						<div class="col-lg-4 clients-w3layouts-row">
							<div class="least-w3layouts-text-gap">
								<div class="row">
									<div class="col-md-4 col-sm-4 news-img">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/t1.jpg"
											alt="" class="image-fluid">
									</div>
									<div class="col-md-8 col-sm-8 clients-says-w3layouts">
										<h4>Milky Deo</h4>
										<span class="mt-2">Duis posuere</span>
									</div>
									<div class="mt-3 news-agile-text">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/tt1.jpg"
											alt="" class="image-fluid">
										<p class="mt-3">
											<span class="fas fa-quote-left"></span> velit sagittis
											vehicula. Duis posuere ex in mollis iaculis. Suspendisse
											tincidunt velit sagittis vehicula. Duis posuere velit
											sagittis vehicula. Duis posuere <span
												class="fas fa-quote-right"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 clients-w3layouts-row">
							<div class="least-w3layouts-text-gap">
								<div class="row">
									<div class="col-md-4 col-sm-4 news-img">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/t2.jpg"
											alt="" class="image-fluid">
									</div>
									<div class="col-md-8 col-sm-8 clients-says-w3layouts">
										<h4>Sam Deo</h4>
										<span class="mt-2">Duis posuere</span>
									</div>
									<div class="mt-3 news-agile-text">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/tt2.jpg"
											alt="" class="image-fluid">
										<p class="mt-3">
											<span class="fas fa-quote-left"></span> velit sagittis
											vehicula. Duis posuere ex in mollis iaculis. Suspendisse
											tincidunt velit sagittis vehicula. Duis posuere velit
											sagittis vehicula. Duis posuere <span
												class="fas fa-quote-right"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 clients-w3layouts-row">
							<div class="least-w3layouts-text-gap">
								<div class="row">
									<div class="col-md-4 col-sm-4 news-img">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/t2.jpg"
											alt="" class="image-fluid">
									</div>
									<div class="col-md-8 col-sm-8 clients-says-w3layouts">
										<h4>Sam Deo</h4>
										<span class="mt-2">Duis posuere</span>
									</div>
									<div class="mt-3 news-agile-text">
										<img
											src="${pageContext.servletContext.contextPath }/images/images/tt2.jpg"
											alt="" class="image-fluid">
										<p class="mt-3">
											<span class="fas fa-quote-left"></span> velit sagittis
											vehicula. Duis posuere ex in mollis iaculis. Suspendisse
											tincidunt velit sagittis vehicula. Duis posuere velit
											sagittis vehicula. Duis posuere <span
												class="fas fa-quote-right"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- // Slide_03 -->

			</div>
			<!-- // All Slide -->

			<!-- pn_bar -->
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
			<!-- // pn_bar -->

		</div>
	</div>
</section>
<!-- // Session_02 -->



<!-- Session_03 -->
<section class="">
	<div class="container card py-lg-5 py-md-5 py-sm-4 py-3">
		<h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3"
			style="margin-bottom: 20px;">DETAIL CATE</h3>
		<div class="row">
			<c:forEach var="nb" items="${newBoard }">
				<div class="col-lg-3 card">
					<img class="card-img-top" alt=""
						src="${pageContext.servletContext.contextPath }${nb.IMGPATH}"
						width="217.5" height="266">
					<div class="card-title">
						${nb.TITLE }
						<hr/>
						<div align="right">
							작성자 : <b>${nb.WRITER }</b>
						</div>
						<div class="clients_more-buttn" style="height: 45px;">
							<a href="${pageContext.servletContext.contextPath }/board/detail.do?no=${nb.NO}">글보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</section>
<!-- // Session_03 -->

<section class="clients py-lg-4 py-md-3 py-sm-3 py-3" id="clients"
	style="margin-bottom: 50px;">
	<div class="container py-lg-5 py-md-5 py-sm-4 py-3"
		style="position: relative;">
		<div align="center"
			style="background-color: #000; opacity: 0.6; width: 100%; height: 330px; position: absolute; top: 50%; left: 0; margin-top: -165px;"></div>
		<div align="center" style="font-weight: bold;">
			<br />
			<!-- <div class="row">카테고리별 전문가 랭킹</div> -->

			<div class="row" style="margin-left: 4%; margin-bottom: 20px;">
				<div class="col">
					<label
						style="color: #fff; font-size: 25px; margin-bottom: 30px; margin-left: -300px;">${rank1[0].BIGCATE_STR }</label>
					<table class="table" style="color: #BDBDBD;">
						<tbody>
							<c:forEach var="r" items="${rank1 }" varStatus="stau">
								<tr>
									<th scope="row">${stau.count }위</th>
									<td>${r.TITLE }</td>
									<td style="border-right: 2px solid #ea1d5d;"><A href="#"
										style="color: #ea1d5d;">${r.WRITER} </A></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div class="col">
					<label
						style="color: #fff; font-size: 25px; margin-bottom: 30px; margin-left: -210px;">${rank2[0].BIGCATE_STR }</label>
					<table class="table" style="color: #BDBDBD; padding-right: -50px;">
						<tbody>
							<c:forEach var="r" items="${rank2 }" varStatus="stau">
								<tr>
									<th scope="row">${stau.count }위</th>
									<td>${r.TITLE }</td>
									<td style="border-right: 2px solid #ea1d5d;"><A href="#"
										style="color: #ea1d5d;">${r.WRITER} </A></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div class="col">
					<label
						style="color: #fff; font-size: 25px; margin-bottom: 30px; margin-left: -280px;">${rank3[0].BIGCATE_STR }</label>
					<table class="table" style="color: #BDBDBD;">
						<tbody>
							<c:forEach var="r" items="${rank3 }" varStatus="stau">
								<tr>
									<th scope="row">${stau.count }위</th>
									<td>${r.TITLE }</td>
									<td style="border-right: 2px solid #ea1d5d;"><A href="#"
										style="color: #ea1d5d;">${r.WRITER} </A></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
</section>

<!-- footer -->
<footer class="py-lg-4 py-md-3 py-sm-3 py-3 text-center">
	<div class="copy-agile-right">
		<p>2018-2019 재미나</p>
	</div>
</footer>
<!-- //footer -->

<script src='js/jquery-2.2.3.min.js'></script>
<script src="js/minicart.js"></script>
<script>
	toys.render();

	toys.cart.on('toys_checkout', function(evt) {
		var items, len, i;

		if (this.subtotal() > 0) {
			items = this.items();

			for (i = 0, len = items.length; i < len; i++) {
			}
		}
	});
</script>


