<%@page import="com.beans.Product"%>
<%@page import="com.daos.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.Sub_CategoryDao"%>
<%@page import="com.beans.Sub_category"%>
<%@page import="com.beans.Category"%>

<div class="section">

        <div class="container">

            <div class="row">
<div class="col-lg-3">

       
        <div class="list-group">
              <a href="productindex.jsp?cid=<%=101%>&sid=<%=0%>" class="list-group-item active"> All Sub_Categories </a>
            <%
                String p=request.getParameter("cid");
                int id=Integer.parseInt(request.getParameter("sid"));
                Sub_CategoryDao cd= new Sub_CategoryDao();
                ArrayList<Sub_category> as= cd.getAllRecordsId(Integer.parseInt(p)); int t=0;
                for(Sub_category c:as){
                %>
                 <a href="productindex.jsp?cid=<%=p%>&sid=<%=c.getSub_category_id()%>" class="text-bold list-group-item <%if((request.getParameter("sid")!=null) && request.getParameter("sid").equals(String.valueOf(c.getSub_category_id()))) {out.println(" active");} %>"><%=c.getSub_category_name()%></a>
                
                <%}%>
        </div>
</div>
        <h3 class=" col-lg-9 btn-primary active text-center">Product Details</h3>
         <%
             ProductDao pd=new ProductDao();
           
            ArrayList<Product> ads=pd.getbysub(id);
            
            for(Product sds :ads){
        %>
         <div class="col-lg-3 col-md-4 mb-4">
            <div class="card text-center">
               <img class="card-img-top" src="./<%=sds.getPhoto()%>" alt="" width="180" height="200">
              <div class="card-body">
                <h3 class="card-title">
                 <%=sds.getProduct_Brand()%> <%=sds.getProduct_name()%>
                </h3>
                <h4> MRP :<%=sds.getProduct_price()%></h4>
                  <p class="card-text"><%=sds.getProduct_desc()%> </p>
              </div>
              <div class="card-footer">
                  <a href="viewshop.jsp?pid=<%=sds.getProduct_id()%>" class="btn btn-primary">View Shop</a>
                   </div>
            </div>
            
        </div>
         <%}%>
        
</div>
</div>
</div>