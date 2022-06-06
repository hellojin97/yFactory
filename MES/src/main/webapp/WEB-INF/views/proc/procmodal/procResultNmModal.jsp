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
	<div id="nmModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">진행공정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					
					<div id="processList"></div>
				</div>
				<!-- 내용끝 -->
				
			</div>
		</div>
	</div>
	
<script>

	//생산 지시 목록
	$.ajax({
		url: "procResultProcessList",
		method : "GET",
		dataType : "JSON",
		success : function(result){			
			processList.resetData(result);
		}
	});
	
	var processList = new tui.Grid({
	el: document.getElementById('processList'),
	columns: [
	  {
	    header: '공정명',
	    name: '공정명',
	    align: 'center'
	  },
	  {
	    header: '공정코드',
	    name: '공정코드',
	    align: 'center'
	  },
	  {
	    header: '설비코드',
	    name: '설비코드',
	    align: 'center'
	  }
	],
	rowHeaders : [ 'rowNum' ],
	pageOptions: {
	      useClient: true,
	      perPage: 5
	    }
	
	});
	
	$('body').css("overflow", "hidden");
	  
	  var nmModal = document.getElementById('nmModal');


	  nmModal.addEventListener('shown.bs.modal', function () {
		  //ajax 호출
		  //grid.resetData(data)
		  
	      processList.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
	  });
	  
	  processList.on("dblclick", function(e){
		  var getNm = processList.getValue(e.rowKey, "공정명");
		  var getCd = processList.getValue(e.rowKey, "공정코드");
		  $("#procNm").val(getNm);
		  $("#procCd").val(getCd);
		  $("#nmModal").modal('hide');
	  })
</script>
</body>
</html>