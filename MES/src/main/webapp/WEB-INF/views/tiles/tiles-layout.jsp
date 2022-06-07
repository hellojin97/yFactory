<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>YFactory</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<!-- JQUERY -->
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
<!-- 엑셀 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>  
<!-- Favicons -->
   <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
   <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Google Fonts -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!-- Vendor CSS Files -->
   <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css" rel="stylesheet">
   
<!-- toastr.CSS -->
   <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></link>
<!-- toastr.JS -->
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   
<!-- Toast UI AND Modal -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
   <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
   <script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.js"></script>
   <script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
<!-- Template Main CSS File -->
   <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"> 
<!-- Date Picker -->   
   <link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
   <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<!-- JQUERY timePicker -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- Toast UI AND Modal -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>
<style type="text/css"> 
  /* 폰트 */ 
   .fontClass {
   	font-family: GongGothicLight;
   }
	@font-face {
    font-family: 'GongGothicLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
 	.font_fm, h1,h2, h3, h4, h5, p{
 		font-family: GongGothicLight;
 	}
   #header {
      width: 100%;
      height: 50px;
      text-align: center;
   }  
   #menu {
      float: left;
      width: 5%;
   }  
   #body {
      float: left;
      width: 95%;
      padding-top: 80px;
   }  
   #menu, #body{
      min-height: 600px;
   } 
   .title {
      font-family: 'Permanent Marker', cursive;
   }
</style>

</head>
<!-- 타일즈 -->
<body>
   <div id="header" class="font_fm"><tiles:insertAttribute name="header" /></div>
   <div id="menu" class="font_fm"><tiles:insertAttribute name="menu" /></div>
   <div id="body" class="font_fm"><div class="container"><tiles:insertAttribute name="body" /></div></div>
   <!-- Vendor JS Files -->
      <script src="${pageContext.request.contextPath}/assets/vendor/apexcharts/apexcharts.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/vendor/chart.js/chart.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/vendor/echarts/echarts.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/vendor/quill/quill.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/vendor/simple-datatables/simple-datatables.js"></script>
      <script src="${pageContext.request.contextPath}/assets/vendor/tinymce/tinymce.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
   <!-- Template Main JS File -->
      <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>