<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>YAFS EQUIPMENT MANAGE PAGE</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />

<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>


</head>
<body>
	<h1>설비 관리</h1>
	<div id="in/out"></div>
	<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding-bottom: 15px; color:;">
			<h4>설비 데이터</h4>
			<hr style="border: solid 1px gray;">

		</div>



		<div id="grid"></div>
		<div id="grid1"></div>
		<div style="padding-right: 10px;" align="right">
			<button type="button" id="eqUpd" class="inSearch btn1">설비 수정</button>
		</div>

	</div>
	<script type="text/javascript">
		window.onload = function() {
			const url = "getEqMngList";
			$.ajax(url, {
				dataType : "JSON",
				method : "GET"
			}).done(function(result) {
				grid.resetData(result);
				console.log(result);
			})

			var grid = new tui.Grid({
				el : document.getElementById('grid'),
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '설비코드',
					name : '설비코드',
				}, {
					header : '설비명',
					name : '설비명',
					editor : "text"
				}, {
					header : '공정코드',
					name : '공정코드',
				}, {
					header : '공정명',
					name : '공정명',
					editor : "text"
				}, {
					header : '최저온도',
					name : '최저온도',
					editor : "text"
				}, {
					header : '최고온도',
					name : '최고온도',
					editor : "text"
				}, {
					header : '구매일자',
					name : '구매일자',
					editor : {
						type : 'datePicker',
						options : {
							format : 'yy/MM/dd'
						}
					}
				},

				{
					header : '사용여부',
					name : '사용여부',
					editor : "text"
				}, ],
				rowHeaders : [ 'rowNum' ],
				pageOptions : {
					useClient : true,
					perPage : 10
				}
			});
			
			
			
			
			grid.on("dblclick",function(e) {
				//debugger
				let eqCd = grid.getValue(e.rowKey, '설비코드');
				 if(eqCd != null){
					 $("#grid1").load("eqdvmodal", function() {
							
							const prdModal = new bootstrap.Modal('#myModal');
							prdModal.show();
							

						})
				 } 
		 			 /*  $.ajax({
							   url  : "procPlListAjax",
							   data : {
								   ordCd : ordCd
								   },
							   dataType : "JSON",
							   contentType : "application/json; charset = UTF-8;"
						   }).done(function(result){
									for (var i = 0; i < result.length; i++) {
										resultGrid.appendRow(result[i]);
									}
									//resultGrid.appendRow(result, {at : 0}); 
										
					
						   })  */
				
				
				
			});
		
		
		
		  $("#eqUpd").click(function () {
		        Swal.fire({
		            title: '정말로 그렇게 하시겠습니까?',
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
		            	
		            	 $.ajax({
			            	   url : "eqMngUpdate",
			            	   data : {},
			            	   dataType : "JSON",
			            	   contentType : "application/json; charset=utf-8"
			            	   
			            	   
			               }).done(function(){
			            	   toastr.success('수정완료!');
			            	   Swal.fire(
					                    '수정이 완료되었습니다.',
					                    '화끈하시네요~!',
					                    'success'
					                		);
			               });
		            	
		                
		                 
		              
		                
		            }else{
		            	Swal.fire(
		                        '수정이 취소되었습니다.',
		                        '섹시하시네요~!',
		                        'error'
		                    )
		            }
		        })
		    });
		
		
		}	
		
		
	</script>



</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>



</html>