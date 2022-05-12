<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>


</head>

<body>
<div class="blank" >a</div>
<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">
	
    <ul class="sidebar-nav" id="sidebar-nav">


	<!-- ================ 공통코드관리 ================ -->
      <li class="nav-item">
      
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>공통코드관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="components-alerts.html">
              <i class="bi bi-circle"></i><span>INDEX</span>
            </a>
          </li>
        </ul>
	
      </li><!-- End Components Nav -->


	 <!-- ================ 영업관리 ================ -->
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>영업관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        
          <li>
            <a href="forms-elements.html">
              <i class="bi bi-circle"></i><span>INDEX</span>
            </a>
          </li>
          
        </ul>
        
      </li><!-- End Forms Nav -->

	 <!-- ================ 자재관리 ================ -->	
      <li class="nav-item">
      
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>자재관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        
          <li>
            <a href="orderForm">
              <i class="bi bi-circle"></i><span>발주관리</span>
            </a>
          </li>

          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>발주이력조회</span>
            </a>
          </li>

          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>입고관리</span>
            </a>
          </li>
          
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>LOT재고조회</span>
            </a>
          </li>
           
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>불량조회</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Tables Nav -->

	 <!-- ================ 생산관리 ================ -->	
      <li class="nav-item">
      
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>생산관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span>INDEX</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      <!-- ================ 품질관리 ================ -->	
      <li class="nav-item">
      
        <a class="nav-link collapsed" data-bs-target="#rows-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>품질관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        
        <ul id="rows-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span>INDEX</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      <!-- ================ 설비관리 ================ -->	
      <li class="nav-item">
      
        <a class="nav-link collapsed" data-bs-target="#labels-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-alarm"></i><span>설비관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        
        <ul id="labels-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span>INDEX</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      
      
	 <!-- ================ 토스트 UI  ================ -->
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>Toast UI 참조</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="toast">
              <i class="bi bi-circle"></i><span>토스트홈</span>
            </a>
          </li>
          <li>
            <a href="alert">
              <i class="bi bi-circle"></i><span>알림</span>
            </a>
          </li>
          <li>
            <a href="calendar">
              <i class="bi bi-circle"></i><span>캘린더</span>
            </a>
          </li>
          <li>
            <a href="modal">
              <i class="bi bi-circle"></i><span>모달</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-faq.html">
          <i class="bi bi-question-circle"></i>
          <span>F.A.Q</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-contact.html">
          <i class="bi bi-envelope"></i>
          <span>Contact</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-register.html">
          <i class="bi bi-card-list"></i>
          <span>Register</span>
        </a>
      </li><!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login.html">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Login</span>
        </a>
      </li><!-- End Login Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-error-404.html">
          <i class="bi bi-dash-circle"></i>
          <span>Error 404</span>
        </a>
      </li><!-- End Error 404 Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-blank.html">
          <i class="bi bi-file-earmark"></i>
          <span>Blank</span>
        </a>
      </li><!-- End Blank Page Nav -->

    </ul>

  </aside>
  <!-- End Sidebar-->

</body>