

<%@page import="com.daos.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Dashboard</title>
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
 <jsp:useBean class="com.beans.Category" id="category" scope="session"></jsp:useBean>
 <% 
            int id=request.getParameter("id")==null?-1:Integer.parseInt(request.getParameter("id"));
           CategoryDao ud= new CategoryDao();
           if(category!=null && category.getCategory_id()!=id){
           category=ud.getById(id);
           session.setAttribute("category",category);
           }
            %>
 
        <div class="container" >
            <div class="row">
             
                
                <div class="col col-md-12">
                    <form method="post" class="form">
                       
                        <div class="card">
                            <div class="card-header bg-primary text-white"> <center><i class="fa fa-registered"></i>
                                    <h1 class="h3 mb-0 text-white ">Category</h1></center>
                            </div>
                              <jsp:setProperty name="category" property="*"></jsp:setProperty>
                            <table class="table">

                                <td>Category Name </td>
                                <td><input type="text" name="category_name"  Required="Required" class="form-control" value="${category.category_name}" /></td>
                                </tr> 

                            </table>
                            <center> <input type="submit" value="Update" name="submit" id ="submit" class="form-control btn btn-primary col col-md-2"/></center>
                    </form>
                </div>


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

  
</body>
<%
    if(request.getParameter("submit")!=null){
        category.setCategory_id(id);
        CategoryDao cd= new CategoryDao();
        if(cd.update(category)){
        out.println("<script>alert('Category Updated successfully');</script>");
         out.println("<script>window.location='viewCategory.jsp'</script>");
        }
        else
        {
         out.println("<script>alert('Category not Updated !');</script>");
         out.println("<script>window.location='viewCategory.jsp'</script>");
        }
            
    }%>
</html>
