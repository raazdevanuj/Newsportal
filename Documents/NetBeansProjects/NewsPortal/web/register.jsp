<%-- 
    Document   : register
    Created on : 26 Feb, 2020, 10:20:59 PM
    Author     : Abhishek Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="base.jsp"></jsp:include>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

         <style>
             .register{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    margin-top: 3%;
    padding: 3%;
}
.register-left{
    text-align: center;
    color: #fff;
    margin-top: 4%;
}
.register-left input{
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 60%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 30%;
    margin-bottom: 3%;
    cursor: pointer;
}
.register-right{
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
}
.register-left img{
    margin-top: 15%;
    margin-bottom: 5%;
    width: 25%;
    -webkit-animation: mover 2s infinite  alternate;
    animation: mover 1s infinite  alternate;
}
@-webkit-keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
@keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
.register-left p{
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}
.register .register-form{
    padding: 10%;
    margin-top: 10%;
}
.btnRegister{
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 50%;
    cursor: pointer;
}
.register .nav-tabs{
    margin-top: 3%;
    border: none;
    background: #0062cc;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}
.register .nav-tabs .nav-link{
    padding: 2%;
    height: 34px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover{
    border: none;
}
.register .nav-tabs .nav-link.active{
    width: 100px;
    color: #0062cc;
    border: 2px solid #0062cc;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}
.register-heading{
    text-align: center;
    margin-top: 8%;
    margin-bottom: -15%;
    color: #495057;
}
             </style>
             <script>
                  function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                   pic.src= e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
         function comparePwds(x,y){
                if(x===y)
                    return true;
                else {
                    alert("Password and Confirm Password not matched !!");
                    return false;
                }
            }
                 </script>
    </head>
    <body>
      
<div class="container register">
                <div class="row">
                    <div class="col-md-2 register-left">
<!--                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                        <h3>Welcome</h3>-->
                       </div>
                   <form enctype="multipart/form-data" action="UserControl?op=Add" method="post" onsubmit="return comparePwds(password.value,rpassword.value);"> 
                    <h2 class="register-left">REPORTER REGISTRATION</h2>
                       <div class="col-md-12 register-right">
                     
                          
                                <div class="row register">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Name *"  required="required" name="name" />
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Your Email *"  required="required" name="email" />
                                        </div>
                                        <div class="form-group">
                                            <input type="number"   class="form-control" placeholder="Your Phone *"  required="required" name="phone" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text"  class="form-control" placeholder="User Id *"  required="required" name="userid" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Password *"  required="required" name="password" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control"   required="required" placeholder="Confirm Password *" name="rpassword" />
                                        </div>
                                      
                     </div>
                                    <div class="col-md-6">
                                        <img src="assets/Images/nophoto.jpg" style="width:200px;height: 200px" class="img form-control  " id="pic"/><br/>
                                        <input type="file" name="photo" id="photoInput" required="required" class="form-control "  onchange="readURL(this);" />
           
                                        <input type="submit" class="btnRegister"  value="Register"/>
                                    </div>
                    </form>
                                </div>
                            </div>
                           
               
        
                </div>
                    </div>
               
    
    
    </body>
</html>
