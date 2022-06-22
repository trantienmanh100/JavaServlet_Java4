<%@ page 
	session="true"
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

    <c:if test="${!empty sessionScope.error }">
   		<div class="alert alert-danger">
   			${sessionScope.error }
   		</div>
   		<c:remove var="error" scope="session"/>
   </c:if>
   
   
   <div class="container">

	<form action="${pageContext.request.contextPath }/admin/product/store" method="post" 
	 enctype="multipart/form-data"
	 class="col-8 offset-2" >

        
        <div class="form-group mt-3">      
               <label for="">Tên Sản phẩm</label>
                <input  
                type="text" name="ten" class="form-control" >
        </div>
		<div class="form-group mt-3">
		
			<label>Danh mục</label>
			<select  class="form-control" name="categoryId">
			<c:forEach items="${listCate}" var="obj">
					<option value="${obj.id}">${obj.ten}</option>
			</c:forEach>
			</select>
		</div>
	
        <div class="form-group mt-3">      
               <label for="">Số lượng</label>
                <input  
                type="number" name="soLuong" class="form-control" >
        </div>
        <div class="form-group mt-3">      
               <label for="">Đơn giá</label>
                <input  
                type="number" name="ten" class="form-control" >
        </div>
         <div class="form-group mt-3">      
               <label for="">Màu sắc </label>
                <input  
                type="text" name="mauSac" class="form-control" >
        </div>
        <div class="form-group mt-3">      
               <label for="">Kích thước </label>
                <input  
                type="text" name="kichThuoc" class="form-control" >
        </div>
        
        <div class="form-group mt-3">      
               <label for="">Ảnh</label>
                <input 
                type="file" class="form-control" name="img">
        </div>
      
            <button class=" btn btn-primary mt-4">Thêm</button>
	
    </form>
	
	</div>
	