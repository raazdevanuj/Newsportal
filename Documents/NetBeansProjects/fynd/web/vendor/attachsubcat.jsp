
<%@page import="com.beans.Category"%>
<%@page import="com.daos.CategoryDao"%>
<%@page import="com.beans.Shop"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.ShopDao"%>
<%@page import="com.beans.Vendor"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Dashboard - Vendor</title>
        <style> 
        input.largerCheckbox { 
            width: 30px; 
            height: 20px; 
        } 
    </style> 
     <script>
             function selectcat(x, y) {
                    //alert(x);
                    ajax = new XMLHttpRequest();

                    ajax.open("GET", "../SubController?op=cat&id="+x, true);
                    ajax.send();
                    ajax.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200)
                            y.innerHTML = this.responseText;
                    };

                }
                function selectAll(){
				var items=document.getElementsByName('subcat');
				for(var i=0; i<items.length; i++){
					if(items[i].type=='checkbox')
						items[i].checked=true;
				}
			}
			
			function UnSelectAll(){
				var items=document.getElementsByName('subcat');
				for(var i=0; i<items.length; i++){
					if(items[i].type=='checkbox')
						items[i].checked=false;
				}
			}		
                </script>
        <jsp:include page="base.jsp"></jsp:include>
        </head>
        <body class="nav-fixed">
        <%
            if (session.getAttribute("vendor") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
              Vendor v = (Vendor) session.getAttribute("vendor");
            int id = v.getVendor_id();
        %>
        <jsp:include page="navbar.jsp"></jsp:include>

            <div id="layoutSidenav">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="page-header pb-10 page-header-dark bg-gradient-primary-to-secondary">
                            <div class="container-fluid">
                                <div class="page-header-content">
                                    <h1 class="page-header-title">
                                        <div class="page-header-icon"><i data-feather="activity"></i></div>
                                        <span>Sub-Category</span>
                                    </h1>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid mt-n10">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card mb-5">
                                        <div class="card-header">
                                            
                                            <h3>Add Sub-Category Details</h3>           
                                                    
                                        </div>
                                         <div class="card-body">   
                                             <table class="table text-success text-center">
                                                 <tr><td colspan="2">
                                                    <button  class="btn btn-outline-blue" type="button">Select Shop By Name</button></td></tr>
                                                <tr> 
                                             <%
                                             ShopDao sd= new ShopDao();
                                             ArrayList<Shop> spp= sd.getAllRecordsbyid(id);
                                             int count=0;
                                             for(Shop s:spp){
                                               
                                             
                                             %>
                                             
                                             <td>
                                                 <button  class="btn btn-cyan form-control" type="button">
                                                     <input type="checkbox" class="largerCheckbox form-control" value="<%=s.getShop_id()%>"><%=s.getShop_name()%></input>
                                                 </button> </td>  <% count++;  if(count==3){out.println("</tr>");
                                                  count=0;}else{out.println("&nbsp;&nbsp;");} }%>
                                                     
                                                 </tr>
                                             
                                                 <tr><td><button  class="btn btn-cyan form-control" ><label> Select Category</label></button></td>
                                                     <td>
                                                        
                                                         <select class="btn btn-cyan form-control"  id="cid" onclick="selectcat(this.value,tab);">
                                                             <option value="-1">Select Category</option>
                                                         <%
                                                         CategoryDao cd=new CategoryDao();
                                                         ArrayList<Category> c=cd.getAllRecords();
                                                         for(Category cat:c){
                                                         %>
                                                         <option value="<%=cat.getCategory_id()%>"><%=cat.getCategory_name()%></option>
                                                             <%}%>
                                                         </select>
                                                         
                                                     </td>
                                             </tr>
                                          
                                             </table>
                                                         <p>
		<input class="btn btn-primary" type="button" onclick='selectAll()' value="Select All"/>
		<input  class="btn btn-primary" type="button" onclick='UnSelectAll()' value="Unselect All"/>
	</p>
                                                         <table id="tab" class="table text-success text-center">
                                                             <tr>
                                                                 <td>
                                                                     View Sub_Category
                                                                 </td>
                                                             </tr>  
                                                         </table>
                                    

                                    </div>
                                </div>
                            </div>

                        </div>  
                </div>

            </main>
        <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
<jsp:include page="base1.jsp"></jsp:include>
</body>
</html>
