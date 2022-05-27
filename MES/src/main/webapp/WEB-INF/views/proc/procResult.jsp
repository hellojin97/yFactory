<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주관리</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
	<div style="padding-bottom:15px; color: ;">
		<h1>공정 실적 조회</h1>
	</div>
	<div class="min1">
	
	
	<h4>공정 실적 목록</h4>
	<div>
	<form>				
	<div class="col-md-12" style="padding-bottom: 10px;">
			
			<!-- 생산코드 -->
			<div class="col-md-12 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">생산지시코드</label> 
						<div class="col-sm-2">
							<input type="text" class="form-control" placeholder="생산지시코드" id="prdCd">
						</div>
						<a class="nav-link nav-icon search-bar-toggle" id="procCdBtn" onclick="procCdBtn">
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>											
					</div>
				</div>
	
			<!-- 공정명 -->
			<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group" style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 72px;">공정명</label>
						
							<input type="text" class="form-control" placeholder="공정명" id="procNm">
							
						<a class="nav-link nav-icon search-bar-toggle" id="procNmBtn" onclick="procNmBtn">
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>
						
						<input type="text" id="procCd" class="form-control" readonly="readonly">
												
					</div>
				</div>

			<!-- 계획일자 -->	
			<div class="col-md-8">
			<div class="input-group">
					<label for="inputText" class="col-form-label"
						style="padding-right: 58px;">계획일자</label>
					<div class="col-sm-3">
						<input type="date" class="form-control" id="req1">
					</div>

					<div style="padding: 0px 15px 0px 15px;">
						<p>~</p>
					</div>
					<div class="col-sm-3" style="padding-right: 20px;">
						<input type="date" class="form-control" id="req2">&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div>
						<button type="button" id="search" class="btn1">검색</button>							
							&nbsp;&nbsp;
						<button type="reset" id="reset" class="btn1">초기화</button>
					</div>	
				</div>
				</div>
			</div>
				</form>
				</div>
	<div id="procResultList"></div>
	</div>
	
<div id="procResultCdModal"></div>
<div id="procResultNmModal"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>
	

// 공정 실적 조회
$.ajax({
	url: "procResultList",
	method : "GET",
	dataType : "JSON",
	success : function(result){
		procResultList.resetData(result);
	}
});

var procResultList = new tui.Grid({
    el: document.getElementById('procResultList'),
    columns: [
    	{
            header: '생산지시코드',
            name: '생산지시코드'
          },
          {
            header: '진행공정코드',
            name: '진행공정코드'
          },
          {
            header: '공정명',
            name: '공정명'
          },
          {
            header: '설비코드',
            name: '설비코드'
          },
          {
              header: '설비명',
              name: '설비명'
            },
          {
              header: '투입량',
              name: '투입량'
            },
            {
                header: '생산량',
                name: '생산량'
              },
            {
                header: '불량량',
                name: '불량량'
              },
              {
                  header: '불량코드',
                  name: '불량코드'
                }
              ,{
                  header: '불량상세',
                  name: '불량상세'
                }
              ,{
                  header: '공정시작시간',
                  name: '공정시작시간'
                }
              ,{
                  header: '공정종료시간',
                  name: '공정종료시간'
                }
              ,{
                  header: '담당자',
                  name: '담당자'
                }
              ,{
                  header: '생산지시일자',
                  name: '생산지시일자'
                }
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 10
    }
  });

procCdBtn.addEventListener("click", function(){
	$("#procResultCdModal").load("procResultCdModal", function(){
		const cdModal = new bootstrap.Modal('#cdModal');
		cdModal.show();
	})
})
	
procNmBtn.addEventListener("click", function(){
	$("#procResultNmModal").load("procResultNmModal", function(){
		const nmModal = new bootstrap.Modal('#nmModal');
		nmModal.show();
	})
})

$("#search").on("click", function(){
	let prdCd = $("#prdCd").val();
	let procNm = $("#procNm").val();
	let req1 = $("#req1").val();
	let req2 = $("#req2").val();
	
	$.ajax({
		url : "",
		data : {
			
		}
	}).done(function(result){
		procResultList.resetData(result);
	})
})

  
</script>

</html>