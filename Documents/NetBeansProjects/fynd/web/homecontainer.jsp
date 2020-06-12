<%@page import="com.beans.Sub_category"%>
<%@page import="com.daos.Sub_CategoryDao"%>
<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.CategoryDao"%>
 
 <script>

                function selectsub(x, y) {
                    //alert(x);
                    ajax = new XMLHttpRequest();

                    ajax.open("GET", "./ProductController?op=sub&id=" + x, true);
                    ajax.send();
                    ajax.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200)
                            y.innerHTML = this.responseText;
                    };

                }
                function selectsh(x){
                   var val1=x.options[x.selectedIndex].value;
                   if(val1==-1) alert('Please select Category First ans Sub-Category');
                   else
                    window.location.assign("viewshops.jsp?sid="+val1);
                }
            </script>    
<div class="section">

        <div class="container">

            <div class="row">
              <div class="card">
                  <div class="card-footer">
                <h4 class="text-center border-danger-soft"> 
                    <select name="category_id" id="cid" onchange="selectsub(this.value, sid)">
                        <option value="-1">Select Category Name</option>

                        <%
                            CategoryDao cd = new CategoryDao();
                            ArrayList<Category> cat = cd.getAllRecords();
                            for (Category sd : cat) {
                        %>
                        <option value="<%=sd.getCategory_id()%>"><%=sd.getCategory_name()%></option>
                        <%}%>
                    </select>
                    <select name="sub_category_id" id="sid">
                        <option value="-1"> Select Sub-Category Name</option>
                    </select>

                    <button id="search"  class="bg-warning" onclick="selectsh(sid)"><i class="fa fa-search">Search</i></button>
                </h4>                                
                  </div>
            </div>
                <div class="col-lg-12 text-center">
                    <h2>Here Some Popular Category</h2>
                    <hr>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="sub_catindex.jsp?id=<%=101%>">
                        <h3 class="text-center">Home Appliances</h3>
                        <img class="img-responsive img-home-portfolio" src="media/slider1/photo1.jpg" width="700" height="300">
                        
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="sub_catindex.jsp?id=<%=102%>">
                        <h3 class="text-center">Books</h3>
                       <img class="img-responsive img-home-portfolio" src="media/slider1/photo2.jpg" width="700" height="250">
                       
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="sub_catindex.jsp?id=<%=104%>">
                        <h3 class="text-center">Clothes</h3>
                       <img class="img-responsive img-home-portfolio" src="media/slider1/photo3.jpg" width="700" height="250">
                       
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="sub_catindex.jsp?id=<%=105%>">
                          <h3 class="text-center">Computer & Accessories</h3>
                       <img class="img-responsive img-home-portfolio" src="media/slider1/photo4.jpg" width="700" height="250">
                       
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="sub_catindex.jsp?id=<%=103%>">
                         <h3 class="text-center">Beauty Products</h3>
                       <img class="img-responsive img-home-portfolio" src="media/slider1/photo7.jpg" width="700" height="250">
                       
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="sub_catindex.jsp?id=<%=108%>">
                          <h3 class="text-center">Grocery</h3>
                       <img class="img-responsive img-home-portfolio" src="media/slider1/photo6.jpg" width="700" height="250">
                       
                    </a>
                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

    </div>
    <!-- /.section -->
  <h2 class="text-center">Here Some Popular Shop and their Offers</h2>
    <div class="section-colored">
       
        <div class="container">

            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <h2>RBTO.SHOP</h2>
                    <ul>
                        <li>It has Amazing offer</li>
                        <li>Reach Shop today</li>
                        <li> <strong>Upto 50% off</strong></li>
                       
                    </ul>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <img class="img-responsive" src="media/slider1/banner1.jpg">
                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

    </div>
    <!-- /.section-colored -->

    <div class="section">

        <div class="container">

            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <img class="img-responsive" src="media/slider1/banner2.jpg">
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <h2>NEW TECHNOLOGY INTRODUCED</h2>
                    <ul>
                        <li>Buy one and get one</li>
                        <li>Mobile Responsive Design</li>
                        
                    </ul>
                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

    </div>
    <!-- /.section -->
