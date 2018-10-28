<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- JAEMINA_HOME -->
	<link href="${pageContext.servletContext.contextPath }/css/home_css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath }/css/home_css/modern-business.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	
	<title>JAEMINA_HOME</title>
	
</head>

<body>

	<!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.html">JAEMINA</a>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<button type="button" class="btn btn-light">Sale Start</button>
					</li>
					<li class="nav-item">
						<button type="button" class="btn btn-secondary">Login</button>
					</li>
					<li class="nav-item">
						<button type="button" class="btn btn-primary">Free Join</button>
					</li>
				</ul>
			</div>
		</div>
    </nav>
	
    <header>
		<div id="carouselExampleIndicators" class="carousel" data-ride="carousel">
			<div class="carousel-inner" role="listbox">
		
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active" style="background-image: url('${pageContext.servletContext.contextPath }/images/home_images/2.jpeg'); background-size:cover;">
					<div class="carousel-caption d-none d-md-block">
						<h3>First Photo</h3>
						<p>This is a description for the first photo.</p>
					</div>	
				</div>
			 
				<div id="r" class="row">
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search for..." aria-label="Search for...">
							<span class="input-group-btn">
								<button class="btn btn-secondary" type="button">Go!</button>
							</span>	
						</div>
					</div>
				</div>
			</div>
		</div>
    </header>

    <!-- Page Content -->
    <div class="container">
	  
		<div id="row_1" class="row">
			<div class="col-lg-3">
				<img class="rounded-circle" src="${pageContext.servletContext.contextPath }/images/home_images/web.svg" alt="Generic placeholder image" width="140" height="140">
				<h5>디자인</h5>
				<p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
			</div><!-- /.col-lg-4 -->
			
			<div class="col-lg-3	">
				<img class="rounded-circle" src="${pageContext.servletContext.contextPath }/images/home_images/ux.svg" alt="Generic placeholder image" width="140" height="140">
				<h5>IT·프로그래밍</h5>
				<p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
			</div><!-- /.col-lg-4 -->
			
			<div class="col-lg-3">
				<img class="rounded-circle" src="${pageContext.servletContext.contextPath }/images/home_images/motion.svg" alt="Generic placeholder image" width="140" height="140">
				<h5>콘텐츠 제작</h5>
				<p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
			</div><!-- /.col-lg-4 -->
			
			<div class="col-lg-3">
				<img class="rounded-circle" src="${pageContext.servletContext.contextPath }/images/home_images/mobile-ui.svg" alt="Generic placeholder image" width="140" height="140">
				<h5>마케팅</h5>
				<p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
			</div><!-- /.col-lg-4 -->
		</div><!-- /.row -->

		<!-- Portfolio Section -->
		<h3>마케팅 카테고리</h3>
		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="${pageContext.servletContext.contextPath }/images/home_images/post1.png"  alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project One</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Two</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Three</a>
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		<h3>디자인 카테고리</h3>
		<div class="row">	
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Four</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Five</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<div class="card-title">
							<a href="#">Project Six</a>
						</div>
					</div>
				</div>
			</div>
		</div> 
      <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
		</div>
    </footer>

</body>
  
</html>