
<%@page import="com.beans.News"%>
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
    return ;
} 
%>  
   <jsp:include page="navbar.jsp"></jsp:include>
 <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
         
        <jsp:include page="sidebar.jsp"></jsp:include>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
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
                            </div>
                    
        </main>
      </div>
    </div>

   
    <script>
      feather.replace()
    </script>

  </body>
</html>
