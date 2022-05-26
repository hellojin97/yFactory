<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script> --%>
	 <!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<style type="text/css">
#search {
	background-color: #555555;
	color: white;
	size : 20px;
	margin : 3px;
	padding : 4px;
	font-size : 13px;
}

button:hover {
	color: black;
	background-color: white;
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
		/* var arr = grid2.getCheckedRows();
		var setArr = []; */
		$("#search").on("click" , function(e){
			modalGrid.clear();
			var chkdt1 = $("#chkdt1").val();
			var chkdt2 = $("#chkdt2").val();
			
			var data = {chkdt1 : chkdt1 , chkdt2 : chkdt2};
			console.log(data);
			const url = "getEqDailyChkListAjax";
			$.ajax(url, {
				method : "GET",
				data : data,
				dataType : "JSON",
				contentType : "application/json; charset=UTF-8"
			}).done(function(rs) {
				console.log(rs);
				for (var i = 0; i < rs.length; i++) {
					grid2.resetData(rs[i]);
					
					
							}
				
			})
	
	
		});
		
	  
	
	});
</script>

</html>