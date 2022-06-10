<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.smMouseOver {
		cursor:pointer;
	}
</style>

</head>
<body>
<!-- 숫자 천자리는 ","구분 적용 / 표기될 문자길이가 길다면 왼쪽정렬 / 숫자는 우측정렬 /나머지 가운데 정렬 -->
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

	<h4>비가동 설비 내역</h4>
	<div>
	<form>				
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
							<i class="bi bi-search smMouseOver" style="color: #2c3e50"></i>
						</a>
						<input type="text" id="eqCd" class="form-control" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;
						
							<button type="button" id="search" class="btn1">검색</button>							
							&nbsp;&nbsp;
							<button type="reset" id="reset" class="btn1">초기화</button>
						
					</div>
				</div>
				</form>
				</div>
	<!-- 비가동 설비 목록 -->
	<div id="eqInaList" style="padding-bottom:15px;"></div>
	<div>
		<button type="button" class="btn1" id="excel">Excel</button>
	</div>	
	</div>
		
		
	
	
	
	
<div id="test"></div>
<div id="seachModal"></div>

<input type="hidden" id="inEqCd"> 
<input type="hidden" id="inEqNm">
</body>

<script>

// 비가동 설비 검색
$("#search").on("click", function() {
	let req1 = $("#req1").val();
	let req2 = $("#req2").val();
	let eqNm = $("#eqNm").val();
	let eqCd = $("#eqCd").val();
	$.ajax({
	      url : "searchEqInaAjax",
	      data : {
	            "req1" : req1,
	            "req2" : req2,
	            "eqNm" : eqNm,
	            "eqCd" : eqCd
	      }
	   }).done(function(result){	       
	       eqInaList.resetData(result);
	   });
})

// 비가동 설비 초기화
$('#reset').on('click',function(){
	const url = "getEqInListAjax";
	   $.ajax(url,{
	      dataType : "JSON",
	      method: "GET"
	   }).done(function(result){
		   eqInaList.resetData(result);	     
	   });
})
	

// 설비 목록
$.ajax({
	url: "getEqActStatListAjax",
	method : "GET",
	dataType : "JSON",
	success : function(result){		
		eqList.resetData(result);
	}
}).done(function(result){
	for (var i = 0; i < result.length; i++) {
		if(result[i].공정코드 == '' || result[i].공정코드==null){
			console.log((i+1)+"번째 열의 공정코드가 비었습니다!");
			result[i].공정코드 = 'Not Exist';
			//console.log(result[i]);
			
		};
		if(result[i].공정명 == '' || result[i].공정명==null){
			console.log((i+1)+"번째 열의 공정명이 비었습니다!");
			result[i].공정명 = 'Not Exist';
		};
	};
	
});

var eqList = new tui.Grid({
    el: document.getElementById('eqList'),
    scrollX: false,
    bodyHeight: 200,
    columns: [
    	{
            header: '설비코드',
            name: '설비코드',
            className : 'fontClass',
            align: 'center'
          },{
              header: '구분명',
              name: '구분명',
              className : 'fontClass',
              align: 'center'
          },{
            header: '설비명',
            name: '설비명',
            align: 'left',
            className : 'fontClass',
          },
          {
            header: '공정코드',
            name: '공정코드',
            className : 'fontClass',
            align: 'center'
          },
          {
            header: '공정명',
            name: '공정명',
            align: 'center',
            className : 'fontClass',
          },
          {
              header: '점검주기',
              name: '점검주기',
              className : 'fontClass',
              align: 'right'
            },
          {
              header: '사용여부',
              name: '사용여부',
              className : 'fontClass',
              align: 'center'
            }
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
        type: 'scroll', 
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
        header: '설비가동코드',
        name: '설비가동코드',
        className : 'fontClass',
        align: 'center'
      },{
        header: '설비코드',
        name: '설비코드',
        className : 'fontClass',
        align: 'center'
      },{
          header: '구분명',
          name: '구분명',
          className : 'fontClass',
          align: 'center'
      },{
        header: '설비명',
        name: '설비명',
        align: 'center',
        className : 'fontClass',
      },
      {
        header: '사유',
        name: '사유',
        align: 'center',
        className : 'fontClass',
      },
      {
        header: '시작날짜',
        name: '시작날짜',
        className : 'fontClass',
        align: 'center'
      },
      {
          header: '종료날짜',
          name: '종료날짜',
          className : 'fontClass',
          align: 'center'
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
	  	  
	  if(eqc.columnName == '사용여부'){
		  if(eqc.value == '사용가능'){
		  $("#test").load("eqInaModal", function() {
				const eqInaModal = new bootstrap.Modal('#myModal');
				eqInaModal.show();
				});
		  }else{
			  Swal.fire(
	                    '비가동중인 설비입니다.',
	                    '가동중인 설비를 선택해주세요!',
	                    'error'
	                )
		  }
	  }
  })
  
  $("input[name=radios]").on("click", function(){
	  let key = $("input[name=radios]:checked").val();
	  $.ajax({
		  url : "getEqInActListAjax",
		  data : { key : key},
		  dataType: 'JSON',
	      contentType : "application/json; charset=utf-8"
	  		
	  }).done(function(result){
		  eqList.resetData(result);
	  })
  })
  
  prodBtn.addEventListener("click", function(){
	$("#seachModal").load("seachInaModal", function(){
		const searchModal = new bootstrap.Modal('#searchModal');
		searchModal.show();
	})
	});
  
//마우스 커서 올리면
  eqList.on('mouseover', function(e){
  	var cn = e.columnName;
  	var tt = e.targetType;
  		if(cn == '사용여부' && tt == 'cell' ){			
  			$('#eqList').attr("class", "smMouseOver");
  		}else{
  			$('#eqList').removeClass();					
  		}
  });
  
//excel호출
  $('#excel').on('click',function(){
  	const options = {
  			  includeHiddenColumns: true,
  			  onlySelected: true,
  			  fileName: '비가동설비내역',
  			};
  	eqInaList.export('xlsx', options);
  });
  
</script>

</html>