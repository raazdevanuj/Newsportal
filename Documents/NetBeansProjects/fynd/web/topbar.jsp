
<%@page import="com.beans.Admin"%>
<%@page import="com.daos.AdminDao"%>
<%@page import="com.beans.Vendor"%>
<%@page import="com.daos.VendorDao"%>
<div class="container">
    <div class="row">
        <div class="col-sm-4 hidden-xs">
            <span class="nav-text">
                <i class="fa fa-phone" aria-hidden="true"></i>  +123  8910   &nbsp;  &nbsp;
                <i class="fa fa-envelope" aria-hidden="true"></i> raazdevanuj@gmail.com</span>
        </div>
        <div class="col-sm-4 text-center hidden-xs"></div>
        <div class="col-sm-4 text-right hidden-xs">
            <button type="button" class="btn btn-sm ml-4" data-toggle="modal" data-target="#myModal">Login</button>
     
            <a>  &nbsp; or</a>
        
         <button type="button" class="btn btn-sm ml-4" data-toggle="modal" data-target="#Modal">Register</button>
        </div>
        

        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="container">
                        <h1 class="form-heading">login Form</h1>
                        <div class="login-form">
                            <div class="main-div">
                                <div class="panel">
                                    <h1>LOGIN</h1>
                                    <p>Please enter your username and password</p>
                                    <br/>
                                <span id="s1">
                                <% if (request.getParameter("msg")!=null)
                                    out.println("<font color='red' size='4'>"+request.getParameter("msg")+"</font>" );
                                %>
                                </span>
                                </div>
                                <form id="Login" >

                                    <div class="form-group">


                                        <input type="text" class="form-control" id="inputEmail" name="userid" placeholder="Username">

                                    </div>

                                    <div class="form-group">

                                        <input type="password" class="form-control" id="inputPassword"  name="password" placeholder="Password">

                                    </div>
                                    <div>
                                        <select class="form-control" name="role">
                                            <option class="form-control" value="log">Role</option>
                                            <option class="form-control" name="role" value="userLogin">Login as User</option>
                                            <option class="form-control" name="role" value="vendorLogin" >Login as Vendor</option>
                                            <option class="form-control" name="role" value="adminLogin">Login as admin</option>
                                        </select>
                                    </div>
                                    <div class="forgot">
                                        <a href="reset.html">Forgot password?</a>
                                    </div>
                                    <input type="submit" name="submit"  value="Login" class="btn btn-primary"/>

                                </form>
                            </div>
                            
                          <% 
    if(request.getParameter("submit")!=null) {
        
        String role = request.getParameter("role");
         if (role.equals("log")){
             out.println("<script>alert('Please Select any Role');</script>");
               out.println("<script>window.location='index.jsp'</script>");
             
              return;
        }  
         String userid = request.getParameter("userid");
       String  password = request.getParameter("password");
      //   System.out.println("111111111111");
          if(role.equals("vendorLogin")){
            VendorDao rd = new VendorDao();
            Vendor vendor = rd.isValid(userid, password);
            if (vendor!=null)
            {
                session.setAttribute("vendor",vendor);
                
                 out.println("<script>window.location='shop/dashboard.jsp'</script>");
                 out.println("<script>alert('Welcome :"+ vendor.getVendor_name()+ "');</script>");
            }
            else
            {
                 out.println("<script>alert('Invalid Userid or Password');</script>");
                out.println("<script>window.location='index.jsp'</script>");
                
                 
            }
        }
      if (role.equals("adminLogin")) {
         
            AdminDao ad = new AdminDao();
            Admin admin = ad.validateAdmin(userid, password);
            
            if(admin!=null) {
                
                session.setAttribute("admin", admin);
               
                 out.println("<script>window.location='admin/dashboard.jsp'</script>");
                  out.println("<script>alert('Welcome : Admin ');</script>");
                //response.sendRedirect("");
            }
            else {
                String msg="invalid userid or password";
                 out.println("<script>alert('Invalid Userid or Password');</script>");
                out.println("<script>window.location='index.jsp'</script>");
               
                 
            }
        }
        else
      {
         out.println("<script>window.location='index.jsp'</script>");  
      }
    }
               
          %>    
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="modal" id="Modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="container">
                        <h1 class="form-heading">Registration</h1>
                        <div class="login-form">
                            <div class="main-div">
                                <form>

                                    <div class="form-group">
                                        <a href="register.jsp" class="btn btn-primary">Register for Vendor</a>
                                    </div>
                                    <div class="form-group">
                                         <a href="#" class="btn btn-primary">Register for User</a>
                                       
                                    </div>

                                    
                                </form>
                            </div>
                            
                        </div>
                    </div>

                </div>
            </div>
        </div>
                                
                           
    </div>
</div>
                                