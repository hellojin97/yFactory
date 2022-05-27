<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<!-- 추가 CDN ALERT-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></link>
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

			

				<div class="col-md " style="padding-bottom: 30px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">설비구분</label> 
							<select id="eq_nm" name="eq_nm">
							<option value="반죽기">반죽기</option>
							<option value="성형기">성형기</option>
							<option value="가열기">가열기</option>
							<option value="1차">1차선별벨트</option>
							<option value="초코프레스">초코코팅기</option>
							<option value="냉각기">냉각기</option>
							<option value="2차">2차선별벨트</option>
							<option value="포장기">포장기</option>
						</select>
					</div>
				</div>
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
						&nbsp;&nbsp;
						<button type="submit" class="btn btnpart" id="searchEq">점검비등록조회</button>
					</div>
				</div>
			
			<div align="right">
				<span>
					<button type="button" class="btn btnpart" id="resetList">초기화</button>
					<button type="button" class="btn btnpart" id="ListAll">전체조회</button>
					<button type="button" class="btn btnpart" id="dailyChk">일점검조회</button>
					<button type="button" class="btn btnpart" id="savbtnMain">저장</button>
					<button type="button" class="btn btnpart">삭제</button>
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
// 점검 종료일 을 오늘날짜로 기본 셋팅
//document.getElementById('eq_chkdt1').value = new Date().toISOString().substring(0, 10);
//document.getElementById('eq_chkdt2').value = new Date().toISOString().substring(0, 10);
var modalGrid;
$(function(){
	$("#ListAll").on("click" ,function(){
		const url = "eqActListAjax";
		   $.ajax(url,{
			   dataType : "JSON",
			   method: "GET"
			   
		   }).done(function(result){
			   modalGrid.resetData(result);
			  console.log(result);
		   });
		
		
	});
	$("#resetList").on("click" ,function(){
		modalGrid.clear();
	});
	
		 	
		   	 	modalGrid  = new tui.Grid({
		       el: document.getElementById('grid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [
		    	  
		         {
		        	sortable: false,
		           header: '설비코드',
		           name: '설비코드',
		           align: 'center'
		         },
		         {
		             header: '설비명',
		             name: '설비명',
		             align: 'center'
		          },
		          { 	
		               header: '점검일자',
		               name: '점검일자',
		               align: 'center'
		           },
		           {
		                 header: '점검주기',
		                 name: '점검주기',
		                 align: 'center'
		           },
		               
		           {
		                 header: '차기점검일',
		                 name: '차기점검일',
		                 align: 'center'
		           },
		           {
		                 header: '점검내역',
		                 name: '점검내역',
		                 align: 'center',
		                 editor : 'text'
		       		},
		           {
			                 header: '결과',
			                 name: '결과',
			                 align: 'center',
			                 editor: {
			                     type: 'select',
			                     options: {
			                       listItems: [
			                         {
			                           text: '재점검필요',
			                           value: 'DIV01'
			                         },
			                         {
			                           text: '통과',
			                           value: 'DIV02'
			                         }
			                    ]
			                 }
			            }
			             
			       },
			       
			       {
				                 header: '검수자',
				                 name: '검수자',
				                 align: 'center'
				   },    
			          
			          
		               ],
		               		
		               rowHeaders: [ { type: 'checkbox' },{ type: 'rowNum' }],
		   					
		                     pageOptions: {
		                         useClient: true,
		                         perPage: 15
		                    }
		   });
		   
		   
		   
		// 클릭시 모달 호출
			$("#searchEq").on("click" , function(){
				modalGrid.clear();
				eq_nm = $("#eq_nm option:selected").val();
					
				//eq_chkdt1 = $("#eq_chkdt1").val();
				//eq_chkdt2 = $("#eq_chkdt2").val();
				
				console.log(eq_nm);
				//console.log(eq_chkdt1);
				//console.log(eq_chkdt2);
					//모달 페이지 호출 부
					$("#modalDiv").load("eqsearchmodal" , function(){
						const myModal = new bootstrap.Modal('#myModal');
						myModal.show();	
						
						
					});
					
					
			}); // END OF BUTTON CLICKED EVENT AJAX
				

			// 일점검조회 버튼 클릭시 모달 호출
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
					//console.log(modalGrid.getValue(modalGrid.getCheckedRowKeys(),'설비코드'));
					data = {
						설비코드 : chkRows[i].설비코드,
						점검일자 : chkRows[i].점검일자,
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
							if(res.result){	toastr.success('등록성공!');	}
							},
						error : function(){toastr.error('등록실패!');}
					})// END OF AJAX 
			
		 
				
				
			}); // END OF MAIN SAVBTN SYNTAX
			
			
			
		
});						

 </script>




</html>