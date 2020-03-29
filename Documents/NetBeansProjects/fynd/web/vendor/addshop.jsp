
<%@page import="com.beans.Vendor"%>
<%@page import="java.util.Base64"%>
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
        <jsp:useBean class="com.beans.Shop" id="shope" scope="session"></jsp:useBean>
            <script type="text/javascript">
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
             Vendor vf = (Vendor) session.getAttribute("vendor");
          int id = vf.getVendor_id();
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:setProperty name="shope" property="*"></jsp:setProperty>

            <div id="layoutSidenav">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="page-header pb-10 page-header-dark bg-gradient-primary-to-secondary">
                            <div class="container-fluid">
                                <div class="page-header-content">
                                    <h1 class="page-header-title">
                                        <div class="page-header-icon"><i data-feather="activity"></i></div>
                                        <span>SHOP</span>
                                    </h1>

                                </div>
                            </div>
                        </div>
                        <div class="container-fluid mt-n10">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <!--<div class="card-header">Shop Details</div>-->
                                        <div class="card-body">
                                            <div class="row">

                                                <div class="col-md-8">
                                                     <div class="card">     
                                                            <div class="card-header bg-primary text-white"> Shop Details</div>
                                                            
                                                    <form  method="post"> 
                                                        <center>
                                                            <h2  class="text-light bg-gradient-primary-to-secondary">Add Shop Details </h2>
                                                            <table class="table" > 
                                                                <!--pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"-->
                                                                <tr>
                                                                    <td>Enter Shop Name </td>
                                                                    <td><input type="text" name="shop_name"   required="required" class="form-control" value="${shope.shop_name}" /></td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                    <td>Enter Shop City</td>
                                                                    <td><input type="text" name="shop_city" required="required" class="form-control" value="${shope.shop_city}"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Enter Shop Location</td>
                                                                    <td><input type="text" name="shop_locality" required="required" class="form-control" value="${shope.shop_locality}"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Enter Shop Address</td>
                                                                    <td><input type="text" name="shop_address" required="required" class="form-control" value="${shope.shop_address}"/></td>
                                                                </tr>
                                                                <input type="hidden" name="vendor_id" value="<%=id%>"/>

                                                            <tr>
                                                                <td class="text-center" colspan="2">
                                                                    <input type="submit" name="sumit" value="Next" class=" btn btn-primary"  id="sumit"/> 
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </center>
                                                </form>
                                            </div>
                                            </div> 

                                            <div class="col-md-4">
                                                <%if (request.getParameter("sumit") != null) {%>
                                                
                                                    <form action="../ShopController?op=add" method="post" enctype="multipart/form-data">
                                                        <div class="card">     
                                                            <div class="card-header bg-primary text-white">add Shop Banner</div>
                                                            <img src="" style="width:200px; height: 200px;" id="preview" class="form-control"/> <br/>
                                                            <input type="file" name="photo" required="required" onchange="readURL(this, preview);" class="form-control btn btn-success"/> <br/>
                                                            <input type="submit" value="Submit " class="btn btn-primary" name="submit"/>
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
