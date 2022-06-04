<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주관리</title>


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
	<button id="reset" class="btn1">초기화</button>
	
	</div>
		
		
	
	
	
	
<div id="test"></div>
<input type="hidden" id="ordTL"> 
<input type="hidden" id="ordNum">
<input type="hidden" id="prodCd">
<input type="hidden" id="ordHiden">
</body>

<script>
	 let ord = [];

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
            name: '주문상세코드',
			align: 'center'
          },
          {
            header: '주문코드',
            name: '주문코드',
			align: 'center'
          },
          {
            header: '완제품코드',
            name: '완제품코드',
			align: 'center'
          },
          {
            header: '제품명',
            name: '제품명'
          },
          {
              header: '주문수량',
              name: '주문수량',
  			align: 'right'
            },
          {
              header: '납기일자',
              name: '납기일자',
  			align: 'center'
            }      
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 8
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
        name: '주문상세코드',
		align: 'center'
      },
      {
        header: '완제품코드',
        name: '완제품코드',
		align: 'center'
      },
      {
        header: '완제품LOT번호',
        name: '완제품LOT번호',
		align: 'center'
      },
      {
          header: '출고량',
          name: '출고량',
			align: 'right'
        },
        {
            header: '출고날짜',
            name: '출고날짜',
    		align: 'center'
          },
      {
          header: '제조일자',
          name: '제조일자',
			align: 'center'
        },
        {
            header: '유통기한',
            name: '유통기한',
			align: 'center'
          }
    ],
    rowHeaders : [ 'checkbox' ]
    
  });
	
  	//완제품 lot 모달 호출
  ordDtpList.on("dblclick", function(e) {
	  let ordtl = ordDtpList.getValue(e.rowKey,"주문상세코드");
	  let ordNum = ordDtpList.getValue(e.rowKey, "주문수량");
	  let prodCd = ordDtpList.getValue(e.rowKey, "완제품코드");
	  let pushOrd = $("#ordHiden").val();
	  let count = 0;
	  ord.push(pushOrd);
	  for(i=0; i<ord.length; i++){
	  	if(ordtl == ord[i]){
	  		count = 1;
	  	}
	  }
	  if(count == 1){
		  Swal.fire({
              icon: 'error',
              title: '등록이 취소되었습니다.',
              text: '이미 등록한 주문입니다!',
			});
	  }else{
	  	$("#ordTL").val(ordtl);
	  	$("#ordNum").val(ordNum);
	  	$("#prodCd").val(prodCd);
	  
  		$("#test").load("releaseModal", function() {
			const ProdModal = new bootstrap.Modal('#myModal');
			ProdModal.show();
			});
	  }
	  
  });	
  
  	//초기화 버튼
  $('#reset').on('click',function(){
	  ord = [];
	  $('#ordHiden').val('');
	  releaseList.clear();
	  console.log(ord);
	})

	//출고 버튼
  $("#releaseBtn").on("click", function(){
      Swal.fire({
          title: '출고등록을 완료하시겠습니까?',
          text: "다시 되돌릴 수 없습니다. 신중하세요.",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '승인',
          cancelButtonText: '취소'
      }).then((result) => {
      	console.log(result);
      	console.log(result.isConfirmed); // 승인시 FALSE / 취소시 TRUE
          if (result.isConfirmed) {
        	  
        	  
        	  
        	  let prd = releaseList.getCheckedRows();
        	  for (var i = 0; i < prd.length; i++) {
        		  
        		  /* 주문상세코드 */
        			let ordtlCd = prd[i].주문상세코드;
        		  /* 완제품LOT번호  */
        		  	let prodLot = prd[i].완제품LOT번호;
        		  	/* 출고량 */
        		  	let wrQty = prd[i].출고량;
        			
        		  	$.ajax({
        		  		url :'releaseOrder',
        		  		method : 'POST',
        		  		async : false,
        		  		data : {"prod_lot" : prodLot, "prod_wrqty" : wrQty, "ordtl_cd" : ordtlCd},
        		  		}).done(function(result){
        		  			console.log(result);
        		  		});
        		  	
        		};
        	  
              Swal.fire(
                  '승인이 완료되었습니다.',
                  '출고등록이 완료되었습니다.',
                  'success'
              );
              ord = [];              
              location.reload(true);              
          }else{
          	Swal.fire(
                      '승인이 취소되었습니다.',
                      '섹시하시네요~!',
                      'error'
                  )
          }
      });
	 
  })
  
</script>

</html>