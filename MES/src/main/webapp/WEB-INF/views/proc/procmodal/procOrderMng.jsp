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
		<h3>생산지시관리</h3>
	</div>
	<div>
		<button id="btnNoPlanSelect" class="btn1">미지시 계획 조회</button>
		
	</div>
	<div>
	<h3>상세생산계획</h3>
	<div id="procDtPlan"></div>
	</div>
	<div>
	<h3>생산지시</h3>
	<div id="procOrder"></div>
	<button id="btnNeedMtrl">조회</button>
	</div>
	<div>
	<h3>필요자재</h3>
	<div id="needMtrl"></div>
	</div>
	<div>
	<h3>필요자재LOT</h3>
	<hr>
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
		}, {
			header : '계획상세코드',
			name : '생산계획상세코드'
		},{
			header : '제품명',
			name : '완제품명',

		}, {
			header : '생산일수',
			name : '생산일수',
		},{
			header : '수량',
			name : '계획량',
		},{
			header : '생산지시량',
			name : '생산지시량',
		},{
			header : '잔량',
			name : '잔량',
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
			}, {
				header : '작업일자',
				name : '작업일자',
				editor : {
	                  type : 'datePicker',
	                  options : {
	                     format : 'yyyy-MM-dd'
	                  }
				}
			}, {
				header : '작업수량',
				name : '작업수량',
				editor : {
	                  type : 'text',
	                  }
			}, {
				header : '일자별 우선순위',
				name : '일자별 우선순위',
				editor : {
	                  type : 'text',
	                  }
			},{
				header : '비고',
				name : '비고',
				editor : {
	                  type : 'text',
	                  }
			},
			
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
				scrollY : false,
				columns : [ {
					header : '제품코드',
					name : '제품코드',
				}, {
					header : '자재코드',
					name : '자재코드',

				}, {
					header : '자재명',
					name : '자재명',
				}, {
					header : '소모량',
					name : '소모량',
				},
				],
				rowHeaders : [ 'rowNum' ],
				pageOptions : {
					useClient : true,
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
					}, {
						header : '자재LOT번호',
						name : '자재LOT번호',

					}, {
						header : '사용수량',
						name : '사용수량',
					}, {
						header : '유통기한',
						name : '유통기한',
					},{
						header : '지시디테일코드',
						name : '지시디테일코드',
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
	dateRank = procOrder.getValue(selectedRowKey, '일자별 우선순위');
	temp = 
	//if (lineCode != null){
		//procOrder.focus(selectedRowKey, '작업일자');
	//}
	console.log(workDate + ' ' + workQty + ' ' + dateRank);
	$("#btnNeedMtrl").click(function () {
	if(workDate != null && workQty != null && dateRank != null ){
		if(workDate != bworkDate || bworkQty != workQty || bdateRank != dateRank){
			needMtrl.clear();
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
			
	</script>

</body>
</html>