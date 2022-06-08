<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script> --%>
	 <!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<style>
img{
	display: block;
 	margin-left: auto;
 	margin-right: auto;
}
</style>


</head>
<body>
	<div class="m-4">


		<!-- Modal HTML -->
		<div id="myModal" class="modal fade" tabindex="-1">
			<div class="modal-dialog modal-lg modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">설비 상세 데이터</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					
					<div class="modal-body">
					<img src="" id="img_path" name="img_path" style="width:50%;">
					
					<div class="min1" >
				<!-- <div style="background-color: #e9ecef; padding: 8px;">
				<div class="mainTitle" style="padding: 15px;"> -->
					
					
					
						<div id="grid2">
						
						<!-- <input type="hidden" name="hdeqCd" id="eqCe" value="">
						<input type="hidden" name="hdeqNm" id="eqNm" value=""> -->
						</div>
						<div class="modal-footer">
							<!-- <button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancel</button>
							<button type="button" id="btnSav" class="btn btn-primary">Save
								changes</button> -->
						</div>
					</div>
				</div>
			<!-- </div>
			</div> -->
			</div>
		</div>
	</div>
	</div>
	
</body>

<script>


	$(function() {
		console.log(eqDtlCd);
		const url = "getEqDetailDataAjax";
		$.ajax(url, {
			method:"get",
			data : {eqDtlCd : eqDtlCd},
			dataType : "JSON",
			contentType : "application/json; charset=utf-8"
		}).done(function(rs) {
			console.log("테스트 : " + rs);
			grid2.resetData(rs);
			//$("#img_path").src(rs.이미지);
			//console.log(rs.이미지);
			console.log(rs);
		});
		

		console.log(eqDtlCd);

		

		var url2 =  "getEqImgAjax";
		$.ajax(url2 , {
			method: "get",
			data : {eqDtlCd : eqDtlCd},
			
			contentType : "application/json; charset=utf-8"
		}).done(function(res){

			
			

			$("#grid2").prepend('<img src="'+res+'">');
		}); 

		var grid2 = new tui.Grid({
			el : document.getElementById('grid2'),
			bodyHeight:30,
			scrollX : true,
			
			columns : [

			{
				header : '설비코드',
				name : '설비코드',
				 className : 'fontClass',
				 align: 'center'
			},

			{
				header : '설비명',
				name : '설비명'
				,className : 'fontClass',
				align: 'center'
			},
			{
				header : '공정코드',
				name : '공정코드'
				,className : 'fontClass',
				align: 'center'
			},
			{
				header : '공정명',
				name : '공정명'
				,className : 'fontClass',
				
			},
			{
				header : '점검주기',
				name : '점검주기'
				,className : 'fontClass',
				 align: 'right'
			},
			{
				header : '점검일자',
				name : '점검일자'
				,className : 'fontClass'
			},
			{
				header : '차기점검일',
				name : '차기점검일'
				,className : 'fontClass'
			},
			{
				header : '등록인',
				name : '등록인'
				,className : 'fontClass'
			},
			
			{
				header : '사용여부',
				name : '사용여부'
				,className : 'fontClass'
				,align: 'center'
			},

			],
			rowHeaders : [ 'rowNum' ],
			columnOptions: {
		        resizable: true
		      },
			pageOptions : {
				useClient : true,
				type:'scroll',
				perPage : 5
			} 
		});

		setTimeout(function() {
			grid2.refreshLayout();
		}, 300)

	
	});
</script>

</html>