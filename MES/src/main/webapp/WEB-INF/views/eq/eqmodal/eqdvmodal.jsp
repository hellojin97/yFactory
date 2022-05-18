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
		<div id="myModal" class="modal fade" tabindex="-1">
			<div class="modal-dialog modal-lg modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">설비 구분</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body">
						<div id="grid">
						<input type="hidden" name="hdeqCd" id="eqCe" value="">
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
			grid.resetData(rs);
			console.log(rs);
		})

		const grid = new tui.Grid({
			el : document.getElementById('grid'),
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
			grid.refreshLayout();
		}, 300)
		
		grid.on("click",function(e) {
		//debugger
		let eqCd = grid.getValue(e.rowKey, '설비코드');
		let eqNm = grid.getValue(e.rowKey , '설비명');
		$("input[name='eqCdinp']").value=eqCd;
		$("input[name='eqNminp']").value=eqNm;
		
		console.log(eqCd);
		console.log(eqNm);
		if(eqCd != null){
			 $('#myModal').modal('hide');
			 
			 $.ajax({
				   url  : "eqSelectAjax",
				   data : {eqCd : eqCd , eqNm : eqNm},
				   dataType : "JSON",
				   contentType : "application/json; charset = UTF-8;"
			   }).done(function(result){
				   console.log(result);
				
				 
			   }) 
			 
			 
		}
	})
	
	   // window.dialogArguments : 부모창에서 값을 받을 때 사용하는 속성
   		// var obj = window.dialogArguments;

	//    var retVal = {objcode , objname};

    // window.returnValue : 부모창으로 값을 넘겨줄 때 사용하는 속성
	//    window.returnValue = retVal;


	
	
	});
</script>

</html>