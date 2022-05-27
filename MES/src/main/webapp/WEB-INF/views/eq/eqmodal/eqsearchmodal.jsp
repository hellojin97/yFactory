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

#savbtn{
align:right;
background-color: #555555;
color: white;
			}
#savbtn:hover {
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
						<h5 class="modal-title">설비 조회</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body">
					
						<div id="grid2">
					
					
						
						</div>
						
						<div class="modal-footer">
							<button  type="button" id="savbtn" class="btn-sav">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>

<script>
var grid2;

	

		console.log("--1--------"+eq_nm);
		//console.log("---2-------"+eq_chkdt1);
		//console.log("----3------"+eq_chkdt2);

		var url1 = "eqChkSelectAjax";
		var data = {
				eq_nm : eq_nm 
				/* ,eq_chkdt1  : eq_chkdt1
				,eq_chkdt2 :  eq_chkdt2 */
		};
		$.ajax(url1, {
			method : "POST",
			data : JSON.stringify(data),
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8"
		}).done(function(rs) {
			grid2.resetData(rs);
			console.log(rs);
		});

		grid2 = new tui.Grid({
			el : document.getElementById('grid2'),
			rowHeaders: [{type: 'checkbox'},{type: 'rowNum'}],
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
			},

			{
				header : '점검일자',
				name : '점검일자'
			},
			

			
			{
				header : '점검주기',
				name : '점검주기'
			},


			{
				header : '차기점검일',
				name : '차기점검일'
			}
			],
			
			pageOptions : {
				useClient : true,
				perPage : 5
			}
		});

		setTimeout(function() {
			grid2.refreshLayout();
		}, 300);
		
		
		
		var setArr = [];
	$("#savbtn").on("click" , function(){
		console.log(grid2.getCheckedRows());
		let arr = grid2.getCheckedRows();
		console.log(arr);
		$('#myModal').modal('hide');
		
		for(var i = 0; i < arr.length; i++) {
			
			setArr.push(arr[i])
			
			
		} 
		modalGrid.clear();
		modalGrid.appendRows(setArr);
		
	});


</script>

</html>