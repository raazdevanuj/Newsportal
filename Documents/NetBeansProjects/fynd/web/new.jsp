
<html>
    <head>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"  crossorigin="anonymous">
        <jsp:include page="base.jsp"></jsp:include>
            <script>

                function readURL(input, preview) {
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
            <nav class="top-bar">

            <jsp:include page="topbar.jsp"></jsp:include> 
            </nav>
        <jsp:include page="navbar.jsp"></jsp:include>

<jsp:useBean class="com.beans.Vendor" id="vendor" scope="session"></jsp:useBean>
          <section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">E-COMMERCE CONTACT</h1>
        <p class="lead text-muted mb-0">Contact Page build with Bootstrap 4 !</p>
    </div>
</section> 
               
             <center>
        <div class="container">
            <div class="row">
                <div class="col-md-3" style="position:absolute;right:0px;">
                    <%if (request.getParameter("submit")!=null){%>
                    <jsp:setProperty name="vendor" property="*"></jsp:setProperty>
                    <form action="VendorController?op=add" method="post" enctype="multipart/form-data">
                        <div class="card">     
                            <div class="card-header bg-primary text-white"><i class="fa fa-registered"></i> add Photo Here</div>
                    <img scr="" style="width:200px; height: 200px;" id="preview" class="form-control"/> <br/>
                    <input type="file" name="image" onchange="readURL(this,preview);" class="form-control btn btn-success"/> <br/>
                    <input type="submit" value="Save to Data base " class="btn btn-primary" name="submit"/>
                    </form>
                    <%
                }%>
                </div>
                </div>
                
                
                
                <div class="col col-md-9">
                    <form method="post" class="form">
                         <div class="card">
                <div class="card-header bg-primary text-white"><i class="fa fa-registered"></i> Fill Vendor Details Here
                </div>
                        <table class="table">
                            
                                <td>Enter Name </td>
                                <td><input type="text" name="vendor_name" class="form-control" value="${vendor.vendor_name}"/></td>
                            </tr> 
                            <tr>
                                <td>Enter Contact </td>
                                <td><input type="text" name="mobile" class="form-control" value="${vendor.mobile}"/></td>
                            </tr> 
                            
                             <tr>
                                <td>Enter Email </td>
                                <td><input type="email" name="email_id" class="form-control" value="${vendor.email_id}"/></td>
                            </tr>                       
                             <tr>
                                <td>Enter Username </td>
                                <td><input type="text" name="userid" class="form-control" value="${vendor.userid}"/></td>
                            </tr> 
                            
                              <tr>
                                <td>Enter Password </td>
                                <td><input type="password" name="password" class="form-control" value="${vendor.password}"/></td>
                            </tr> 
                           
                            <input type="hidden" name="status" value="approved"/>
                        </table>
                            <input type="submit" value="save and Next" name="submit" id ="submit" class="form-control btn btn-primary"/>
                    </form>
                </div>
                
                 
            </div>
        </div>
    </center>
                      

        <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>