<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>

   <div style="padding-bottom:15px; color: ;">
      <h1>제품 주문</h1>
   </div>
   
   <div class="min1">
			<div class="mainTitle" style="padding: 15px;">
				<!-- 구분 -->				

                <form>
           
                
				<!-- 업체명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">업체명</label>
						
						
										<input type="text" class="form-control" style="width: 50px" placeholder="업체명" id="vnm">
										
						<!-- Modal 불러오기 -->				
						<a class="nav-link nav-icon search-bar-toggle" id="venderBtn" onclick="venderBtn" style="cursor: pointer;"> 
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>
						
						
										<input type="text" id="vcd" class="form-control" readonly="readonly">
						
					</div>
				</div>
				
				<!-- 주문일자 -->
				<div class="col-md-12" style="padding-bottom: 10px;">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 10px;">주문일자</label>
									<div class="col-sm-2">
										<input type="date" class="form-control" id="currentDate" readonly="readonly">
									</div>
					</div>
				</div>

				<!-- 납품일자 -->
				<div class="col-md-12">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 10px;">납품일자</label>
							
							
						<div class="col-sm-2">
							<input type="date" class="form-control" id="reqDt"  style="cursor: pointer;">
						</div>

						<div style="padding-right: 10px;">
							
						</div>

						
						
					</div>
				</div>
					</form>

			</div>
			<hr style="border: solid 1px gray;">

			<!-- 테이블 -->
			<div id="ordeList"></div>
			<div id="venderModal"></div>
			
			<div>
							<button type="button" id="reset" class="btn1" >초기화</button>
							<button type="button" id="requestOrder" class="btn1">주문 등록</button>
							<button type="button" id="cancel" class="btn1">취소</button>
			</div>
</div>


<script type="text/javascript">

/* 주문일자(현재 날짜) 표현*/
document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;


/* reset버튼 눌렀을때 function */
 $('#reset').on('click', function(){
	 $('#reqDt').val('');
	 $('#vnm').val('');
	 $('#vcd').val('');
 });


//업체명 modal
venderBtn.addEventListener("click", function(){
		$("#venderModal").load("salesVenderModal", function(){
			const venModal = new bootstrap.Modal('#venModal');
			venModal.show();
		})
		});

/* 주문서 전체 조회 */
window.onload = function (){
   const url = "userOrder";
   $.ajax(url,{
      dataType : "JSON",
      method: "GET"
   }).done(function(result){
	   orderGrid.resetData(result);
     console.log(result);
   })
   
   var orderGrid = new tui.Grid({
       el: document.getElementById('ordeList'),
       scrollX: false,
       scrollY: false,
       columns: 
    	   [
    	   {
               header: '제품코드',
               name: '제품코드'
            },
           {
               header: '제품명',
               name: '제품명'
            },
            {
               header: '수량',
               name: '주문수량',
               editor : 'text'
            }
      		],
      		rowHeaders : [ 'checkbox' ]
     });

   
   
   /* 주문등록 이벤트 */
   
   $("#requestOrder").on("click", function(){
	   
	   	/* input 변수 */
	   	let venCd = $('#vcd').val();
	   	let curDt = $('#currentDate').val();
	   	let reqDt = $('#reqDt').val();
	   
	   	if(venCd != '' && reqDt != '') {
	   	
	      Swal.fire({
	          title: '주문을 완료하시겠습니까?',
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
	        	  
	        	  
	        	  
	        	  let prd = orderGrid.getCheckedRows();
	        	  for (var i = 0; i < prd.length; i++) {
	        		  
	        		  /* 제품코드 */
	        			let prodCd = prd[i].제품코드;
	        		  /* 제품명  */
	        		  	let prodNm = prd[i].제품명;
	        		  	/* 수량  */
	        		  	let qty = prd[i].주문수량;
	        		  
	        		  
	        		  	
	        		  	
	        			
/* 	        		  	$.ajax({
	        		  		url :'releaseOrder',
	        		  		method : 'POST',
	        		  		data : {"prod_lot" : prodLot, "prod_wrqty" : wrQty, "ordtl_cd" : ordtlCd},
	        		  		}).done(function(result){
	        		  			console.log(result);
	        		  		}); */
	        		  	
	        		};
	        	  
	              Swal.fire(
	                  '승인이 완료되었습니다.',
	                  '출고등록이 완료되었습니다.',
	                  'success'
	              );
	              
	          }
	      });
	      
	   	} else {
	   		alert('업체명 또는 납품일자가 비어있습니다.');
	   		
	   		if(venCd == ''){
	   			$('#vnm').focus();
	   		}
	   	}
		 
	  })



}
  </script>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>



</html>