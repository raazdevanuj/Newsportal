  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3"> ${admin.name}'s  DashBoard  </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
          <a class="nav-link" href="dashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
  

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Manage News </span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Actions...</h6>
            <a class="collapse-item" href="viewAllNews.jsp">View All News</a>
            <a class="collapse-item" href="pendingnews.jsp">View Pending News</a>
            <a class="collapse-item" href="approvednews.jsp">View Approved News</a>
          </div>
        </div>
      </li>
 <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">
     
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Manage Reporter </span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Actions...</h6>
            <a class="collapse-item" href="addReporter.jsp">Add Reporters</a>
            <a class="collapse-item" href="viewallrep.jsp">View All Reporters</a>
           
         </div>
        </div>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider">

       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Reports</span>
        </a>
        <div id="collapseFour" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Actions...</h6>
            <a class="collapse-item" href="categorybasednews.jsp">Category based News</a>
            <a class="collapse-item" href="reporterbasednews.jsp">Reporter based News</a>
            <a class="collapse-item" href="fliter.jsp">Filter News </a>
          </div>
        </div>
      </li> 

      

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">
        <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Other Action</span>
        </a>
        <div id="collapseFive" class="collapse" aria-labelledby="heading" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Actions...</h6>
            <a class="collapse-item" href="viewsub.jsp">View Subscribers</a>
            <a class="collapse-item" href="viewenq.jsp">View Enquiry</a>
        </div>
        </div>
      </li> 
 <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">
     
      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>