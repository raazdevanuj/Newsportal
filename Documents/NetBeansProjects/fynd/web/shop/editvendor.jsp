<%@page import="com.beans.Vendor"%>
<%@page import="com.daos.VendorDao"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Vendor Profile
        </title>
        <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />

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

        <body class="">
        <%
            if (session.getAttribute("vendor") == null) {
                response.sendRedirect("../index.jsp");
                return;
                
            }
            else{
                
        // Vendor vend=(Vendor) session.getAttribute("vendor");
            }
         
        %>
        <div class="wrapper ">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div class="main-panel">
                    <!-- Navbar -->
                <jsp:include page="navbar.jsp"></jsp:include>
                 
                <jsp:useBean class="com.beans.Vendor" id="vend" scope="session"></jsp:useBean>
                 <% 
            int id=request.getParameter("id")==null?-1:Integer.parseInt(request.getParameter("id"));
               VendorDao vd=new VendorDao();
           if(vend!=null){
          
               vend=vd.getByid(id);
           session.setAttribute("vend",vend);
          
           }
           //System.out.println(scd.getCategory_id());
           %>
                <jsp:setProperty name="vend" property="*"></jsp:setProperty>
               
                    <!-- End Navbar -->
                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                      <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header card-header-primary">
                                        <h4 class="card-title">Edit Profile</h4>
                                        <p class="card-category">Complete your profile</p>
                                    </div>
                                    <div class="card-body">
                                        <form method="post" class="form">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="bmd-label-floating">Vendor's Name</label>
                                                        <input type="text"  name="vendor_name" class="form-control" value="${vend.vendor_name}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="bmd-label-floating">Mobile</label>
                                                        <input type="text" name="mobile" class="form-control" value="${vend.mobile}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="bmd-label-floating">Email</label>
                                                        <input type="email" name="email_id" class="form-control" value="${vend.email_id}">
                                                    </div>
                                                </div>
                                            </div>


                                            <input type="submit" value="Next" name="sumit" id ="sumit" class="btn btn-primary pull-right"/>
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                </div> 
                            </div>
                                                    
                             <div class="col-md-4">
                                <div class="card card-profile">
                                       <%if (request.getParameter("sumit") != null) {%>
                                        <div class="card-header card-header-primary">
                                    
                                        <p class="card-category">Update your profile photo</p>
                                    </div>
                                      
                                <form action="../VendorController?op=update" method="post" enctype="multipart/form-data">
                                        <div class="card card-profile align-center">     
                                                  
                                            <center> <img src="../${vend.photo}" style="width:150px; height: 150px;" id="preview" class="form-control"/> <br/>
                                            <input  type="file" name="photo" onchange="readURL(this, preview);" class="form-control btn btn-success"/></center> <br/>
                                        <input type="submit" value="Update" class="btn btn-primary btn-round" name="submit"/>
                                    </div>
                                </form>
                                <%
                    
                                            }%>

                                </div>
                            </div>                        
                            
                        </div>
                    </div>
                </div>

                <jsp:include page="footer.jsp"></jsp:include>  
                </div>
            </div>
        <jsp:include page="settings.jsp"></jsp:include>
    </body>

</html>