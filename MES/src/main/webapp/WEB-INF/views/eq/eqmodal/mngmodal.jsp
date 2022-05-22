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
						<h5 class="modal-title">설비 구분</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body">
						<div id="grid2">
						<input type="hidden" name="hdeqCd" id="eqCd" value="">
						<input type="hidden" name="hdeqNm" id="eqNm" value="">
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
		const url = "getEqDivList";
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
				header : '설비코드',
				name : '설비코드'
			},

			{
				header : '설비명',
				name : '설비명'
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
			var grid2RowCell = grid2.getFocusedCell().rowKey;
			

		//debugger
		let eqCd = grid2.getValue(e.rowKey, '설비코드');
		let eqNm = grid2.getValue(e.rowKey , '설비명');

		
		
		if(eqCd != null){
			 $('#myModal').modal('hide'); 
			
			 console.log(grid);
			// console.log(gridRowCell);
			 //let newCd = grid.getFocusedCell('설비코드');

			$.ajax({
				   url  : "eqSelectAjax",
				   data : {
					   eqCd : eqCd
					   },
				   dataType : "JSON",
				   contentType : "application/json; charset = UTF-8;",
				   success : function(data){
					  	    console.log(data);  
				   			// 지역변수로 선언되어 있어서 모달내부에서 부모페이지의 div를 인식을 못하고 setValue 함수를 사용하지 못하였습니다
				   			// 부모페이지(eqMngPage)의 grid 변수를 전역변수로 선언하여 해당 페이지에 잔존 및 인식하도록 수정 완료 
				   			grid.setValue(rowKey , '설비코드' , data[0].설비코드);
				   			grid.setValue(rowKey , '설비명' , data[0].설비명); 
				   			}
			   
			
			}); // END OF AJAX

			
		} // END OF IF SYNTAX
	
		
	}); // END OF DUBBLE CLICK EVENT

	
}); // END OF DOM_LOADED
</script>

</html>