<%-- 
    Document   : reg
    Created on : 27-Feb-2020, 08:31:47
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="Test.person"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
            <input type="text" name="name" placeholder="enter name"/><br/>
            <input type="number" name="age" placeholder="enter age"/><br/>
            <input type="text" name="userid" placeholder="Enter userid"/><br/>
            <input type="password" name="password" placeholder="enter password"/><br/>
            <input type="text" name="contact" placeholder="enter contact no"/><br/>
            <input type="text" name="address" placeholder="Enter address"/><br/>
            <input type="submit" value="Register" name="submit"/> 
        </form> 
       
        <% if(request.getParameter("submit")!=null){
            person per = new person();
            per.setName(request.getParameter("name"));
            per.setAge(Integer.parseInt(request.getParameter("age")));
            per.setContact(request.getParameter("contact"));
            per.setAddress(request.getParameter("address"));
            per.setUserid(request.getParameter("userid"));
            per.setPassword(request.getParameter("password"));
            
            session.setAttribute("person", per); 
            response.sendRedirect("login2.jsp");
        }
            
            %>
    </body>
</html>
