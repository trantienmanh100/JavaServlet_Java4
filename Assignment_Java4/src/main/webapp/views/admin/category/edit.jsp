<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form action="${pageContext.request.contextPath }/admin/category/update?id=${id }" method="post">
	<div>
	<label>Tên danh mục</label>
	<input type="text"  class="form-control" name="ten" value="${cate.ten }">
	</div>
	<div>
	<label>Người chỉnh sửa</label>
	<input type="text" name="user" class="form-control " value="${user.id }">
	</div>
	
 <button class="btn btn-success mt-3">Sửa</button>
	</form>
    