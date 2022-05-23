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
	</div>
	<div>
	<h3>필요자재</h3>
	<div id="needMtrl"></div>
	</div>
	<div>
	<h3>필요자재LOT</h3>
	<div id="needMtrlLOT"></div>
	</div>
		
	<div id="main"></div>
	
	<script>
	var procDtPlan
	var procOrder
	var needMtrl
	var needMtrlLOT
	$(function(){
		procDtPlan = new tui.Grid({
		el : document.getElementById('procDtPlan'),
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '생산계획코드',
			name : '생산계획코드',
		}, {
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
				},{
					header : '수량',
					name : '수량',
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
					rowHeaders : [ 'checkbox' ],
					pageOptions : {
						useClient : true,
						perPage : 5
					}

				});
				
	$("#btnNoPlanSelect").click(function () {
		$("#main").load("procodermngModal", function() {

			const procDtPlanModal = new bootstrap.Modal('#procDtPlanModal');
			procDtPlanModal.show();
 			});
		});
	
	
	});
			
	</script>

</body>
</html>