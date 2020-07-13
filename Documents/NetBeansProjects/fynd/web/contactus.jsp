<!DOCTYPE html>
<html lang="en">

    <head>
        

        <title>Fyndal</title>
        <link rel="icon" href="media/slider1/loki.png"/>


        <link href="assets/css/bootstrap.css" rel="stylesheet">

        <link href="assets/css/modern-business.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/css/log.css" rel="stylesheet" type="text/css">
       
        <jsp:include page="base.jsp"></jsp:include>
<style>

                
                .contact-form{
                    background: #fff;
                    margin-top: 10%;
                    margin-bottom: 5%;
                    width:100%;
                }
                .contact-form .form-control{
                    border-radius:1rem;
                }
                .contact-image{
                    text-align: center;
                }
                .contact-image img{
                    border-radius: 6rem;
                    width: 11%;
                    margin-top:-10%;
                    transform: rotate(29deg);
                }
                .contact-form form{
                    padding: 0%;
                }
                .contact-form form .row{
                    margin-bottom: -7%;
                }
                .contact-form h3{
                    margin-bottom: 8%;
                    margin-top: -10%;
                    text-align: center;
                    color: #0062cc;
                }
                .contact-form .btnContact {
                    width: 50%;
                    border: none;
                    border-radius: 1rem;
                    padding: 1.5%;
                    background: #dc3545;
                    font-weight: 600;
                    color: #fff;
                    cursor: pointer;
                }
                .btnContactSubmit
                {
                    width: 50%;
                    border-radius: 1rem;
                    padding: 1.5%;
                    color: #fff;
                    background-color: #0062cc;
                    border: none;
                    cursor: pointer;
                }
            </style>
        </head>

        <body>
            <nav class="top-bar"><jsp:include page="topbar.jsp"></jsp:include></nav>
            <jsp:include page="navbar.jsp"></jsp:include>

        <jsp:include page="slider.jsp"></jsp:include>

       <div class="section">

        <div class="container">

            <div class="row">
           
                  <div class="contact-form col col-md-9 bg-danger">
                                
                                <form method="post">
                                    <h3>Drop Us a Message</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="text" name="name" class="form-control" placeholder="Your Name *" value="" />
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="email" class="form-control" placeholder="Your Email *" value="" />
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="contact" class="form-control" placeholder="Your Phone Number *" value="" />
                                            </div>
                                            <div class="form-group">
                                                <input type="submit" name="submit" class="btnContact" value="Send Message" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <textarea name="message" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        
            </div>
              <h3 class="bg-primary text-left">
              
                Fyndal is developed in concern of saving time and 
	effort  of going to market and investigating whether 
	the same is available or not.
</h3>
        </div>
          
       </div>
        
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="assets/js/jquery-1.10.2.js"></script>
        <script src="assets/js/bootstrap.js"></script>
        <script src="assets/js/modern-business.js"></script>
    </body>

</html>
