<%-- 
    Document   : dashboard
    Created on : 13-Mar-2020, 10:11:09
    Author     : Dell
--%>

<%@page import="com.beans.News"%>
<%@page import="com.daos.NewsDao"%>
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
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("../login.jsp");
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

                        <!-- Begin Page Content -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                        <%
                            int newsid = Integer.parseInt(request.getParameter("newsid"));
                            NewsDao nd = new NewsDao();
                            News news = nd.getById(newsid);
                        %>

                        <div class="card col col-md-12">
                            <div class="card-body">
                                <h4 class="card-title"><%=news.getTitle()%></h4>
                                <p class="card-text"><%=news.getDescription()%></p>
                            </div>
                            <img class="card-img-bottom" src="../<%=news.getImage()%>" alt="Card image" style="width:100%">
                            <h6>Current Status :</h6>
                            <form method="post">
                                <p class="card-text"><input type="radio" value="Pending" name="status"  <%if(news.getStatus().equalsIgnoreCase("Pending"))out.println(" checked");%> > Pending</p>
                           <p class="card-text"><input type="radio" value="Approved" name="status"   <%if(news.getStatus().equalsIgnoreCase("Approved"))out.println(" checked");%>> Approved</p>
                           <p class="card-text"><input type="radio" value="Rejected" name="status"  <%if(news.getStatus().equalsIgnoreCase("Rejected"))out.println(" checked");%>> Rejected</p>
                           <input type="hidden" name="newsid" value="<%=newsid%>"/>
                           <p class="card-text"><input type="text" name="status_text" required="required" class="form-control" value="<%=news.getStatus_text()%>"> </p><br/>
                            <input type="submit" value="Update Status" name="submit" class="btn  btn-primary form-control">
                            </form>
                            </div>
                     </div>

                    <!-- Content Row -->


                </div>
                <!-- /.container-fluid -->

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


<%
    
 if (request.getParameter("submit")!=null) {
   if(nd.updateNewsStatus(Integer.parseInt(request.getParameter("newsid")), request.getParameter("status"), request.getParameter("status_text"))) 
    response.sendRedirect("viewAllNews.jsp");
   else 
       out.println("<script>alert('news is not updated !');</script>");
}
 %>   
    
</body>

</html>
