<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
		<div style="padding-bottom:15px; color: ;">
		<h1>완제품 LOT재고조회</h1>
		</div>

		<div class="min1">
			<div class="mainTitle" style="padding: 15px;">
				<form>
				<!-- 제품명 -->
				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">제품명</label>
						<input type="text" id="pnm" class="form-control" style="width: 50px" placeholder="제품명">
						<a class="nav-link nav-icon search-bar-toggle " id="myBtn" onclick="myBtn">
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>
						<input type="text" id="pcd" class="form-control" readonly="readonly">
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
							<button type="button" id="search" class="btn1">조회</button>
						</div>

						<div>
							<button type="reset" class="btn1">초기화</button>
						</div>
					</div>
				</div>
				</form>
			</div>
			<hr style="border: solid 1px gray;">

			<!-- 테이블 -->
			<div class="code-html contents" style="padding-bottom: 10px;">
				<div id="prodLotorder"></div>
			<div>
				<button type="button" class="btn1" id="excel">Excel</button>
			</div>	
				<div id="test"></div>
			</div>

		</div>

	

</body>

<script>
	myBtn.addEventListener("click", function(){
	$("#test").load("prodModal", function(){
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
			listProdLot.resetData(result);			
		}
	});

	var listProdLot = new tui.Grid({
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
	

	
  /* 주문서 단건 조회 */
  $("#search").on("click", function() {     
     var pnm = $("#pnm").val();
     var pcd = $("#pcd").val();
     var fdt1 = $("#fdt1").val();
     var fdt2 = $("#fdt2").val();     
     $.ajax({
        url : "searchProdLot",
        data : {
              pnm : pnm,  
              pcd : pcd,
              fdt1 : fdt1,
              fdt2 : fdt2              
        },
        dataType: 'JSON',
        contentType : "application/json; charset=utf-8"
     }).done(function(result){
         console.log(result);
         listProdLot.resetData(result);
          
     });
  })
  
  //excel호출
$('#excel').on('click',function(){
	const options = {
			  includeHiddenColumns: true,
			  onlySelected: true,
			  fileName: '주문서조회',
			};
	listProdLot.export('xlsx', options);
})
  

 </script>

</html>