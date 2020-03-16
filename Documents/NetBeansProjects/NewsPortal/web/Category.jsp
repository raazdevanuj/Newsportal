

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.daos.CategoryDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <jsp:include page="base.jsp"></jsp:include>
    </head>
    <body>
        <jsp:useBean class="com.beans.Category" id="category" scope="session"></jsp:useBean>
                    <jsp:setProperty name="category" property="*"></jsp:setProperty>
        <form method="post">
            <center>
            <h2>Please Enter Category </h2>
            <table border="2" width="60%" class="table table-striped  text-dark text-center" >
              
                <tr>
                    <th>Enter Category</th><td>
                        <input type="text" name="name" placeholder="Category" class="form-control"/>
                       </td>
                 </tr>
         <th class="text-center" colspan="2">
          
                    <input type="submit" value="Save"  name="submit" class=" btn btn-success col col-md-10"/>
                 </th>
            </table>
            </center>
        </form>
        
    <center>
        <hr><hr>
        <table class="table table-striped table-dark" width="60%" border="1" cellspacing="0">
            <tr>
                <th > ID</th>
                 <th>Category NAME</th>
                 <th>Oprations</th>
                  <th>Oprations</th>
            </tr>
            
            <tr>
                <td>a</td>
                <td>b</td> 
                <td><a><i class="fa fa-edit btn btn-success"  aria-hidden="true"> Edit</i></a></td>
                <td><a><i class="fa fa-trash btn btn-danger"  aria-hidden="true"> Delete</i></a></td>   
            </tr>
        </table>
        <br>
    </center>
    <%
        if(request.getParameter("submit")!=null){
          
            com.beans.Category category = (com.beans.Category) session.getAttribute("category");
             com.daos.CategoryDao ud = new com.daos.CategoryDao();
            if (ud.add(category)) {
                session.removeAttribute("category");
                response.sendRedirect("category.jsp");
            }
        }
        %>
    </body>
</html>
