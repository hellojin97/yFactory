<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
	<div class="m-4">


		<!-- Modal HTML -->
		<div id="myModal" class="modal fade" tabindex="-1">
			<div class="modal-dialog modal-lg modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">공정 구분</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body">
						<div id="grid2">
						
						</div>
						<div class="modal-footer">
							<!-- <button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancel</button>
							<button type="button" id="btnSav" class="btn btn-primary">Save
								changes</button> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>

<script>
	$(function() {
		const url = "getPrcList";
		$.ajax(url, {
			dataType : "JSON",
		}).done(function(rs) {
			grid2.resetData(rs);
			console.log(rs);
		})

		const grid2 = new tui.Grid({
			el : document.getElementById('grid2'),
			scrollX : false,
			scrollY : false,
			columns : [

			{
				header : '공정코드',
				name : '공정코드'
			},

			{
				header : '공정명',
				name : '공정명'
			}

			],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 5
			}
		});

		setTimeout(function() {
			grid2.refreshLayout();
		}, 300)
		
		
		// START DUBBLE CLICK EVENT
		grid2.on("dblclick",function(e) {
		
			

		//debugger
		let prcCd = grid2.getValue(e.rowKey, '공정코드');
		let prcNm = grid2.getValue(e.rowKey , '공정명');
		let eqCd = grid.getValue(e.rowKey, '설비코드');
		//console.log(prcCd);
		
		if(prcCd != null){
			 $('#myModal').modal('hide'); 
			
			 console.log(grid);
			

			$.ajax({
				   url  : "eqPrcSelctAjax",
				   data : {
					   eqCd : eqCd
					   },
				   dataType : "JSON",
				   contentType : "application/json; charset = UTF-8;",
				   success : function(data){
					  	    console.log(data);  
				   			// 지역변수로 선언되어 있어서 모달내부에서 부모페이지의 div를 인식을 못하고 setValue 함수를 사용하지 못하였습니다
				   			// 부모페이지(eqMngPage)의 grid 변수를 전역변수로 선언하여 해당 페이지에 잔존 및 인식하도록 수정 완료 
				   			grid.setValue(rowKey , '공정코드' , data[0].공정코드);
				   			grid.setValue(rowKey , '공정명' , data[0].공정명); 
				   			}
			   
			
			}); // END OF AJAX

			
		} // END OF IF SYNTAX
	
		
	}); // END OF DUBBLE CLICK EVENT

	
}); // END OF DOM_LOADED
</script>

</html>