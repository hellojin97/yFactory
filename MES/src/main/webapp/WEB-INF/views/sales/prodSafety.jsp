<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.smMouseOver {
		cursor:pointer;
	}
</style>
</head>
<body>
		<div style="padding-bottom:15px; color: ;">
		<h1>완제품 안전재고 관리</h1>
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
							<i class="bi bi-search smMouseOver" style="color: #2c3e50"></i>
						</a>
						<input type="text" id="pcd" class="form-control" readonly="readonly">
					</div>
				</div>				

				<!-- 날짜 -->
				<div class="col-md-6">
					<div class="input-group">						
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">안전수량</label>
						<div class="col-sm-4" style="padding-right: 10px;">
						<input type="text" id="safe" class="form-control" placeholder="안전수량">
						</div>
						<div style="padding-right: 10px;">
							<button type="button" id="search" class="btn1">조회</button>
						</div>

						<div style="padding-right: 10px;">
							<button type="button" id="safeSave" class="btn1">저장</button>
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
		url : "prodSafetyList",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			listProdLot.resetData(result);
			setTimeout(listColor, 10);
		}
	});

	var listProdLot = new tui.Grid({
		el : document.getElementById('prodLotorder'),
		columns : [ {
			header : '제품코드',
			name : '제품코드',
			className : 'fontClass',
			align: 'center'
		}, {
			header : '제품명',
			name : '제품명',
			className : 'fontClass',
		}, {
			header : '단위',
			name : '단위',
			className : 'fontClass',
			align: 'center'
		}, {
			header : '완제품수량',
			name : '완제품수량',
			className : 'fontClass',
			align: 'right'
		}, {
			header : '안전수량',
			name : '안전수량',
			className : 'fontClass',
			align: 'right'
		}

		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 5
		}
	});
	

	
  /* 단건 조회 */
  $("#search").on("click", function() {     
     var pnm = $("#pnm").val();
     var pcd = $("#pcd").val();
          
     $.ajax({
        url : "searchProdSafety",
        data : {
              pnm : pnm,  
              pcd : pcd,                           
        },
        dataType: 'JSON',
        contentType : "application/json; charset=utf-8"
     }).done(function(result){
    	 setTimeout(listColor, 10);
         listProdLot.resetData(result);          
     });
  })
  
  /* 안전수량 저장 */
  $("#safeSave").on("click", function(){	  
	  var pcd = $("#pcd").val();
	  var safe = $("#safe").val();	  
	  if(safe == '' || pcd == ''){
		  Swal.fire({
              icon: 'error',
              title: '저장이 취소되었습니다.',
              text: '제품 코드와 안전 수량을 입력해주세요!',
			});
	  }else	{
		  Swal.fire({
	            title: '안전수량을 변경하시겠습니까?',
	            text: "다시 되돌릴 수 없습니다. 신중하세요.",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '승인',
	            cancelButtonText: '취소'
	        }).then((result) => {
	        	if (result.isConfirmed) {
		  $.ajax({
			  url : "updateSafe",
			  method : "POST",
			  data : { pcd : pcd,
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
	                        '섹시하시네요~!',
	                        'error'
	                    )
	            }
	           })
	  }
  });
  
  listProdLot.on("click", function(e){
	  var pcd = listProdLot.getValue(e.rowKey, "제품코드");
	  var pnm = listProdLot.getValue(e.rowKey, "제품명");
	  var safe = listProdLot.getValue(e.rowKey, "안전수량");
	  $("#pcd").val(pcd);
	  $("#pnm").val(pnm);
	  $("#safe").val(safe);
  });
  
  function listColor(){
	$("#prodLotorder").find(".tui-grid-body-area tbody tr").each(function(){
		var data1 =parseInt($(this).find("[data-column-name = '완제품수량']").find("div").text());
		var data2 =parseInt($(this).find("[data-column-name = '안전수량']").find("div").text());
	    if(data1 < data2){
	    	$(this).find("[data-column-name = '완제품수량']").css("background-color", "pink");
	    }else{
	    	$(this).find("[data-column-name = '완제품수량']").css("background-color", "#f4f4f4");
	    } 
	});
	
	listProdLot.on("afterPageMove", function(e){		
		setTimeout(listColor, 10);
	})
}
  
//마우스 커서 올리면
  listProdLot.on('mouseover', function(e){
  	var tt = e.targetType;
  		if(tt == 'cell' ){	
  			$('#prodLotorder').attr("class", "smMouseOver");
  		}else{
  			$('#prodLotorder').removeClass();					
  		}
  });

 </script>

</html>