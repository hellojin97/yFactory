<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<div class="mainTitle">
		<h3>공정 관리</h3>
		<div>
		공정구분
		<select id = "procProcessSelect">
		<option value="전체">전체</option>
		</select>
		
		<button id="btnSearch" class="btn1">검색</button>
		<button id="btnClear" class="btn1">초기화</button>
		</div>
	</div>
	<hr>
	<div>
	<button id="btnInsert" class="btn1">추가</button>
	<button id="btnDelete" class="btn1">삭제</button>
	<button id="btnSave" class="btn1">저장</button>
	</div>


	<div id="procProcessCtlGrid"></div>
	<div id="test"></div>

	<script>
	$(function(){
		 var selectBox = [];


		 const url1 = "procProcessCheckList";
		   $.ajax(url1,{
			   dataType : "JSON",
			   method: "GET"
		   }).done(function(result){
			   //console.log(result)
			   for (var i = 0; i < result.length; i++) {
					 var list = {};
					 list.text = result[i].CD_NM;
					 list.value = result[i].CD_NM;

					 selectBox.push(list);
					 console.log(selectBox);
				$("#procProcessSelect").append('<option value="' + result[i].CD_NM + '">' + result[i].CD_NM + '</option');
				
			} 
				 				 
		   });	
			

			 
	 const url = "procProcessCtlSelect";
	   $.ajax(url,{
		   dataType : "JSON",
		   method: "GET"
	   }).done(function(result){
		   
		   procProcessCtlGrid.resetData(result);
	   })
	   
				procProcessCtlGrid = new tui.Grid({
					el : document.getElementById('procProcessCtlGrid'),
					scrollX : false,
					scrollY : false,
					columns : [ {
						header : '공정코드',
						name : '공정코드',
						className : 'fontClass',
					}, 
					{
						header : '공정명',
						name : '공정명',
						className : 'fontClass',

					}, 
					{
						header : '공정구분',
						name : '공정구분',
          				className : 'fontClass',
						  editor: {
                              type: 'select',
                              options: {
                                listItems: selectBox,
                          }
						  },
						  validation: { required: true }
					},

					{
						header : '설비코드',
						name : '설비코드',
						className : 'fontClass',
						  validation: { required: true }

					}, {
						header : '설비명',
						name : '설비명',
						className : 'fontClass',
					},{
						header : '모델명',
						name : '모델명',
						className : 'fontClass',
					},
					{
						header : '관리자',
						name : '관리자',
						className : 'fontClass',
					},
					],
					rowHeaders : [
 				          {
 	   				        type: 'checkbox',
 	   				          },
   				        	{
   				            type: 'rowNum',

   				          }

   				          ],
					pageOptions : {
						useClient : true,
						perPage : 5
					}

				});
	   
		procProcessCtlGrid.on("click", function(e) {
			let prd = procProcessCtlGrid.getFocusedCell('설비코드');
			if (prd.columnName == '설비코드') {
				console.log(prd);
				if (prd.value == null) {
					$("#test").load("procNoUseEqSelectModal", function() {
						const procNoUseEqSelectModal = new bootstrap.Modal('#NoUseEqSelectModal');
						procNoUseEqSelectModal.show();

					})
				}
			}

		})
				
	});
	
	

	
	btnSearch.addEventListener("click", function() {
		//  조회 ajax 작성 요망 
		let cdNm = $("#procProcessSelect option:selected").val();
		console.log(cdNm);
 		 if(cdNm != null){
			  $.ajax({
					   url  : "procCdNmSelect",
					   data : {
						   cdNm : cdNm
						   },
					   dataType : "JSON",
					   contentType : "application/json; charset = UTF-8;"
				   }).done(function(result){
					   procProcessCtlGrid.resetData(result);
				   })
		} 
	});
	
	btnClear.addEventListener("click", function() {
		procProcessCtlGrid.clear();
	});
	
	btnInsert.addEventListener("click", function() {
		procProcessCtlGrid.prependRow(0);
	});
	btnDelete.addEventListener("click", function() {
		//삭제 ajax 작성 요망
		let eq = procProcessCtlGrid.getCheckedRows();
		
		 /* 확인 CONFIRM  */
		  Swal.fire({
	          title: '생산계획을 삭제하시겠습니까?',
	          icon: 'warning',
	          showCancelButton: true,
	          confirmButtonColor: '#3085d6',
	          cancelButtonColor: '#d33',
	          confirmButtonText: '승인',
	          cancelButtonText: '취소'
	      }).then((result) => {
	      	console.log(result);
	      	console.log(result.isDismissed); // 승인시 FALSE / 취소시 TRUE
	          if (result.isConfirmed) {
	        	  
	        	  for (var i = 0; i < eq.length; i++) {
	 				 result = {
	 		 				 "procCls" : eq[i].공정구분,
	 		 				 "eqCd" : eq[i].설비코드
	  					 };
	 				 
		               $.ajax({
						   url  : "procProcessMgtDelete",
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
					        		    window.location = "procProcessCtl";
					        		});

	          			}else{
	          	Swal.fire(
	                      '승인이 취소되었습니다.',
	                      '섹시하시네요~!',
	                      'error'
	                  )
	          			}
	      }) 

	});
	
	btnSave.addEventListener("click", function() {
		//저장 ajax 작성 요망
		let eq = procProcessCtlGrid.getCheckedRows();
		
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
	          if (result.isConfirmed) {
	        	  
	        	  for (var i = 0; i < eq.length; i++) {
	 				 result = {
	 		 				 "procCls" : eq[i].공정구분,
	 		 				 "eqCd" : eq[i].설비코드
	  					 };
	 				 
		               $.ajax({
						   url  : "procProcessMgtInsert",
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
					        		    window.location = "procProcessCtl";
					        		});

	          			}else{
	          	Swal.fire(
	                      '승인이 취소되었습니다.',
	                      '섹시하시네요~!',
	                      'error'
	                  )
	          			}
	      }) 
	});
	


			
	</script>

</body>
</html>