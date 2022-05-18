<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자재명모달  -->
	<div id="myModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">완제품코드</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-8 " style="padding-bottom: 20px;">
						<div class="input-group ">
							<label for="inputText" class="col-form-label"
								style="padding-right: 10px;">제품명</label> <input type="text"
								class="form-control" style="width: 50px" id="prod" placeholder="자재명">
							<a class="nav-link nav-icon search-bar-toggle " id="prodSearch"	onclick="prodSearch">
								<i class="bi bi-search"	style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="prodGrid"></div>
				</div>
				<!-- 내용끝 -->
				
			</div>
		</div>
	</div>
	<!-- 모달끝 -->

	<script>
		//완제품명 전체조회
		
		$.ajax({
			url : "prodModalList",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				console.log()
				prodList.resetData(result);
			}
		});

		var prodList = new tui.Grid({
			el : document.getElementById('prodGrid'),
			columns : [ {
				header : '제품명',
				name : '제품명'
			}, {
				header : '제품코드',
				name : '제품코드'
			} ],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 5
			}
		});
		
		 
		  
		$('body').css("overflow", "hidden");
		  
		  var myModal = document.getElementById('myModal')


		  myModal.addEventListener('shown.bs.modal', function () {
			  //ajax 호출
			  //grid.resetData(data)
			  
		      prodList.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
		  })
		  
	//자재명 검색
	$("#prodSearch").on("click",function(){
		console.log("확인")
	
		var prod = $("#prod").val();
		console.log(prod);
	
	$.ajax({
		url : "prodModalSearch",
		data : {
			prod : prod
		},
		dataType: 'JSON',
		contentType : "application/json; charset=utf-8"
	}).done(function(result){
		prodList.resetData(result);
		
	})
	})
	//모달 데이터값 받아오기
	prodList.on("dblclick",function(e) {
    //debugger
       let prodNm = prodList.getValue(e.rowKey, '제품명');
       let prodCd = prodList.getValue(e.rowKey, '제품코드');
       
       
       
       $("#pnm").val(prodNm);
       $("#pcd").val(prodCd);
       $('#myModal').modal('hide');       
       }
    );

	</script>
</body>
</html>