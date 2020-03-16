<%-- 
    Document   : login
    Created on : 27 Feb, 2020, 10:20:35 PM
    Author     : Abhishek Kumar
--%>

<%@page import="com.utility.SmsSender"%>
<%@page import="java.util.concurrent.ThreadLocalRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="icon" href="assets/Images/photo2.jpg"/>
        <jsp:include page="base.jsp"></jsp:include>
<style>
  
html,body{
background-image: url('assets/images/544750.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
 </style>
    </head>
    <body class="bg-secondary">
      
            <!-- Navigation -->
        <jsp:include page="navbar.jsp"></jsp:include>

            <!-- Page Content -->
  
            <div class="container">

                <div class="row">

                <%-- <jsp:include page="sidebar.jsp"></jsp:include> --%>
                <!-- /.col-lg-3 -->
                <div class="col-md-4"></div>
                <div class="col-md-8">
                    <%--<jsp:include page="slider.jsp"></jsp:include>--%>

                    <div class="row">
                        
                        <div class="d-flex justify-content-center h-100" style="margin-top: 15%; ">
		<div class="card">
                    
			<div class="card-header">
                            <h3>Forget Password</h3>
                                <br/>
                                <span id="s1">
                                <% if (request.getParameter("msg")!=null)
                                    out.println("<font color='red' size='4'>"+request.getParameter("msg")+"</font>" );
                                %>
                                </span>
				
			</div>
			<div class="card-body">
                            <form action="forget.jsp" method="post">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
                                            <input type="text" class="form-control" placeholder="username" name="name" required="required"  onfocus="s1.innerHTML='';" autocomplete="off" >
						
					</div>
					
					<div class="form-group">
                                            <center><input type="submit" name="submit" value="Next" class="btn  login_btn"></center>
					</div>
				</form>
			</div>
			
		</div>
	</div>
                        </div>


                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

     
        <!-- /.container -->

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Bootstrap core JavaScript -->
        <%
            
            
       if(request.getParameter("submit")!=null){
           String user=request.getParameter("name");
           Connection con=null;
         PreparedStatement smt=null;
                 try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
                String sql="select contact from reporter where email=? ";
                smt=con.prepareStatement(sql);
                smt.setString(1,user);
               
                ResultSet rs= smt.executeQuery();
                
                if(rs.next()){
                    String contact=rs.getString(1);
                      int otp=ThreadLocalRandom.current().nextInt(100000,999999);
                         String output=SmsSender.sendCampaign("J2D1AOM721DSLE41CES22OUGXQMXIUQ0","DX96PF4PNZFO3BUF", "stage",contact,String.valueOf(otp) , "Rahul");
                         HttpSession session1=request.getSession();
                         session1.setAttribute("otp", String.valueOf(otp));
                response.sendRedirect("welcome.jsp?contact="+rs.getString("contact"));     
                }
                else
                {
                    response.sendRedirect("login.jsp?msg=Invaild Userid or Password");
                   con.close();
                   smt.close();
                }
            }
          catch(Exception e)
          {
              System.out.println("Error"+e.getMessage());
          }
       }
            %>
    </body>

</html>
