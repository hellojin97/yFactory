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
	<div id="poDtlCdModal" class="modal fade" tabindex="-1">
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
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">자재명</label>
								<input type="text" class="form-control" style="width: 50px" id="mtName" placeholder="자재명">
							<a class="nav-link nav-icon search-bar-toggle " id="mtnmSearch"	onclick="mtnmSearch">
								<i class="bi bi-search"	style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="poDtlCd"></div>
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
		dataType: "JSON",
		contentType : "application/json; charset=utf-8"
	}).done(function(result){
		grid.resetData(result);
	});
	
	var poDtlCd = new tui.grid({
		el: document.getElementById('poDtlCd'),
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
	
	// 자재명 검색
	$("#mtnmSearch").on("click",function(){
		var key = $("#mtnm").val();
		console.log(key);
	
	$.ajax({
		url : "pocdModalSearch",
		data : {
			key : key
		},
		dataType: 'JSON',
		contentType : "application/json; charset=utf-8"
	}).done(function(result){
		prodList.resetData(result);
		})
	})
	</script>
</body>
</html>