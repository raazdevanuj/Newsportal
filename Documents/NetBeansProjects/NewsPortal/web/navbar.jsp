<%
    String url = request.getRequestURI();
    request.setAttribute("url", url);
    %>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <h3 class="text-white">News Portal</h3>
<!--      <a class="navbar-brand" href="index.jsp">News Portal</a>-->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item ">
            <a class="nav-link ${url.contains("index.jsp")?" active":""}" href="index.jsp">
                <i class="fa fa-home">&nbsp; Home</i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link"  href="#"><i class="fa fa-about">About</i></a>
          </li>
          <li class="nav-item">
            <a class="nav-link "  href="#">Services</a>
          </li>
          <li class="nav-item">
              <a class="nav-link ${url.contains("contact.jsp")?" active":""}" href="contact.jsp"><i class="fa fa-address-book">&nbsp;Contact</i></a>
          </li>
          <li>
             <a class="nav-link ${url.contains("login.jsp")?" active":""}" href="login.jsp"><i class="fa fa-lock">&nbsp;Login</i></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
