<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

</head>    
  
<body>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="home.do" class="logo d-flex align-items-center">
        <span class="d-none d-lg-block title" style=" color:#fad145 ; cursive;    font-family: 'GangwonEduPowerExtraBoldA'; font-style: italic;">YAFS</span>
        <span style="font-size: 11px; color:#ff8000; padding: 8px 0px 0px 7px ">Yedam Automize Factory System</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div>
    <!-- End Logo -->

   
    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
		<li class="nav-item">
		<button class="btn1" id="chat" onclick="chat">채팅</button>
		</li>
		<li class="nav-item">
		<button class="btn1" onclick="location.href='loginForm.do'">로그인</button>
		</li>
		  



          
          <c:if test="${not empty loginUser }">
        <li class="nav-item dropdown">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">${loginUser.emp_nm }</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">              
              <span>${userDept}</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="loginForm.do">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="userLogOut">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </c:if>

      </ul>
      
    </nav><!-- End Icons Navigation -->
     
  </header><!-- End Header -->
     <div id="test"></div>
</body>


<script>
chat.addEventListener("click", function(){
	$("#test").load("chatForm", function(){
		const myModal = new bootstrap.Modal('#myModal',{backdrop : false , keyboard: false});
		myModal.show();
		$('.modal-dialog').draggable({
		    handle: ".modal-header"
		  });
	})
	});

if('${message}' != ''){
	alert('${message}');
	location.href ='home.do';
}
</script>
</html>    