<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="padding-bottom: 70px; ">
	<div class="mainTitle" style="padding-bottom: 15px;">
		<h1>불량내역조회</h1>
	</div>
	
	<div class="min2">
		<button type="button" class="btn2" id="mtBtn">자재</button>
		<button type="button" class="btn3" id="prodBtn">제품</button>
	</div>
	<div class="min1" >
	<div style="background-color: #e9ecef; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">
			
			<!-- grid 테이블 출력 div -->
			<div id="errLotList"></div>
			<div>
				<button type="button" class="btn1" id="excel">Excel</button>
			</div>
		</div>
	</div>
	</div>
	</div>

	<script>
	// 페이지 onload
	$.ajax({
		url : "selectMtErrList",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			grid.resetData(result);
		}
	});

	var grid = new tui.Grid({
		el : document.getElementById('errLotList'),
		columns : [ 
			{
				header: '품질검사코드',
				name: '품질검사코드',
				width: '100',
				align: 'center',
				className : 'fontClass'
			}, {
				header: '자재코드',
				name: '자재코드',
				width: '60',
				align: 'center',
				className : 'fontClass'
			}, {
				header: '자재명',
				name: '자재명',
				className : 'fontClass',
				width: '60'
			}, {
				header:'담당인',
				name: '담당인',
				width: '60',
				align: 'center',
				className : 'fontClass'
			}, {
				header: '검사일',
				name: '검사일',
				width: '80',
				align: 'center',
				className : 'fontClass'
			}, {
				header: '불량코드',
				name: '불량코드',
				width: '80',
				align: 'center',
				className : 'fontClass'
			}, {
				header: '불량사유',
				name: '불량사유',
				className : 'fontClass',
				width: '170'
			}, {
				header: '납품업체명',
				name: '납품업체명',
				width: '140',
				align: 'center',
				className : 'fontClass'
			}, {
				header: '불량량',
				name: '불량량',
				width: '60',
				align: 'right',
				className : 'fontClass'
			}, {
				header: '단가',
				name: '단가',
				width: '80',
				align: 'right',
				className : 'fontClass'
			}, {
				header: '청구금액',
				name:  '청구금액',
				width: '80',
				align: 'right',
				className : 'fontClass'
			} ],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 10
		}
	});

	// 자재 버튼 클릭 시 실행
	$('#mtBtn').on('click', function(){
		$('#errLotList').empty();
		$('#prodBtn').removeClass();
		$('#prodBtn').attr("class", "btn3");
		$('#mtBtn').removeClass();
		$('#mtBtn').attr("class", "btn2");
		
		$.ajax({
			url : "selectMtErrList",
			dataType : "JSON",
			success : function(result) {
				grid.resetData(result);			
			}
		});

		var grid = new tui.Grid({
			el : document.getElementById('errLotList'),
			columns : [ 
				{
					header: '품질검사코드',
					name: '품질검사코드',
					width: '100',
					align: 'center',
					className : 'fontClass'
				}, {
					header: '자재코드',
					name: '자재코드',
					width: '60',
					align: 'center',
					className : 'fontClass'
				}, {
					header: '자재명',
					name: '자재명',
					className : 'fontClass',
					width: '60'
				}, {
					header:'담당인',
					name: '담당인',
					width: '60',
					align: 'center',
					className : 'fontClass'
				}, {
					header: '검사일',
					name: '검사일',
					width: '80',
					align: 'center',
					className : 'fontClass'
				}, {
					header: '불량코드',
					name: '불량코드',
					width: '80',
					align: 'center',
					className : 'fontClass'
				}, {
					header: '불량사유',
					name: '불량사유',
					className : 'fontClass',
					width: '170'
				}, {
					header: '납품업체명',
					name: '납품업체명',
					width: '140',
					align: 'center',
					className : 'fontClass'
				}, {
					header: '불량량',
					name: '불량량',
					width: '60',
					align: 'right',
					className : 'fontClass'
				}, {
					header: '단가',
					name: '단가',
					width: '80',
					align: 'right',
					className : 'fontClass'
				}, {
					header: '청구금액',
					name:  '청구금액',
					width: '80',
					align: 'right',
					className : 'fontClass'
				} ],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 10
			}
		});
	});
	
	//제품 버튼 클릭 시 실행
	$('#prodBtn').on('click', function() {
		$('#errLotList').empty();
		$('#mtBtn').removeClass();
		$('#mtBtn').attr("class", "btn3");
		$('#prodBtn').removeClass();
		$('#prodBtn').attr("class", "btn2");

		$.ajax({
			url : "selectProdErrList",
			dataType : "JSON",
			success : function(result) {
				grid.resetData(result);
			}
		});

		var grid = new tui.Grid({
			el : document.getElementById('errLotList'),
			columns : [ {
				header : '제품LOT',
				name : '제품LOT'
			}, {
				header : '제품코드',
				name : '제품코드'
			}, {
				header : '제품명',
				name : '제품명'
			}, {
				header : '불량량',
				name : '불량량'
			}, {
				header : '불량코드',
				name : '불량코드'
			}, {
				header : '불량사유',
				name : '불량사유',
				width: '200'
			} ],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 10
			}
		});
	});
	
	//excel호출
	$('#excel').on('click',function(){
		const options = {
				  includeHiddenColumns: true,
				  onlySelected: true,
				  fileName: '불량내역',
				};
		grid.export('xlsx', options);
	})
	</script>
</body>
</html>