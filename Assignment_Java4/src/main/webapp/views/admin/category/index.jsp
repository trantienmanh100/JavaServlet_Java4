<%@ page 
	session="true"
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

   <div class="section__content section__content--p30">
    <div class="container-fluid">
               <div class="row">
                 <div class="col-lg-9">
                    <div class="table-responsive table--no-card m-b-30">
                      <table class="table table-borderless table-striped table-earning">
                        <thead class="table-primary">
				   			<th>STT</th>
				   			<th>Tên</th>
				   			<th>Người tạo,chỉnh sửa</th>
				   			<th colspan="2" >Thao tác</th>
   						</thead>
   		<tbody>
   			<c:forEach var ="obj" items="${listCate}" varStatus="loop">
   				<tr>
   				   <td>${loop.count}</td>
   				   <td>${obj.ten}</td>
   				   <td>${obj.user.hoTen}</td>

   				   <td>
   				 		<a href="${pageContext.request.contextPath }/admin/category/edit?id=${obj.id }" class="btn btn-primary"> Cập nhật</a>
   				 		<a href="${pageContext.request.contextPath }/admin/category/delete?id=${obj.id }" class="btn btn-danger"> Xoá</a>
   				   </td>
   				   
   				   
   				</tr>
   			</c:forEach>
   		</tbody>               
                      </table>
                    </div>
                 </div>
                            
                </div>
    </div>
    <a href="${pageContext.request.contextPath }/admin/category/create" class="btn btn-success ms-5"> Thêm</a>
   
    </div>