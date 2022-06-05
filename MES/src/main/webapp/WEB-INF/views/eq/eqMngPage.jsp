<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>YAFS EQUIPMENT MANAGE PAGE</title>

<!-- 알람창 자체가 희미하게 떠서 자체적으로 페이지에 추가 했습니다 -->
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





<style>
.inSearch {
	background-color: #555555;
	color: white;
	font-family: "Audiowide", sans-serif;
	font-size:25px;
	padding: 10px 20px;
	border-radius: 4px;
}

.inSearch:hover {
	color: black;
	background-color: white;
	 border:2px solid green;
}
h3{
 /* color:ghostwhite;
 border: 15px solid #e0e0e0; */
 
}


</style>

</head>
<body>
	<h1>설비 관리</h1>
	<div id="in/out"></div>
	<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding-bottom: 15px; color:;">
			<!-- <h3>설비 데이터</h3> -->
			<div style="padding-bottom: 10px;" align="right">
			<button type="button" id="eqUpd" class="inSearch">설비 수정</button>
			</div>
			<hr style="border: solid 1px gray;">
			
		</div>



		<div id="grid"></div>
		<div id="grid1"></div>
		

	</div>
	<script type="text/javascript">
	// 지역변수로 윈도우에 선언이되있으니까 자식에서 못쳐가지고오는거죠~ 
	// 그래서 전역으로 돌려야함 숙지하도록 ㅅㄱ 
	var grid;
	var rowKey;
	var gridRowCell;
		window.onload = function() {
			const url = "getEqMngList";
			$.ajax(url, {
				dataType : "JSON",
				method : "GET"
			}).done(function(result) {
				grid.resetData(result);
				console.log(result);
			})

			 grid = new tui.Grid({
				el : document.getElementById('grid'),
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '설비코드',
					name : '설비코드',
					className : 'fontClass',
					filter: { type: 'text', showApplyBtn: true, showClearBtn: true }
				}, {
					header : '설비구분',
					name : '설비구분',
					className : 'fontClass',
					filter: { type: 'select', showApplyBtn: true, showClearBtn: true }
				},{
					header : '설비명',
					name : '설비명',
					className : 'fontClass',
					filter: { type: 'text', showApplyBtn: true, showClearBtn: true }
				}, {
					header : '공정코드',
					name : '공정코드',
					className : 'fontClass',
					filter: { type: 'text', showApplyBtn: true, showClearBtn: true }
				}, {
					header : '공정명',
					name : '공정명',
					className : 'fontClass',
					editor : "text"
				}, {
					header : '최저온도',
					name : '최저온도',
					className : 'fontClass',
					editor : "text"
				}, {
					header : '최고온도',
					name : '최고온도',
					className : 'fontClass',
					editor : "text"
				}, {
					header : '구매일자',
					name : '구매일자',
					className : 'fontClass',
					editor : {
						type : 'datePicker',
						options : {
							format : 'yyyy-MM-dd'
						}
					},
					filter: { type: 'date', 
								showApplyBtn: true, 
								showClearBtn: true,
								operator:'OR',
								
								}
				},

				{
					header : '사용여부',
					name : '사용여부',
					className : 'fontClass',
					filter: { type: 'select', showApplyBtn: true, showClearBtn: true },
					 editor: {
	                     type: 'select',
	                     options: {
	                       listItems: [
	                         {
	                           text: '사용가능',
	                           value: '사용가능'
	                         },
	                         {
	                           text: '사용불가',
	                           value: '사용불가'
	                         }
	                    ]
	                 }
	            }
				}, ],
				 rowHeaders: [ { type: 'checkbox' },{ type: 'rowNum' }],
				pageOptions : {
					useClient : true,
					perPage : 10
				}
			});
			
			
			
			
			grid.on("dblclick",function(e) {
				//debugger
				//let eqCd = grid.getValue(e.rowKey, '설비코드');
				console.log("Parent_e.rowKey: "+e.rowKey);
				rowKey = e.rowKey;
				gridRowCell = grid.getFocusedCell().rowKey;
				
				let eqCdCol = grid.getFocusedCell('설비코드');
				let eqPrcCol = grid.getFocusedCell('공정코드');
				/* 	if(eqCdCol.columnName == '설비코드'){ // 설비코드 컬럼을 클릭했다면
						$("#grid1").load("mngmodal", function(){

							const mngModal = new bootstrap.Modal('#myModal');
							mngModal.show();
							console.log("gridRowCell"+gridRowCell);
							
							
						
							});
					}
					else  */
						if(eqCdCol.columnName == '공정코드'){ // 설비코드 컬럼을 클릭했다면
							$("#grid1").load("eqPrcmodal", function(){
									const mngModal = new bootstrap.Modal('#myModal');
									mngModal.show();
							
							});
					};
				
				
			});
		
		
			// 설비 수정 버튼
		  $("#eqUpd").click(function () {
			  
			var chkRows = grid.getCheckedRows();
			var updRowArr = [];
			var data = {};
			var temp1;
		
			console.log(chkRows);
			console.log(JSON.stringify(chkRows));
			
			
			for (var i = 0; i < chkRows.length; i++) {
				if(chkRows[i].사용여부 == '사용가능'){ // 사용가능 이 선택되어있다면
					temp1 = 'USE01';
				}else{ // 사용불가 가 선택되어 있다면
					temp1 = 'USE02';
				}
				console.log(temp1);
				data = {
						eq_cd : chkRows[i].설비코드 , 
						// eq_nm : chkRows[i].설비명 ,
						proc_cd : chkRows[i].공정코드 ,
						proc_nm : chkRows[i].공정명 ,
						eq_min : chkRows[i].최저온도 ,
						eq_max : chkRows[i].최고온도 ,
						eq_purdt : chkRows[i].구매일자 ,
						eq_actst : temp1

				};
				
				updRowArr.push(data);
				
			};
			 
			 
		        Swal.fire({
		            title: '정말 수정 하시겠습니까?',
		            icon: 'warning',
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '수정',
		            cancelButtonText: '취소'
		        }).then((result) => {
		        	console.log(result);
		        	console.log(result.isConfirmed); // 승인시 FALSE / 취소시 TRUE
		        	if(chkRows.length >=1){ // 체크된 행이 존재하면 실행하세요 ~
		        		
		        	
		            if (result.isConfirmed) {
		            	
		            	 $.ajax({
			            	   url : "eqMngUpdateAjax",
			            	   method: "POST",
			            	   traditional : true,
			            	   data : JSON.stringify(updRowArr),
			            	   dataType : "JSON",
			            	   contentType : "application/json; charset=utf-8"
			            	   
			            	   
			               }).done(function(){
			            	   toastr.success('수정완료!');
			            	   Swal.fire(
					                    '수정이 완료되었습니다.',
					                    '',
					                    'success'
					                		);
			               });  
		            }else{
		            	Swal.fire(
		                        '수정이 취소되었습니다.',
		                        '',
		                        'error'
		                    )
		            	}
		        	}
		        	else{
		        		toastr.error('체크된 행이 없습니다! 확인해주세요');
		        	}
		        })
		    }); 
		
		
		}	
		
		
	</script>



</body>



</html>