<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 발주코드모달  -->
	<div id="myModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">발주코드</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-8 " style="padding-bottom: 20px;">
						<div class="input-group ">
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">발주코드</label> 
							<input type="text" class="form-control" style="width: 50px" id="pocd" placeholder="발주코드">
							<a class="nav-link nav-icon search-bar-toggle " id="pocdSearch" onclick="pocdSearch"> 
								<i class="bi bi-search" style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="pocdGrid"></div>
				</div>
				<!-- 내용끝 -->
				
			</div>
		</div>
	</div>
	<!-- 모달끝 -->

	<script>
		//발주코드 조회
 		$.ajax({
			url : "pocd",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				pocdList.resetData(result);
			}
		});

		var pocdList = new tui.Grid({
			el : document.getElementById('pocdGrid'),
			columns : [ {
				header : '발주코드',
				name : '발주코드'
			}
			],
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
			  
		      pocdList.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
		  })
		  
	//발주코드 검색
	$("#pocdSearch").on("click",function(){
		console.log("확인")
		var pocd = $("#pocd").val();
		console.log(pocd);
	
		$.ajax({
			url : "pocdSelectSearch",
			data : {
				pocd : pocd
			},
			dataType: 'JSON',
			contentType : "application/json; charset=utf-8"
		}).done(function(result){
			pocdList.resetData(result); 
			 console.log(result)
		})
	})
	
		  
	//모달 데이터값 받아오기
	pocdList.on("dblclick",function(e) {
      //debugger
         let poCd = pocdList.getValue(e.rowKey, '발주코드');

         $("#poCdinput").val(poCd);
         $('#myModal').modal('hide');
         }
      ); 
		  
	</script>
</body>
</html>