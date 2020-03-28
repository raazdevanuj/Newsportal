
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
           <jsp:useBean class="com.beans.Vendor" id="vendor" scope="session"></jsp:useBean>
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
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
       

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
                                <div class="col-md-10">
                                    <div class="card">
                                        <div class="card-header">Shop Details</div>
                                        <div class="card-body">
                                            <div class="row">

                                                <div class="col-md-6">
                                                    <form  method="post" onsubmit="return comparePwds(password.value, rpassword.value);"> 
                                                        <center>
                                                            <h2  class="text-light bg-gradient-primary-to-secondary">Add Shop Details </h2>
                                                            <table class="table" > 
                                                                <!--pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"-->
                                                                <tr>
                                                                    <td>Enter Shop Name </td>
                                                                    <td><input type="text" name="shop_name"  class="form-control" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Enter Shop Address</td>
                                                                    <td><input type="text" name="shop_address" id="rpassword" class="form-control"/></td>
                                                                </tr>
                                                                <tr>

                                                                    <td class="text-center" colspan="2">

                                                                        <input type="submit" name="submit" value="submit" class=" btn btn-primary"  id="submit"/> 
                                                                    </td>
                                                                </tr>

                                                            </table>
                                                        </center>
                                                    </form>

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
    <% if(request.getParameter("submit")!=null){%>
 

     <%
         String password = request.getParameter("password");
   String encodedPassword =Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
    
    
     VendorDao rd=new VendorDao();
    if(rd.updat2(encodedPassword,vendor.getVendor_id())){
    out.println("<script>alert('Password updated Successfully');</script>");
               out.println("<script>window.location = 'changepass.jsp';</script>");
    }
else
    {
    out.println("<script>alert('Password not updated Successfully');</script>");
               out.println("<script>window.location = 'changepass.jsp';</script>");
     }
  }%>
</html>
