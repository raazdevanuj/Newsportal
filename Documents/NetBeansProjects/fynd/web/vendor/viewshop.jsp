
<%@page import="com.beans.Vendor"%>
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
    </head>
    <body class="nav-fixed">
        
         <jsp:useBean class="com.beans.Vendor" id="ven" scope="session"></jsp:useBean>
             
        <%
            if (session.getAttribute("vendor") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
           
              
          VendorDao vd = new VendorDao();

          Vendor v = (Vendor) session.getAttribute("vendor");
          int id = v.getVendor_id();
            if(ven!=null){
                ven=vd.getByid(id);
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
                                <!--<div class="page-header-subtitle">All Personal Details</div>-->
                            </div>
                        </div>
                    </div>
                <div class="container-fluid mt-n10">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">All Personal Details</div>
                                    <div class="card-body">
                                         <div class="row">
                                             <div class="col-md-6">
                                            <table class="table">

                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                Name
                                                            </td>
                                                            <td>
                                                           <%=ven.getVendor_name()%>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Mobile
                                                        </td>
                                                        <td>
                                                           <%=ven.getMobile()%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Email_id
                                                        </td>
                                                        <td>
                                                          <%=ven.getEmail_id()%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                           User Name
                                                        </td>
                                                        <td>
                                                          <%=ven.getUserid()%>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                            </table>
                                                <a href="editvendor.jsp?id=<%=id%>" class="btn btn-primary">&nbsp; Update</a>         
                                        </div>
                                        <div class="col-md-6"> 
                                            <div>
                                                <img src="../<%=ven.getPhoto()%>" style="border-radius: 0%; width:100%; height: 100%;"/>
                                                       
                                            </div>
                                        </div>
                                               
                                    </div>
                                        <!--<div class="chart-area"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>-->
                                    
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
