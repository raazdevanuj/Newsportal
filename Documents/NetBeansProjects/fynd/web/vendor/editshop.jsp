
<%@page import="com.daos.ShopDao"%>
<%@page import="com.daos.VendorDao"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Dashboard - Vendor</title>
        <jsp:include page="base.jsp"></jsp:include>
            <script>
                function readURL(input, preview) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            preview.src = e.target.result;
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }

            </script>
        </head>
        <body class="nav-fixed">
        <%
            if (session.getAttribute("vendor") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
         <jsp:useBean class="com.beans.Shop" id="shop" scope="session"></jsp:useBean>
                 <% 
            int id=request.getParameter("id")==null?-1:Integer.parseInt(request.getParameter("id"));
              ShopDao sd=new ShopDao();
           if(shop!=null){
          
               shop=sd.getbyid(id);
           session.setAttribute("shop",shop);
          
           }
         //  System.out.println(shop.getShop_name());
           %>
                <jsp:setProperty name="shop" property="*"></jsp:setProperty>

            <div id="layoutSidenav">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="page-header pb-10 page-header-dark bg-gradient-primary-to-secondary">
                            <div class="container-fluid">
                                <div class="page-header-content">
                                    <h1 class="page-header-title">
                                        <div class="page-header-icon"><i data-feather="activity"></i></div>
                                        <span>Dashboard</span>
                                    </h1>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid mt-n10">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">All Shop Details</div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                     <div class="card-header card-header-primary">

                                                    <p class="card-category">Update Shop Details</p>
                                                </div>
                                                <%--<jsp:include page="container.jsp"></jsp:include>--%>  
                                                <form method="post" class="form">
                                                     <div class="card card-profile text-center">
                                                    <label class="bmd-label-floating">Shop 's Name</label>
                                                    <input type="text"  name="shop_name" class="form-control" value="${shop.shop_name}">
                                                    <label class="bmd-label-floating">Shop Location</label>
                                                    <input type="text" name="shop_locality" class="form-control" value="${shop.shop_locality}">


                                                    <label class="bmd-label-floating">Shop City</label>
                                                    <input type="text" name="shop_city" class="form-control" value="${shop.shop_city}">
                                                    <label class="bmd-label-floating">Shop Address</label>
                                                    <input type="text" name="shop_address" class="form-control" value="${shop.shop_address}">


                                                    <br>
                                                    <input type="submit" value="Next" name="sumit" id ="sumit" class="btn btn-primary btn-round"/>
                                                    
                                                </form>
                                                   </div>
                                            </div>
                                            <div class="col-md-6">
                                                <%if (request.getParameter("sumit") != null) {%>
                                                <div class="card-header card-header-primary">

                                                    <p class="card-category">Update your Shop Banner</p>
                                                </div>

                                                <form action="../ShopController?op=update" method="post" enctype="multipart/form-data">
                                                    <div class="card card-profile align-center">     

                                                        <center> <img src="../${shop.shop_Banner}" style="width:150px; height: 150px;" id="preview" class="form-control"/> <br/>
                                                            <input  type="file" name="shop_Banner" onchange="readURL(this, preview);" class="form-control btn btn-success"/></center> <br/>
                                                        <input type="submit" value="Update" class="btn btn-primary btn-round" name="submit"/>
                                                    </div>
                                                </form>
                                                <%

                                    }%>

                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="footer.jsp"></jsp:include>
                </div>
            </div>
        <jsp:include page="base1.jsp"></jsp:include>
    </body>
</html>
