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
					<form id="frm" name="frm" method="post">
						<div id="grid2">
					
						</div>
						<button  type="button" id="sav">등록</button>
						</form>
						<div class="modal-footer">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>

<script>
/* 
var eq_nm = $("#eq_nm").val();
var eq_chkdt = $("#eq_chkdt").val();
var eq_chkeddt = $("#eq_chkeddt").val();
console.log($("#eq_nm").val());
console.log( $("#eq_chkdt").val());
console.log($("#eq_chkeddt").val()); */
	$(function() {
		
		console.log("--1--------"+eq_nm);
		console.log("---2-------"+eq_chkdt1);
		console.log("----3------"+eq_chkdt2);
		
		
		var url1 = "eqChkListAajx";
		var data = {
				eq_nm : eq_nm  , 
				eq_chkdt1  : eq_chkdt1 , 
				eq_chkdt2 :  eq_chkdt2
		}
		$.ajax(url1, {
			method : "POST",
			data : JSON.stringify(data),
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8"
		}).done(function(rs) {
			grid2.resetData(rs);
			console.log(rs);
		})

		const grid2 = new tui.Grid({
			el : document.getElementById('grid2'),
			rowHeaders: [{type: 'rowNum'},{type: 'checkbox'}],
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
				header : '차기점검일',
				name : '차기점검일'
			},

		
			{
				header : '점검주기',
				name : '점검주기'
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
		
	$("#sav").on("click" , function(e){
			
	})
	

	
	
	});
</script>

</html>