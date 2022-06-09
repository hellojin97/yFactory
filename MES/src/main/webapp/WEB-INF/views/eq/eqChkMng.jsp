<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.btnpart {
	background-color: #555555;
	color: white;
}

button:hover {
	color: black;
	background-color: white;
}


</style>
</head>
<body>

	<div id="in/out" style="padding-bottom: 15px;">
		<h1>설비 점검 관리</h1>
	</div>



	<div class="min1">
		<div class="mainTitle">
			<!-- 구분 드롭박스 -->

				<div class="col-md " style="padding-bottom: 15px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">설비구분</label> 
							<select id="eq_nm" name="eq_nm">
							<option value="">전체</option>
							<!-- <option value="YAFS01">반죽기</option>
							<option value="YAFS02">성형기</option>
							<option value="YAFS03">냉각기</option>
							<option value="YAFS04">포장기</option> -->
						</select>&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btnpart" id="noChksearch">점검 조회</button>	
						
					</div>
					</div>
					<!-- <div class="col-md " style="padding-bottom: 15px;">
					<div class="input-group ">
					<label for="inputText" class="col-form-label"
							style="padding-right: 24px;">점검 날짜</label> 
					<input type="date" id="eq_chkdt1" name="eq_chkdt1">&nbsp;&nbsp; ~ &nbsp;&nbsp; 
					<input type="date" id="eq_chkdt2" name="eq_chkdt2">&nbsp;&nbsp;  -->
							
					<!-- <button type="submit" class="btn btnpart" id="noChksearch">점검 조회</button> -->
							
						
					<!-- </div>
					</div> -->
				
				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<!-- <label for="inputText" class="col-form-label"
							style="padding-right: 20px;">점검일자</label> <input type="date"
							class="form-control" id="eq_chkdt1" name="eq_chkdt1"
							style="width: 20px" >
						<h2>&nbsp;~&nbsp;</h2>
						<input type="date" class="form-control" id="eq_chkdt2"
							name="eq_chkdt2" style="width: 20px" >
 					-->
						
						
					</div>
				</div>
			
			<div align="right">
				<span>
					<button type="button" class="btn btnpart" id="resetList">초기화</button>
					<button type="button" class="btn btnpart" id="ListAll">내역조회</button>
					<button type="button" class="btn btnpart" id="dailyChk">일점검조회</button>
					<button type="button" class="btn btnpart" id="savbtnMain">저장</button>
					<button type="button" class="btn btnpart" id="delDailyChk">삭제</button>
				</span>
			</div>
			<hr style="border: solid 1px gray;">
			<!-- 테이블 -->
		<div class="code-html contents" style="padding-bottom: 10px;">
		
			<div id="grid"></div>
		
			<div id="modalDiv"></div>
			<div id="modalDiv2"></div>

		</div>

			<hr style="border: solid 1px gray;">
		</div>
		

	</div>



</body>


<script>
var eq_nm;
var eq_chkdt;
var eq_chkeddt;
var eq_chkdt1;
var eq_chkdt2;
// 점검 종료일 을 오늘날짜로 기본 셋팅
//document.getElementById('eq_chkdt1').value = new Date().toISOString().substring(0, 10);
//document.getElementById('eq_chkdt2').value = new Date().toISOString().substring(0, 10);
var modalGrid;

var now = new Date();	// 현재 날짜 및 시간
//console.log("현재 : ", now);
//var aweekAgo = new Date(now.setDate(now.getDate() - 7)).toISOString().substring(0, 10);// 일주일전 
//document.getElementById('eq_chkdt1').value = new Date(now.setDate(now.getDate() - 7)).toISOString().substring(0, 10);
//document.getElementById('eq_chkdt2').value = new Date().toISOString().substring(0, 10);
//console.log("aweekAgo:"+aweekAgo);
$(function(){
	$("#ListAll").on("click" ,function(){
		const url = "eqActListAjax";
		   $.ajax(url,{
			   dataType : "JSON",
			   method: "GET"
			   
		   }).done(function(result){
			   if(result.length ==0){
				   toastr.error('LIST NOT EXIST');
			   }
			   modalGrid.resetData(result);
			  console.log(result);
		   });
		
		
	});
	$("#resetList").on("click" ,function(){
		modalGrid.clear(); // 모달 데이터 초기화
		location.reload(); // 페이지 새로고침
	});
	
	
	var selectBox = [];
	const url2 = "eqDivChkAjax";
	$.ajax({
		url : url2,
		method : "GET",
		dataType:"JSON"
		
	}).done(function(res){
		console.log(res);
		for (var i = 0; i < res.length; i++) {
			
			
			var divList = {};
			divList.text = res[i].CD_NM;
			divList.value = res[i].CD_NM;
			
			selectBox.push(divList);
			console.log(selectBox);
			$("#eq_nm").append('<option value="'+res[i].CD_NM+'">'+res[i].CD_NM+'</option>');
		}
	})
	
		 	
		   	 	modalGrid  = new tui.Grid({
		       el: document.getElementById('grid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [
		    	  
		         {
		        	sortable: false,
		           header: '설비코드',
		           name: '설비코드',
		           className : 'fontClass',
		           align: 'center'
		         },
		         {
		             header: '설비명',
		             name: '설비명',
		             className : 'fontClass',
		             align: 'center'
		          },
		          { 	
		               header: '점검일자',
		               name: '점검일자',
		               className : 'fontClass',
		               align: 'center'
		           },
		           {
		                 header: '점검주기',
		                 name: '점검주기',
		                 className : 'fontClass',
		                 align: 'right'
		           },
		               
		           {
		                 header: '차기점검일',
		                 name: '차기점검일',
		                 className : 'fontClass',
		                 align: 'center'
		           },
		           {
		                 header: '점검내역',
		                 name: '점검내역',
		                 className : 'fontClass',
		                 align: 'center',
		                 editor : 'text'
		       		},
		           {
			                 header: '결과',
			                 name: '결과',
			                 className : 'fontClass',
			                 align: 'center',
			                 editor: {
			                     type: 'select',
			                     options: {
			                       listItems: [
			                         {
			                           text: '재점검 필요',
			                           value: '재점검 필요'
			                         },
			                         {
			                           text: '통과',
			                           value: '통과'
			                         }
			                    ]
			                 }
			            }
			             
			       },
			       
			       {
				                 header: '검수자',
				                 name: '검수자',
				                 className : 'fontClass',
				                 align: 'center'
				   },    
			          
			          
		               ],
		               		
		               rowHeaders: [ { type: 'checkbox' },{ type: 'rowNum' }],
		   					
		                     pageOptions: {
		                    	 
		                         useClient: true,
		                         perPage: 10
		                    }
		   });
		   
		   
		   
		// 클릭시 모달 호출
			$("#noChksearch").on("click" , function(){
				modalGrid.clear();
				
				eq_nm = $("#eq_nm option:selected").val();
				eq_chkdt1=$("#eq_chkdt1").val(); 	
				eq_chkdt2=$("#eq_chkdt2").val(); 	
				//eq_chkdt1 = $("#eq_chkdt1").val();
				//eq_chkdt2 = $("#eq_chkdt2").val();
				
				console.log("eq_nm:"+eq_nm);
				console.log("eq_chkdt1:"+eq_chkdt1);
				console.log("eq_chkdt2:"+eq_chkdt2);
				
				//console.log(eq_chkdt1);
				//console.log(eq_chkdt2);
					//모달 페이지 호출 부
					$("#modalDiv").load("eqsearchmodal" , function(){
						const myModal = new bootstrap.Modal('#myModal');
						myModal.show();	
						
						
					});
					
					
			}); // END OF BUTTON CLICKED EVENT AJAX
				

			// 설비조회 버튼 클릭시 모달 호출
			$("#dailyChk").on("click" , function(e){
				modalGrid.clear();
				
				$("#modalDiv2").load("eqDailyChkCount" , function(){
					const myModal = new bootstrap.Modal('#myModal');
					myModal.show();	
				
				
					});
			
			}); // END OF daliyChk BUTTON
			
			
			
		
			
			//var rowArr2 = [];
			//var chkRows2 = modalGrid.getCheckedRows();
			$("#savbtnMain").on("click" , function(){
				
				var chkRows = modalGrid.getCheckedRows();
				var rowArr = [];
				var data = {};
				for (var i = 0; i < chkRows.length; i++) {
					console.log(chkRows[i].설비코드);
					console.log(chkRows[i]);
					//console.log(modalGrid.getValue(modalGrid.getCheckedRowKeys(),'설비코드'));
					data = {
						설비코드 : chkRows[i].설비코드,
						점검주기 : chkRows[i].점검주기,
						점검내역 : chkRows[i].점검내역,
						결과 : chkRows[i].결과,
						검수자 : parseInt(1041)
						};
				
					rowArr.push(data);
				};
					console.log(rowArr);
					$.ajax({
						url : "eqChkResultAjax",
						method:"POST",
						traditional: true,
						data : JSON.stringify(rowArr),
						async : true,
						dataType: "JSON",
						contentType : "application/json; charset=UTF-8",
						success : function(res){
								toastr.success('등록이 완료되었습니다!');
								modalGrid.clear();
								
								
							},
						error : function(){toastr.error('등록이 실패했어요!');}
					
					}).done(function(){
						location.reload(); // 현재 화면 새로고침
					
					})	// END OF AJAX 

				
			}); // END OF MAIN SAVBTN SYNTAX
			
			
			// 점검 삭제 버튼
			$("#delDailyChk").on("click" , function(){
					
				var chkDelRows = modalGrid.getCheckedRows();
				var delRowArr = [];
				var data = {};
				for (var i = 0; i < chkDelRows.length; i++) {
					console.log(chkDelRows[i].설비코드);
					console.log(chkDelRows[i]);
					//console.log(modalGrid.getValue(modalGrid.getCheckedRowKeys(),'설비코드'));
					data = {
						eq_cd : chkDelRows[i].설비코드
						};
				
					delRowArr.push(data);
				};
					console.log(delRowArr);
					 Swal.fire({
				          title: '정말 삭제 하시겠습니까?',
				          text: "다시 되돌릴 수 없습니다. 신중하세요.",
				          icon: 'warning',
				          showCancelButton: true,
				          confirmButtonColor: '#3085d6',
				          cancelButtonColor: '#d33',
				          confirmButtonText: '삭제',
				          cancelButtonText: '취소'
				      }).then((result) => {
				      	console.log(result);
				      	console.log(result.isDismissed); // 승인시 FALSE / 취소시 TRUE
				      	 if (result.isConfirmed) {
				      		 Swal.fire(
					                  '승인이 완료되었습니다.',
					                  '',
					                  'success'
					              );
				      		$.ajax({
								url : "eqChkDelAjax",
								method:"DELETE",
								traditional: true,
								data : JSON.stringify(delRowArr),
								async : false,
								dataType: "JSON",
								contentType : "application/json; charset=UTF-8",
								success : function(res){
										toastr.success('삭제 성공!');
									},
								error : function(){toastr.error('삭제 실패!');}
				      		});  // END OF AJAX	
				      		
				      		setTimeout(function(){
				      			location.reload();	
				      		},500);
				      		
				      	 }
				      	 else{
				           	Swal.fire(
				                      '삭제가 취소되었습니다.',
				                      '',
				                      'error'
				                  );
				      	 }
				      });
				
		
			
		
		});	// END OF DELCHKLIST SYNTAX  	

	
		
		
});// END OF TOTAL DOM LOADED
 </script>




</html>