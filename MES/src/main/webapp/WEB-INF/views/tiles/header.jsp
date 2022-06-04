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