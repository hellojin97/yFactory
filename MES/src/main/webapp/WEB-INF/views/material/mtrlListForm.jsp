<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주관리</title>

</head>
<body>
	<div style="padding-bottom: 70px; ">
	<div class="mainTitle" style="padding-bottom:15px;">
		<h1>발주 관리/등록</h1>
	</div>

	<div class="min2" >
		<button type="button" class="btn3" id="btnMg">등록</button>
		<button type="button" class="btn2" id="btnIn">관리</button>
	</div>
	<div class="min1" >
	<div style="background-color: #e9ecef; padding: 8px;">
			<div class="mainTitle" style="padding: 15px;">
				<!-- 발주코드검색 -->				
				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
					
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">발주코드</label> 
						<input type="text" class="form-control" style="width: 50px" id="poCdinput" placeholder="발주코드">
						<a class="nav-link nav-icon search-bar-toggle " id="poCd" onclick="poCd"> 
							<i class="bi bi-search"style="color: #2c3e50"></i>
						</a> 
						<div>
							<button id="search" type="button" class="btn1">조회</button>
						</div>
						<div>
							<button id="reset" type="button" class="btn1">초기화</button>
						</div>
					</div>

				</div>
			</div>
			<hr style="border: solid 1px gray;">
			<!-- 테이블 -->
			<div class="code-html contents" style="padding-bottom: 10px;">
				<div id="reqList"></div>
				<div id="test"></div>
			</div>

		</div>
	<div>
		<button  class="btn1" id="excel">Excel</button>
		<button class="btn1" id="mtrlOrderJasper">발주서인쇄</button>
	</div>
	</div>
	</div>
</body>

<script>

//발주 등록
$('#btnMg').on('click', function(){
  location.href = 'mtrlOrderForm';
}) 

//
$('#mtrlOrderJasper').on('click', function(){
	window.open('mtrlOrderJasper','발주서인쇄.PDF','width=500, height=500'); 
})

// 발주 관리
$('#btnIn').on('click', function(){
	location.href = 'mtrlListForm';
})

//발주코드 모달창
poCd.addEventListener("click", function(){
	$("#test").load("pocdModal", function(){
		const myModal = new bootstrap.Modal('#myModal');
		myModal.show();
	})
});

// 발주관리조회
$.ajax({
	url : "mtrlRequestList",
	method :"GET",
	dataType : "JSON",
	success : function(result){
		mtrlReqList.resetData(result);			
	}
});
	var mtrlReqList = new tui.Grid({
	    el: document.getElementById('reqList'),
	    columns: [
	      {
	        header: '원자재발주코드',
	        name: '원자재발주코드',
	        className : 'fontClass',
		    sortable: true,
		    sortingType: 'asc'
	      },
	      {
	        header: '원자재코드',
	        name: '원자재코드',
	        className : 'fontClass',
	      },
	      {
	        header: '원자재명',
	        name: '원자재명',
	        className : 'fontClass',
	      },
	      {
	        header: '업체명',
	        name: '업체명',
	        className : 'fontClass',
	      },
	      {
	    header: '발주수량',
	    name: '발주수량',
	    className : 'fontClass',
	  },
	      {
  	    header: '단위',
  	    name: '단위',
  	  className : 'fontClass',
  	  },
	      {
  	    header: '발주신청일',
  	    name: '발주신청일',
  	  className : 'fontClass',
  	  },
	      {
  	    header: '납기신청일',
  	    name: '납기신청일',
  	  className : 'fontClass',
  	  },
	      {
  	    header: '단가',
  	    name: '단가',
  	  className : 'fontClass',
  	  },
	      {
  	    header: '금액',
  	    name: '금액',
  	  className : 'fontClass',
  	  },
	    ],
	    rowHeaders: ['rowNum'],
	    pageOptions: {
	      useClient: true,
	      perPage: 10
	    }
	  });
	  // 발주코드 검색
	  $("#search").on("click", function() {

	   var poCdinput = $("#poCdinput").val();
		console.log(poCdinput);
	   $.ajax({
		      url : "mtrlReqSelectSearch",
		      data : {
		    	  poCdinput : poCdinput,

		      },
		      method : 'get',
		      dataType: 'JSON',
		      contentType : "application/json; charset=utf-8"
		   }).done(function(result){
			   mtrlReqList.resetData(result);
		       console.log(result);
		       
		   }).fail(function(result){
			   console.log(result);
		   });
	})

	/* 검색 결과 초기화  */
	$('#reset').on('click',function(){
	const url = "mtrlRequestList";
	   $.ajax(url,{
	      dataType : "JSON",
	      method: "GET"
	   }).done(function(result){
		   mtrlReqList.resetData(result);
	     console.log(result);
	   });
})

//excel호출
$('#excel').on('click',function(){
	const options = {
			  includeHiddenColumns: true,
			  onlySelected: true,
			  fileName: '원자재발주조회',
			};
	mtrlReqList.export('xlsx', options);
})
	
</script>

</html>