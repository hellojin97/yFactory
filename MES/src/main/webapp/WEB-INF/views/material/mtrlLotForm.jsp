<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOT재고조회</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>

	<div class="container">
		<h1>자재 LOT재고조회</h1>

		<div style="background-color: #e0e0e0; padding: 8px;">
			<div class="mainTitle" style="padding: 15px;">
				<!-- 자재명 -->
				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">자재명</label> <input type="text"
							class="form-control" style="width: 50px" placeholder="자재명">
						<a class="nav-link nav-icon search-bar-toggle " id="myBtn"
							onclick="myBtn"> <i class="bi bi-search"
							style="color: #2c3e50"></i>
						</a> <input type="text" class="form-control" readonly="readonly">
					</div>
				</div>
				<!-- 업체명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">업체명</label> <input type="text"
							class="form-control" style="width: 50px" placeholder="업체명">
						<a class="nav-link nav-icon search-bar-toggle "id="vdr"
							onclick="vdr"> <i
							class="bi bi-search" style="color: #2c3e50"></i>
						</a> <input type="text" class="form-control" readonly="readonly">
					</div>
				</div>

				<!-- 날짜 -->
				<div class="col-md-12">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 10px;">입고날짜</label>
						<div class="col-sm-2">
							<input type="date" class="form-control">
						</div>

						<div style="padding: 0px 15px 0px 15px;">
							<p>~</p>
						</div>
						<div class="col-sm-2" style="padding-right: 20px;">
							<input type="date" class="form-control">
						</div>

						<div style="padding-right: 10px;">
							<button class="btn1">조회</button>
						</div>

						<div>
							<button class="btn1">초기화</button>
						</div>
					</div>
				</div>

			</div>
			<hr style="border: solid 1px gray;">

			<!-- 테이블 -->
			<div class="code-html contents" style="padding-bottom: 10px;">
				<div id="mtrlLotorder"></div>
				<div id="test"></div>
			</div>

		</div>
	</div>
<<<<<<< HEAD
	<!-- 모달 -->
	<div id="myModal" class="modal fade" tabindex="-1">
	<form>
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">품목코드</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-8 " style="padding-bottom: 20px;">
						<div class="input-group ">
							<label for="inputText" class="col-form-label"
								style="padding-right: 10px;">자재명</label> <input type="text"
								class="form-control" style="width: 50px" placeholder="자재명">
							<a class="nav-link nav-icon search-bar-toggle " id="myBtn"
								onclick="myBtn"> <i class="bi bi-search"
								style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="mtcdGrid"></div>
				</div>
				<!-- 내용끝 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancel">Cancel</button>
					<button type="button" id="btnSav" class="btn btn-primary"
						style="background-color: #2c3e50; border-color: #2c3e50;">Save
						changes</button>
					<!-- 사용시 필히 onclick 이용 onclick="location.href='/board'"  -->
				</div>
			</div>
		</div>
		</form>
	</div>
=======
	
>>>>>>> branch 'main' of https://github.com/Hyeonjinkk/yFactory.git

	

</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>
	myBtn.addEventListener("click", function(){
	$("#test").load("mtcdModal", function(){
		const myModal = new bootstrap.Modal('#myModal');
		myModal.show();
	})
	});

	vdr.addEventListener("click", function(){
		$("#test").load("vdrModal", function(){
			const myModal = new bootstrap.Modal('#myModal');
			myModal.show();
		})
		});


	//LOT 전체조회
	$.ajax({
		url : "mtrlLot",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			listMtrlLot.resetData(result);
		}
	});

	var listMtrlLot = new tui.Grid({
		el : document.getElementById('mtrlLotorder'),
		columns : [ {
			header : '자제LOT번호',
			name : 'mt_lot'
		}, {
			header : '자재코드',
			name : 'mt_cd'
		}, {
			header : '자재명',
			name : 'mt_nm'
		}, {
			header : '업체명',
			name : 'vdr_nm'
		}, {
			header : '수량',
			name : 'mt_qty'
		}, {
			header : '유통기한',
			name : 'mt_exp'
		}

		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 10
		}
	});
	

<<<<<<< HEAD
	

  
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
  $("#myBtn").click(function(){
      $("#myModal").modal("show");

  });
  $('body').css("overflow", "hidden");		

  
  var myModal = document.getElementById('myModal')


  myModal.addEventListener('shown.bs.modal', function () {
	  //ajax 호출
	  //grid.resetData(data)
	  	
	  $.ajax({
			url : "mtcd",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				mtcdList.resetData(result);
			}
		});
	  	var mtcdList = new tui.Grid({
			el : document.getElementById('mtcdGrid'),
			columns : [ {
				header : '자재명',
				name : '자재명'
			}, {
				header : '자재코드',
				name : '자재코드'
			} 
			],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 3
			}
		});

  })


 </script>
</html>