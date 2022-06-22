<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
	<form action="${pageContext.request.contextPath }/admin/users/update?id=${user.id }" method="post"
	enctype="multipart/form-data">
	<div>
	<label>Họ tên</label>
	<input type="text"  class="form-control" name="hoTen" value="${user.hoTen }">
	</div>
	<div>
	<label>Email</label>
	<input type="email" name="email" class="form-control " value="${user.email }">
	</div>
	<div>
	<label>DiaChi</label>
	<input type="text" name="diaChi" class="form-control" value="${user.diaChi }">
	</div>
	<div>
	<label>Password</label>
	<input type="password" name="password" class="form-control" value="${user.password }">
	</div>
	<div>
	<label>SDT</label>
	<input type="text" name="sdt" class="form-control" value="${user.sdt}">
	</div>
	<div>
	Gioi tinh : <input type="radio" name ="gioiTinh" value="0"
	${user.gioiTinh == 0 ? "checked" : ""}
	> Nam
 <input type="radio" name ="gioiTinh" value="1" ${user.gioiTinh == 1 ? "checked" : ""}> Nu <br> <br>
	</div>
	<div class="form-group mt-3">      
               <label for="">Ảnh</label>
                <input 
                type="file" class="form-control" name="avatar" value="${user.avatar }">
        </div>
	
 <button>Sửa</button>
	</form>
    