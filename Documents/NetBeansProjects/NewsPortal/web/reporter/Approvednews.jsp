
<%@page import="com.beans.News"%>
<%@page import="com.daos.ReporterDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.NewsDao"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
      <link rel="icon" href="assets/Images/photo2.jpg"/>

     <title>Reporter Home</title>
     <jsp:include page="base.jsp"></jsp:include>

  </head>

  <body>
      <%
if(session.getAttribute("reporter")==null){
    response.sendRedirect("../login.jsp");
    return;
} 
%>  
 <jsp:useBean class="com.beans.Reporter" id="reporter" scope="session"></jsp:useBean>
   <jsp:include page="navbar.jsp"></jsp:include>
 <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
         
        <jsp:include page="sidebar.jsp"></jsp:include>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          
            <h1 class="h3 mb-0 text-gray-800">All  Approved News</h1><hr><hr>
          <table class="table">
              <tr>
                  <td>Title</td>
                  <td>Uploaded On</td>
                  <td>Status</td>
                  <td>View and Change Status</td>
              </tr>
              
          <%
              NewsDao nd = new NewsDao();
              ArrayList<News> newsList = nd.getAllproved(reporter.getId());
              for(News news : newsList){%>
              <tr>
                  <td><%=news.getTitle()%></td>
                  <td><%=news.getUploaded_on()%></td>
                  <td><%=news.getStatus()%></td>
                  <td><a href="showDetailNews.jsp?newsid=<%=news.getId()%>" class="btn btn-success">View and Change Status</a></td>
              </tr>
             <%} %>
          </table>

        
 
        </main>
      </div>
 </div>

   
    <script>
      feather.replace()
    </script>

  </body>
</html>
