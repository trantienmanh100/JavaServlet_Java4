<%@ page 
	session="true"
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	 <div class="section__content section__content--p30">
    <div class="container-fluid">
               <div class="row">
                 <div class="col">
                    <div class="table-responsive ">
                      <table class="table table-borderless table-striped table-earning" >
                        <thead class="table-primary">
				   			<th>STT</th>
				   			<th>Tên</th>
				   			<th>CategoryID</th>
				   			<th>SoLuong</th>
				   			<th>DonGia</th>
				   			<th>Màu Sắc</th>
				   			<th>Kích thước</th>
				   			<th>Hình ảnh</th>
				   			<th colspan="2" >Thao tác</th>
   						</thead>
   		<tbody>
   			<c:forEach var ="obj" items="${listPro}" varStatus="loop">
   				<tr>
   				   <td>${loop.count}</td>
   				   <td>${obj.ten}</td>
   				   <td>${obj.category.id}</td>
   				   <td>${obj.soLuong}</td>
   				   <td>${obj.donGia}</td>
   				   <td>${obj.mauSac}</td>
   				   <td>${obj.kichThuoc}</td>
   				   <td><img alt="" width="100px" height="100px" src="${pageContext.request.contextPath}/imgProduct/${obj.img}"></td>

   				   <td>
   				   		
   				 		<a href="${pageContext.request.contextPath }/admin/product/edit?id=${obj.id }" class="btn btn-primary"> Cập nhật</a>
   				 		<a href="${pageContext.request.contextPath }/admin/product/delete?id=${obj.id }" class="btn btn-danger"> Xoá</a>
   				 		<%-- <button class="btn btn-danger" data-bs-toggle="modal"
									data-bs-target="#delete${obj.id }">Delete</button>
									<div class="modal fade" id="delete${obj.id }" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="delete${obj.id }">Xác nhận</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<h5>Bạn có muốn xóa ?</h5>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Đóng</button>
												<a type="button" class="btn btn-primary"
													href="${pageContext.request.contextPath }/admin/product/delete?id=${obj.id }">Xác nhận</a>
											</div>
										</div>
									</div>
								</div> --%>
   				   </td>
   				   
   				   
   				</tr>
   			</c:forEach>
   		</tbody>               
                      </table>
                    </div>
                 </div>
                            
                </div>
    </div>
    <a href="${pageContext.request.contextPath }/admin/product/create" class="btn btn-success ms-5"> Thêm</a>
   
    </div>