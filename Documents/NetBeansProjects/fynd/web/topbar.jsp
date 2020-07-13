
<%@page import="com.beans.user"%>
<%@page import="com.daos.UserDao"%>
<%@page import="com.beans.Admin"%>
<%@page import="com.daos.AdminDao"%>
<%@page import="com.beans.Vendor"%>
<%@page import="com.daos.VendorDao"%>
<!--<div class="container">
    <div class="row">
        <div class="col">
           
        </div>
        <div class="col-sm-4 text-center hidden-xs"></div>
        <div class="col-sm-4 text-right hidden-xs">
            </div>
    </div>
</div>-->

<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="login-form">
            <div class="main-div">
                <div class="panel">
                    <h1>LOGIN</h1>
                    <p>Please enter your username and password</p>
                    <br/>
                    <span id="s1">
                        <% if (request.getParameter("msg") != null) {
                                out.println("<font color='red' size='4'>" + request.getParameter("msg") + "</font>");
                            }
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
                    <input type="submit" name="sumit"  value="Login" class="btn btn-primary"/>

                </form>
            </div>

            <%
                if (request.getParameter("sumit") != null) {

                    String role = request.getParameter("role");
                    if (role.equals("log")) {
                        out.println("<script>alert('Please Select any Role');</script>");
                        out.println("<script>window.location='index.jsp'</script>");

                        return;
                    }
                    String userid = request.getParameter("userid");
                    String password = request.getParameter("password");
                    //   System.out.println("111111111111");
                    if (role.equals("vendorLogin")) {
                        VendorDao rd = new VendorDao();
                        Vendor vendor = rd.isValid(userid, password);
                        if (vendor != null) {
                            session.setAttribute("vendor", vendor);

                            out.println("<script>window.location='vendor/dashboard.jsp'</script>");
                            out.println("<script>alert('Welcome :" + vendor.getVendor_name() + "');</script>");
                        } else {
                            out.println("<script>alert('Invalid Userid or Password');</script>");
                            out.println("<script>window.location='index.jsp'</script>");

                        }
                    }
                    if (role.equals("adminLogin")) {

                        AdminDao ad = new AdminDao();
                        Admin admin = ad.validateAdmin(userid, password);

                        if (admin != null) {

                            session.setAttribute("admin", admin);

                            out.println("<script>window.location='admin/dashboard.jsp'</script>");
                            out.println("<script>alert('Welcome : Admin ');</script>");
                            //response.sendRedirect("");
                        } else {
                            String msg = "invalid userid or password";
                            out.println("<script>alert('Invalid Userid or Password');</script>");
                            out.println("<script>window.location='index.jsp'</script>");

                        }
                    }

                    if (role.equals("userLogin")) {

                        UserDao usee = new UserDao();
                        user use = usee.isValid(userid, password);

                        if (use != null) {

                            session.setAttribute("use", use);
                            out.println("<script>alert('Welcome :" + use.getName() + "');</script>");
                            out.println("<script>window.location='index.jsp'</script>");
                            // out.println("<script>alert('Welcome : Admin ');</script>");
                            //response.sendRedirect("");
                        } else {
                            String msg = "invalid userid or password";
                            out.println("<script>alert('Invalid Userid or Password');</script>");
                            out.println("<script>window.location='index.jsp'</script>");

                        }
                    } else {
                        out.println("<script>window.location='index.jsp'</script>");
                    }
                }
            %>    
        </div>
    </div>

</div>

<div class="modal" id="Modal">
    <div class="modal-dialog">
        <div class="login-form">
            <div class="main-div">
                <form>

                    <div class="form-group">
                        <a href="register.jsp" class="btn btn-primary">Register for Vendor</a>
                    </div>
                    <div class="form-group">
                        <a href="register1.jsp" class="btn btn-primary">Register for User</a>

                    </div>


                </form>
            </div>

        </div>
    </div>

</div>

<div class="modal" id="Mdal">
    <div class="modal-dialog">
        <div class="login-form">
            <div class="main-div">
                <form>

                    <div class="form-group">


                        <input type="text" class="form-control" id="City" name="City" placeholder="City">

                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="Locality" name="Locality" placeholder="Locality">
                    </div>
                    <div class="form-group">


                        <input type="number" class="form-control" id="Pincode" name="Pincode" placeholder="Pincode">

                    </div>


                    <input type="submit" name="conti"  value="continue" class="btn btn-primary"/>



                </form>
            </div>

        </div>
    </div>
       
</div>





