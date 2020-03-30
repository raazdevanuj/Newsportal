
<%@page import="com.daos.Sub_CategoryDao"%>
<%@page import="com.beans.Product"%>
<%@page import="com.daos.ProductDao"%>
<%@page import="com.beans.Sub_category"%>
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
        <script>
             function confirmation(){
                if(confirm("Do you really wanna delete"))
                {
                 return true;   
                }
                return false;
            }
            </script>
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
                                                    <th>Sub Category Name</th>
                                                    <th>Product Details</th>


                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                    <th>Shop Name</th>
                                                    <th>Sub Category Name</th>
                                                    <th>Product Details</th>
                                                    </tfoot>
                                                    <tbody>
                                                    <%       ShopDao sd = new ShopDao();
                                                            ProductDao pd=new ProductDao();
                                                            Sub_CategoryDao sc=new Sub_CategoryDao();
                                                        ArrayList<Shop> sdd = sd.getAllRecordsbyid(id);
                                                        for (Shop d : sdd) {
                                                    
                                                                                   ArrayList<Product> ps=pd.getbyshop(d.getShop_id());
                                                                                    for (Product p:ps) {
                                                                                        String rrr=sc.getByPROId(p.getProduct_id());
                                                                                %>



                                                    <tr>
                                                        <td><%=d.getShop_name()%></td>
                                                        <td><%=rrr%></td>
                                                        <td>

                                                            <div class="card">
                                                                <div class="card-header">All Product Details</div>
                                                                <div class="card-body">
                                                                    <div class="datatable table-responsive">
                                                                        <table class="table  text-center table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                                                            <thead>
                                                                                
                                                                            <tbody>
                                                                            <th>Product Name</th>
                                                                            <th>Product Brand</th>
                                                                            <th>Product Price</th>
                                                                            
                                                                            </tbody> 
                                                                                <tr>

                                                                                    <td><%=p.getProduct_name()%></td>
                                                                                    <td><%=p.getProduct_Brand()%></td>
                                                                                    <td><%=p.getProduct_price()%></td>
                                                                                   
                                                                                </tr>
                                                                                <tr >
                                                                                    <td colspan="2">
                                                                                        Product Description <br>
                                                                                        <%=p.getProduct_desc()%>
                                                                                    </td>
                                                                                       <td colspan="2"> <img src="../<%=p.getPhoto()%>" style="border-radius: 0%; width:150px; height: 150px;"/><br>
                                                                                    
                                                                                    </td></tr> <tr >
                                                                                    <td colspan="4">    <button class="btn btn-sm btn-cyan"><a href="../ProductController?op=del&id=<%=p.getProduct_id()%>" onclick="return confirmation()"><i data-feather="trash">Delete</i>&nbsp; Delete</a></button>
                                                                                    </td>
                                                                                </tr>
                                                                                 
                                                                            </tbody>

                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </td>

                                                    </tr>
                                                    <%}}%>
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
