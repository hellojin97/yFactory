<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<head>


</head>

<body>
<div class="blank" >a</div>
<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">
  	<c:if test="${not empty loginUser.emp_no}">
   	<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#">
            <img src="${profile}" alt="Profile" class="rounded-circle" width="100px;" height="100px;" style="margin-right: 40px;">
            <p style="color: white;">
            	<br>  
            	${loginUser.emp_nm } <br>
            	${userDept }		 <br>
            	ID : ${loginUser.emp_no } 
            </p>
    </a><!-- End Profile Iamge Icon -->
            <button type="button" class="btn-warning btn-block" style="width: 100%" onclick="location.href='userLogOut'">로그아웃</button>
    </c:if>
    <c:if test="${empty loginUser.emp_no }">
            <button type="button" class="btn-warning btn-block" style="width: 100%" onclick="location.href='loginForm.do'">로그인</button>
    </c:if>
   	<hr>
    <ul class="sidebar-nav" id="sidebar-nav">

		
   <!-- ================ 공통코드관리 ================ -->
      <li class="nav-item">
      
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>공통코드관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="userOrderForm">
              <i class="bi bi-circle"></i><span>(사용자) 제품 주문</span>
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
            <a href="orderList">
              <i class="bi bi-circle"></i><span>주문서 조회</span>
            </a>
          </li>
          
            <li>
            <a href="bomList">
              <i class="bi bi-circle"></i><span>BOM 관리</span>
            </a>
          </li>                  
          
          <li>
             <a href="prodLotForm">
               <i class="bi bi-circle"></i><span>완제품 LOT 조회</span>
             </a>
          </li>
          
          <li>
             <a href="prodSafety">
               <i class="bi bi-circle"></i><span>완제품 안전재고 관리</span>
             </a>
          </li>
          
          <li>
             <a href="prodWrnote">
               <i class="bi bi-circle"></i><span>입/출고 조회</span>
             </a>
          </li>
          
          <li>
             <a href="prodRelease">
               <i class="bi bi-circle"></i><span>출고 관리</span>
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
            <a href="mtrlOrderForm">
              <i class="bi bi-circle"></i><span>원자재 발주등록</span>
            </a>
          </li>
        
          <li>
            <a href="mtrlListForm">
              <i class="bi bi-circle"></i><span>원자재 발주관리</span>
            </a>
          </li>

          <li>
            <a href="mtrlInsertForm">
              <i class="bi bi-circle"></i><span>원자재 입고관리</span>
            </a>
          </li>
          
          <li>
            <a href="mtrlInsertListForm">
              <i class="bi bi-circle"></i><span>원자재 입고조회</span>
            </a>
          </li>
          
          <li>
            <a href="mtrlLotForm">
              <i class="bi bi-circle"></i><span>LOT재고조회</span>
            </a>
          </li>
          
          <li>
            <a href="mtrlStorageForm">
              <i class="bi bi-circle"></i><span>원자재 재고조회</span>
            </a>
          </li>         
           
          <li>
            <a href="mtrlSafetyForm">
              <i class="bi bi-circle"></i><span>안전재고관리</span>
            </a>
          </li>
          
        </ul>
      </li>
      <!-- ================ END자재관리 ================ -->   

    <!-- ================ 생산관리 ================ -->   
      <li class="nav-item">
      
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>생산관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        
          <li>
            <a href="procPlMgt">
              <i class="bi bi-circle"></i><span>생산계획관리</span>
            </a>
          </li>
          <li>
            <a href="procPlSelect">
              <i class="bi bi-circle"></i><span>생산계획조회</span>
            </a>
          </li>
          <li>
            <a href="procOrderMng">
              <i class="bi bi-circle"></i><span>생산지시관리</span>
            </a>
          </li>
          <li>
            <a href="procOrderSelect">
              <i class="bi bi-circle"></i><span>생산지시조회</span>
            </a>
          </li>
          <li>
            <a href="procManagement">
              <i class="bi bi-circle"></i><span>생산관리</span>
            </a>
          </li>
          <li>
            <a href="procResult">
              <i class="bi bi-circle"></i><span>공정실적조회</span>
            </a>
          </li>
          <li>
            <a href="procProcessCtl">
              <i class="bi bi-circle"></i><span>공정관리</span>
            </a>
          </li>

          <li>
            <a href="procLineForm">
              <i class="bi bi-circle"></i><span>제품 공정 흐름도</span>
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
            <a href="qa_request">
              <i class="bi bi-circle"></i><span>품질검사요청</span>
            </a>
          </li>
          <li>
            <a href="qa_requestMgr">
              <i class="bi bi-circle"></i><span>품질검사관리</span>
            </a>
          </li>
          <li>
            <a href="qa_result">
              <i class="bi bi-circle"></i><span>품질검사결과</span>
            </a>
          </li>
          <li>
            <a href="qa_errlot">
              <i class="bi bi-circle"></i><span>불량내역조회</span>
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
            <a href="eqInsert">
              <i class="bi bi-circle"></i><span>설비등록</span>
            </a>
          </li>
          <li>
            <a href="eqMngPage">
              <i class="bi bi-circle"></i><span>설비관리</span>
            </a>
          </li>
          <li>
            <a href="eqChkMng">
              <i class="bi bi-circle"></i><span>설비 점검 관리</span>
            </a>
          </li>
          <li>
            <a href="eqIna">
              <i class="bi bi-circle"></i><span>설비 비가동 관리</span>
            </a>
          </li>
          <li>
            <a href="eqRstat">
              <i class="bi bi-circle"></i><span>실시간 설비 상태</span>
            </a>
          </li>
           <li>
            <a href="popupTest">
              <i class="bi bi-circle"></i><span>팝업테스트</span>
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

      

    </ul>

  </aside>
  <!-- End Sidebar-->

</body>