<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include> 
<script>
    $(document).ready(function(){
       $("#c_id").change(function(){
          $("#tab").load("controller2?op=course&cour_id="+$(this).val()); 
       }); 
//        $("#sub_id").change(function(){
//          $("#tab1").load("controller2?op=subject&sub_id="+$(this).val()); 
//       }); 
    });
    </script>
    </head>
    <body>
     
        <form>
            <center>
                <h2>View Subject </h2> <hr>
                <table  width="60%">
                    <tr>
                        <th> <label> Select Subject </label></th>
                        <td>
                 <select class="form-control" id="c_id">
                    <option value="-1">select Subject</option> 
                    <%
                        
                        PreparedStatement smt;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
                       String sql1="select * from course";
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
            <table id="tab" border="2" width="60%" class="text-center bg-success text-white font-weight-bold" >
              
                <tr >
                    <td>Course</td>
                </tr>
                 
            </table>
            </center>
        </form>                 
    </body>
</html>
