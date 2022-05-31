<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mainTitle" style="padding-bottom: 15px;">
		<h1>불량내역조회</h1>
	</div>
	
	<div>
		<button type="button" id="mtBtn" class="btn1">자재</button>
		<button type="button" id="prodBtn" class="clickB">제품</button>
	</div>
	
	<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">
			
			<!-- grid 테이블 출력 div -->
			<div id="errLotList"></div>
			
		</div>
	</div>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>
		
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
		columns : [ {
			header: '발주코드',
			name: '발주코드'
		}, {
			header: '발주상세코드',
			name: '발주상세코드'
		}, {
			header: '검사일자',
			name: '검사일자'
		}, {
			header: '업체명',
			name: '업체명'
		}, {
			header: '자재명',
			name: '자재명'
		}, {
			header: '불량량',
			name: '불량량'
		}, {
			header: '불량내역',
			name: '불량내역',
			width: '200'
		}, {
			header: '단가',
			name: '단가',
			width: '80'
		}, {
			header: '청구금액',
			name:  '청구금액'
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
		$('#prodBtn').attr("class", "clickB");
		$('#mtBtn').removeClass();
		$('#mtBtn').attr("class", "btn1");
		
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
			columns : [ {
				header: '발주코드',
				name: '발주코드'
			}, {
				header: '발주상세코드',
				name: '발주상세코드'
			}, {
				header: '검사일자',
				name: '검사일자'
			}, {
				header: '업체명',
				name: '업체명'
			}, {
				header: '자재명',
				name: '자재명'
			}, {
				header: '불량량',
				name: '불량량'
			}, {
				header: '불량내역',
				name: '불량내역',
				width: '200'
			}, {
				header: '단가',
				name: '단가',
				width: '80'
			}, {
				header: '청구금액',
				name:  '청구금액'
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
		$('#mtBtn').attr("class", "clickB");
		$('#prodBtn').removeClass();
		$('#prodBtn').attr("class", "btn1");

		$.ajax({
			url : "selectProdErrList",
			method : "GET",
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
				header : '불량내역',
				name : '불량내역'
			} ],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 10
			}
		});
	});
	</script>
</body>
</html>