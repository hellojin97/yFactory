<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="mainTitle">
		<h1>생산지시관리</h1>
	</div>
	<div>
		<button id="btnNoPlanSelect" class="btn1" style="margin-bottom: 1em;">미지시 계획 조회</button>
		<button id="prdInsert" class="btn1">생산지시 등록</button>
	</div>
	<div>
	<h3>상세생산계획</h3>
	<div id="procDtPlan"></div>
	</div>
	<div>
	<h3>생산지시</h3>
	<div id="procOrder"></div>
	<button id="btnNeedMtrl" class="btn-warning btn-block" style="margin-bottom: 1em;">조회</button>
	</div>
	<div>
	<h3>필요자재</h3>
	<div id="needMtrl"></div>
	</div>
	<div>
	<h3 style="margin-top: 1em;">필요자재LOT</h3>
	<div id="needMtrlLOT"></div>
	</div>
		
	<div id="procDtPlanDiv"></div>
	<div id="needMtrlDiv"></div>
	<input type="hidden" id="modalState" />
	<script>
	var procDtPlan
	var procOrder
	var needMtrl
	var needMtrlLOT

	$(function(){
		
		
		
		
		
		var dtlCd = [];
		procDtPlan = new tui.Grid({
		el : document.getElementById('procDtPlan'),
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '생산계획코드',
			name : '생산계획코드',
			className : 'fontClass',
			align: 'center',
		}, {
			header : '계획상세코드',
			name : '생산계획상세코드',
			className : 'fontClass',
			align: 'center',
		},
		{
			header : '제품명',
			name : '완제품명',
			className : 'fontClass',

		}, {
			header : '생산일수',
			name : '생산일수',
			className : 'fontClass',
			align: 'right',
		},{
			header : '수량',
			name : '계획량',
			className : 'fontClass',
			align: 'right',


		},{
			header : '생산지시량',
			name : '생산지시량',
			className : 'fontClass',
			align: 'right',

		},{
			header : '잔량',
			name : '잔량',
			className : 'fontClass',
			align: 'right',

		},
		
		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 5
		}

	});
	
	
		procOrder = new tui.Grid({
			el : document.getElementById('procOrder'),
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '라인코드',
				name : '라인코드',
				className : 'fontClass',
				align: 'center',
			}, {
				header : '작업일자',
				name : '작업일자',
				className : 'fontClass',
				align: 'center',
				editor : {
	                  type : 'datePicker',
	                  options : {
	                     format : 'yyyy-MM-dd'
	                  }
				},
			validation: { required: true }
			}, {
				header : '작업수량',
				name : '작업수량',
				className : 'fontClass',
				align: 'right',
				editor : {
	                  type : 'text',
	                  },
			validation: { required: true }
			}, {
				header : '일자별우선순위',
				name : '일자별우선순위',
				align: 'center',
				editor : {
	                  type : 'text',
	                  },
			validation: { required: true }
			}
			
			],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 5
			}

		});
		
		
		
		
			needMtrl = new tui.Grid({
				el : document.getElementById('needMtrl'),
				scrollX : false,
				bodyHeight : 150,
				columns : [  {
					header : '자재코드',
					name : '자재코드',
					className : 'fontClass',
					align: 'center',
				}, {
					header : '자재명',
					name : '자재명',
					className : 'fontClass',
				}, {
					header : '소모량',
					name : '소모량',
					className : 'fontClass',
					align: 'right',
					formatter(myNum) {                
						               return myNum.value.toString()
						               .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						         		}
				},
				],
				rowHeaders : [ 'rowNum' ],
				pageOptions : {
					useClient : true,
					type : 'scroll',
					perPage : 5
				}

			});
			
			
				needMtrlLOT = new tui.Grid({
					el : document.getElementById('needMtrlLOT'),
					scrollX : false,
					scrollY : false,
					columns : [ {
						header : '자재명',
						name : '자재명',
						className : 'fontClass',
					}, {
						header : '자재LOT번호',
						name : '자재LOT번호',
						className : 'fontClass',
						align: 'center',

					}, {
						header : '사용수량',
						name : '사용수량',
						className : 'fontClass',
						align: 'right',
					}, {
						header : '유통기한',
						name : '유통기한',
						className : 'fontClass',
						align: 'center',
					},
					],
					rowHeaders : [
   				        {
   				            type: 'rowNum',

   				          },
   				          {
   				            type: 'checkbox',
   				          }
   				          ],
					pageOptions : {
						useClient : true,
						perPage : 5
					}

				});
				
				
				
    
	// focusChange 변수
	let selectedRowKey = null;
	let workDate, bworkDate;
	let workQty, bworkQty;
	let dateRank, bdateRank;
	let temp;

	

	procOrder.on('afterChange', (ev) => {
		orgin: 'cell';
		selectedRowKey = ev.changes;
		lineCode = procOrder.getValue(selectedRowKey, '라인코드');
		workDate = procOrder.getValue(selectedRowKey, '작업일자');
		workQty = procOrder.getValue(selectedRowKey, '작업수량');
		dateRank = procOrder.getValue(selectedRowKey, '일자별우선순위');
			
		if(workQty != null){
		procDtPlan.setValue(selectedRowKey[0].rowKey,'생산지시량', workQty);
		let Qty = procDtPlan.getValue(selectedRowKey[0].rowKey, '계획량');
		procDtPlan.setValue(selectedRowKey[0].rowKey,'잔량', Qty-workQty);
			
		}
	


	$("#btnNeedMtrl").click(function () {

		let rowCount = procOrder.getRowCount();
	if(workDate != null && workQty != null && dateRank != null){
		if(workDate != bworkDate || bworkQty != workQty || bdateRank != dateRank){
			needMtrl.clear();
			
			for (var i = 0; i < rowCount; i++) {
				
			
		//procNeedMtrl
			let line = lineCode;
		    var data= {line : line};
			if(line != null){
			//ajax 실행
				 	  $.ajax({
						url  : "procNeedMtrl",
						data :  JSON.stringify(data), 
						dataType : "JSON",
						type : "POST",
						contentType : "application/json; charset = UTF-8;"
				   	  }).done(function(result){
							for (var i = 0; i < result.length; i++) {
								result[i].소모량 = result[i].소모량 * workQty;
								needMtrl.appendRow(result[i]);
								dtlCd.push(result[i].생산지시상세코드);
							}

				   })
	        }
			bworkDate = workDate;
			bworkQty = workQty;
			bdateRank = dateRank;
		}
		}
	}
	
	});

	});
	

	$("#btnNoPlanSelect").click(function () {
		$("#modalState").val("1");
		$("#procDtPlanDiv").load("procodermngModal", function() {

			const procDtPlanModal = new bootstrap.Modal('#procDtPlanModal');
			procDtPlanModal.show();
			 
			
 			});
		});
	
	needMtrl.on("dblclick",function(e) {
		 let dtlCdRow = dtlCd[e.rowKey];
		 $("#dtlCdText").val(dtlCdRow);

		 $("#modalState").val('2');
		 let ppCd = needMtrl.getValue(e.rowKey, '자재명');
		 let mtNm = needMtrl.getValue(e.rowKey, '자재코드');
		 let pdQty = needMtrl.getValue(e.rowKey, '소모량');
		 $("#ppCdText").val(ppCd);
		 $("#pdQtyText").val(pdQty);
		 $("#mtNmText").val(mtNm);

			$("#needMtrlDiv").load("procodermngModal", function() {
				const needMtrlModal = new bootstrap.Modal('#needMtrlModal');
				needMtrlModal.show();
			})
		})
	
	});
	
	$("#prdInsert").click(function() {
		let checkAry = needMtrlLOT.getCheckedRows();
	
		Swal.fire({
	        title: '생산지시를 등록하시겠습니까?',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '승인',
	        cancelButtonText: '취소'
	    }).then((result) => {
	    	if (result.isConfirmed) {
		
		  for(var i = 0; i < checkAry.length; i++) {
			var result = {
					"ppCd" : procDtPlan.getData()[0].생산계획코드,
					"pdNm" : procDtPlan.getData()[0].완제품명,
					"line" : procOrder.getData()[0].라인코드,
					"dtlDt" : procOrder.getData()[0].작업일자,
					"insQty" : procOrder.getData()[0].작업수량,
					"rank" : procOrder.getData()[0].일자별우선순위,
					"mLot" : needMtrlLOT.getData()[i].자재LOT번호,
					"procQty" : needMtrlLOT.getData()[i].사용수량
			};

			  // AJAX START
 			  $.ajax({
				  url: "prdInsInsert",
				  data :  result,
				   dataType : "JSON",
				   async : false,
				   type : "POST",
				   
			  }).done(function(result){
			  }) 
			  // END OF AJAX
			
		} 
		  Swal.fire(
                  '승인이 완료되었습니다.',
                  '변경이 완료되었습니다.',
                  'success'
              ).then(function(){
            	  window.location = "procOrderSelect";	  
          	  });
	        	}else{
	              	Swal.fire(
	                        '승인이 취소되었습니다.',
	                        '',
	                        'error'
	                    )
	            }
	           })
		  

	});
	</script>

</body>
</html>