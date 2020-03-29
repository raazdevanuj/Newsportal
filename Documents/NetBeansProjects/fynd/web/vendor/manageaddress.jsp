
<%@page import="com.beans.Shop"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.ShopDao"%>
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

            Vendor v = (Vendor) session.getAttribute("vendor");
            int id = v.getVendor_id();


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
                                    <!--<div class="page-header-subtitle">All Personal Details</div>-->
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid mt-n10">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">All Shop Details</div>
                                        <div class="card-body">
                                            <div class="datatable table-responsive">
                                                <table class="table  text-center table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <th>Shop Name</th>
                                                            <th>Shop Location</th>
                                                            <th>Shop City</th>
                                                            <th>Shop Address</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                           
                                                            <th>Shop Name</th>
                                                            <th>Shop Location</th>
                                                            <th>Shop City</th>
                                                            <th>Shop Address</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                    <%                                                ShopDao sd = new ShopDao();
                                                        ArrayList<Shop> sdd = sd.getAllRecordsbyid(id);
                                                        for (Shop d : sdd) {
                                                    %>




                                                    <tr>
                                                       
                                                        <td><%=d.getShop_name()%></td>


                                                        <td><%=d.getShop_locality()%></td>

                                                        <td><%=d.getShop_city()%></td>

                                                        <td><%=d.getShop_address()%></td>
                                                        <td>


                                                            <a href="editaddress.jsp?id=<%=d.getShop_id()%>" class="btn btn-primary col-md-12">&nbsp; Update</a>

                                                        </td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
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
