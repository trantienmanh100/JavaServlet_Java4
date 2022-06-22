<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:if test="${empty listCart}">
   	<p class="alert alert-warning">Không có bản ghi</p>
</c:if>

	
    <div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Shopping Summery -->
					<table class="table shopping-summery">
						<thead>
							<tr class="main-hading">
								<th>PRODUCT</th>
								<th>NAME</th>
								<th class="text-center">UNIT PRICE</th>
								<th class="text-center">QUANTITY</th>
								<th class="text-center">TOTAL</th> 
								<th class="text-center"><i class="ti-trash remove-icon"></i></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var ="obj" items="${listCart}">
							<tr>
								<td class="image" data-title="No"><img src="${pageContext.request.contextPath}/imgProduct/${obj.product.img}" alt="#"></td>
								<td class="product-des" data-title="Description">
									<p class="product-name"><a href="#">${obj.product.ten}</a></p>
									<p class="product-des">Maboriosam in a tonto nesciung eget  distingy magndapibus.</p>
								</td>
								<td class="price" data-title="Price"><span>${obj.product.donGia }</span></td>
								<td class="qty" data-title="Qty"><!-- Input Order -->
									<div class="input-group">
										<div class="button minus">
											<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=${obj.id } ">
												<i class="ti-minus"></i>
											</a>
										</div>
										<input type="text"  name="soLuong" class="input-number" readonly="readonly"  data-min="1" data-max="100" value="${obj.soLuong }">
										<div class="button plus">
											<a class="btn btn-sm btn-incre"  href="quantity-inc-dec?action=inc&id=${obj.id } " >
												<i class="ti-plus"></i>
											</a>
										</div>
									</div>
									<!--/ End Input Order -->
								</td>
								<td class="total-amount" data-title="Total"><span>${obj.soLuong*obj.product.donGia }</span></td>
								<td class="action" data-title="Remove"><a href="#"><i class="ti-trash remove-icon"></i></a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<!-- Total Amount -->
					<div class="total-amount">
						<div class="row">
							<div class="col-lg-8 col-md-5 col-12">
								<div class="left">
									<div class="coupon">
										<form action="#" target="_blank">
											<input name="Coupon" placeholder="Enter Your Coupon">
											<button class="btn">Apply</button>
										</form>
									</div>
									<div class="checkbox">
										<label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox"> Shipping (+10$)</label>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-7 col-12">
								<div class="right">
									<ul>
										<li>Cart Subtotal<span>${sessionScope.total }</span></li>
										<li>Shipping<span>Free</span></li>
										
										<li class="last">You Pay<span>${sessionScope.total }</span></li>
									</ul>
									<div class="button5">
										 <form action="${pageContext.request.contextPath }/user/bill/create" method="post">
                						<button  class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Thanh toán</button>
                						</form>
          
										<a href="${pageContext.request.contextPath }/user/sell/index" class="btn">Continue shopping</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--/ End Total Amount -->
				</div>
			</div>
		</div>
	</div>