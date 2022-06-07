<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		}, {
			header : '계획상세코드',
			name : '생산계획상세코드',
			className : 'fontClass',
		},
		{
			header : '제품명',
			name : '완제품명',
			className : 'fontClass',

		}, {
			header : '생산일수',
			name : '생산일수',
			className : 'fontClass',
		},{
			header : '수량',
			name : '계획량',
			className : 'fontClass',
		},{
			header : '생산지시량',
			name : '생산지시량',
			className : 'fontClass',
		},{
			header : '잔량',
			name : '잔량',
			className : 'fontClass',
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
			}, {
				header : '작업일자',
				name : '작업일자',
				className : 'fontClass',
				editor : {
	                  type : 'datePicker',
	                  options : {
	                     format : 'yyyy-MM-dd'
	                  }
				}
			}, {
				header : '작업수량',
				name : '작업수량',
				className : 'fontClass',
				editor : {
	                  type : 'text',
	                  }
			}, {
				header : '일자별우선순위',
				name : '일자별우선순위',
				editor : {
	                  type : 'text',
	                  }
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

				}, {
					header : '자재명',
					name : '자재명',
					className : 'fontClass',
				}, {
					header : '소모량',
					name : '소모량',
					className : 'fontClass',
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

					}, {
						header : '사용수량',
						name : '사용수량',
						className : 'fontClass',
					}, {
						header : '유통기한',
						name : '유통기한',
						className : 'fontClass',
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

	
	procOrder.on('mousedown', (ev) => {
	selectedRowKey = ev.rowKey;
	lineCode = procOrder.getValue(selectedRowKey, '라인코드');
	workDate = procOrder.getValue(selectedRowKey, '작업일자');
	workQty = procOrder.getValue(selectedRowKey, '작업수량');
	dateRank = procOrder.getValue(selectedRowKey, '일자별우선순위');
	if(workQty != null){
	procDtPlan.setValue(ev.rowKey,'생산지시량', workQty);
	let Qty = procDtPlan.getValue(ev.rowKey, '계획량');
	procDtPlan.setValue(ev.rowKey,'잔량', Qty-workQty);
		
	}
	
	temp = 
	console.log(workDate + ' ' + workQty + ' ' + dateRank);
	$("#btnNeedMtrl").click(function () {
		let rowCount = procOrder.getRowCount();
	if(workDate != null && workQty != null && dateRank != null ){
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
							console.log(result);
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
/* 		 console.log(dtlCdRow);
		 console.log(dtlCd); */
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
			console.log(result);
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
		  

	});
	</script>

</body>
</html>