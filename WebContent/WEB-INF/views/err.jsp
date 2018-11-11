<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }"/>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html style="background-color: #66CC66;">
<head>
<title>에러 페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="${path }/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<script
		src='//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<script src="//m.servedby-buysellads.com/monetization.js"
		type="text/javascript"></script>
	<script>
		(function() {
			if (typeof _bsa !== 'undefined' && _bsa) {
				// format, zoneKey, segment:value, options
				_bsa.init('flexbar', 'CKYI627U', 'placement:w3layoutscom');
			}
		})();
	</script>
	<script>
		(function() {
			if (typeof _bsa !== 'undefined' && _bsa) {
				// format, zoneKey, segment:value, options
				_bsa.init('fancybar', 'CKYDL2JN', 'placement:demo');
			}
		})();
	</script>
	<script>
		(function() {
			if (typeof _bsa !== 'undefined' && _bsa) {
				// format, zoneKey, segment:value, options
				_bsa.init('stickybox', 'CKYI653J', 'placement:w3layoutscom');
			}
		})();
	</script>
	<script>
		(function(v, d, o, ai) {
			ai = d.createElement("script");
			ai.defer = true;
			ai.async = true;
			ai.src = v.location.protocol + o;
			d.head.appendChild(ai);
		})(window, document, "//vdo.ai/core/w3layouts/vdo.ai.js");
	</script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-125810435-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-125810435-1');
	</script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');
		ga('create', 'UA-30027142-1', 'w3layouts.com');
		ga('send', 'pageview');
	</script>
<body>
	<!---728x90--->

	<!-----start-wrap--------->
	<div class="wrap">
		<!-----start-content--------->
		<div class="content">
			<!-----start-logo--------->
			<div class="logo">
				<h1>
					<a href="#"><img
						src="${path}/images/images/logo.png" /></a>
				</h1>
				<span><img
					src="${path}/images/images/signal.png" />페이지가
					삭제되었거나 존재하지 않는 페이지입니다.</span>
			</div>
			<!-----end-logo--------->
			<!---728x90--->

			<!-----start-search-bar-section--------->
			<div class="buttom">
				<div class="seach_bar">
					<p>
						홈으로 이동하시려면 <span><a href="${path}/index.do">home</a></span>을 눌러주세요.
					</p>
					<!-----start-sear-box--------->
					<form action="${path}/board/searchList.do?currentPage=1" method="post">
						<div class="row">
							<div class="col">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..." aria-label="Search for..."
										id="searchKey" name="searchKey" required autofocus> <span
										class="input-group-btn">
										<button class="btn btn-secondary" type="submit" >Go!</button>
									</span>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-----end-sear-bar--------->
		</div>
		<!---728x90--->

		<!----copy-right-------------->
		<p class="copy_right">
			&#169; 2018-2019 재미나<a href="http://w3layouts.com" target="_blank">&nbsp;</a>
		</p>
	</div>

	<!---------end-wrap---------->
</body>
</html>