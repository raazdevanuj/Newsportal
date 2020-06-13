 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- You'll want to use a responsive image option so this logo looks good on devices - I recommend using something like retina.js (do a quick Google search for it and you'll find it) -->
                <a class="navbar-brand" href="index.jsp"><img src="media/slider1/loki.png" width='25'/> &nbsp; Fyndal</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right">
<!--                    <li><a href="about.jsp">About</a>
                    </li>-->
                    
                    <li><a href="contactus.jsp">Contact Us</a>
                    </li>
                    
                    <li>
                        <a data-toggle="modal" href="#myModal"><i class="fa fa-lock">&nbsp;Login</i></a>
                    </li><li>
                        <a data-toggle="modal" href="#Modal"><i class="fa fa-registered">&nbsp;Register</i>
                        </a> </li>
                         <li> <a data-toggle="modal" href="#Mdal"><i class="fa fa-">&nbsp;Choose Address</i></a>
                </li> 
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
<jsp:useBean class="com.beans.user" id="usee" scope="session"></jsp:useBean>
 <jsp:setProperty name="use" property="*"></jsp:setProperty>

     <div class="col-md-12"><label class="col-md-11">Current Location- ${use.city} ${use.locality},${use.pincode}</label></div>  
<br>

 
                          