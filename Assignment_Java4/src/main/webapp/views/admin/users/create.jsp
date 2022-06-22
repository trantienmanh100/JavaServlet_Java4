<%@ page 
	session="true"
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/theme.css">

    <c:if test="${!empty sessionScope.error }">
   		<div class="alert alert-danger">
   			${sessionScope.error }
   		</div>
   		<c:remove var="error" scope="session"/>
   </c:if>
   
   
   <div class="container">

	<form action="${pageContext.request.contextPath }/admin/users/store" method="post"  class="col-8 offset-2" enctype="multipart/form-data">

        <div>
        <label>Email</label>
		<input type="email" name="email" class="form-control">
		</div>
        <div class="form-group mt-3">      
               <label for="">Họ và tên</label>
                <input placeholder="Nhập họ và tên"
                type="text" class="form-control" name="hoTen">
        </div>
        
        <div class="form-group mt-3">      
               <label for="">Địa chỉ</label>
                <input placeholder="Nhập địa chỉ"
                type="text" class="form-control" name="diaChi">
        </div>
        <div class="form-group mt-3">
	    <label>Password</label>
	    <input type="password" name="password" class="form-control">
	    </div>
         <div class="form-group mt-3">      
               <label for="">SDT</label>
                <input placeholder="Nhập SDT"
                type="text" class="form-control" name="sdt">
        </div>
         <div class="form-group mt-3">      
               <label for="">Ảnh</label>
                <input 
                type="file" class="form-control" name="avatar">
        </div>
        
    <div class="form-group mt-1 ">
            <label class="bg-white indigo-text rounded px-2" for=""> <i class="fas fa-transgender"></i>Giới tính:</label>
    <div>
	 <input type="radio" name ="gioiTinh" value="0"> Nam
 	 <input type="radio" name ="gioiTinh" value="1"> Nữ <br> <br>
	</div>
	</div>
            <button class=" btn btn-primary">Thêm</button>
	
    </form>
	
	</div>

	<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
   
   