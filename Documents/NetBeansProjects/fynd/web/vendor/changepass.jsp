
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
         
              function comparePwds(x,y){
                if(x===y)
                    return true;
                else {
                    alert("Password and Confirm Password not matched !!");
                    return false;
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
                                        <span>User Profile</span>
                                    </h1>

                                </div>
                            </div>
                        </div>
                        <div class="container-fluid mt-n10">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="card">
                                        <div class="card-header">All Personal Details</div>
                                        <div class="card-body">
                                            <div class="row">

                                                <div class="col-md-12">
                                                    <form  method="post" onsubmit="return comparePwds(password.value, rpassword.value);"> 
                                                        <center>
                                                            <h2  class="text-light bg-gradient-primary-to-secondary">CHANGE PASSWORD </h2>
                                                            <table class="table" > 
                                                                <!--pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"-->
                                                                <tr>
                                                                    <td>Enter Password </td>
                                                                    <td><input type="password" name="password" id="password" class="form-control" />
                                                                        <span><b>Password should be minimum 8 char and contains one Upper, one Lower, one Special and one digit</b></span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Retype Password </td>
                                                                    <td><input type="password" name="rpassword" id="rpassword" class="form-control"/></td>
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
