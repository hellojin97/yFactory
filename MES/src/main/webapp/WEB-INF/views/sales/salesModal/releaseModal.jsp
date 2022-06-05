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
								<input type="number" class="form-control" id="ordModalNum" disabled>							
						</div>
						<div class="input-group">
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">선택 수량 : </label>
								<input type="number" class="form-control" id="selNum" value="0" readonly="readonly">
								<div style="padding-left: 10px;">
								<button id="btnInsert" class="btn1">등록</button>
								</div>						
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
	var pcd = $("#prodCd").val();
	var bfN;
	var nowN;
	var res = parseInt($("#selNum").val());
		
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
				header : '완제품LOT번호',
				name : '완제품LOT번호'
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
		
		//출고량 더블클릭
		prodList.on("dblclick", function(e) {
		bfN = prodList.getValue(e.rowKey, "출고량");			
		if (bfN == null){
			bfN = 0;
		}			
		})
		
		//출고량 입력
     	prodList.on('afterChange', ev =>{
        orgin: 'cell';               
        let evn = ev.changes;
        let affN = parseInt(evn[0].value);;
        console.log(evn);
		nowN = prodList.getValue(evn[0].rowKey, "완제품 현재고");			
        var sum = parseInt(affN) - parseInt(bfN);
        
        if(nowN < affN) {
			Swal.fire({
	               icon: 'error',
	               title: '등록이 취소되었습니다.',
	               text: '현재고보다 출고량이 많습니다!',
				});
			prodList.setValue(evn[0].rowKey, "출고량", 0);
		}else{
			res = res + sum
         	$("#selNum").val(res);				
		}
      });
		
		  
		$('body').css("overflow", "hidden");
		  
		  var myModal = document.getElementById('myModal')


		  myModal.addEventListener('shown.bs.modal', function () {
			  //ajax 호출
			  //grid.resetData(data)
			  
		      prodList.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
		  })

	//등록 버튼
	btnInsert.addEventListener("click", function() {
		var ord = parseInt($("#ordModalNum").val());
		var sel = parseInt($("#selNum").val());	
		var orDt = $("#ordTL").val();
		var today = new Date();
		var sysDate = today.getFullYear() + '-' + (today.getMonth()+1) + '-' + today.getDate();
		if(ord < sel) {
			Swal.fire({
                icon: 'error',
                title: '등록이 취소되었습니다.',
                text: '주문량보다 출고량이 많습니다!',
            });
		}else if(ord > sel){
			Swal.fire({
                icon: 'error',
                title: '등록이 취소되었습니다.',
                text: '주문량보다 출고량이 적습니다!',
            });
		}else if(ord = sel){
			
			let checkedAry = {"주문상세코드" : orDt , "완제품코드" : pcd, "출고날짜" : sysDate};
			let prd = prodList.getCheckedRows();
			let plus;
			for (var i = 0; i < prd.length; i++) {				
				plus = {...checkedAry, ...prd[i]};
				releaseList.appendRow(plus);
			}
      		$('#ordHiden').val(orDt);
      		$('#myModal').modal('hide');
      		
      	}       
       });
		  
		//마우스 커서 올리면
		  prodList.on('mouseover', function(e){
		  	var cn = e.columnName;
		  	var tt = e.targetType;
		  		if(cn == '출고량' && tt == 'cell' ){			
		  			$('#prodGrid').attr("class", "smMouseOver");
		  		}else{
		  			$('#prodGrid').removeClass();					
		  		}
		  });
	</script>
</body>
</html>