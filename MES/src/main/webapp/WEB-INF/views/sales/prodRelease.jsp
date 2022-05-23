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
		<h1>출고 관리</h1>
	</div>
	<div class="min1">
	
	
	<h4>주문 상세</h4>
	<div id="ordDtpList"></div>
	
	<hr style="border: solid 1px gray;">

	<h4>출고 현황</h4>
	<div id="releaseList" style="padding-bottom:15px;"></div>
	
	<button id="releaseBtn" class="btn1">출고</button>
	<button class="btn1">초기화</button>
	
	</div>
		
		
	
	
	
	
<div id="test"></div>
<input type="hidden" id="ordTL"> 
<input type="hidden" id="ordNum">
<input type="hidden" id="prodCd">
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>

// 주문 상세 리스트
$.ajax({
	url: "ordDtpList",
	method : "GET",
	dataType : "JSON",
	success : function(result){
		ordDtpList.resetData(result);
	}
});

var ordDtpList = new tui.Grid({
    el: document.getElementById('ordDtpList'),
    columns: [
    	{
            header: '주문상세코드',
            name: '주문상세코드'
          },
          {
            header: '주문코드',
            name: '주문코드'
          },
          {
            header: '완제품코드',
            name: '완제품코드'
          },
          {
            header: '제품명',
            name: '제품명'
          },
          {
              header: '주문수량',
              name: '주문수량'
            },
          {
              header: '납기일자',
              name: '납기일자'
            }      
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 10
    }
  });

	//출고 현황 리스트
	$.ajax({
		url: "",
		method : "GET",
		dataType : "JSON",
		success : function(result){
			releaseList.resetData(result);
		}
	});

  var releaseList = new tui.Grid({
    el: document.getElementById('releaseList'),
    columns: [
      {
        header: '주문상세코드',
        name: '주문상세코드'
      },
      {
        header: '완제품코드',
        name: '완제품코드'
      },
      {
        header: '완제품LOT번호',
        name: '완제품LOT번호'
      },
      {
        header: '출고날짜',
        name: '출고날짜'
      },
      {
          header: '출고량',
          name: '출고량'
        },
      {
          header: '제조일자',
          name: '제조일자'
        },
        {
            header: '유통기한',
            name: '유통기한'
          }
    ],
    rowHeaders : [ 'checkbox' ]
    
  });
	
  	//완제품 lot 모달 호출
  ordDtpList.on("dblclick", function(e) {
	  let ordtl = ordDtpList.getValue(e.rowKey,"주문상세코드");
	  let ordNum = ordDtpList.getValue(e.rowKey, "주문수량");
	  let prodCd = ordDtpList.getValue(e.rowKey, "완제품코드");
	  $("#ordTL").val(ordtl);
	  $("#ordNum").val(ordNum);
	  $("#prodCd").val(prodCd);
	  
  	$("#test").load("releaseModal", function() {
			const ProdModal = new bootstrap.Modal('#myModal');
			ProdModal.show();
			}); 
  });	

  $("#releaseBtn").on("click", function(){
	  let prd = releaseList.getCheckedRows();
	  for (var i = 0; i < prd.length; i++) {
			
		}
  })
  
</script>

</html>