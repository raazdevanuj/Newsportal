

<%@page import="com.beans.Vendor"%>
<%@page import="com.daos.VendorDao"%>
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

  <title>All Vendor</title>
  
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
              <h6 class="m-0 font-weight-bold text-primary">All vendor Data </h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                      <tr>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Mobile</th>
                      <th>Photo</th>
                       <th>Status</th>
                      <th>Actions</th>
                    
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                     <th>Name</th>
                      <th>Email</th>
                      <th>Mobile</th>
                      
                      <th>Photo</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </tfoot>
                  <tbody>
                      <%
                          VendorDao vd=new VendorDao();
                      
                      ArrayList<Vendor> sub=vd.getallRecordsappro();
                      for(Vendor sd:sub){
                        
                      %>
                    <tr>
                      <td><%=sd.getVendor_name()%></td>
                      <td><%=sd.getEmail_id()%></td>
                      <td><%=sd.getMobile()%></td>
                      <td><img src="../<%=sd.getPhoto()%>" style="width:150px; height: 150px;"/></td>
                      <td><%=sd.getStatus()%></td>
                      <td><a href="viewshow.jsp?id=<%=sd.getVendor_id()%>" class="btn btn-primary"><i class="fa fa-edit">&nbsp;Change their Status</i></a></td>
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
