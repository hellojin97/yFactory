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
		<h1>품질검사요청</h1>
	</div>

	<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">
			<form>
				<!-- 발주상세코드 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">발주상세코드</label>
							<input type="text" class="form-control" style="width: 50px" placeholder="발주상세코드를 입력해주십시오" id="pdt">
							<a class="nav-link nav-icon search-bar-toggle" id="pdcBtn" onclick="pdcBtn">
								<i class="bi bi-search" style="color: #2c3e50"></i>
							</a>
					</div>
				</div>
				
				<!-- 자재코드 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">자재코드</label> 
						<input type="text" class="form-control" style="width: 50px" placeholder="자재코드를 입력해주십시오" id="mcd" readonly="readonly">
					</div>
				</div>
				
				<!-- 업체명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">업체명</label> 
						<input type="text" class="form-control" style="width: 50px" placeholder="업체명을 입력해주십시오" id="vnm" readonly="readonly">
					</div>
				</div>
				
				<!-- 자재명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">자재명</label> 
						<input type="text" class="form-control" style="width: 50px" placeholder="자재명을 입력해주십시오" id="mnm" readonly="readonly">
					</div>
				</div>
				
				<!-- 발주량 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">발주량</label> 
						<input type="text" class="form-control" style="width: 50px" placeholder="발주량을 입력해주십시오" id="pqty" readonly="readonly">
					</div>
				</div>
				
				<div class="col-md-5" style="padding-bottom: 10px;">
					<div class="input-group">
						<div style="padding-right: 10px;">
							<button type="button" id="insert" class="btn1">신청</button>							
						</div>
						<div>
							<button type="reset" id="reset" class="btn1">초기화</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<div id="poDtlModal"></div>
	
	<script type="text/javascript">
	// 발주상세코드 modal
	pdcBtn.addEventListener("click", function() {
		$("#poDtlModal").load("poDtlCdModal", function() {
			const pocdModal = new bootstrap.Modal('#poDtlCdModal');
			pocdModal.show();
		})
	});
	</script>
</body>
</html>