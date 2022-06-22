<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
   
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

	<div class="card-body">
       <div class="table-responesive">
         
          <table class="table">
		  <thead>
		   <tr>
		    <th>Mã hóa đơn </th>
		    <th>Tên người mua</th>
		    <th>Tổng tiền</th>
		    
		    <th>Trạng thái đơn hàng</th>
		    <th colspan="2">Thao tác</th>
		   </tr>
		
		  </thead>
		  
		  <tbody>
		  <c:forEach var="obj" items="${listHD}">
		   <tr>
		    <td>${obj.id }</td>
		    <td>${obj.user.hoTen}</td>
		    <td>${obj.tongTien }</td>
		    
		    <td>
		    	<c:choose>
		         <c:when test="${obj.status ==0 }">Chờ xác nhận</c:when>
		         <c:when test="${obj.status ==1 }">Đang giao</c:when>
		         <c:when test="${obj.status ==2 }">Đã giao</c:when>
		       </c:choose>
		    </td>
			<td>
			<a class="btn" href="/Assignment_Java4/">Xem chi tiết</a>
			</td>
		    <td><a class="btn" href="/Assignment_Java4/user/bill/update?id=${obj.id}&status=4">Hủy</a></td>
		   </tr> 
		  </c:forEach> 
 
		  </tbody>
       </table>
          
        
       
       </div>
     </div>

   