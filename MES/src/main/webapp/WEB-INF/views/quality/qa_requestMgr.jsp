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
	
	<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">
			<div id="qaRequestMgr_mt"></div>
			
			<div class="col-md-5" style="padding-bottom: 10px;">
				<div class="input-group">
					<div style="padding-right: 10px;">
						<button type="button" id="update" class="btn1" onclick="update">완료</button>							
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$.ajax({
		url: "selectMtCheckMgr",
		dataType: "JSON",
		contentType : "application/json; charset=utf-8",
	}).done(function(result) {
		grid.resetData(result);
	})
	
	var grid = new tui.Grid({
		el: document.getElementById('qaRequestMgr_mt'),
		columns: [ {
			header: '발주상세코드',
			name: '발주상세코드',
		}, {
			header: '자재코드',
			name: '자재코드',
		}, {
			header: '자재명',
			name: '자재명',
		}, {
			header: '검사일자',
			name: '검사일자',
		}, {
			header: '발주량',
			name: '발주량',
		}, {
			header: '합격량',
			name: '합격량',
		}, {
			header: '불량량',
			name: '불량량',
		}, {
			header: '불량명',
			name: '불량명',
		}, {
			header: '불량내역',
			name: '불량내역',
		}, {
			header: '상태',
			name: '상태',
		} ],
		rowHeaders: [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 10
		}
	});
	</script>
</body>
</html>