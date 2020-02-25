<%-- 
    Document   : welcome
    Created on : 23 Feb, 2020, 11:12:06 PM
    Author     : Abhishek Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome <%=request.getParameter("name")%> </h1>
    </body>
</html>
