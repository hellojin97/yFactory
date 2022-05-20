<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 완제품명모달  -->
	<div id="myModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">완제품 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-8 " style="padding-bottom: 20px;">
						<div class="input-group" style="padding-bottom: 15px;">
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">주문 수량 : </label>
								<input type="text" class="form-control" id="ordModalNum" disabled>							
						</div>
						<div class="input-group">
							<label for="inputText" class="col-form-label">선택 수량 : </label>
								<input type="text" class="form-control" id="selNum" readonly="readonly" style="padding-right: 10px;">	
								<button id="btnInsert" class="btn1">등록</button>						
						</div>
					</div>
					<div id="prodGrid"></div>
				</div>
				<!-- 내용끝 -->
				
			</div>
		</div>
	</div>
	<!-- 모달끝 -->

	<script>
	var omn = $("#ordNum").val();
	$("#ordModalNum").val(omn);
		//완제품명 전체조회
		key = $("#ordTL").val()
		$.ajax({
			url : "outProdModal",
			data : {key : key},
			method : "GET",
			dataType : "JSON",
			contentType : "application/json; charset=utf-8",
			success : function(result) {
				prodList.resetData(result);
			}
		});

		var prodList = new tui.Grid({
			el : document.getElementById('prodGrid'),
			columns : [ {
				header : '완제품 LOT 번호',
				name : '완제품 LOT 번호'
			}, {
				header : '완제품명',
				name : '완제품명'
			}, {
				header : '완제품 현재고',
				name : '완제품 현재고'
			}, {
				header : '출고량',
				name : '출고량',
				editor : 'text'
			}, {
				header : '제조일자',
				name : '제조일자',
			}, {
				header : '유통기한',
				name : '유통기한'
			}],
			rowHeaders : [ 'checkbox' ],
			pageOptions : {
				useClient : true,
				perPage : 5
			}
		});
		
		prodList.on('afterChange', ev =>{
			orgin: 'cell';					
			let evn = ev.changes;
			var res = 0;
			for (var i = 0; i < evn.length; i++) {
				res = res + parseInt(evn[i].value);
				}
			console.log(res);
			$("#selNum").val(res);
		})
		
		 
		  
		$('body').css("overflow", "hidden");
		  
		  var myModal = document.getElementById('myModal')


		  myModal.addEventListener('shown.bs.modal', function () {
			  //ajax 호출
			  //grid.resetData(data)
			  
		      prodList.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
		  })

	//모달 데이터값 받아오기
	btnInsert.addEventListener("click", function() {
		let checkedAry = [];
		 let prd = resultGrid.getCheckedRows();
		 for (var i = 0; i < prd.length; i++) {
			checkedAry.push(prd[i].rowKey);
		}
		
       let prodLot = prodList.getValue(e.rowKey, '완제품 LOT 번호');
       let prodNm = prodList.getValue(e.rowKey, '완제품명');
       let prodNum = prodList.getValue(e.rowKey, '완제품 현재고');
       let prodOut = prodList.getValue(e.rowKey, '출고량');
       let prodCre = prodList.getValue(e.rowKey, '제조일자');
       let prodDt = prodList.getValue(e.rowKey, '유통기한');
       
       
       
       $("#pnm").val(prodNm);
       $("#pcd").val(prodCd);
       $('#myModal').modal('hide');       
       }
    );    
	</script>
</body>
</html>