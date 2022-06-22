<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


  <article class="row" >
          <div  class="col-md-9 col-md-offset-10 ">
        <div class="row p-4">
            <div class="card card-body">
              <div class="container ">
                <div class="row text-center ">
               

                  <c:forEach items="${ds}" var="obj">
                  <div class="col-4">
                    <div class="card" style="width: 19rem;">
                    
                      <div class="card-header"><h5>${ obj.ten }</h5></div>
                      <img src="images\java.jpg" class="card-img-top" style="height: 250px;">
                      <div class="card-body">
                       
                      </div>
                      <div class="card-footer"><button class="btn btn-success">Thêm</button>
                      <button class="btn btn-primary">Xem chi tiết</button>
                      </div>
                      
                    </div>
                    </div>
                    </c:forEach>
                    
                  </div>
                  
                  <br>
                  
                </div>
              </div>
            </div>
        </div>
        

   
    
      </article> 

</body>
</html>