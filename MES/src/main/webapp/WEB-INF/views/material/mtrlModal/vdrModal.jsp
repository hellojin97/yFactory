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
	<div id="myModal" class="modal fade" tabindex="-1">
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
							<label for="inputText" class="col-form-label"
								style="padding-right: 10px;">업체명</label> <input type="text"
								class="form-control" style="width: 50px" placeholder="업체명">
							<a class="nav-link nav-icon search-bar-toggle " id="myBtn"
								onclick="myBtn"> <i class="bi bi-search"
								style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="vdrGrid"></div>
				</div>
				<!-- 내용끝 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" id="btnSav" class="btn btn-primary"
						style="background-color: #2c3e50; border-color: #2c3e50;">Save
						changes</button>
					<!-- 사용시 필히 onclick 이용 onclick="location.href='/board'"  -->
				</div>
			</div>
		</div>
	</div>
	<!-- 모달끝 -->

	<script>
		//자재명 검색
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
		
		  $("#btnSav").click(function () {
		      Swal.fire({
		          title: '정말로 그렇게 하시겠습니까?',
		          text: "다시 되돌릴 수 없습니다. 신중하세요.",
		          icon: 'warning',
		          showCancelButton: true,
		          confirmButtonColor: '#3085d6',
		          cancelButtonColor: '#d33',
		          confirmButtonText: '승인',
		          cancelButtonText: '취소'
		      }).then((result) => {
		      	console.log(result);
		      	console.log(result.isDismissed); // 승인시 FALSE / 취소시 TRUE
		          if (result.isConfirmed) {
		              Swal.fire(
		                  '승인이 완료되었습니다.',
		                  '화끈하시네요~!',
		                  'success'
		              )
		              $('#myModal').modal('hide')
		          }else{
		          	Swal.fire(
		                      '승인이 취소되었습니다.',
		                      '섹시하시네요~!',
		                      'error'
		                  )
		          }
		      })
		  });
		  
		  $('body').css("overflow", "hidden");
		  
		  var myModal = document.getElementById('myModal')


		  myModal.addEventListener('shown.bs.modal', function () {
			  //ajax 호출
			  //grid.resetData(data)
			  
		      vendorList.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
		  })
	</script>
</body>
</html>