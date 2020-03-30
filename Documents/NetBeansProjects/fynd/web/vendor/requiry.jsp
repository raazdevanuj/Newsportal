
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Dashboard - Vendor</title>
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
                    <div class="page-header pb-10 page-header-dark bg-gradient-primary-to-secondary">
                        <div class="container-fluid">
                            <div class="page-header-content">
                                <h1 class="page-header-title">
                                    <div class="page-header-icon"><i data-feather="activity"></i></div>
                                    <span>Dashboard</span>
                                </h1>
                                <div class="page-header-subtitle">Example dashboard overview and content summary</div>
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
