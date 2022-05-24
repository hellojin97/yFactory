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
		<h1>품질검사관리</h1>
	</div>
	
	<div>
		<button type="button" id="mtBtn" class="btn1">자재</button>
		<button type="button" id="prodBtn" class="clickB">제품</button>
	</div>
	
	<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">
			
			<!-- grid 테이블 출력 div -->
			<div id="qaRequestMgr"></div>
			
			<div class="col-md-5" style="padding-bottom: 10px;">
				<div class="input-group">
					<div style="padding-right: 10px;">
						<button type="button" id="update" class="btn1" onclick="update">완료</button>							
					</div>
				</div>
			</div>
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
		url : "selectMtCheckMgr",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			defaultMt.resetData(result);
		}
	});

	var defaultMt = new tui.Grid({
		el : document.getElementById('qaRequestMgr'),
		columns : [ {
			header: '발주상세코드',
			name: '발주상세코드'
		}, {
			header: '자재코드',
			name: '자재코드'
		}, {
			header: '자재명',
			name: '자재명'
		}, {
			header: '발주량',
			name: '발주량'
		}, {
			header: '합격량',
			name: '합격량',
			editor : "text"
		}, {
			header: '불량량',
			name: '불량량'
		}, {
			header: '불량명',
			name: '불량명'
		}, {
			header: '불량내역',
			name: '불량내역'
		}, {
			header: '상태',
			name: '상태'
		} ],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 10
		}
	});

	// 자재 버튼 클릭 시 실행
	$('#mtBtn').on('click', function(){
		$('#qaRequestMgr').empty();
		$('#prodBtn').removeClass();
		$('#prodBtn').attr("class", "clickB");
		$('#mtBtn').removeClass();
		$('#mtBtn').attr("class", "btn1");
		
		$.ajax({
			url : "selectMtCheckMgr",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				grid.resetData(result);			
			}
		});

		var grid = new tui.Grid({
			el : document.getElementById('qaRequestMgr'),
			columns : [ {
				header: '발주상세코드',
				name: '발주상세코드'
			}, {
				header: '자재코드',
				name: '자재코드'
			}, {
				header: '자재명',
				name: '자재명'
			}, {
				header: '발주량',
				name: '발주량'
			}, {
				header: '합격량',
				name: '합격량',
				editor : "text"
			}, {
				header: '불량량',
				name: '불량량'
			}, {
				header: '불량명',
				name: '불량명'
			}, {
				header: '불량내역',
				name: '불량내역'
			}, {
				header: '상태',
				name: '상태'
			} ],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 10
			}
		});
	});
	
	//제품 버튼 클릭 시 실행
	$('#prodBtn').on('click', function(){
		$('#qaRequestMgr').empty();
		$('#mtBtn').removeClass();
		$('#mtBtn').attr("class", "clickB");
		$('#prodBtn').removeClass();
		$('#prodBtn').attr("class", "btn1");
		
		$.ajax({
			url : "selectProdCheckMgr",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				grid.resetData(result);			
			}
		});
		
		var grid = new tui.Grid({
			el : document.getElementById('qaRequestMgr'),
			columns : [ {
				header: '제품LOT',
				name: '제품LOT'
			}, {
				header: '제품코드',
				name: '제품코드'
			}, {
				header: '제품명',
				name: '제품명'
			}, {
				header: '공정코드',
				name: '공정코드'
			}, {
				header: '설비코드',
				name: '설비코드'
			}, {
				header: '생산량',
				name: '생산량'
			}, {
				header: '합격량',
				name: '합격량',
				editor : "text"
			}, {
				header: '불량량',
				name: '불량량'
			}, {
				header: '불량코드',
				name: '불량코드'
			}, {
				header: '불량명',
				name: '불량명'
			}, {
				header: '상태',
				name: '상태'
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