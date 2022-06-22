<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

       <div class="product-area section">
            <div class="container">
				<div class="row">
					<div class="col-12">
						<div class="section-title">
							<h2>Trending Item</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="product-info">
							<div class="nav-main">
								<!-- Tab Nav -->
								<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active" href="?id=all" role="tab">All</a></li>
								
								<c:forEach items="${listCate}" var="obj"> 
								
									<li class="nav-item"><a class="nav-link "  href="?id=${obj.id }" role="tab">${obj.ten}</a></li>
								
								</c:forEach>
								</ul>
								<!--/ End Tab Nav -->
							</div>
							<div class="tab-content" id="myTabContent">
								<!-- Start Single Tab -->
								<div class="tab-pane fade show active" id="man" role="tabpanel">
									<div class="tab-single">
										<div class="row">
										<c:forEach items="${ds}" var="obj">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												
												<div class="single-product">
												
													<div class="product-img">
														<a href="product-details.html"> <!-- sản phẩm chi tiết -->
															<img class="default-img" height="380px" width="550px"  src="${pageContext.request.contextPath}/imgProduct/${obj.img}" alt="#">
															<img class="hover-img" width="550px" height="380px" src="${pageContext.request.contextPath}/imgProduct/${obj.img}" alt="#">
														</a>
														<div class="button-head">
															<div class="product-action">
																<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
																<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
																<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
															</div>
															<div class="product-action-2">
																<a title="Add to cart" href="${pageContext.request.contextPath }/user/sell/store?id=${obj.id }">Add to cart</a>
															</div>
														</div>
													</div>
													
													<div class="product-content">
														<h3><a href="product-details.html">${ obj.ten }</a></h3>
														<div class="product-price">
															<span>${ obj.donGia }</span>
														</div>
													</div>
												</div>
												
											</div>
											</c:forEach>

											

										</div>
									</div>
								</div>
								<!--/ End Single Tab -->
							</div>
						</div>
					</div>
				</div>
            </div>
    </div>   
         