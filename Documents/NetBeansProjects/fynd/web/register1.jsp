<%@page import="com.daos.UserDao"%>
<%@page import="com.daos.VendorDao"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Fyndal</title>

    
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"  crossorigin="anonymous">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
   <link rel="icon" href="media/slider1/loki.png"/>
    <link href="assets/css/modern-business.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/log.css" rel="stylesheet" type="text/css">
 <jsp:include page="base.jsp"></jsp:include>
   
</head>

<body>
    <nav class="top-bar"><jsp:include page="topbar.jsp"></jsp:include></nav>
   <jsp:include page="navbar.jsp"></jsp:include>

     <jsp:include page="slider.jsp"></jsp:include>
<jsp:useBean class="com.beans.user" id="use" scope="session"></jsp:useBean>
 <jsp:setProperty name="usee" property="*"></jsp:setProperty>
<br>
       
<div class="section">
    <center>
        <div class="container">

            <div class="row">
                
                
                
                <div class="col col-md-12">
                    <form method="post" class="form">
                         <div class="card">
                <div class="card-header bg-primary text-white"><i class="fa fa-registered"></i> Enter User Details Here
                </div>
                        <table class="table">
                            
                                <td>Enter Name </td>
                                <td><input type="text" name="name" class="form-control" value="${usee.name}"/></td>
                            </tr> 
                            <tr>
                                <td>Enter Contact </td>
                                <td><input type="text" name="phone_no" class="form-control" value="${usee.phone_no}"/></td>
                            </tr> 
                             <tr>
                                <td>Enter Address </td>
                                <td><input type="text" name="city" class="form-control"  placeholder="Enter City" value="${usee.city}"/>
                                
                                <input type="text" name="locality" class="form-control" placeholder="Enter Locality" value="${usee.locality}"/>
                                
                                <input type="text" name="pincode" class="form-control" placeholder="Enter pincode" value="${usee.pincode}"/></td>
                             </tr> 
                            
                             <tr>
                                <td>Enter Email </td>
                                <td><input type="email" name="email_id" class="form-control" value="${usee.email_id}"/></td>
                            </tr>                       
                            
                            
                              <tr>
                                <td>Enter Password </td>
                                <td><input type="password" name="password" class="form-control" value="${usee.password}"/></td>
                            </tr> 
             
                        </table>
                            <input type="submit" value="save and Next" name="submit" id ="submit" class="form-control btn btn-primary"/>
                    </form>
                </div>
                
            </div>        
        </div>
     </div>                        
        <!-- /.container -->
        </center>
    </div>
    <!-- /.section -->

     
     
    <jsp:include page="footer.jsp"></jsp:include>
  <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/modern-business.js"></script>
</body>
<% if(request.getParameter("submit")!=null){%>
 

     <%
       
   UserDao vd=new UserDao();
   
    if(vd.add1(use)){
    out.println("<script>alert('Registered Successfully');</script>");
     session.removeAttribute("use");
               out.println("<script>window.location = 'index.jsp';</script>");
    }
else
    {
    out.println("<script>alert('Registeration Failed');</script>");
               out.println("<script>window.location = 'register1.jsp';</script>");
     }
  }%>
</html>
