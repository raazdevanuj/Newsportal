<%@page import="com.beans.Subscriber"%>
<%@page import="com.daos.NewsDao"%>
<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.CategoryDao"%>
<%@page import="com.daos.SubscriberDao"%>
<div class="col-lg-3">

        <h3 class="my-4">Categories</h3>
        <div class="list-group">
            <a href="index.jsp" class="list-group-item  <%if(request.getParameter("catid")==null)out.println(" active"); %>"> All News </a>
     
            <% 
                NewsDao nd = new NewsDao(); 
                CategoryDao cd = new CategoryDao();
                ArrayList<Category> catList = cd.getAllRecords();
                for(Category c : catList){%>
                <a href="index.jsp?catid=<%=c.getId()%>" class="list-group-item <%if((request.getParameter("catid")!=null) && request.getParameter("catid").equals(String.valueOf(c.getId()))) out.println(" active"); %>"><%=c.getName()%> <span class="badge badge-secondary">
                        <%=nd.getApprovedCount(c.getId())%> </span></a>
          <%}%>
                 
                           
    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#myModal">
    Subscribe Us
    </button>
   
           
        </div>
  
     <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Fill the Basic Details</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
           <form method="post" class="form bg-light">
               <input type="text" placeholder="Enter Name" name="name" class="form-control" required="required"> <br/><br/>
               <input type="email" name="email" placeholder="Enter your email" class="form-control" required="required"/> <br/><br/>
                        <input type="submit" value="Subscribe" class="btn btn-dark form-control" name="submit"/>
         </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>           
    </div>        

  </div>
</div>
          
          
<% if(request.getParameter("submit")!=null){%>
<jsp:useBean id="sub" class="com.beans.Subscriber" scope="request"></jsp:useBean>
<jsp:setProperty name="sub" property="*"></jsp:setProperty>
<% SubscriberDao sd = new SubscriberDao();
if(sd.add(sub))
    out.println("<script>alert('You have successfully subscriber');</script>");
else
    out.println("<script>alert('Request cannot be completed !');</script>");

}%>