<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   Vendor Dashboard
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
 
  <jsp:include page="base.jsp"></jsp:include>
</head>

<body class="">
     <%
        if(session.getAttribute("vendor")==null)
        {
            response.sendRedirect("../index.jsp");
            return;
        }
        %>
  <div class="wrapper ">
      <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="main-panel">
      <!-- Navbar -->
    <jsp:include page="navbar.jsp"></jsp:include>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            
              
              
              
              
              
          </div>
        </div>
      </div>
      
     <jsp:include page="footer.jsp"></jsp:include>  
    </div>
  </div>
    <jsp:include page="settings.jsp"></jsp:include>
</body>

</html>