<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	<form action="${pageContext.request.contextPath }/admin/product/update?id=${product.id }" method="post" enctype="multipart/form-data">
	
	<div class="form-group mt-3">      
               <label for="">Tên Sản phẩm</label>
                <input  
                type="text" name="ten" class="form-control" value="${product.ten }" >
        </div>
		<div class="form-group mt-3">
		
			<label>Danh mục</label>
			<select  class="form-control" name="categoryId">
			<option value="${product.category.id}">${product.category.ten}</option>
			<c:forEach items="${listCate}" var="obj">
				<c:if test="${obj.ten != product.category.ten}">
					<option value="${obj.id}">${obj.ten}</option>
				</c:if>
			</c:forEach>
			</select>
		</div>
	
        <div class="form-group mt-3">      
               <label for="">Số lượng</label>
                <input  
                type="number" name="soLuong" class="form-control" value="${product.soLuong}" >
        </div>
        <div class="form-group mt-3">      
               <label for="">Đơn giá</label>
                <input  
                type="number" name="donGia" class="form-control"  value="${product.donGia }">
        </div>
         <div class="form-group mt-3">      
               <label for="">Màu sắc </label>
                <input  
                type="text" name="mauSac" class="form-control" value="${product.mauSac }" >
        </div>
        <div class="form-group mt-3">      
               <label for="">Kích thước </label>
                <input  
                type="text" name="kichThuoc" class="form-control" value="${product.kichThuoc }" >
        </div>
        
        <div class="form-group mt-3">      
               <label for="">Ảnh</label>
                <input 
                type="file" class="form-control" name="img" value="${product.img }">
        </div>
      
            <button class=" btn btn-primary mt-4">Sửa</button>
	</form>
    