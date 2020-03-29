
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
         <jsp:useBean class="com.beans.Shop" id="shopee" scope="session"></jsp:useBean>
                 <% 
            int id=request.getParameter("id")==null?-1:Integer.parseInt(request.getParameter("id"));
              ShopDao sd=new ShopDao();
           if(shopee!=null){
          
               shopee=sd.getbyid(id);
           session.setAttribute("shopee",shopee);
          
           }
         //  System.out.println(shop.getShop_name());
           %>
                <jsp:setProperty name="shopee" property="*"></jsp:setProperty>

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
                                                <form action="../ShopController?op=address"  method="post" class="form">
                                                     <div class="card card-profile text-center">
                                                    <label class="bmd-label-floating">Shop 's Name</label>
                                                    <input type="text"  name="shop_name" class="form-control" value="${shopee.shop_name}">
                                                    <label class="bmd-label-floating">Shop Location</label>
                                                    <input type="text" name="shop_locality" class="form-control" value="${shopee.shop_locality}">


                                                    <label class="bmd-label-floating">Shop City</label>
                                                    <input type="text" name="shop_city" class="form-control" value="${shopee.shop_city}">
                                                    <label class="bmd-label-floating">Shop Address</label>
                                                    <input type="text" name="shop_address" class="form-control" value="${shopee.shop_address}">


                                                    <br>
                                                    <input type="submit" value="Submit" name="submit" id ="submit" class="btn btn-primary"/>
                                                    
                                                </form>
                                                   </div>
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
