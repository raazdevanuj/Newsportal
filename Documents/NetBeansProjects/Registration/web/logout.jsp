

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           session.removeAttribute("loggedin");
           out.println("<h3>Session Timeout</h3>");
           response.sendRedirect("login2.jsp");
           %>
           
         <!--  <script>window.location.reload();</script> -->
    </body>
</html>
