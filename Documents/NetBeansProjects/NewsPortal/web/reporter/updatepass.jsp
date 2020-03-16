
<%@page import="com.daos.ReporterDao"%>
<%@page import="java.util.Base64"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
      <link rel="icon" href="assets/Images/photo2.jpg"/>

     <title>Reporter Home</title>
     <jsp:include page="base.jsp"></jsp:include>
     <jsp:useBean class="com.beans.Reporter" id="reporter" scope="session"></jsp:useBean>
     <script type="text/javascript">
         
              function comparePwds(x,y){
                if(x===y)
                    return true;
                else {
                    alert("Password and Confirm Password not matched !!");
                    return false;
                }
            }
            </script>
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
            <form  method="post" onsubmit="return comparePwds(password.value,rpassword.value);"> 
    <center>
        <h2  class="text-light bg-dark shadow ">CHANGE PASSWORD </h2>
        <table class="table" > 
            <!--pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"-->
              <tr>
                <td>Enter Password </td>
                <td><input type="password" name="password" id="password" class="form-control" />
                    <span><b>Password should be minimum 8 char and contains<br> one Upper, one Lower, one Special and one digit</b></span></td>
            </tr>
            <tr>
                <td>Retype Password </td>
                <td><input type="password" name="rpassword" id="rpassword" class="form-control"/></td>
            </tr>
              <tr>
                 
                <th class="text-center" colspan="2">
                   
                    <input type="submit" name="submit" value="submit" class=" btn btn-primary"  id="submit"/> 
                </th>
            </tr>
            
         </table>
    </center>
        </form>
          </div>
 
        </main>
      </div>
    </div>

   
    <script>
      feather.replace()
    </script>

  </body>
  <% if(request.getParameter("submit")!=null){%>
 

     <%
         String password = request.getParameter("password");
   String encodedPassword =Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
    
     out.println(reporter.getId());
     
     ReporterDao rd=new ReporterDao();
    if(rd.updat2(encodedPassword,reporter.getId())){
    out.println("<script>alert('Password updated Successfully');</script>");
               out.println("<script>window.location = 'updatepass.jsp';</script>");
    }
else
    {
    out.println("<script>alert('Password not updated Successfully');</script>");
               out.println("<script>window.location = 'updatepass.jsp';</script>");
     }
  }%>
</html>
