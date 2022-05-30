<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 업체명모달  -->
	<div id="ordtlModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">주문상세목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">					
					<div id="ordtlModalList"></div>
				</div>
				<!-- 내용끝 -->				
			</div>
		</div>
	</div>
	<script>
	
	
	var key = $("#hdOrdtlCd").val();
	
	
	$.ajax({
		url : "ordtlModalList",
		data : {
				key : key
		},
		success : function(result) {			
			ordtlModalList.resetData(result);
			key = null;
		}
	});

	var ordtlModalList = new tui.Grid({
		el : document.getElementById('ordtlModalList'),
		columns : [ {
			header : '주문상세코드',
			name : '주문상세코드'
		}, {
			header : '제품명',
			name : '제품명'
		}, {
			header : '주문량',
			name : '주문량'
		},{
			header : '진행상황',
			name : '진행상황'
		}		
		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 5
		}
	});
	
	 
	  
	$('body').css("overflow", "hidden");
	  
	var myModal = document.getElementById('ordtlModal');

	myModal.addEventListener('shown.bs.modal', function () {		 
	      ordtlModalList.refreshLayout(); 
	  })
	</script>
</body>
</html>