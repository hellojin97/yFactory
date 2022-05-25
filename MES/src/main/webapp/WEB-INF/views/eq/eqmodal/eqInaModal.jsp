<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 완제품명모달  -->
	<div id="myModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">비가동 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-12 " style="padding-bottom: 15px;">
						<div class="input-group" style="padding-bottom: 15px;">
							<label for="inputText" class="col-form-label" style="padding-right: 32px;">설비코드 </label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="modalEqCd" disabled>
							</div>
						</div>
						
						<div class="input-group" style="padding-bottom: 15px;">
							<label for="inputText" class="col-form-label" style="padding-right: 47px;">설비명 </label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="modalEqNm" disabled>								
							</div>
						</div>
						
						<div class="input-group" style="padding-bottom: 15px;">	
							<label for="inputText" class="col-form-label" style="padding-right: 47px;">등록인 </label>
							<div class="col-sm-2">			
								<input type="text" class="form-control" id="modalUser" disabled>
							</div>					
						</div>
						
						<div class="input-group" style="padding-bottom: 10px;">							
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">비가동 시간 </label>
							<div class="col-sm-3" style="padding-right: 10px;">
								<input type="datetime-local" class="form-control" id="stDt">
							</div>

							<div style="padding: 5px 15px 0px 0px;">
								<p>시작</p>
							</div>
							
							<div class="col-sm-3" style="padding-right: 10px;">
								<input type="datetime-local" class="form-control" id="edDt">
							</div>
							
							<div style="padding: 5px 15px 0px 0px;">
								<p>종료</p>
							</div>				
						</div>
						
						<div class="input-group" style="padding-bottom: 10px;">	
							<label for="inputText" class="col-form-label" style="padding-right: 64px;">사유 </label>
							<div class="col-sm-2">			
								<select id="modalDis">
									<option value="DIS01">점검</option>
									<option value="DIS02">고장</option>
									<option value="DIS03">파손</option>
								</select>
							</div>
						</div>
						
						<div class="input-group" style="padding-bottom: 15px;">	
							<label for="inputText" class="col-form-label" style="padding-right: 64px;">비고 </label>
							<div class="col-sm-2">			
								<textarea id="Modalnote" rows="4" cols="33"></textarea>
							</div>					
						</div>
						
								<button id="btnInsert" class="btn1">등록</button>
					</div>					
				</div>
				<!-- 내용끝 -->
				
			</div>
		</div>
	</div>
	<!-- 모달끝 -->
	<script>
	var mec = $("#inEqCd").val();
	var men = $("#inEqNm").val();
		
	$("#modalEqCd").val(mec);
	$("#modalEqNm").val(men);
	
	$("#btnInsert").on("click", function(){
		var ec = $("#modalEqCd").val();
		var en = $("#modalEqNm").val();
		var us = $("#modalUser").val();
		var sd = $("#stDt").val();
		var ed = $("#edDt").val();
		var dc = $("#modalDis").val();
		var nt = $("#Modalnote").val();
		
		.$ajax({
			url : "",
			method : "POST",
			data : {
					"ec" : ec,
					"en" : en,
					"us" : us,
					"sd" : sd,
					"ed" : ed,
					"dc" : dc,
					"nt" : nt				
					}
		});
	})
	
	</script>
	
</body>
</html>