
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
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
                <%-- <jsp:include page="reportbar.jsp"></jsp:include>--%>
          </div>
 
        </main>
      </div>
    </div>

   
    <script>
      feather.replace()
    </script>

  </body>
</html>
