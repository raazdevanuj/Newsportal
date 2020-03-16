
<%@page import="com.beans.Category"%>
<%@page import="com.daos.CategoryDao"%>
<%@page import="com.daos.ReporterDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.News"%>
<%@page import="com.daos.NewsDao"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="icon" href="assets/Images/photo2.jpg"/>

        <title>Reporter Home</title>
    
        <jsp:include page="base.jsp"></jsp:include>
          <script>

                function readURL(input,preview) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            preview.src = e.target.result;
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }
                </script>
        </head>

        <body>
<%
if(session.getAttribute("reporter")==null){
    response.sendRedirect("../login.jsp");
    return ;
} 
%>  

        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container-fluid">
                <div class="row">
                    <nav class="col-md-2 d-none d-md-block bg-light sidebar">

                    <jsp:include page="sidebar.jsp"></jsp:include>
                    </nav>

                        <jsp:useBean class="com.beans.News" id = "newz" scope="session"></jsp:useBean>
                         <jsp:useBean class="com.beans.Category" id = "category" scope="session"></jsp:useBean>
               
                <div class="col-md-3" style="position: fixed;right:0px;">
                    <%if (request.getParameter("submit")!=null){ 
                        String catids[] = request.getParameterValues("category");
                        String categories = "";
                        for (String id : catids)
                            categories += id +",";
                        session.setAttribute("catids", catids);
                        request.setAttribute("categories",categories);
                    %>
                    <jsp:setProperty name="newz" property="*"></jsp:setProperty>
                    <form action="../NewsController?op=update" method="post" enctype="multipart/form-data">
                        <img src="../${newz.image}" style="width:200px; height: 200px;" id="preview" class="form-control"/> <br/>
                    <input type="file" name="image" onchange="readURL(this,preview);" class="form-control btn btn-success"/> <br/>
                    <input type="hidden" name="oldimage" value="${newz.image}"/>
                    <input type="submit" value="Save to Data base " class="btn btn-primary" name="submit"/>
                    </form>
                    <%
                }%>
                </div>
            <%
                int id = request.getParameter("newsid") == null ? -1 : Integer.parseInt(request.getParameter("newsid"));
                NewsDao ud = new NewsDao();
                CategoryDao cd= new CategoryDao();
                if (newz != null && newz.getId() != id) {
                    newz = ud.getById(id);
                   
                    session.setAttribute("newz", newz);
                    
                }
            %>
            <form method="post">
                <center>
                    <br>
                    <table  class="table" width="60%" >
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title" required="required" autocomplete="off" class="form-control" value="${newz.title}"/> </td>
                        </tr>
                        <tr>
                            <td>Enter Description </td>
                            <td><textarea name="description" rows="10" cols="20" class="form-control">${newz.description}</textarea> 
                            </td>
                        </tr> 
                        <tr>
                            <td>Uploaded On </td>
                            <td><input type="date" name="uploaded_on" value="${newz.uploaded_on}"  class="form-control" /> </td>
                        </tr>

                        <tr>
                            <td>Select Categories </td>
                            <td>
                                <%
                                   
                                    ArrayList<Category> catList = cd.getAllRecords();                                 
                                    ArrayList<Integer> cat= cd.getAllcats(id);
                                    String categories = request.getAttribute("categories") != null ? (String) request.getAttribute("categories") : "";
                                    for (Category catd : catList) {%>
                                <input type="checkbox" name="category" value="<%=catd.getId()%>"  <%if (cat.contains(catd.getId())) {
                                                out.println(" checked");
                                            }%>/>  <%=catd.getName()%> 
                                <%}%>
                            </td>
                        </tr>
                        

                        <tr>

                            <th  class="text-center" colspan="2">
                                <input type="reset" class="btn btn-info" value="Clear" />
                                <input type="submit" class="btn btn-primary" name="submit" value="Save and Next "/> 
                            </th>
                        </tr>
                   

                    </table>  

                </center>

            </form>

        </div>




        <script>
            feather.replace()
        </script>

    </body>
</html>
