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
			<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">생산지시코드</label> 
						<input type="text" class="form-control" style="width: 50px" placeholder="생산지시코드" id="prdCd">
							
						<a class="nav-link nav-icon search-bar-toggle" id="procCdBtn" onclick="procCdBtn">
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>											
					</div>
				</div>
	
			<!-- 공정명 -->
			<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group" style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">공정명</label>
						
							<input type="text" class="form-control" style="width: 50px" placeholder="공정명" id="procNm">
							
						<a class="nav-link nav-icon search-bar-toggle" id="procNmBtn" onclick="prodBtn">
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>
						
						<input type="text" id="eqCd" class="form-control" readonly="readonly">
												
					</div>
				</div>

			<!-- 계획일자 -->	
			<div class="col-md-8">
			<div class="input-group">
					<label for="inputText" class="col-form-label"
						style="padding-right: 10px;">계획일자</label>
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
	
	
		
		
	
	
	
	
<div id="test"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>
	 let ord = [];

// 공정 실적 조회
$.ajax({
	url: "",
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
            header: '생산코드',
            name: '생산코드'
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
                  header: '공정종료시간',
                  name: '공정종료시간'
                }
              ,{
                  header: '투입량',
                  name: '투입량'
                }
              ,{
                  header: '담당자',
                  name: '담당자'
                }
              ,{
                  header: '지시일자',
                  name: '지시일자'
                }
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 10
    }
  });

	

  
</script>

</html>