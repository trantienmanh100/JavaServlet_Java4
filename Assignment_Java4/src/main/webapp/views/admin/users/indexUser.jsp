<%@ page 
	session="true"
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/theme.css">

   <c:if test="${empty list }">
   	<p class="alert alert-warning">Không có bản ghi</p>
   </c:if>
   <c:if test="${!empty list }">
   
   <c:if test="${!empty sessionScope.error }">
   		<div class="alert alert-danger">
   			${sessionScope.error }
   		</div>
   		<c:remove var="error" scope="session"/>
   </c:if>
   
   <c:if test="${!empty sessionScope.message }">
   		<div class="alert alert-success">
   				${sessionScope.message }
   		</div>
   		<c:remove var="message" scope="session"/>
   </c:if>
   <div class="section__content section__content--p30">
    <div class="container-fluid">
               <div class="row">
                 <div class="col">
                    <div class="table-responsive table--no-card m-b-30">
                      <table class="table table-borderless table-striped table-earning">
                        <thead class="table-primary">
   			<th>Họ tên</th>
   			<th>SDT</th>
   			<th>Email</th>
   			<th>Giới tính</th>
   			<th>avatar</th>
   			<th colspan="2" >Thao tác</th>
   		</thead>
   		<tbody>
   			<c:forEach var ="obj" items="${list}" >
   				<tr>
   				   <td>${obj.hoTen }</td>
   				   <td>${obj.sdt }</td>
   				   <td>${obj.email }</td>
   				   <td>
						<c:choose>
							<c:when test="${obj.gioiTinh ==0 }">Nam</c:when>
							<c:when test="${obj.gioiTinh ==1 }">Nữ</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
					
   				   <td><img alt="" width="100px" height="100px" src="${pageContext.request.contextPath }/files/${obj.avatar }"> </td>
   				   <td>
   				 		<a href="${pageContext.request.contextPath }/admin/users/edit?id=${obj.id }" class="btn btn-primary"> Cập nhật</a>
   				 		<a href="${pageContext.request.contextPath }/admin/users/delete?id=${obj.id }" class="btn btn-danger"> Delete</a>
   				 					<%-- <button class="btn btn-danger" data-bs-toggle="modal"
									data-bs-target="#exampleModal${obj.id }">Delete</button> --%> <!-- Button trigger modal -->
								<!-- Modal -->
								<div class="modal fade" id="exampleModal${obj.id }"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Xác nhận</h5>
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
													href="${pageContext.request.contextPath }/admin/users/delete?id=${obj.id }">Xác nhận</a>
											</div>
										</div>
									</div>
								</div>
   				   </td>
   				   
   				   
   				</tr>
   			</c:forEach>
   		</tbody>               
                      </table>
                    </div>
                 </div>
                            
                </div>
    </div>
    <a href="${pageContext.request.contextPath }/admin/users/create" class="btn btn-success ms-5"> Thêm</a>
   
    </div>
   
   
   </c:if>
   
   
   <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
   
   