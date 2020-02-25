<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include> 
<script>
    $(document).ready(function(){
        $("#sub_id").change(function(){
          $("#tab1").load("controller2?op=subject&sub_id="+$(this).val()); 
       }); 
    });
    </script>
    </head>
    <body>
     
        <form>
            <center>
                <h2>View Course </h2> <hr>
                <table  width="60%" border="2" class="text-center">
                    <tr>
                        <th> <label> Select Course </label></th>
                        <td>
                 <select class="form-control text-center" id="sub_id">
                    <option value="-1">select Subject</option> 
                    <%
                        
                        PreparedStatement smt;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
                       String sql1="select * from subject";
                       smt=con.prepareStatement(sql1);
                         ResultSet rt=smt.executeQuery();
                         while(rt.next())
                         {
                        %>
                        <option value="<%=rt.getString(1)%>"><%=rt.getString(2)%></option>
                        <%}%>
                        </select>
                        </td>
                    </tr>
                </table>    <br><br>
            <table id="tab1" border="2" width="60%" class="text-center bg-success text-white font-weight-bold text-center" >
              
                <tr >
                    <td>Course</td>
                </tr>
                 
            </table>
            </center>
        </form>                 
    </body>
</html>
