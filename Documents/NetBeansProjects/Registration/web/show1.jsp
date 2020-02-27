<%-- 
    Document   : show1
    Created on : 27-Feb-2020, 09:00:11
    Author     : Dell
--%>

<%@page import="Test.person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Person Details </h1>
         <%
            person  per = (person)session.getAttribute("person");
            String islogin = (String) session.getAttribute("loggedin");
            if (per==null){
                response.sendRedirect("reg.jsp");
                return;
            }
            if (islogin==null ||  !islogin.equals("yes"))
            {
                response.sendRedirect("login2.jsp");
                return;
            }
           
            %>
            
            <h2>Name: <%=per.getName()%><br/>
            Age : <%= per.getAge()%> </h2>
    </body>
</html>
