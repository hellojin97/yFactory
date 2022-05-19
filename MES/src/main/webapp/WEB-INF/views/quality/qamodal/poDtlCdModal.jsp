<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 발주상세코드 Modal  -->
	<div id="

" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">발주상세코드</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-8 " style="padding-bottom: 20px;">
						<div class="input-group ">
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">발주상세코드</label>
								<input type="text" class="form-control" style="width: 50px" id="poDtlCd" placeholder="발주상세코드">
							<a class="nav-link nav-icon search-bar-toggle " id="poDtlCdSearch"	onclick="poDtlCdSearch">
								<i class="bi bi-search"	style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="poDtlCdGrid"></div>
				</div>
				<!-- 내용끝 -->
				
			</div>
		</div>
	</div>
	<!-- 모달끝 -->
	
	<script>
	// 발주상세코드 조회
	$.ajax({
		url: "poDtlCdModalList",
		dataType: "JSON"
	}).done(function(result){
		grid.resetData(result);
	});
	
	var pocdList = new tui.grid({
		el: document.getElementById('poDtlCdGrid'),
		columns: [ {
			header: '발주상세코드'
			name: '발주상세코드'
		}, {
			header: '자재명'
			name: '자재명'
		}],
		rowHeaders: [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 5
		}
	});
	</script>
</body>
</html>