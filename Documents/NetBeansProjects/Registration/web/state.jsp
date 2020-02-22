<%-- 
    Document   : state
    Created on : 22 Feb, 2020, 7:16:42 PM
    Author     : Abhishek Kumar
--%>

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
<script>
    function selectcity(x,y){
        //alert(x);
     ajax=new XMLHttpRequest();
     
     ajax.open("GET","controller?id="+x,true);
     ajax.send();
     ajax.onreadystatechange=function(){
       if(this.readyState==4 && this.status==200)
       y.innerHTML=this.responseText;
     };
    
    }
    </script>
    </head>
    <body>
        <form>
            <center>
            <h2>Select city  and state </h2>
            <table border="2" width="60%" class="text-center" >
              
                <tr>
                    <td>select state</td>
                    <td>
                        <select class="form-control" onchange="selectcity(this.value,cid)">
                    <option>select state</option> 
                    <%
                        
                        PreparedStatement smt;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
                       String sql="select * from state";
                       smt=con.prepareStatement(sql);
                         ResultSet rs=smt.executeQuery();
                         while(rs.next())
                         {
                        %>
                        <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                        <%}%>
                        </select>
                    </td>
                 </tr>
                  <tr>
                    <td>select City</td>
                    <td>
                <select id="cid" class="form-control">
                    <option>select City</option> 
                </select>
                    </td>
                 </tr>
            </table>
            </center>
        </form>
    </body>
</html>
