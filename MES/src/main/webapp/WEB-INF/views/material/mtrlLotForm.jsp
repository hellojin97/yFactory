<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOT재고조회</title>
</head>
<body onkeyup="on_key_up()">

		<h1>자재 LOT재고조회</h1>
<form>
		<div style="background-color: #e9ecef; padding: 8px;">
			<div class="mainTitle" style="padding: 15px;">
				<!-- 자재명 -->
				
				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
					
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">자재명</label> 
						<input type="text" class="form-control" style="width: 50px" id="mtNminput" placeholder="자재명">
						<a class="nav-link nav-icon search-bar-toggle " id="myBtn" onclick="myBtn"> 
							<i class="bi bi-search"style="color: #2c3e50"></i>
						</a> 
						<input type="text" class="form-control" id="mtCdinput" readonly="readonly">
					</div>
				</div>
				<!-- 업체명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label"style="padding-right: 27px;">업체명</label> 
						<input type="text" class="form-control" style="width: 50px" id="vdrNminput" placeholder="업체명">
						<a class="nav-link nav-icon search-bar-toggle "id="vdr" onclick="vdr"> 
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a> 
						<input type="text" class="form-control" id="vdrCdinput" readonly="readonly">
					</div>
				</div>

				<!-- 날짜 -->
				<div class="col-md-12">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 10px;">입고날짜</label>
						<div class="col-sm-2">
							<input type="date" id="req1" class="form-control">
						</div>

						<div style="padding: 0px 22px 0px 22px;">
							<p>~</p>
						</div>
						<div class="col-sm-2" style="padding-right: 20px;">
							<input type="date" id="req2" class="form-control">
						</div>

						<div style="padding-right: 10px;">
							<button class="btn1"  type="button" id="search">조회</button>
						</div>

						<div>
							<button class="btn1" type="reset" id="reset">초기화</button>
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
			<div>
				<button  class="btn1" id="excel">Excel</button>
				<button class="btn1" id="mtrlcancel">발주서인쇄</button>
			</div>
		</div>
</form>
	

</body>

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

	
	function on_key_up(){
		if($("#vdrNminput").val()==""){
			$("#vdrCdinput").val("");
		}
		if($("#mtNminput").val()==""){
			$("#mtCdinput").val("");
		}
	}
	
	

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
			name : 'mt_lot',
			className : 'fontClass',
		    sortable: true,
		    sortingType: 'asc'
		}, {
			header : '자재코드',
			name : 'mt_cd',
			className : 'fontClass',

		}, {
			header : '자재명',
			name : 'mt_nm',
			className : 'fontClass',

		}, {
			header : '업체명',
			name : 'vdr_nm',
			className : 'fontClass',

		}, {
			header : '수량',
			name : 'mt_qty',
			className : 'fontClass',

		}, {
			header : '유통기한',
			name : 'mt_exp',
			className : 'fontClass',

		},{
			header : '폐기여부',
			name : 'cd_nm',
			className : 'fontClass',

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
      	$("#mtCdinput").val(result);
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

  // 자재명 검색
  $("#search").on("click", function() {
   console.log("click!")
   var mtNminput = $("#mtNminput").val();
   var vdrNminput = $("#vdrNminput").val();
   var req1 = $("#req1").val();
   var req2 = $("#req2").val();
	console.log(vdrNminput);
   $.ajax({
      url : "lotSelectSearch",
      data : {
    	  m1 : mtNminput,
    	  m2 : vdrNminput,
            req1 : req1,
            req2 : req2
      },
      method : 'get',
      dataType: 'JSON',
      contentType : "application/json; charset=utf-8"
   }).done(function(result){
	    listMtrlLot.resetData(result);
       console.log(result);
       
   }).fail(function(result){
	   console.log(result);
   });
})

/* 검색 결과 초기화  */
$('#reset').on('click',function(){
	const url = "mtrlLot";
	   $.ajax(url,{
	      dataType : "JSON",
	      method: "GET"
	   }).done(function(result){
		   listMtrlLot.resetData(result);
	     console.log(result);
	   });
})
//excel호출
$('#excel').on('click',function(){
	const options = {
			  includeHiddenColumns: true,
			  onlySelected: true,
			  fileName: '원자재LOT관리',
			};
	listMtrlLot.export('xlsx', options);
})
 </script>
</html>