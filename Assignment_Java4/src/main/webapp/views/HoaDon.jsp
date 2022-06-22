<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
		         <c:when test="${obj.status ==0 }">Chưa xác nhận</c:when>
		         <c:when test="${obj.status ==1 }">Đang giao</c:when>
		         <c:when test="${obj.status ==2 }">Đã giao</c:when>
		       </c:choose>
		    
		    </td>
		    
		    <td>
		       <a class="btn btn-primary" href="/Assignment_Java4/user/bill/update?id=${obj.id}">
		       <c:choose>
		       <c:when test="${obj.status ==0 }">Xác nhận</c:when>
		         <c:when test="${obj.status ==1 }">Đã giao</c:when>
		         <c:when test="${obj.status ==2 }">Hoàn thành</c:when>
		       </c:choose>
		       </a>
		    </td>
		    <td><a class="btn btn-danger" href="/Assignment_Java4/user/bill/update?id=${obj.id}&status=4">Hủy</a></td>
		   </tr> 
		  </c:forEach> 
 
		  </tbody>
       </table>
          
        
       
       </div>
     </div>