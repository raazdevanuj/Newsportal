

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

        <title>Dashboard</title>
        <jsp:include page="base.jsp"></jsp:include>
            <script>

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

        <body id="page-top">
        <%
            if (session.getAttribute("admin") == null) {
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
<jsp:useBean class="com.beans.Sub_category" id="sub_categ" scope="session"></jsp:useBean>
<% 
            int id=request.getParameter("id")==null?-1:Integer.parseInt(request.getParameter("id"));
           Sub_CategoryDao ud= new Sub_CategoryDao();
           if(sub_categ!=null && sub_categ.getCategory_id()!=id){
           sub_categ=ud.getById(id);
           session.setAttribute("sub_categ",sub_categ);
          // System.out.println(sub_category.getSub_category_name());
           }
            %>
                        <!-- Begin Page Content -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Update Sub-Category</h1>
                            </div>

                            <center>
                                <div class="container" >
                                    <div class="row">

                                        <div class="col-md-4" style="position:absolute;right:0px;">
                                        <%if (request.getParameter("sumit") != null) {%>
                                        <jsp:setProperty name="sub_categ" property="*"></jsp:setProperty>
                                        <form action="../SubController?op=update" method="post" enctype="multipart/form-data">
                                            <div class="card align-center">     
                                                <div class="card-header bg-primary text-white"><i class="fa fa-registered"></i> add Photo Here</div>
                                                <center> <img src="../${sub_categ.photo}" style="width:150px; height: 150px;" id="preview" class="form-control"/> <br/>
                                                    <input  type="file" name="photo" onchange="readURL(this, preview);" class="form-control btn btn-success"/></center> <br/>
                                                <input type="submit" value="Update to Data base " class="btn btn-primary" name="submit"/>
                                            </div>
                                        </form>
                                        <%
                        }%>

                                    </div>

                                    <div class="col col-md-7">
                                        <form method="post" class="form">

                                            <div class="card">
                                                <div class="card-header bg-primary text-white"> <center><i class="fa fa-registered"></i>
                                                        <h1 class="h3 mb-0 text-white ">Sub_category</h1></center>
                                                </div>
                                                <table class="table">
                                                    <tr><td>Category Name</td>
                                                        <td ><select name="category_id" class="form-group">
                                                                <option value="-1">Category Name</option>
                                                               
                                                                <%
                                                                    CategoryDao cd = new CategoryDao();
                                                                    ArrayList<Category> cat = cd.getAllRecords();
                                                                    for (Category sd : cat) {
                                                                %>
                                                                <option value="<%=sd.getCategory_id()%>" <%if (sd.getCategory_id()==sub_categ.getCategory_id()) {out.println(" selected");}%>><%=sd.getCategory_name()%></option>
                                                                <%}%>
                                                            </select></td></tr>
                                                    <td>Sub_category Name </td>
                                                    <td><input type="text" name="sub_category_name"  Required="Required" class="form-control" value="${sub_categ.sub_category_name}" /></td>
                                                    </tr> 

                                                </table>
                                                <center> <input type="submit" value="Next" name="sumit" id ="sumit" class="form-control btn btn-primary col col-md-2"/></center>
                                        </form>
                                    </div>
                                </div>


                            </div>
                    </div>
                    </center>




                </div>
                <!-- /.container-fluid -->

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

</html>
