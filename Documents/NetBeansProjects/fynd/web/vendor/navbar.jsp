<%@page import="com.beans.Vendor"%>
<%@page import="com.daos.VendorDao"%>
<% VendorDao vd = new VendorDao();

                        Vendor vend = (Vendor) session.getAttribute("vendor");
                        String p = vd.getphotoid(vend.getVendor_id());
                        String t=vd.getnameid(vend.getVendor_id());
                         String u=vd.getemailid(vend.getVendor_id());
                    %>
<nav class="topnav navbar navbar-expand shadow navbar-light bg-white" id="sidenavAccordion">
    <a class="navbar-brand d-none d-sm-block" href="dashboard.jsp">Fyndal</a><button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 mr-lg-2" id="sidebarToggle" href="#"><i data-feather="menu"></i></button>
                <form class="form-inline mr-auto d-none d-lg-block">
                    <h4><%=t%></h4>
                    <!--<input class="form-control form-control-solid mr-sm-2" type="search" placeholder="Search" aria-label="Search">-->
                </form>
    <ul class="navbar-nav align-items-center ml-auto">

        <li class="nav-item dropdown no-caret mr-3 dropdown-notifications">
            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownAlerts" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="bell"></i></a>
            <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownAlerts">
                <h6 class="dropdown-header dropdown-notifications-header"><i class="mr-2" data-feather="bell"></i>Alerts Center</h6>
                <a class="dropdown-item dropdown-notifications-item" href="#!"><div class="dropdown-notifications-item-icon bg-warning"><i data-feather="activity"></i></div>
                    <div class="dropdown-notifications-item-content">
                        <div class="dropdown-notifications-item-content-details">December 29, 2019</div>
                        <div class="dropdown-notifications-item-content-text">This is an alert message. It&apos;s nothing serious, but it requires your attention.</div>
                    </div></a><a class="dropdown-item dropdown-notifications-item" href="#!"><div class="dropdown-notifications-item-icon bg-info"><i data-feather="bar-chart"></i></div>
                    <div class="dropdown-notifications-item-content">
                        <div class="dropdown-notifications-item-content-details">December 22, 2019</div>
                        <div class="dropdown-notifications-item-content-text">A new monthly report is ready. Click here to view!</div>
                    </div></a>  <a class="dropdown-item dropdown-notifications-footer" href="#!">View All Alerts</a>
            </div>
        </li>
        <li class="nav-item dropdown no-caret mr-3 dropdown-notifications">
            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownMessages" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="mail"></i></a>
            <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownMessages">
                <h6 class="dropdown-header dropdown-notifications-header"><i class="mr-2" data-feather="mail"></i>Message Center</h6>
            </div>
        </li>
          
        <li class="nav-item dropdown no-caret mr-3 dropdown-user">
            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i data-feather="user"> </i><img class="img-fluid" src="../<%=p%>"></a>
            <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                <h6 class="dropdown-header d-flex align-items-center">
                  
                    <img class="dropdown-user-img" src="../<%=p%>">
                    <div class="dropdown-user-details">
                        <div class="dropdown-user-details-name"><%=t%></div>
                        <div class="dropdown-user-details-email"><%=u%></div>
                    </div>
                </h6>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="viewprofile.jsp"><div class="dropdown-item-icon"><i data-feather="user"></i></div>User Profile</a>
                <a class="dropdown-item" href="changepass.jsp"><div class="dropdown-item-icon"><i data-feather="settings"></i></div>Change Password</a>
                <a class="dropdown-item" href="signout.jsp"><div class="dropdown-item-icon"><i data-feather="log-out"></i></div>Logout</a>
            </div>
        </li>
    </ul>
</nav>
