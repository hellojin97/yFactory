<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 추가 CDN -->

	
<style type="text/css">
#search {
	background-color: #555555;
	color: white;
	/* margin : 3px;
	padding : 4px; */
	font-size : 13px;
}

button:hover {
	color: black;
	background-color: white;
}
#search:hover{
	color: black;
	background-color: green;
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
						<h5 class="modal-title">일 점검 건수 조회</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body">
							
								<input type="date" id="chkdt1" name="chkdt1"> ~
								<input type="date" id="chkdt2" name="chkdt2">
							
							<button type="button" id="search" class="btn btnpart">조회</button>
							
							
						<div id="grid2"></div>
						
						
						<div align="right">
							<button type="button" id="dailyCountSav" class="btn btnpart">등록</button>
							<button type="button" id="cancel" class="btn btnpart">취소</button>
						</div>
						<div class="modal-footer"></div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
document.getElementById('chkdt2').value = new Date().toISOString().substring(0, 10);
$(function() {
		const grid2 = new tui.Grid({
			el : document.getElementById('grid2'),
			scrollX : false,
			scrollY : false,
			columns : [
			
			{
				header : '점검일자',
				name : '점검일자'
			},

			{
				header : '건수',
				name : '건수'
			}

			],
			rowHeaders: [{ type: 'rowNum' }, { type: 'checkbox' }],
			pageOptions : {
				useClient : true,
				perPage : 5
			}
		});

		setTimeout(function() {
			grid2.refreshLayout();
		}, 300);
		
		var arr = grid2.getCheckedRows();
		var setArr = [];
		$("#search").on("click" , function(e){
			// 해당 기간 날짜 조회
			modalGrid.clear();
			var chkdt1 = $("#chkdt1").val();
			var chkdt2 = $("#chkdt2").val();
			
			var data = {chkdt1 : chkdt1 , chkdt2 : chkdt2};
			//console.log(data);
			const url = "getEqDailyChkListAjax";
			$.ajax(url, {
				method : "GET",
				data : data,
				dataType : "JSON",
				contentType : "application/json; charset=UTF-8"
				
			}).done(function(rs) {
				if(rs.length ==0){
					toastr.options = {
				            closeButton: true,
				            progressBar: true,
				            positionClass: "toast-bottom-right",
				            timeOut: 5000
				        	};
					
					toastr.error('DATA NOT FOUND');	
				}else{
					toastr.options = {};
					toastr.success('점검 건수 조회 완료!');
					grid2.resetData(rs);	
				}
				
					//console.log(rs);		
				
			});
		});// END OF SEARCH BUTTON SYNTAX
		
		$("#cancel").on("click" , function(){
			// 취소 버튼 클릭시 
			$('#myModal').modal('hide');
		});
		
		$("#dailyCountSav").on("click" , function(){
			
			var chkdRows = grid2.getCheckedRows();
			var data2 = {};
			var setArr2 = [];
			//console.log(grid2.getValue(grid2.getCheckedRows() , '점검일자'));
			for (var i = 0; i < chkdRows.length; i++) {
				
				data2 = {eq_chkdt : chkdRows[i].점검일자	};
				setArr2.push(data2);			
			
			}; // END OF FOR SYNTAX
			
			console.log(setArr2);
			
			
			$.ajax({
				url : "dailyChkListAjax",
				method: "POST",
				traditional: true,
				data : JSON.stringify(setArr2),
				dataType : "JSON",
				contentType:"application/json; charset=UTF-8"
				
			}).done(function(rs){
				console.log(rs);
				
				modalGrid.resetData(rs);
			}); // END OF AJAX SYNTAX 
			
			$("#myModal").modal('hide');
			
			
		});// END OF dailySavBtn SYNTAX
		

}); // END OF TOTAL SYNTAX
</script>

</html>
