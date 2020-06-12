<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Fyndal</title>
<link rel="icon" href="media/slider1/loki.png"/>
    
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"  crossorigin="anonymous">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
   
    <link href="assets/css/modern-business.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/log.css" rel="stylesheet" type="text/css">
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
    <nav class="top-bar"><jsp:include page="topbar.jsp"></jsp:include></nav>
   <jsp:include page="navbar.jsp"></jsp:include>

     <jsp:include page="slider.jsp"></jsp:include>
<jsp:useBean class="com.beans.Vendor" id="vendo" scope="session"></jsp:useBean>
<br>
       
<div class="section">
    <center>
        <div class="container">

            <div class="row">
                 <div class="col-md-3" style="position:absolute;right:0px;">
                    <%if (request.getParameter("submit")!=null){%>
                    <jsp:setProperty name="vendo" property="*"></jsp:setProperty>
                    <form action="VendorController?op=add" method="post" enctype="multipart/form-data">
                        <div class="card">     
                            <div class="card-header bg-primary text-white"><i class="fa fa-registered"></i> add Photo Here</div>
                    <img src="" style="width:200px; height: 200px;" id="preview" class="form-control"/> <br/>
                    <input type="file" name="photo" onchange="readURL(this,preview);" class="form-control btn btn-success"/> <br/>
                    <input type="submit" value="Register" class="btn btn-primary" name="submit"/>
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
                                <td><input type="text" name="vendor_name" class="form-control" value="${vendo.vendor_name}"/></td>
                            </tr> 
                            <tr>
                                <td>Enter Contact </td>
                                <td><input type="text" name="mobile" class="form-control" value="${vendo.mobile}"/></td>
                            </tr> 
                            
                             <tr>
                                <td>Enter Email </td>
                                <td><input type="email" name="email_id" class="form-control" value="${vendo.email_id}"/></td>
                            </tr>                       
                             <tr>
                                <td>Enter Username </td>
                                <td><input type="text" name="userid" class="form-control" value="${vendo.userid}"/></td>
                            </tr> 
                            
                              <tr>
                                <td>Enter Password </td>
                                <td><input type="password" name="password" class="form-control" value="${vendo.password}"/></td>
                            </tr> 
                           
                            <input type="hidden" name="status" value="approved"/>
                        </table>
                            <input type="submit" value="save and Next" name="submit" id ="submit" class="form-control btn btn-primary"/>
                    </form>
                </div>
                
            </div>        
        </div>
     </div>                        
        <!-- /.container -->
        </center>
    </div>
    <!-- /.section -->

     
     
    <jsp:include page="footer.jsp"></jsp:include>
  <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/modern-business.js"></script>
</body>

</html>
