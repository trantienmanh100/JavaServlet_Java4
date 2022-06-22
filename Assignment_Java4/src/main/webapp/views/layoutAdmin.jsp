<%@ page language="java" 
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tiến Mạnh</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
        <header class="row bg-primary ms-1" ><!-- ms margin-left-->
            <div class="shopping-mall pt-4 col-7">
                <h1>ONLINE SHOPPING MALL</h1>
                <h5>The center point of the professionnal programing</h5>
            </div>
            
           
        </header>
        
      <!-- navbar -->
        <nav class=" row navbar navbar-expand-lg navbar-dark bg-dark ms-1">
            <div class="container-fluid">
              <!-- <a class="navbar-brand" href="#">Trang chủ</a> -->
             
              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/Assignment_Java4/admin/users/index"><i class="fas fa-home"></i> Quản lý User</a>
                      </li>
                  <li class="nav-item">
                    <a class="nav-link " aria-current="page" href="/Assignment_Java4/admin/product/index"><i class="fas fa-list"></i> Quản lý Sản phẩm</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/Assignment_Java4/admin/category/index"><i class="fas fa-phone"></i> Quản lý danh mục</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/Assignment_Java4/user/bill/index"> <i class="fas fa-envelope-square"></i>  Quản lý đơn hàng</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/Assignment_Java4/logout"><i class="fas fa-question"></i> Đăng xuất</a>
                  </li>
      
                </ul>
              </div>

            </div>
            
          </nav>
        <div class="row ms-1 mt-5">
            <!-- <div class="col-2 bg-secondary"></div> -->
           <div class="col-12">
          <jsp:include page="${view }"></jsp:include> 
           </div>
            
          </div>
          
    </div>
	
	<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	
</body>
</html>