

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <jsp:include page="base.jsp"></jsp:include>
    </head>
    <body>
        <form action="controller1?" method="post">
            <center>
            <h2> Category </h2>
            <table border="2" width="60%" class="text-center bg-success text-white font-weight-bold" >
              
                <tr>
                    <td> Category</td><td>
                        <input type="text" name="category" placeholder="Category" value="" class="form-control text-center"/>
                       </td>
                 </tr>
         <th class="text-center" colspan="2">
          
                    <input type="submit" value="update" class=" btn btn-dark"/>
                 </th>
            </table>
            </center>
        </form>
    </body>
</html>
