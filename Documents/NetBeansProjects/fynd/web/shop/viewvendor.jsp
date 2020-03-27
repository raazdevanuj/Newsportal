<%@page import="com.beans.Vendor"%>
<%@page import="com.daos.VendorDao"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Vendor Dashboard
        </title>
        <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />

        <jsp:include page="base.jsp"></jsp:include>
        </head>

        <body class="">
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
         <%--<jsp:setProperty name="ven" property="*"></jsp:setProperty>--%>
        <div class="wrapper ">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div class="main-panel">
                    <!-- Navbar -->
                <jsp:include page="navbar.jsp"></jsp:include>
                    <!-- End Navbar -->
                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header card-header-primary">
                                            <h4 class="card-title ">Vendor Details</h4>

                                        </div>
                                  
                                        <div class="card  center col-md-7">
                                            <div class="table-responsive">
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
                                                            Email_id
                                                        </td>
                                                        <td>
                                                          <%=ven.getUserid()%>
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>
                                                            Photo
                                                        </td>
                                                        <td>
                                                            <img src="../<%=ven.getPhoto()%>" style="border-radius: 0%; width:150px; height: 150px;"/>
                                                        </td>
                                                   
                                                        <td><a href="editvendor.jsp?id=<%=id%>" class="btn btn-primary ml-4"><i class="fa fa-edit">&nbsp; Update</i></a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="footer.jsp"></jsp:include>  
                </div>
            </div>
        <jsp:include page="settings.jsp"></jsp:include>
    </body>

</html>