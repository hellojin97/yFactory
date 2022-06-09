<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고등록</title>
</head>
<body onkeyup="on_key_up()">

		<div style="padding-bottom: 70px;">
		<div class="mainTitle" style="padding-bottom: 15px;">
			<h1>원자재 입고등록</h1>
		</div>
		<div class="min2">
			<button class="btn2" id="btnMg">등록</button>
			<button class="btn3" id="btnIn">관리</button>
		</div>
		<div class="min1">
			<div >
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
	</div>	
	
	


</body>

<script>

//입고 관리
$('#btnIn').on('click', function(){
	location.href = 'mtrlInsertListForm';

})

  
//입고 등록
  $('#btnMg').on('click', function(){
	location.href = 'mtrlInsertForm';
  }) 
  

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
		bodyHeight:400,
		columns : [ {
			header : '원자재발주코드',
			name : '원자재발주코드',
			className : 'fontClass',
		    sortable: true,
		    sortingType: 'desc',
		    align : 'center'
		}, {
			header : '원자재코드',
			name : '원자재코드',
			className : 'fontClass',
		    align : 'center'
		}, {
			header : '원자재명',
			name : '원자재명',
			className : 'fontClass',
		}, {
			header : '업체명',
			name : '업체명',
			className : 'fontClass',
		}, {
			header : '입고량',
			name : '입고량',
			className : 'fontClass',
			align : 'right',
			formatter(myNum) { 					
			      return myNum.value.toString()
			      .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			}
		}, {
			header : '입고일시',
			name : '입고일시',
			className : 'fontClass',
			align : 'center'
		}, {
			header : '원자재LOT번호',
			name : '원자재LOT번호',
			className : 'fontClass',
			 align : 'center'
		}, {
			header : '유통기한',
			name : '유통기한',
			className : 'fontClass',
			align : 'center'
		}

		],
		rowHeaders : [ 'checkbox' ],
		pageOptions : {
			useClient : true,
			perPage : 10
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

/* 행삭제 */
 $('#delete').on('click', function(e){
	let value = listMtrlInsert.getCheckedRows(e);
	console.log(value);
	listMtrlInsert.removeCheckedRows();
})//end of 행삭제 


 </script>
</html>