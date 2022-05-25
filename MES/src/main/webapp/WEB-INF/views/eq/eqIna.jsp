<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
	<div style="padding-bottom:15px; color: ;">
		<h1>설비 비가동 관리</h1>
	</div>
	<div class="min1">
	
	
	<h4>설비 가동 상태</h4>
			<!-- 구분 -->				
			<fieldset class="col-md-5" style="padding-bottom: 10px;">				
               	<div class="input-group">
              		<p style="padding-right: 30px;">구분</p>
	                  <div class="form-check">
	                    <input class="form-check-input" type="radio" name="radios" id="1" value="1" checked>
	                    <label class="form-check-label" for="gridRadios1" style="padding-right: 10px;">
	                      전체
	                    </label>
	                  </div>
	                  <div class="form-check">
	                    <input class="form-check-input" type="radio" name="radios" id="2" value="2">
	                    <label class="form-check-label" for="gridRadios2" style="padding-right: 10px;">
	                      가동
	                    </label>
	                  </div>
	                  <div class="form-check">
	                    <input class="form-check-input" type="radio" name="radios" id="3" value="3">
	                    <label class="form-check-label" for="gridRadios3" style="padding-right: 10px;">
	                      비가동
	                    </label>
	                  </div>        
                  </div>                              
              </fieldset>
     <!-- 설비 목록 -->         
	<div id="eqList"></div>
	
	<hr style="border: solid 1px gray;">

	<h4>비가동 설비 목록</h4>
	<div class="col-md-12" style="padding-bottom: 10px;">

			<!-- 해당일자 -->					
			<div class="input-group">
					<label for="inputText" class="col-form-label"
						style="padding-right: 10px;">해당일자</label>
					<div class="col-sm-2">
						<input type="date" class="form-control" id="req1">
					</div>

					<div style="padding: 0px 15px 0px 15px;">
						<p>~</p>
					</div>
					<div class="col-sm-2" style="padding-right: 20px;">
						<input type="date" class="form-control" id="req2">
					</div>
				</div>
			</div>
			
			<!-- 설비명 -->
			<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">설비명</label> 
							<input type="text" class="form-control" style="width: 50px" placeholder="설비명" id="eqNm">
						<a class="nav-link nav-icon search-bar-toggle" id="prodBtn" onclick="prodBtn">
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>
						<input type="text" id="eqCd" class="form-control" readonly="readonly">
					</div>
				</div>
	<!-- 비가동 설비 목록 -->
	<div id="eqInaList" style="padding-bottom:15px;"></div>	
	</div>
		
		
	
	
	
	
<div id="test"></div>
<input type="hidden" id="inEqCd"> 
<input type="hidden" id="inEqNm">
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>


	

// 설비 목록
$.ajax({
	url: "getEqActStatListAjax",
	method : "GET",
	dataType : "JSON",
	success : function(result){		
		eqList.resetData(result);
	}
});

var eqList = new tui.Grid({
    el: document.getElementById('eqList'),
    columns: [
    	{
            header: '설비코드',
            name: '설비코드'
          },
          {
            header: '설비명',
            name: '설비명'
          },
          {
            header: '공정코드',
            name: '공정코드'
          },
          {
            header: '공정명',
            name: '공정명'
          },
          {
              header: '점검주기',
              name: '점검주기'
            },
          {
              header: '사용여부',
              name: '사용여부'
            }
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 5
    }
  });

	//비가동 설비 목록
	$.ajax({
		url: "getEqInListAjax",
		method : "GET",
		dataType : "JSON",
		success : function(result){			
			eqInaList.resetData(result);
		}
	});
	
  var eqInaList = new tui.Grid({
    el: document.getElementById('eqInaList'),
    columns: [
      {
        header: '설비코드',
        name: '설비코드'
      },
      {
        header: '설비명',
        name: '설비명'
      },
      {
        header: '사유',
        name: '사유'
      },
      {
        header: '시작날짜',
        name: '시작날짜'
      },
      {
          header: '종료날짜',
          name: '종료날짜'
        }
    ],
    rowHeaders : [ 'rowNum' ],
    pageOptions: {
        useClient: true,
        perPage: 5
      }    
  });
	
  eqList.on("dblclick", function(e){
	  let eqc = eqList.getFocusedCell();
	  let inEqCd = eqList.getValue(e.rowKey, '설비코드');
	  let inEqNm = eqList.getValue(e.rowKey, '설비명');	  
	   
	  $("#inEqCd").val(inEqCd);
	  $("#inEqNm").val(inEqNm);
	  
	  console.log(inEqCd);
	  if(eqc.columnName == '사용여부'){
		  if(eqc.value == 'N'){
		  $("#test").load("eqInaModal", function() {
				const eqInaModal = new bootstrap.Modal('#myModal');
				eqInaModal.show();
				});
		  	}
	  }
  })
  
</script>

</html>