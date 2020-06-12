<%@page import="com.daos.Sub_CategoryDao"%>
<%@page import="com.beans.Sub_category"%>
<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.CategoryDao"%>
<div class="section">

        <div class="container">

            <div class="row">
<div class="col-lg-3">

       
        <div class="list-group">
              <a href="sub_catindex.jsp" class="list-group-item active"> All Categories </a>
            <%
                CategoryDao cd=new CategoryDao();
                ArrayList<Category> as= cd.getAllRecords(); int t=0;
                for(Category c:as){
                %>
                 <a href="sub_catindex.jsp?id=<%=c.getCategory_id()%>" class="text-bold list-group-item <%if((request.getParameter("id")!=null) && request.getParameter("id").equals(String.valueOf(c.getCategory_id()))) { t=c.getCategory_id();out.println(" active");} %>"><%=c.getCategory_name()%></a>
                
                <%}%>
        </div>
</div>
        <h3 class=" col-lg-9 btn-primary active text-center">Sub-Category Details</h3>
        
        <%
            Sub_CategoryDao sd= new Sub_CategoryDao();
            ArrayList<Sub_category> ads=sd.getAllRecordsId(t);
            
            for(Sub_category sds :ads){
        %>
         <div class="col-lg-3 col-md-4 mb-4">
            <div class="card text-center">
                <a href="#"><img class="card-img-top" src="./<%=sds.getPhoto()%>" alt="" width="150" height="200"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#"><%=sds.getSub_category_name()%></a>
                </h4>
                
                  <p class="card-text"> </p>
              </div>
              <div class="card-footer">
                  <a href="viewshops.jsp?sid=<%=sds.getSub_category_id()%>" class="btn btn-primary">View Shop</a>
                  <a href="productindex.jsp?cid=<%=t%>&sid=<%=sds.getSub_category_id()%>" class="btn btn-primary">View Products</a>
              </div>
            </div>
            
        </div>
         <%}%>
</div>
</div>
</div>