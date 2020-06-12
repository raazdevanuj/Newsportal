<%@page import="com.beans.Vendor"%>
<%@page import="com.daos.VendorDao"%>
<%@page import="com.beans.Shop"%>
<%@page import="com.daos.ShopDao"%>
<%@page import="com.beans.Product"%>
<%@page import="com.daos.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.Sub_CategoryDao"%>
<%@page import="com.beans.Sub_category"%>
<%@page import="com.beans.Category"%>

<div class="section">

        <div class="container">
            <div class="row">
            
<!--<div class="col-md-12">

       
        <div class="list-group">
              <h4 class="list-group-item active"> Show Fliters </h4>
              <h4 class="list-group-item active"> RANGE UPTO </h4>
              <h4 class="list-group-item active"> Brand</h4>
              <h4 class="list-group-item active"> Condition </h4>
              
              
        </div>
</div>-->
            
       <jsp:useBean class="com.beans.user" id="use" scope="session"></jsp:useBean>
 <jsp:setProperty name="use" property="*"></jsp:setProperty>
     <h3 class=" col-lg-9 btn-primary active text-center">Shop and Shopkeeper Details</h3>
         <%
             
           
           
             int pid=Integer.parseInt(request.getParameter("sid"));
              
              
             ShopDao sd=new ShopDao();
            ArrayList<Shop> ads=sd.getAllRecordsbysub(pid,use);
            int i=1;
            for(Shop sds :ads){
                    VendorDao vd=new VendorDao();
                        Vendor ven=vd.getByid(sds.getVendor_id());
        %>
         <div class="col-md-4 list-group-item active text-center">
            <div class="card text-center">
               <img class="card-img-top" src="./<%=sds.getShop_Banner()%>" alt="" width="180" height="200">
              <div class="card-body">
                <h3 class="card-title">
                 <%=sds.getShop_name()%> 
                </h3>
                <h5>SN- <% out.println(i++); %></h5>
              </div>
               <h4><%=sds.getShop_locality()%> <%=sds.getShop_city()%></h4>
              <div class="card-footer">
                      <p class="card-text"><%=sds.getShop_address()%></p> 
                   </div>
            </div>
         </div>
               <div class="col-md-4 list-group-item active text-center">
                    <div class="card text-center">
                        <h4>Shopkeeper's Name <%=ven.getVendor_name()%></h4><h4>Mobile No - <%=ven.getMobile()%></h4>   
                <h4> Email id - <%=ven.getEmail_id()%></h4>
                 <img class="card-img-top" src="./<%=ven.getPhoto()%>" alt="" width="180" height="200">
               
              </div>
              
            </div>
            
        </div>
                 <hr>
         <%}  if(i==1){%>
            <div class="col-lg-12">
                <h4>Sorry, No Shop Found</h4></div>
         <%}%>

         
</div>
</div>