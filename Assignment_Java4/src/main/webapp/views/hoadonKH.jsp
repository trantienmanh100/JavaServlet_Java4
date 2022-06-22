<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
   <h1>Hellooo</h1>
   <ul class="nav">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/user/bill/status?status=0">Đơn hàng chờ xác nhận</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath}/user/bill/status?status=1">Đơn hàng đang giao</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath }/user/bill/status?status=2">Đơn hàng đã giao</a>
  </li>
  <li class="nav-item">
    <a class="nav-link "href="${pageContext.request.contextPath }/user/bill/status?status=4">Đơn huỷ</a>
  </li>
</ul>

		<div class="container-fluid">
			<div class="pt-5">
			
				
			</div>
		</div>

   