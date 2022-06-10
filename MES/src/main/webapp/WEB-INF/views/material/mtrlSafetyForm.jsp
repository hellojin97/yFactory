<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원자재 안전재고 관리</title>

<body>
	<div style="padding-bottom: 15px; color:;">
		<h1>원자재 안전재고 관리</h1>
	</div>

	<div class="min1">
		<div class="row" style="padding: 20px;">
			<form>
				<!-- 자재명 -->
				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">원자재명</label> <input type="text"
							id="mtNminput" class="form-control" style="width: 50px"
							placeholder="원자재명"> <a
							class="nav-link nav-icon search-bar-toggle " id="myBtn"
							onclick="myBtn"> <i class="bi bi-search"
							style="color: #2c3e50"></i>
						</a> <input type="text" id="mtCdinput" class="form-control"
							readonly="readonly">
					</div>
				</div>

				<!-- 안전재고 -->
				<div class="col-md-8">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">안전수량</label>
						<div class="col-sm-6" style="padding-right: 10px;">
							<input type="text" id="safe" class="form-control"
								placeholder="안전수량" style="width: 425px;">
						</div>
						<div style="padding-right: 10px; margin-left: 30px;">
							<button type="button" id="search" class="btn1">조회</button>
						</div>

						<div style="padding-right: 10px;">
							<button type="button" id="safeSave" class="btn1">수정</button>
						</div>

						<div>
							<button id="reset" type="button" class="btn1">초기화</button>
						</div>

					</div>
				</div>
			</form>
		</div>
		<hr style="border: solid 1px gray;">

		<!-- 테이블 -->
		<div class="code-html contents" style="padding-bottom: 10px;">
			<div id="mtrlSafetyTable"></div>
			<div id="test"></div>
		</div>
		<div>
			<button  class="btn1" id="excel">Excel</button>
		</div>
	</div>

</body>

<script>
    //원자재명 모달
	myBtn.addEventListener("click", function(){
	$("#test").load("mtcdModal", function(){
		const myModal = new bootstrap.Modal('#myModal');
		myModal.show();
	})
	});

	function on_key_up(){
		if($("#mtNminput").val()==""){
			$("#mtCdinput").val("");
		}
	}

	//안전재고 전체조회
	$.ajax({
		url : "mtrlSafetyList",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			mtrlSafetyGrid.resetData(result);
			setTimeout(listColor, 10);
		}
	});
	var mtrlSafetyGrid = new tui.Grid({
		el : document.getElementById('mtrlSafetyTable'),
		columns : [ {
			header : '원자재코드',
			name : '원자재코드',
			className : 'fontClass',
	        sortable: true,
	        sortingType: 'asc',
	        align : 'center'
		}, {
			header : '원자재명',
			name : '원자재명',
			className : 'fontClass',
			
		}, {
			header : '단위',
			name : '단위',
			className : 'fontClass',
			align : 'center'
		}, {
			header : '현재고',
			name : '현재고',
			className : 'fontClass',
			align : 'right'
		}, {
			header : '안전재고',
			name : '안전재고',
			className : 'fontClass',
			align : 'right'
		}

		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 10
		}
	});
	

	
  /* 단건 조회 */
    $("#search").on("click", function() {   
	  var mtNminput = $("#mtNminput").val();
	  if(mtNminput == ''){
		  Swal.fire({
              icon: 'error',
              title: '입력값이 없습니다.',
              text: '원자재명을 입력해주세요!',
			});

	  }else	{
	        $.ajax({
	        	    url : "mtrlSafetySearch",
	        	    data : {m1 : mtNminput,},
	        	    dataType: 'JSON',
	        	    contentType : "application/json; charset=utf-8"
	        	   }).done(function(result){
	        	      console.log(result);
	        	      mtrlSafetyGrid.resetData(result);    
	        	     	  });	
		  }
	  });
  
  
  
  
  
  /* 안전재고 저장 */
  $("#safeSave").on("click", function(){	  
	  var mtNminput = $("#mtNminput").val();
	  var safe = $("#safe").val();	  
	  if(safe == '' || mtNminput == ''){
		  Swal.fire({
              icon: 'error',
              title: '수정이 취소되었습니다.',
              text: '원자재코드와 안전 수량을 입력해주세요!',
			});
	  }else	{
		  Swal.fire({
	            title: '안전재고수량을 변경하시겠습니까?',
	            text: "다시 되돌릴 수 없습니다.",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '승인',
	            cancelButtonText: '취소'
	        }).then((result) => {
	        	if (result.isConfirmed) {
		  $.ajax({
			  url : "mtrlUpdateSafe",
			  method : "POST",
			  data : { mtNm : mtNminput,
				       safe : safe
				     }
		  }).done(function(result){
		  });
		  Swal.fire(
                  '승인이 완료되었습니다.',
                  '변경이 완료되었습니다.',
                  'success'
              ).then(function(){
            	  location.reload(true);	  
          	  });
	        	}else{
	              	Swal.fire(
	                        '승인이 취소되었습니다.',
	                        ' ',
	                        'error'
	                    )
	            }
	           })
	  }
  });
  
/* 검색 결과 초기화  */
$('#reset').on('click',function(){
const url = "mtrlSafetyList";
   $.ajax(url,{
      dataType : "JSON",
      method: "GET"
   }).done(function(result){
	   mtrlSafetyGrid.resetData(result);
     console.log(result);
   });
})
  
  
//테이블 클릭시 데이터값 호출  
  mtrlSafetyGrid.on("dblclick", function(e){
	  var mnm = mtrlSafetyGrid.getValue(e.rowKey, "원자재명");
	  var mcd = mtrlSafetyGrid.getValue(e.rowKey, "원자재코드");
	  var safe = mtrlSafetyGrid.getValue(e.rowKey, "안전재고");
	  $("#mtNminput").val(mnm);
	  $("#mtCdinput").val(mcd);
	  $("#safe").val(safe);
  });  
  
//excel호출
  $('#excel').on('click',function(){
  	const options = {
  			  includeHiddenColumns: true,
  			  onlySelected: true,
  			  fileName: '원자재안전재고조회',
  			};
  	mtrlSafetyGrid.export('xlsx', options);
  })
// 부족분 색상변경  
  function listColor(){
	$("#mtrlSafetyTable").find(".tui-grid-body-area tbody tr").each(function(){
		var data1 =parseInt($(this).find("[data-column-name = '현재고']").find("div").text());
		var data2 =parseInt($(this).find("[data-column-name = '안전재고']").find("div").text());
	    if(data1 < data2){
	    	$(this).find("[data-column-name = '현재고']").css("background-color", "pink");
	    } else{
	    	$(this).find("[data-column-name = '현재고']").css("background-color", "#f4f4f4");
	    } 
	});
	mtrlSafetyGrid.on("afterPageMove", function(e){		
		setTimeout(listColor, 10);
	})
}

 </script>

</html>