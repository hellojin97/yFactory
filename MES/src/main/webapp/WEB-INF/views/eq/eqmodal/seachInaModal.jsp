<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script> --%>
	 <!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->


</head>
<body>
	<div class="m-4">


		<!-- Modal HTML -->
		<div id="searchModal" class="modal fade" tabindex="-1">
			<div class="modal-dialog modal-lg modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">설비 구분</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body">
						<div id="grid2"></div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>

<script>
	$(function() {
		const url = "eqModalSelect";
		$.ajax(url, {
			dataType : "JSON",
		}).done(function(rs) {
			grid2.resetData(rs);
		})

		const grid2 = new tui.Grid({
			el : document.getElementById('grid2'),
			scrollX : false,
			scrollY : false,
			columns : [

			{
				header : '설비코드',
				name : '설비코드',
				align: 'center'
			},{
				header : '구분명',
				name : '구분명',
				align: 'center'
			},{
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
		
		grid2.on("click",function(e) {
		//debugger
		let eqCd = grid2.getValue(e.rowKey, '설비코드');
		let eqNm = grid2.getValue(e.rowKey , '설비명');
		console.log(eqCd);
		console.log(eqNm);
		if(eqCd != null){
			 $('#searchModal').modal('hide');
			 $("#eqCd").val(eqCd);
			 $("#eqNm").val(eqNm);
		}
		})
		});
	
</script>

</html>