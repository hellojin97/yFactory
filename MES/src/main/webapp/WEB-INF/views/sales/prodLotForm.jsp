<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>

		<h1>완제품 LOT재고조회</h1>

		<div style="background-color: #e0e0e0; padding: 8px;">
			<div class="mainTitle" style="padding: 15px;">
				<!-- 제품명 -->
				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">제품명</label>
						<input type="text" id="pnm" class="form-control" style="width: 50px" placeholder="제품명">
						<a class="nav-link nav-icon search-bar-toggle " id="myBtn" onclick="myBtn">
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>
						<input type="text" class="form-control" readonly="readonly">
					</div>
				</div>				

				<!-- 날짜 -->
				<div class="col-md-12">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 10px;">제조날짜</label>
						<div class="col-sm-2">
							<input type="date" id="fdt1" class="form-control">
						</div>

						<div style="padding: 0px 15px 0px 15px;">
							<p>~</p>
						</div>
						<div class="col-sm-2" style="padding-right: 20px;">
							<input type="date" id="fdt2" class="form-control">
						</div>

						<div style="padding-right: 10px;">
							<button id="search" class="btn1">조회</button>
						</div>

						<div>
							<button type="reset" class="btn1">초기화</button>
						</div>
					</div>
				</div>

			</div>
			<hr style="border: solid 1px gray;">

			<!-- 테이블 -->
			<div class="code-html contents" style="padding-bottom: 10px;">
				<div id="prodLotorder"></div>
				<div id="test"></div>
			</div>

		</div>

	

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



	//LOT 전체조회
	$.ajax({
		url : "prodLot",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			listMtrlLot.resetData(result);
			console.log(result);
		}
	});

	var listMtrlLot = new tui.Grid({
		el : document.getElementById('prodLotorder'),
		columns : [ {
			header : '완제품LOT',
			name : '완제품LOT'
		}, {
			header : '제품코드',
			name : '제품코드'
		}, {
			header : '제품명',
			name : '제품명'
		}, {
			header : '완제품수량',
			name : '완제품수량'
		}, {
			header : '제조일자',
			name : '제조일자'
		}, {
			header : '유통기한',
			name : '유통기한'
		}

		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 10
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
  $("#myBtn").click(function(){
      $("#myModal").modal("show");

  });
  $('body').css("overflow", "hidden");		

  
  var myModal = document.getElementById('myModal')


  /*myModal.addEventListener('shown.bs.modal', function () {
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

  })*/
	
  /* 주문서 단건 조회 */
  $("#search").on("click", function() {
     console.log("click!")
     var pnm = $("#pnm").val();     
     var fdt1 = $("#fdt1").val();
     var fdt2 = $("#fdt2").val();     
     console.log(pnm+fdt1+fdt2);
     $.ajax({
        url : "searchProdLot",
        data : {
              pnm : pnm,              
              fdt1 : fdt1,
              fdt2 : fdt2              
        },
        dataType: 'JSON',
        contentType : "application/json; charset=utf-8"
     }).done(function(result){
         console.log(result);
         grid.resetData(result);
          
     });
  })
  

 </script>

</html>