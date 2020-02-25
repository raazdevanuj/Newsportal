
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:include page="base.jsp"></jsp:include>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function confirmation(){
                if(confirm("Do you really wanna delete"))
                {
                 return true;   
                }
                return false;
            }
            </script>
    </head>
    <body class="text-light bg-dark">
    <center>
        <h1 class="text-black display-3">LIST OF USER</h1>
        <table class="table table-striped table-dark" width="60%" border="1" cellspacing="0">
            <tr>
                <th > ID</th>
                 <th>NAME</th>
                  <th> Father Name</th>
                   <th> Gender</th>
                    <th> Date of Birth</th>
                     <th> Hobbies</th>
                     <th>User Id</th>
                     <td>Photo</td>                  
                      <th> Edit</th>
                      <th> Delete</th>
            </tr>
            <%
                Connection con=null;
                PreparedStatement smt;
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
                    String sql="select * from user";
                    smt=con.prepareStatement(sql);
                    ResultSet rs=smt.executeQuery();
                    while(rs.next()){
                    %>
                    <tr>
                    <td><%=rs.getString("id")%></td>   
                     <td><%=rs.getString("name")%></td>   
                      <td><%=rs.getString("fname")%></td>   
                       <td><%=rs.getString("gender")%></td>   
                        <td><%=rs.getString("dob")%></td>   
                         <td><%=rs.getString("hobbies")%></td> 
                          <td><%=rs.getString("userId")%></td> 
                          <td><%=rs.getString("photo")%></td>
                          <td><img src="<%=rs.getString("photo")%>" style="width:64px;height:64px;" class="img img-thumbnail"/></td>
                         <td><a href="edit.jsp?id=<%=rs.getString("id")%> " class="btn btn-success"><i class="fa fa-pencil"> Edit</i>  </a></td>
                         <td><a href="UserController?op=delete&id=<%=rs.getString("id")%>" class="btn btn-danger" onclick=" return confirmation()"><i class="fa fa-trash"  aria-hidden="true"> Delete</i></a></td>   
                    </tr>
           <% }
}
                
        catch(Exception e)
        {
            System.out.println("Error "+e.getMessage());
        }
         %>       
        </table>
        <br>
       
        <a href="index.jsp" class="btn btn-primary row"> <i class="fa fa-plus-circle" > Add more Record</i></a>
         </center>
    </body>
</html>
