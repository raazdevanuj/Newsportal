

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css"/>
<script src="assets/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <form action="controller1?" method="post">
            <center>
            <h2>Enter Subject Regarding Course </h2>
            <table border="2" width="60%" class="text-center bg-success text-white font-weight-bold" >
              
                <tr>
                    <td>Enter Subject</td>
                    <td><input type="text" name="sub"/>
                       </td>
                 </tr>
                  <tr>
                    <td>select Course</td>
                    <td>
                    <%
                        
                        PreparedStatement smt;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
                       String sql="select * from course";
                       smt=con.prepareStatement(sql);
                         ResultSet rs=smt.executeQuery();
                       // int count=0;
                         while(rs.next())
                         {
                         //out.println("<div class='row'><div class='col-sm-8 col-sm-pull-4'>");
                          %>  
                   
                          <input type="checkbox" name="course"  value="<%=rs.getString(1)%>"><%=rs.getString(2)%></input>
                          <%--  <% if(count>2)%><br/> --%> 
                          
                        <%}//out.println("</div></div>");%>
                        </td>          
                 </tr>
                 <th class="text-center" colspan="2">
                    <input type="submit" value="Save" class=" btn btn-dark"/>
                 </th>
            </table>
            </center>
        </form>
    </body>
</html>
