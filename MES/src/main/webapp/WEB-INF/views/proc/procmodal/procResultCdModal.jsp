<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.smMouseOver {
		cursor:pointer;
	}
</style>
</head>
<body>
<!-- 업체명모달  -->
	<div id="cdModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">생산지시목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-8 " style="padding-bottom: 20px;">
						<div class="input-group ">
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">지시기간</label> 
							<div class="col-sm-3">
								<input type="date" class="form-control" id="req1">
							</div>

							<div style="padding: 0px 15px 0px 15px;">
								<p>~</p>
							</div>
							<div class="col-sm-3" style="padding-right: 20px;">
								<input type="date" class="form-control" id="req2">&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<a class="nav-link nav-icon search-bar-toggle " id="vdrnmSearch" onclick="vdrnmSearch"> 
								<i class="bi bi-search smMouseOver" style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="procOrderList"></div>
				</div>
				<!-- 내용끝 -->
				
			</div>
		</div>
	</div>
	
<script>

	//생산 지시 목록
	$.ajax({
		url: "procResultOrdersList",
		method : "GET",
		dataType : "JSON",
		success : function(result){
			procOrderList.resetData(result);
		}
	});
	
	var procOrderList = new tui.Grid({
	el: document.getElementById('procOrderList'),
	columns: [
	  {
	    header: '생산지시코드',
	    name: '생산지시코드',
	    align: 'center'
	  },
	  {
	    header: '제품명',
	    name: '제품명'
	  },
	  {
	    header: '생산수량',
	    name: '생산수량',
	    align: 'right'
	  },
	  {
	    header: '생산지시일자',
	    name: '생산지시일자',
	    align: 'center'
	  }
	],
	rowHeaders : [ 'rowNum' ]
	
	});
	
	$('body').css("overflow", "hidden");
	  
	  var cdModal = document.getElementById('cdModal')


	  cdModal.addEventListener('shown.bs.modal', function () {
		  //ajax 호출
		  //grid.resetData(data)
		  
	      procOrderList.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
	  })
	  
	  procOrderList.on("dblclick", function(e){
		  var getVal = procOrderList.getValue(e.rowKey, "생산지시코드");
		  $("#prdCd").val(getVal);
		  $("#cdModal").modal('hide');
	  });
	  
	//마우스 커서 올리면
	  procOrderList.on('mouseover', function(e){	  	
	  	var tt = e.targetType;
	  		if(tt == 'cell' ){			
	  			$('#procOrderList').attr("class", "smMouseOver");
	  		}else{
	  			$('#procOrderList').removeClass();					
	  		}
	  });
</script>
</body>
</html>