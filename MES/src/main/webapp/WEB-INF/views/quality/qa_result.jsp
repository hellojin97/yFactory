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
		<h1>품질검사결과</h1>
	</div>
	
	<div class="min2">
		<button type="button" class="btn2" id="mtBtn">자재</button>
		<button type="button" class="btn3" id="prodBtn">제품</button>
	</div>
	<div class="min1" >
	<div style="background-color: #e9ecef; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">
			
			<!-- grid 테이블 출력 div -->
			<div id="qaResult"></div>
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
			url : "selectMtCheck",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				grid.resetData(result);
			}
		});
	
		var grid = new tui.Grid({
			el : document.getElementById('qaResult'),
			columns : [ {
				header: '발주코드',
				name: '발주코드',
				width: '115',
				align: 'center'
			}, {
				header: '품질검사코드',
				name: '품질검사코드',
				width:'110',
				align: 'center'
			}, {
				header: '자재코드',
				name: '자재코드',
				width: '80',
				align: 'center'
			}, {
				header: '자재명',
				name: '자재명',
				width: '80'
			}, {
				header: '담당인',
				name: '담당인',
				width: '80',
				align: 'center'
			}, {
				header: '검사일',
				name: '검사일',
				width: '90',
				align: 'center'
			}, {
				header: '발주량',
				name: '발주량',
				width: '60',
				align: 'right'
			}, {
				header: '합격량',
				name: '합격량',
				width: '60',
				align: 'right'
			}, {
				header: '불량량',
				name: '불량량',
				width: '60',
				align: 'right'
			}, {
				header: '불량코드',
				name: '불량코드',
				width:'90',
				align: 'center'
			}, {
				header: '불량사유',
				name: '불량사유',
				width:'180'
			}, {
				header: '상태',
				name: '상태',
				width: '80',
				align: 'center'
			} ],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 10
			}
		});

		// 자재 버튼 클릭 시 실행
		$('#mtBtn').on('click', function(){
			$('#qaResult').empty();
			$('#prodBtn').removeClass();
			$('#prodBtn').attr("class", "btn3");
			$('#mtBtn').removeClass();
			$('#mtBtn').attr("class", "btn2");
			
			$.ajax({
				url : "selectMtCheck",
				method : "GET",
				dataType : "JSON",
				success : function(result) {
					grid.resetData(result);			
				}
			});
	
			var grid = new tui.Grid({
				el : document.getElementById('qaResult'),
				columns : [ {
					header: '발주코드',
					name: '발주코드',
					width: '115',
					align: 'center'
				}, {
					header: '품질검사코드',
					name: '품질검사코드',
					width:'110',
					align: 'center'
				}, {
					header: '자재코드',
					name: '자재코드',
					width: '80',
					align: 'center'
				}, {
					header: '자재명',
					name: '자재명',
					width: '80'
				}, {
					header: '담당인',
					name: '담당인',
					width: '80',
					align: 'center'
				}, {
					header: '검사일',
					name: '검사일',
					width: '90',
					align: 'center'
				}, {
					header: '발주량',
					name: '발주량',
					width: '60',
					align: 'right'
				}, {
					header: '합격량',
					name: '합격량',
					width: '60',
					align: 'right'
				}, {
					header: '불량량',
					name: '불량량',
					width: '60',
					align: 'right'
				}, {
					header: '불량코드',
					name: '불량코드',
					width:'90',
					align: 'center'
				}, {
					header: '불량사유',
					name: '불량사유',
					width:'180'
				}, {
					header: '상태',
					name: '상태',
					width: '80',
					align: 'center'
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
			$('#qaResult').empty();
			$('#mtBtn').removeClass();
			$('#mtBtn').attr("class", "btn3");
			$('#prodBtn').removeClass();
			$('#prodBtn').attr("class", "btn2");

			$.ajax({
				url : "selectProdCheck",
				method : "GET",
				dataType : "JSON",
				success : function(result) {
					grid.resetData(result);
				}
			});

			var grid = new tui.Grid({
				el : document.getElementById('qaResult'),
				columns : [ {
					header : '제품LOT',
					name : '제품LOT',
					align: 'center'
				}, {
					header : '제품코드',
					name : '제품코드',
					align: 'center'
				}, {
					header : '제품명',
					name : '제품명',
					align: 'center'
				}, {
					header : '공정코드',
					name : '공정코드',
					align: 'center'
				}, {
					header : '설비코드',
					name : '설비코드',
					align: 'center'
				}, {
					header : '생산량',
					name : '생산량',
					align: 'right'
				}, {
					header : '합격량',
					name : '합격량',
					align: 'right'
				}, {
					header : '불량량',
					name : '불량량',
					align: 'right'
				}, {
					header : '불량코드',
					name : '불량코드',
					align: 'center'
				}, {
					header : '불량명',
					name : '불량명',
					align: 'center'
				}, {
					header : '상태',
					name : '상태',
					align: 'center'
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