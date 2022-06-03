<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고등록</title>
</head>
<body onkeyup="on_key_up()">

	<h1>원자재 입고관리</h1>
	<form>
		<div style="background-color: #e9ecef; padding: 8px;">
			<div class="mainTitle" style="padding: 15px;">
				<!-- 자재명 -->

				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">

						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">자재명</label> <input type="text"
							class="form-control" style="width: 50px" id="mtNminput"
							placeholder="자재명"> <a
							class="nav-link nav-icon search-bar-toggle " id="myBtn"
							onclick="myBtn"> <i class="bi bi-search"
							style="color: #2c3e50"></i>
						</a> <input type="text" class="form-control" id="mtCdinput"
							readonly="readonly">
					</div>
				</div>
				<!-- 업체명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">업체명</label> <input type="text"
							class="form-control" style="width: 50px" id="vdrNminput"
							placeholder="업체명"> <a
							class="nav-link nav-icon search-bar-toggle " id="vdr"
							onclick="vdr"> <i class="bi bi-search" style="color: #2c3e50"></i>
						</a> <input type="text" class="form-control" id="vdrCdinput"
							readonly="readonly">
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
							<button class="btn1" type="button" id="search">조회</button>
						</div>

						<div>
							<button class="btn1" type="reset" id="reset">초기화</button>
						</div>
					</div>
				</div>

			</div>
			<hr style="border: solid 1px gray;">
			<div>
				<div style="display: inline-block; float: right;">
					<button class="btn1" type="button" id="btnSav">저장</button>
				</div>

				<div style="display: inline-block; float: right;">
					<button class="btn1" type="button" id="delete">삭제</button>
				</div>

				<div style="display: inline-block; float: right;">
					<button class="btn1" type="reset" id="mtrlBtnAdd">추가</button>
				</div>
			</div>

			<!-- 테이블 -->
			<div class="code-html contents" style="padding-bottom: 10px;">
				<div id="mtrlInsertList"></div>
				<div id="test"></div>
			</div>

		</div>
	</form>


</body>

<script>
	//원자재 모달
	myBtn.addEventListener("click", function(){
	$("#test").load("mtcdModal", function(){
		const myModal = new bootstrap.Modal('#myModal');
		myModal.show();
	})
	});
	//업체명 모달
	vdr.addEventListener("click", function(){
		$("#test").load("vdrModal", function(){
			const myModal = new bootstrap.Modal('#myModal');
			myModal.show();
		})
		});
	//미입고처리 모달
	mtrlBtnAdd.addEventListener("click", function(){
		//만약 그리드 내에 
		
		
		
		$("#test").load("mtrlExpectModal", function(){
			const myModal = new bootstrap.Modal('#myModal',{backdrop : false , keyboard: false});
			myModal.show();
			test1 = listMtrlInsert.getData();
			
			$('.modal-dialog').draggable({
			    handle: ".modal-header"
			  });
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
	
	

	//입고관리 전체조회
	$.ajax({
		url : "",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			listMtrlInsert.resetData(result);
		}
	});

	var listMtrlInsert = new tui.Grid({
		el : document.getElementById('mtrlInsertList'),
		columns : [ {
			header : '원자재발주코드',
			name : '원자재발주코드',
		    sortable: true,
		    sortingType: 'desc'
		}, {
			header : '원자재코드',
			name : '원자재코드'
		}, {
			header : '원자재명',
			name : '원자재명'
		}, {
			header : '업체명',
			name : '업체명'
		}, {
			header : '입고량',
			name : '입고량'
		}, {
			header : '입고일시',
			name : '입고일시'
		}, {
			header : '원자재LOT번호',
			name : '원자재LOT번호'
		}, {
			header : '유통기한',
			name : '유통기한'
		}

		],
		rowHeaders : [ 'checkbox' ],
		pageOptions : {
			useClient : true,
			perPage : 5
		}
	});

  $("#btnSav").click(function () {	  
	  let mtrl = listMtrlInsert.getCheckedRows();
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
          if (result.isConfirmed) {
        	  for (var i = 0; i < mtrl.length; i++) {
        	  $.ajax({
        		  url : 'insertMtrlIn',
        		  method : 'POST',
        		  data : mtrl[i],
        		  async : false,
        		  dataType : 'JSON'
        	  }).done(function(result){
        		  console.log(result);
        	  })
          }        	  
              Swal.fire(
                  '승인이 완료되었습니다.',
                  '화끈하시네요~!',
                  'success'
              ).then(function(){
            	  location.reload();
              })
          }else{
          	Swal.fire(
                      '승인이 취소되었습니다.',
                      '섹시하시네요~!',
                      'error'
                  )
          }
      })
  });

  // 입고 검색
  $("#search").on("click", function() {
   console.log("click!")
   var mtNminput = $("#mtNminput").val();
   var vdrNminput = $("#vdrNminput").val();
   var req1 = $("#req1").val();
   var req2 = $("#req2").val();

   $.ajax({
      url : "insertSearch",
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
	   listMtrlInsert.resetData(result);
       console.log(result);
       
   }).fail(function(result){
	   console.log(result);
   });
})

/* 검색 결과 초기화  */
$('#reset').on('click',function(){
	const url = "mtrlInsertList";
	   $.ajax(url,{
	      dataType : "JSON",
	      method: "GET"
	   }).done(function(result){
		   listMtrlInsert.resetData(result);
	     console.log(result);
	   });
})

/* 행삭제 */
 $('#delete').on('click', function(e){
	let value = listMtrlInsert.getCheckedRows(e);
	console.log(value);
	listMtrlInsert.removeCheckedRows();
})//end of 행삭제 


 </script>
</html>