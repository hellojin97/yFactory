<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mainTitle" style="padding-bottom: 15px; color:;">
		<h1>주문서 조회</h1>
	</div>
	<div id="orderList"></div>
	<button id="btnModal">주문서등록</button>
	<button id="btnInsert">행추가</button>
	<button id="btnDelete">행삭제</button>
	<button id="btntest">제품목록</button>
	<div id="test"></div>
	<script>
	//제품목록 테스트
	btntest.addEventListener("click", function() {
		$("#test").load("prdmodal", function() {
			
			const prdModal = new bootstrap.Modal('#prdModal');
			prdModal.show();
			

		})
	});
	
		btnModal.addEventListener("click", function() {
			$("#test").load("ordermodal", function() {
				
				const myModal = new bootstrap.Modal('#myModal');
				myModal.show();
				

			})
		});
		btnInsert.addEventListener("click", function() {
			resultGrid.appendRow();
		});
		btnDelete.addEventListener("click", function() {
			resultGrid.removeCheckedRows(false);
		});
		
		
		
		var resultGrid
		window.onload = function() {
		 	resultGrid = new tui.Grid({
			el : document.getElementById('orderList'),
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '주문코드',
				name : '주문코드',
			}, {
				header : '제품명',
				name : '완제품명',
			}, {
				header : '제품코드',
				name : '완제품코드',
			}, {
				header : '계획량',
				name : '계획량',
				editor: "text"

		        }, {
				header : '생산일수',
				name : '생산일수',
				editor: "text"
			}, {
				header : '작업우선순위',
				name : '작업우선순위',
				editor: "text"
			}, {
				header : '수량',
				name : '수량',
				editor: "text"
			}, ],
			rowHeaders : [ 'checkbox' ],
			pageOptions : {
				useClient : true,
				perPage : 5
			}
		
		});
			

		 	resultGrid.on("click",function(e){
		 		let prd = resultGrid.getFocusedCell('완제품코드');

		 		if(prd.columnName == '완제품명'){
		 			if(prd.value == null){
		 				$("#test").load("prdmodal", function() {
			 				const prdModal = new bootstrap.Modal('#prdModal');
			 				prdModal.show();
			 				

			 			})
		 			}
		 		}
		 		

		 	})
			
		} 
			 
				
		
		
		
		
		

	</script>

</body>

</html>