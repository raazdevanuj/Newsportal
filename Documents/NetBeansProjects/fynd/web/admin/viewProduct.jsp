

<%@page import="com.beans.Product"%>
<%@page import="com.daos.ProductDao"%>
<%@page import="com.beans.Category"%>
<%@page import="com.daos.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Sub_category"%>
<%@page import="com.daos.Sub_CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>All Products</title>
   <script>
            function confirmation(){
                if(confirm("Do you really wanna delete"))
                {
                 return true;   
                }
                return false;
            }
            </script>
  <jsp:include page="base.jsp"></jsp:include>
</head>

<body id="page-top">
    <%
        if(session.getAttribute("admin")==null)
        {
            response.sendRedirect("../index.jsp");
            return;
        }
        %>
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
  <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
      <jsp:include page="topbar.jsp"></jsp:include>
        <!-- End of Topbar -->

      
		  <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">All Product Data </h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                       <th>ID</th>
                      <th>Name</th>
                       <th>BRAND</th>
                      <th>Photo</th>
                      <th>Price</th>
                      <th>Description</th>
                      <th>UPDATE || DELETE</th>
                    
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                       <th>ID</th>
                      <th>Name</th>
                       <th>BRAND</th>
                      <th>Photo</th>
                      <th>Price</th>
                      <th>Description</th>
                      <th>UPDATE || DELETE</th>
                    </tr>
                  </tfoot>
                  <tbody>
                      <%
                     ProductDao pd=new ProductDao();
                      
                      ArrayList<Product> pro=pd.getAllRecords();
                      for(Product p:pro){
                     
                      %>
                       
                    <tr>
                      <td><%=p.getProduct_id()%></td>
                      <td><%=p.getProduct_name()%></td>
                      <td><%=p.getProduct_Brand()%></td>
                      <td><img src="../<%=p.getPhoto()%>" style="width:150px; height: 150px;"/></td>
                      <td><%=p.getProduct_price()%></td>
                      <td><%=p.getProduct_desc()%></td>
                      <td><a href="editPro.jsp?id=<%=p.getProduct_id()%>" class="btn btn-primary ml-4"><i class="fa fa-edit">&nbsp; Update</i></a>
                          <hr><a href="../ProductController?op=delete&id=<%=p.getProduct_id()%>" class="btn badge-danger ml-4" onclick="return confirmation()"><i class="fa fa-trash">&nbsp; Delete</i></a></td>
                    </tr>
                    <%}%>
                   
                  </tbody>
                </table>
              </div>
            </div>
          </div>
		  

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <jsp:include page="footer.jsp"></jsp:include>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

 <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="signout.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Custom scripts for all pages-->
  <script src="assets/js/sb-admin-2.min.js"></script>
<script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <script src="assets/js/demo/datatables-demo.js"></script>

</body>

</html>
