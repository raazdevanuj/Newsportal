
<!DOCTYPE html>
<html>
    <head>
       
        <title>Dashboard - Vendor</title>
        <link rel="icon" href="media/slider1/loki.png"/>
        <jsp:include page="base.jsp"></jsp:include>
    </head>
    <body class="nav-fixed">
        <%
            if (session.getAttribute("vendor") == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
            %>
    <jsp:include page="navbar.jsp"></jsp:include>
    
        <div id="layoutSidenav">
        <jsp:include page="sidebar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div>
                        <div class="container-fluid">
                            <div class="page-header-content">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon"><i data-feather="activity"></i>
                                    <span>Dashboard</span></div>
                                </h1>
                                
                            </div>
                        </div>
                    </div>
                <%--<jsp:include page="container.jsp"></jsp:include>--%>  
                    
                </main>
            <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
            <jsp:include page="base1.jsp"></jsp:include>
    </body>
</html>
