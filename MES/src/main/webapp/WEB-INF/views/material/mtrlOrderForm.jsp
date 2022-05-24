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
<style type="text/css">
.clickB {     
	color: black;
    text-align: center;
    
    border: solid 1px #2c3e50;
    margin: 3px;
    line-height: 25px;
    padding: 0px 15px 0px 15px;
    border-radius: 5px 5px 0px 0px;
		    }
</style>

</head>
<body>
	<div style="padding-bottom: 70px; ">
	<div class="mainTitle" style="padding-bottom:15px;">
		<h1>발주 관리/등록</h1>
	</div>

	<div class="min2" >
		<button  class="btn2" id="btnMg">등록</button>
		<button class="clickB" id="btnIn">관리</button>
	</div>
	<div class="min1" >
	<h4>미지시 생산계획조회</h4>
	<div id="unorder" ></div>
	<input type="hidden" id="ppCd">
	
	<h4>생산계획별 자재 재고</h4>
	<div id="prodPlan"></div>
	
	<h4>발주요청서 등록</h4>
	<div id="mtrlRequest"></div>
	<div>
		<button  class="btn1" id="mtrlsave">저장</button>
		<button class="btn1" id="mtrlcancel">취소</button>
	</div>
	</div>
	</div>
	

</body>


<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>

//발주 관리
$('#btnIn').on('click', function(){
	location.href = 'mtrlListForm';

})

  
//발주 등록
  $('#btnMg').on('click', function(){
	location.href = 'mtrlOrderForm';
  }) 
  

// 미지시 생산계획조회 토스트
$.ajax({
	url: "mtrlorder",
	method : "GET",
	dataType : "JSON",
	success : function(result){
		unorder.resetData(result);
		
	}
});

var unorder = new tui.Grid({
    el: document.getElementById('unorder'),
    columns: [
      {
        header: '생산계획코드',
        name: 'pp_cd'
      },
      {
        header: '생산계획명',
        name: 'pp_nm'
      },
      {
        header: '계획등록일자',
        name: 'pp_dt'
      },
      {
        header: '총 수량',
        name: 'pd_qty'
      }
      
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 3
    }
  });
//생산계획코드 불러오기
unorder.on("dblclick",function(e) {
//debugger
   let ppCd1 = unorder.getValue(e.rowKey, 'pp_cd');
   console.log(ppCd1);
   $.ajax({
		url: "mtrlPlan",
		data : {ppCd : ppCd1},
		method : "GET",
		dataType : "JSON",
		contentType : "application/json; charset=utf-8"
	  	}).done(function(result){

	  		for (var i = 0; i < result.length; i++) {
				if(result[i].구분 != null){
	  				
					prodPlan.appendRow(result[i]);
					
					
				}			
			}
	  		console.log(result)

	  	 }).fail(function(result){
	  	    console.log(result);
	     });
   }
);
  //생산계획별 자재재고 토스트
  var prodPlan = new tui.Grid({
    el: document.getElementById('prodPlan'),
    columns: [
      {
        header: '완제품코드',
        name: '완제품코드'
      },
      {
        header: '완제품명',
        name: '완제품명'
      },
      {
        header: '계획일자',
        name: '계획일자'
      },
      {
        header: '원자재코드',
        name: '원자재코드'
      },
      {
          header: '원자재명',
          name: '원자재명'
        },
      {
          header: '재고 구분',
          name: '구분'
        },
        {
            header: '생산계획코드',
            name: '생산계획코드'
          },



    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 3
    }
  });
  
//생산계획코드,자재코드 불러오기
  prodPlan.on("dblclick",function(e) {
  //debugger
     
     let ppCd =  prodPlan.getValue(e.rowKey, '생산계획코드');
	 let mtCd  = prodPlan.getValue(e.rowKey, '원자재코드');
	
     console.log(ppCd);
	 console.log(mtCd);
	 	
	 	// AJAX 발주등록 DATA 요청
	 	$.ajax({
	 		url : 'mtrlOrderList',
	 		method : 'GET',
	 		data : { ppCd : ppCd, mtCd : mtCd },
	 		dataType : 'JSON',
	 		contentType : 'application/json; charset=utf-8'
	 	}).done(function (result){
	 			console.log(result);
	 			for (var i = 0; i < result.length; i++) {
	 				mtrlRequest.appendRow(result[i]);
				}
	 			
	 			
	 	})
	 	
	 
     }
  )
  //발주서 요청 조회
  var mtrlRequest = new tui.Grid({
    el: document.getElementById('mtrlRequest'),
        
    columns: [
      {
        header: '원자재코드',
        name: '원자재코드'
      },
      {
        header: '원자재명',
        name: '원자재명'
      },
      {
        header: '업체명',
        name: '업체명'
      },
      {
    	    header: '납기요청일자',
    	    name: '납기요청일자',
    	    editor: 'datePicker'
    	  },
      {
          header: '현재고',
          name: '현재고'
        },
      {
          header: '계획대비 필요수량',
          name: '계획대비 필요수량'
        },
      {
          header: '발주량',
          name: '발주량',
          editor : {
        	  type : 'text'
          }
        }
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 5
    }
  });
  

  //발주등록버튼
    $("#mtrlsave").click(function () {
		var mtrlReqData=[];
		var dataArrayToSend1 = [];
		$("#mtrlRequest").each(function(){
			var len=$(this).find("td").length;
			for(var i=0; i<len; i++ ){
				mtrlReqData.push($(this).find("td").eq(i).text());
				dataArrayToSend1.push(mtrlReqData);
			}
		})
		console.log(mtrlReqData);
		console.log(dataArrayToSend1);
    });


</script>

</html>