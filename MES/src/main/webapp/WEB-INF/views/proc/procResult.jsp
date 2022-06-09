<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주관리</title>
<style>
.smMouseOver {
		cursor:pointer;
	}
</style>
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
							<i class="bi bi-search smMouseOver" style="color: #2c3e50"></i>
						</a>											
					</div>
				</div>
	
			<!-- 공정명 -->
			<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group" style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 72px;">공정명</label>
						
							<input type="text" class="form-control" placeholder="공정명" id="procNm">
							
						<a class="nav-link nav-icon search-bar-toggle" id="procNmBtn" onclick="procNmBtn">
							<i class="bi bi-search smMouseOver" style="color: #2c3e50"></i>
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
	<div>
		<button type="button" class="btn1" id="excel">Excel</button>
	</div>
	</div>
	
<div id="procResultCdModal"></div>
<div id="procResultNmModal"></div>
</body>

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
    scrollX: true,
    columns: [
    	{
            header: '생산지시코드',
            name: '생산지시코드',
            className : 'fontClass',
            align: 'center'
          },
          {
            header: '진행공정코드',
            name: '진행공정코드',
            className : 'fontClass',
            align: 'center'
          },
          {
            header: '공정명',
            name: '공정명',
            className : 'fontClass',
            align: 'center'
          },{
        	  header: '라인코드',
              name: '라인코드',
              className : 'fontClass',
              align: 'center'
          },
          {
            header: '설비코드',
            name: '설비코드',
            className : 'fontClass',
            align: 'center'
          },
          {
              header: '설비명',
              name: '설비명',
              className : 'fontClass',
            },
          {
              header: '투입량',
              name: '투입량',
              className : 'fontClass',
              align: 'right',
			formatter(myNum) { 					
			      return myNum.value.toString()
			      .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			}
            },
            {
                header: '생산량',
                name: '생산량',
                className : 'fontClass',
                align: 'right',
    			formatter(myNum) { 					
  			      return myNum.value.toString()
  			      .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  			}
              },
            {
                header: '불량량',
                name: '불량량',
                className : 'fontClass',
                align: 'right'
              },
              {
                  header: '불량코드',
                  name: '불량코드',
                  className : 'fontClass',
                  align: 'center'
                }
              ,{
                  header: '불량상세',
                  name: '불량상세',
                  className : 'fontClass',
                }
              ,{
                  header: '공정시작시간',
                  name: '공정시작시간',
                  className : 'fontClass',
                  align: 'center'
                }
              ,{
                  header: '공정종료시간',
                  name: '공정종료시간',
                  className : 'fontClass',
                  align: 'center'
                }
              ,{
                  header: '담당자',
                  name: '담당자',
                  className : 'fontClass',
                }
              ,{
                  header: '생산지시일자',
                  name: '생산지시일자',
                  className : 'fontClass',
                  align: 'center'
                }
    ],
    rowHeaders: ['rowNum'],
    columnOptions: {
        frozenCount: 1,
        frozenBorderWidth: 2,
        minWidth: 300
      },
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
		url : "searchProcResult",
		data : { prdCd : prdCd,
			     procNm : procNm,
			     req1 : req1,
			     req2 : req2
		},
		method : "POST"
	}).done(function(result){
		procResultList.resetData(result);
	})
})

//excel호출
$('#excel').on('click',function(){
	const options = {
			  includeHiddenColumns: true,
			  onlySelected: true,
			  fileName: '공정실적조회',
			};
	procResultList.export('xlsx', options);
})

procResultList.on('dblclick',function(e){
	let lineCd = procResultList.getValue(e.rowKey,'라인코드');
	let prcd = procResultList.getValue(e.rowKey, '진행공정코드');
	console.log(lineCd);
	
	window.open('procMoveDialog?line_cd=' + lineCd + '&proc_prcd=' + prcd, '공정이동표.PDF', 'width=1000,height=1500');
})
  
</script>

</html>