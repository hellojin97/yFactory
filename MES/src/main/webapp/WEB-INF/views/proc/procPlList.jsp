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
	<div id="orderList1"></div>
	<button id="btnModal">주문서등록</button>
	<div id="test"></div>
	<script>
	
	
		btnModal.addEventListener("click", function() {
			$("#test").load("ordermodal", function() {
				
				const myModal = new bootstrap.Modal('#myModal');
				myModal.show();
				

			})
		});
	
		window.onload = function() {
			
				
			
			var resultGrid = new tui.Grid({
				el : document.getElementById('orderList'),
				scrollX : false,
				scrollY : false,
				columns : [ {
					header : '주문코드',
					name : '주문코드',
				}, {
					header : '제품명',
					name : '제품명',
				}, {
					header : '제품코드',
					name : '제품코드',
				}, {
					header : '계획량',
					name : '계획량',
				}, {
					header : '생산일수',
					name : '생산일수',
				}, {
					header : '작업우선순위',
					name : '작업우선순위',
				}, {
					header : '수량',
					name : '수량',
				}, ],
				rowHeaders : [ 'checkbox' ],
				pageOptions : {
					useClient : true,
					perPage : 5
				}
			});
			
			
		}
				
		
		
		
		
		
		/* if(ordcd != null){
			 const url = "procPlListAjax";
			$.ajax(url, {
				data : {
					ordCd : ordcd
				},
				dataType : "JSON",
				contentType : "application/json; charset = UTF-8;"
			}).done(function(result) {
				console.log(result);
				orderList.resetData(result);
			}) */

		/* 	var grid = new tui.Grid({
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
					name : '주문일자',
				}, {
					header : '계획량',
					name : '납기일자',
				}, {
					header : '생산일수',
					name : '완제품코드',
				}, {
					header : '작업우선순위',
					name : '완제품명',
				}, {
					header : '수량',
					name : '주문수량',
				}, ],
				rowHeaders : [ 'checkbox' ],
				pageOptions : {
					useClient : true,
					perPage : 5
				}
			}); 
		} */
	</script>

</body>

</html>