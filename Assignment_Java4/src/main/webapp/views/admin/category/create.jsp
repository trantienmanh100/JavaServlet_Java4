
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

	<form action="${pageContext.request.contextPath }/admin/category/store" method="post"  class="col-8 offset-2" >

        
        <div class="form-group mt-3">      
               <label for="">Tên danh mục</label>
                <input  
                type="text" name="tenDM" class="form-control" >
        </div>
      
            <button class=" btn btn-primary mt-4">Thêm</button>
	
    </form>
	
	</div>