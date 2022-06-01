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
	<div id="venModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">업체코드</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-8 " style="padding-bottom: 20px;">
						<div class="input-group ">
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">업체명</label> 
							<input type="text" class="form-control" style="width: 50px" id="vdrnm" placeholder="업체명">
							<a class="nav-link nav-icon search-bar-toggle " id="vdrnmSearch" onclick="vdrnmSearch"> 
								<i class="bi bi-search" style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="vdrGrid"></div>
				</div>
				<!-- 내용끝 -->
				
			</div>
		</div>
	</div>
	<!-- 모달끝 -->

	<script>
		//업체명 검색
		$.ajax({
			url : "vdrcd",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				vendorList.resetData(result);
			}
		});

		var vendorList = new tui.Grid({
			el : document.getElementById('vdrGrid'),
			columns : [ {
				header : '업체코드',
				name : 'vdr_cd'
			},{
				header : '업체명',
				name : 'vdr_nm'
			}, {
				header : '업체구분',
				name : 'cd_nm'
			} ],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 5
			}
		});
	
		  
		  $('body').css("overflow", "hidden");
		  
		  var venModal = document.getElementById('venModal')


		  venModal.addEventListener('shown.bs.modal', function () {
			  //ajax 호출
			  //grid.resetData(data)
			  
		      vendorList.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
		  })
		  
	//업체명 검색
	$("#vdrnmSearch").on("click",function(){
		console.log("확인")
		var vdrnm = $("#vdrnm").val();
		console.log(vdrnm);
	
		$.ajax({
			url : "vdrnmSelectSearch",
			data : {
				vdrnm : vdrnm
			},
			dataType: 'JSON',
			contentType : "application/json; charset=utf-8"
		}).done(function(result){
			vendorList.resetData(result); 
			 console.log(result)
		})
	})
	
		  
	//모달 데이터값 받아오기
	vendorList.on("dblclick",function(e) {
      //debugger
         let vdrNm = vendorList.getValue(e.rowKey, 'vdr_nm');
         let vdrCd = vendorList.getValue(e.rowKey, 'vdr_cd');

         $("#vnm").val(vdrNm);
         $("#vcd").val(vdrCd);
         $('#venModal').modal('hide');
         }
      ); 
		  
	</script>
</body>
</html>