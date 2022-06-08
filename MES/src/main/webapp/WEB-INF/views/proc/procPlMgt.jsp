<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 추가 CDN -->
<!-- toastr.CSS -->
   <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></link>
<!-- toastr.JS -->
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
<style type="text/css">
.clickB {
	color: black;
	font-weight: bold;
	background: white;
	border: solid 1px gray;
	line-height: 30px;
	margin: 3px;
}
</style>
</head>
<body>
	<div class="mainTitle" style="padding-bottom: 15px; color:;">
		<h1>주문서 조회</h1>
	</div>
	<div class="min2">
		<button type="button" id="inBtn" class="btn2">관리</button>
		<button type="button" id="outBtn" class="btn3">등록</button>
	</div>
			

	<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">

			<!-- 제품명 -->
			<div id="PNM">
			<div class="col-md-5 " style="padding-bottom: 10px;">
				<div class="input-group  " style="padding-bottom: 10px;">
					<label for="inputText" class="col-form-label"
						style="padding-right: 27px;">생산계획명</label> <input type="text"
						id="ProcPN" class="form-control" style="width: 50px"
						placeholder="생산계획명">
					<!-- 							<a class="nav-link nav-icon search-bar-toggle" id="NmSearch" onclick="NmSearch">
							<i class="bi bi-search" style="color: #2c3e50"></i>
							</a> -->
				</div>
			
			
			<!-- 주문일자 -->
			<div class="col-md-12" style="padding-bottom: 10px;">
				<div class="input-group">
					<label for="inputText" class="col-form-label"
						style="padding-right: 40px;">주문일자</label>
					<div class="col-sm-6" style="padding-right: 10px;">
						<input type="date" class="form-control" id="date">
					</div>
					<button id="BtnClear" class="btn1">초기화</button>
				</div>
			
		</div>
		</div>
		  <input type="hidden" id="HNum" />
		<hr style="border: solid 1px gray;">
		<!-- 테이블 -->
		<div id="orderList"></div>
		<button id="btnModal" class="btn1">주문서등록</button>
		<button id="btnDtlInsert" class="btn1">계획등록</button>
		<button id="btnInsert" class="btn1">행추가</button>
		<button id="btnDelete" class="btn1">행삭제</button>
	</div>
				<!-- 제품명 -->
			<div id="PNM1">
			
		<!--  <input type="hidden" id="HNum" />-->
		<hr style="border: solid 1px gray;">
		<!-- 테이블 -->
		<div id="orderList1"></div>
		<button id="btnPlanSelect" class="btn1">계획조회</button>
		<button id="btnPlanCancel" class="btn1">계획취소</button>
	</div>

	<div id="test"></div>
	</div>
	</div>
	
	<script>
	// * 자식그리드에서 부모그리드를 사용하려면 전역변수로 지정되어있어야한다 *
	var resultGrid
	
$('#inBtn').on('click', function(){
	$('#PNM').hide();
	$('#PNM1').show();
	$('#orderList1').empty();
	$('#outBtn').removeClass();
	$('#outBtn').attr("class", "btn3");
	$('#inBtn').removeClass();
	$('#inBtn').attr("class", "btn2");
	
	 resultGrid = new tui.Grid({
			el : document.getElementById('orderList1'),
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '생산계획코드',
				name : '생산계획코드',
				className : 'fontClass',
				
			},{
				header : '주문코드',
				name : '주문코드',
				className : 'fontClass',
			}, {
				header : '제품명',
				name : '완제품명',
				className : 'fontClass',
			}, {
				header : '제품코드',
				name : '완제품코드',
				className : 'fontClass',
			},{
				header : '주문수량',
				name : '주문수량',
				className : 'fontClass',
			},{
				header : '계획량',
				name : '계획량',
				className : 'fontClass',
				editor : "text"

			}, {
				header : '생산일수',
				name : '생산일수',
				className : 'fontClass',
				editor : "text"
			}, {
				header : '작업우선순위',
				name : '작업우선순위',
				className : 'fontClass',
				editor : "text"
			},
			],
			rowHeaders : [ 'checkbox' ],
			pageOptions : {
				useClient : true,
				perPage : 5
			}

		});
		
})


$("#outBtn").on("click", function(){
	$('#PNM1').hide();
	$('#PNM').show();
	$('#orderList').empty();
	$('#inBtn').removeClass();
	$('#inBtn').attr("class", "btn3");
	$('#outBtn').removeClass();
	$('#outBtn').attr("class", "btn2");
	
	 resultGrid = new tui.Grid({
		el : document.getElementById('orderList'),
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '주문코드',
			name : '주문코드',
			className : 'fontClass',
			
		}, {
			header : '제품명',
			name : '완제품명',
			className : 'fontClass',
			validation: { required: true }
		}, {
			header : '제품코드',
			name : '완제품코드',
			className : 'fontClass',
			validation: { required: true }
		},{
			header : '주문수량',
			name : '주문수량',
			editor : "text",
			className : 'fontClass'

		},{
			header : '현재고',
			name : '현재고',
			editor : "text",
			className : 'fontClass'

		},{
			header : '계획량',
			name : '계획량',
			className : 'fontClass',
			editor : "text",
			validation: { required: true }
		}, {
			header : '생산일수',
			name : '생산일수',
			className : 'fontClass',
			editor : "text",
			validation: { required: true }
		}, {
			header : '작업우선순위',
			name : '작업우선순위',
			className : 'fontClass',
			editor : "text",
			validation: { required: true }
		},
		],
		rowHeaders : [ 'checkbox' ],
		pageOptions : {
			useClient : true,
			perPage : 5
		}

	});

			resultGrid.on("click", function(e) {
			let prd = resultGrid.getFocusedCell('완제품코드');
			console.log(prd);
			if (prd.columnName == '완제품명') {
				if (prd.value == null) {
					$("#test").load("prdmodal", function() {
						const prdModal = new bootstrap.Modal('#prdModal');
						prdModal.show();

					})
				}
			}

		})
	
})
	//날짜 
	document.getElementById('date').value = new Date().toISOString().substring(0, 10);
		

		 //초기화 버튼클릭시
		 BtnClear.addEventListener("click", function() {
			 $('#ProcPN').val('');
			 resultGrid.clear();
		 });
		 
		 
		 /* =========== 생산계획 등록 ===========*/
		 
		 
		 btnDtlInsert.addEventListener("click", function() {
			 
			 let ppNm = $('#ProcPN').val();
			 let ppDt = $('#date').val();
			 let prd = resultGrid.getCheckedRows();			 
			 let result;
			 let prdRow = resultGrid.getRowCount();

			  /* 확인 CONFIRM  */
			  Swal.fire({
		          title: '생산계획을 등록하시겠습니까?',
		          icon: 'warning',
		          showCancelButton: true,
		          confirmButtonColor: '#3085d6',
		          cancelButtonColor: '#d33',
		          confirmButtonText: '승인',
		          cancelButtonText: '취소'
		      }).then((result) => {
		      	console.log(result);
		      	console.log('승인결과' + result.isDismissed); // 승인시 FALSE / 취소시 TRUE
		      	console.log(prd);
		      // 	console.log(prd[0].rowKey);
				 //console.log(prdRow); 
				//console.log(resultGrid.getValue(0,'제품명') == null);
				//prd[i].제품명
				 for (var i = 0; i < prd.length; i++) {
			      		if(prd[i].완제품명 == null){
			      			toastr.error((prd[i].rowKey)+1 + '번째 제품명을 채워주세요!');
			      		}
			      		
			      		  if(prd[i].주문수량 == null){
			      			toastr.error((prd[i].rowKey)+1 + '번째 주문수량을 채워주세요!');
			      		}
			      		if(prd[i].현재고 == null){
			      			toastr.error((prd[i].rowKey)+1 + '번째 현재고를 채워주세요!');
			      		}
			      		if(prd[i].계획량 == null){
			      			toastr.error((prd[i].rowKey)+1 + '번째 계획량을 채워주세요!');
			      		}
			      		if(prd[i].생산일수 == null){
			      			toastr.error((prd[i].rowKey)+1 + '번째 생산일수를 채워주세요!');
			      		}
			      		if(prd[i].작업우선순위 == null){
				  			toastr.error((prd[i].rowKey)+1 + '번째 작업우선순위를 채워주세요!');
			      		}  
			      		if(prd[i].완제품명 == null || 
			      		   prd[i].주문수량 == null || 
			      		   prd[i].현재고 == null ||
			      		   prd[i].계획량 == null ||
			      		   prd[i].생산일수 == null ||
			      		   prd[i].작업우선순위 == null){
			      			result.isConfirmed = true;
			      		} else{
			      			result.isConfirmed = false;
			      		}
			      	} 
		      		console.log(result.isConfirmed);
		          /* if (result.isConfirmed) {
		        	  
		        	  for (var i = 0; i < prd.length; i++) {
		 				 result = {
		 		 				 "ppNm" : ppNm,
		 		 				 "ppDt" : ppDt,
		 		 				 "ordCd" : prd[i].주문코드,
		 		 				 "prodCd" : prd[i].완제품코드,
		 		 				 "pdQty" : prd[i].계획량,
		 		 				 "pdRank" : prd[i].작업우선순위,
		 		 				 "pdDt" : prd[i].생산일수
		  					 };
		 				 
			               $.ajax({
							   url  : "procPlanInsert",
							   data : result,
							   async : false,
							   method : "POST"
										   }).done(function(result){
												console.log(result);
										   											})
		 				 
		 					}
		        	  
		        	  
		        	  
						        	  swal.fire({
						        		    title: "성공적으로 계획이 등록되었습니다!",
						        		    text: "생산계획조회 페이지로 이동합니다.",
						        		    type: "success"
						        		}).then(function() {
						        		    //window.location = "procPlSelect";
						        		});

		          			}else{
		          	Swal.fire(
		                      '승인이 취소되었습니다.',
		                      '섹시하시네요~!',
		                      'error'
		                  )
		          			} */
		      }) 
		});
		 
	
		 
		 
		 	
		btnModal.addEventListener("click", function() {
			$("#HNum").val("1");
			$("#test").load("ordermodal", function() {

				const myModal = new bootstrap.Modal('#myModal');
				myModal.show();
		
			})
		});
		 
		 btnPlanSelect.addEventListener("click", function() {
				$("#HNum").val("2");
				$("#test").load("ordermodal", function() {

					const ProcPlModal = new bootstrap.Modal('#ProcPlModal');
					ProcPlModal.show();
			
				})
			});
		btnInsert.addEventListener("click", function() {
			resultGrid.appendRow();
		});
		btnDelete.addEventListener("click", function() {
			resultGrid.removeCheckedRows(false);
		});
		
		/* 생산계획 취소 ===================== */
		btnPlanCancel.addEventListener("click", function() {
			let prd = resultGrid.getCheckedRows();
			console.log(prd);
			
			  Swal.fire({
		          title: '생산계획을 취소하시겠습니까?',
		          icon: 'warning',
		          showCancelButton: true,
		          confirmButtonColor: '#3085d6',
		          cancelButtonColor: '#d33',
		          confirmButtonText: '승인',
		          cancelButtonText: '취소'
		          
		      }).then((result) => {
		          if (result.isConfirmed) {
		        	  	for (var i = 0; i < prd.length; i++) {
							$.ajax({
								url : 'procCancelPl',
								data : prd[i],
								method : 'post',
								async : false
							}).done(function(data){
								console.log('성공');
							});
						}	
		        	  
		        	  	/* alert 성공처리 */
		        	  	 swal.fire({
			        		    title: "성공적으로 계획이 취소되었습니다!",
			        		    text: "새로고침합니다.",
			        		    type: "success"
			        		}).then(function() {
			        		   	location.reload();
			        		});
		        	  
		        	  
		        	  }
		      })
		      });
			
			
		

		// var resultGrid
		window.onload = function() {
			$("#inBtn").trigger('click'); 

		}
	</script>

</body>

</html>