<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Meta Tag -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name='copyright' content=''>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Title Tag  -->
    <title>RoPer Shop</title>
	<!-- Favicon -->
	<link rel="icon" type="image" href="${pageContext.request.contextPath }/images/favicon.png">
	<!-- Web Font -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
	
	<!-- StyleSheet -->
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
	<!-- Magnific Popup -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.min.css">
	<!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.css">
	<!-- Fancybox -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery.fancybox.min.css">
	<!-- Themify Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/themify-icons.css">
	<!-- Nice Select CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/niceselect.css">
	<!-- Animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css">
	<!-- Flex Slider CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/flex-slider.min.css">
	<!-- Owl Carousel -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl-carousel.css">
	<!-- Slicknav -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/slicknav.min.css">
	
	<!-- Eshop StyleSheet -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/responsive.css">
</head>
<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	<!-- End Preloader -->
	
	
		
		<!-- Header -->
		<header class="header shop">
			<!-- Topbar -->
			<div class="topbar">
				<div class="container">
					<div class="row">
						<div class="col-lg-5 col-md-12 col-12">
							<!-- Top Left -->
							<div class="top-left">
								<ul class="list-main">
									<li><i class="ti-headphone-alt"></i> 0348353398</li>
									<li><i class="ti-email"></i> RoPer@gmail.com</li>
								</ul>
							</div>
							<!--/ End Top Left -->
						</div>
						<div class="col-lg-7 col-md-12 col-12">
							<!-- Top Right -->
							<div class="right-content">
								<ul class="list-main">
									<li><i class="ti-location-pin"></i> Địa chỉ</li>
									<li><i class="ti-alarm-clock"></i> <a href="/Assignment_Java4/user/bill/userIndex">Đơn hàng</a></li>
									<li><i class="ti-user"></i> <a href="#">Tài Khoản</a></li>
									<li><i class="ti-power-off"></i><a href="/Assignment_Java4/logout">Logout</a></li>
								</ul>
							</div>
							<!-- End Top Right -->
						</div>
					</div>
				</div>
			</div>
			<!-- End Topbar -->
			<div class="middle-inner">
				<div class="container">
					<div class="row">
						<div class="col-lg-2 col-md-2 col-12">
							<!-- Logo -->
							<div class="logo">
								<a href="index.html"><img src="${pageContext.request.contextPath }/images/logo.png" alt="logo"></a>
							</div>
							<!--/ End Logo -->
							<!-- Search Form -->
							<div class="search-top">
								<div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
								<!-- Search Form -->
								<div class="search-top">
									<form class="search-form">
										<input type="text" placeholder="Search here..." name="search">
										<button value="search" type="submit"><i class="ti-search"></i></button>
									</form>
								</div>
								<!--/ End Search Form -->
							</div>
							<!--/ End Search Form -->
							<div class="mobile-nav"></div>
						</div>
						<div class="col-lg-8 col-md-7 col-12">
							<div class="search-bar-top">
								<div class="search-bar">
									<select>
										<option selected="selected">All Category</option>
										<option>watch</option>
										<option>mobile</option>
										<option>kid’s item</option>
									</select>
									<form>
										<input name="search" placeholder="Search Products Here....." type="search">
										<button class="btnn"><i class="ti-search"></i></button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-12">
							<div class="right-bar">
								<!-- Search Form -->
								<div class="sinlge-bar">
									<a href="#" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
								</div>
								<div class="sinlge-bar">
									<a href="#" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
								</div>
								<div class="sinlge-bar shopping">
									<a href="${pageContext.request.contextPath }/user/sell/show" class="single-icon"><i class="ti-bag"></i> <span class="total-count">${listCart.size() }</span></a>
									<!-- Shopping Item -->
									<div class="shopping-item">
										<div class="dropdown-cart-header">
											<span>${listCart.size() } Items</span>
											<a href="${pageContext.request.contextPath }/user/sell/index">View Cart</a>
									</div>
										<ul class="shopping-list">
											<li>
												<a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
												<a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
												<h4><a href="#">Woman Ring</a></h4>
												<p class="quantity">1x - <span class="amount">$99.00</span></p>
											</li>
											<li>
												<a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
												<a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
												<h4><a href="#">Woman Necklace</a></h4>
												<p class="quantity">1x - <span class="amount">$35.00</span></p>
											</li>
										</ul>
										<div class="bottom">
											<div class="total">
												<span>Total</span>
												<span class="total-amount">$134.00</span>
											</div>
											<a href="checkout.html" class="btn animate">Checkout</a>
										</div>
									</div>
									<!--/ End Shopping Item -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Header Inner -->
			<div class="header-inner">
				<div class="container">
					<div class="cat-nav-head">
						<div class="row">
							<div class="col-12">
								<div class="menu-area">
									<!-- Main Menu -->
									<nav class="navbar navbar-expand-lg">
										<div class="navbar-collapse">	
											<div class="nav-inner">	
												<ul class="nav main-menu menu navbar-nav">
													<li class="active"><a href="/Assignment_Java4/user/sell/index">Trang chủ</a></li>
													<li><a href="#">Sản phẩm</a></li>												
													<li><a href="#">Dịch vụ</a></li>
													<li><a href="#">Shop<i class="ti-angle-down"></i><span class="new">New</span></a>
														<ul class="dropdown">
															<li><a href="cart.html">Cart</a></li>
															<li><a href="checkout.html">Checkout</a></li>
														</ul>
													</li>
													<li><a href="#">Pages</a></li>									
													<li><a href="#">Blog<i class="ti-angle-down"></i></a>
														<ul class="dropdown">
															<li><a href="blog-single-sidebar.html">Blog Single Sidebar</a></li>
														</ul>
													</li>
													<li><a href="contact.html">Contact Us</a></li>
												</ul>
											</div>
										</div>
									</nav>
									<!--/ End Main Menu -->	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Header Inner -->
		</header>
		<!--/ End Header -->
	
	
  <jsp:include page="${view}"></jsp:include>
	
	
	
	<!-- Start Footer Area -->
	<footer class="footer">
		<!-- Footer Top -->
		<div class="footer-top section">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer about">
							<div class="logo">
								<a href="index.html"><img src="${pageContext.request.contextPath }/images/logo2.png" alt="#"></a>
							</div>
							<p class="text">Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue,  magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
							<p class="call">Got Question? Call us 24/7<span><a href="tel:123456789">0348353398</a></span></p>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-2 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer links">
							<h4>Information</h4>
							<ul>
								<li><a href="#">About Us</a></li>
								<li><a href="#">Faq</a></li>
								<li><a href="#">Terms & Conditions</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Help</a></li>
							</ul>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-2 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer links">
							<h4>Customer Service</h4>
							<ul>
								<li><a href="#">Payment Methods</a></li>
								<li><a href="#">Money-back</a></li>
								<li><a href="#">Returns</a></li>
								<li><a href="#">Shipping</a></li>
								<li><a href="#">Privacy Policy</a></li>
							</ul>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer social">
							<h4>Get In Tuch</h4>
							<!-- Single Widget -->
							<div class="contact">
								<ul>
									<li>NO. 342 - London Oxford Street.</li>
									<li>012 United Kingdom.</li>
									<li>info@eshop.com</li>
									<li>+032 3456 7890</li>
								</ul>
							</div>
							<!-- End Single Widget -->
							<ul>
								<li><a href="#"><i class="ti-facebook"></i></a></li>
								<li><a href="#"><i class="ti-twitter"></i></a></li>
								<li><a href="#"><i class="ti-flickr"></i></a></li>
								<li><a href="#"><i class="ti-instagram"></i></a></li>
							</ul>
						</div>
						<!-- End Single Widget -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Top -->
		<div class="copyright">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="left">
								<p><a href="http://www.facebook.com" target="_blank">Wpthemesgrid</a>  -  All Rights Reserved.</p>
							</div>
						</div>
						<div class="col-lg-6 col-12">
							<div class="right">
								<img src="${pageContext.request.contextPath }/images/payments.png" alt="#">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- /End Footer Area -->
	
	
 
	<!-- Jquery -->
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-migrate-3.0.0.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script>
	<!-- Popper JS -->
	<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<!-- Color JS -->
	<script src="${pageContext.request.contextPath }/js/colors.js"></script>
	<!-- Slicknav JS -->
	<script src="${pageContext.request.contextPath }/js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="${pageContext.request.contextPath }/js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script src="${pageContext.request.contextPath }/js/magnific-popup.js"></script>
	<!-- Fancybox JS -->
	<script src="${pageContext.request.contextPath }/js/facnybox.min.js"></script>
	<!-- Waypoints JS -->
	<script src="${pageContext.request.contextPath }/js/waypoints.min.js"></script>
	<!-- Jquery Counterup JS -->
	<script src="${pageContext.request.contextPath }/js/jquery-counterup.min.js"></script>
	<!-- Countdown JS -->
	<script src="${pageContext.request.contextPath }/js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<script src="${pageContext.request.contextPath }/js/nicesellect.js"></script>
	<!-- Ytplayer JS -->
	<script src="${pageContext.request.contextPath }/js/ytplayer.min.js"></script>
	<!-- Flex Slider JS -->
	<script src="${pageContext.request.contextPath }/js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script src="${pageContext.request.contextPath }/js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script src="${pageContext.request.contextPath }/js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="${pageContext.request.contextPath }/js/easing.js"></script>
	<!-- Google Map JS -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnhgNBg6jrSuqhTeKKEFDWI0_5fZLx0vM"></script>	
	<script src="${pageContext.request.contextPath }/js/gmap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/map-script.js"></script>
	<!-- Active JS -->
	<script src="${pageContext.request.contextPath }/js/active.js"></script>
</body>


</html>