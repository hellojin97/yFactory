<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자재명모달  -->
	<div id="myModal" class="modal fade" tabindex="-1" >
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">품목코드</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div style="padding-bottom: 20px;">
						<h4>입고예정 목록</h4>
						<div id="expectGrid"></div>
						<div style="padding-right: 10px;">
							<button class="btn1"  type="button" id="select"style="float: left; padding:0px 20px 0px 20px;">선택</button>
						</div>
					</div>
					
				</div>
				<!-- 내용끝 -->
				
			</div>
		</div>
	</div>
	<!-- 모달끝 -->

	<script>
	
		var test1 = null;
		//자재명 전체조회
		$.ajax({
			url : "expectList",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				if(test1 == ''){
						mtrlExpectList.resetData(result);
						console.log(3);
					
				} else {
						for (var i = 0; i < test1.length; i++) {
							console.log(test1[i].원자재코드);
							for (var i = 0; i < result.length; i++) {
								if(test1[i].원자재코드 != result[i].원자재코드){
									mtrlExpectList.appendRow(result[i]);
								}
							}	// end of for문 (result)
						} // end of for문 (test)
				} // end of if
			}
		});

		var mtrlExpectList = new tui.Grid({
			el : document.getElementById('expectGrid'),
 	       bodyWidth: 600,
			columns : [ {
				header : '원자재발주코드',
				name : '원자재발주코드'
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
				header : '입고예정량',
				name : '입고예정량'
			}, {
				header : '검사일자',
				name : '검사일자'
			}
			
			],
			rowHeaders : [ 'checkbox' ],
			pageOptions : {
				useClient : true,
				perPage : 5
			}
		});
		
		 
		  
		  $('body').css("overflow", "hidden");
		  
		  var myModal = document.getElementById('myModal')


		  myModal.addEventListener('shown.bs.modal', function () {
			  //ajax 호출
			  //grid.resetData(data)
			  
		      mtrlExpectList.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
		  })
  //입고예정등록버튼
   $("#select").on("click", function(){
        	  let pocd = mtrlExpectList.getCheckedRows();
        	  for (var i = 0; i < pocd.length; i++) {  
        		  
        		  /* 입고예정리스트 */
      			    let poCd = pocd[i];
        		  console.log(poCd)
        		    $.ajax({
        		    	url : 'selectMtrlReqList',
        		    	data : poCd,
        		 		dataType : 'JSON',
        		    }).done(function(result){
        		    	for (var i = 0; i < result.length; i++) {
        		    		listMtrlInsert.appendRow(result[i]);
						}
        		    	
        		    	$('#myModal').modal('hide')
        		    	
        		    	console.log(result);
        		    })
        		   
        		}; 
        		
        		
  });
	</script>
</body>
</html>