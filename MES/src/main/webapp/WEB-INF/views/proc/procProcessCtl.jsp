<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.clickB {
	color: black;
	font-weight: bold;
	background: white;
	border: solid 1px gray;
	line-height: 30px;
	margin: 3px;
}
</style>
</head>
<body>
	<div class="mainTitle">
		<h3>공정 관리</h3>
		<div>
		공정구분
		<select id = "procProcessSelect">
		<option value="전체">전체</option>
		</select>
		
		<button id="search" class="btn1">검색</button>
		<button id="clear" class="btn1">초기화</button>
		</div>
	</div>

	<div>

	<div id="procProcessCtlGrid"></div>
	</div>
		

	<script>
	$(function(){
		 const url1 = "procProcessCheckList";
		   $.ajax(url1,{
			   dataType : "JSON",
			   method: "GET"
		   }).done(function(result){
			   for (var i = 0; i < result.length; i++) {
				console.log(result[i].CD_NM);
				$("#procProcessSelect").append('<option value="' + result[i].CD_NM + '">' + result[i].CD_NM + '</option');
				
			} 
		   });	
		
	 const url = "procProcessCtlSelect";
	   $.ajax(url,{
		   dataType : "JSON",
		   method: "GET"
	   }).done(function(result){
		   
		   procProcessCtlGrid.resetData(result);
	   })
				procProcessCtlGrid = new tui.Grid({
					el : document.getElementById('procProcessCtlGrid'),
					scrollX : false,
					scrollY : false,
					columns : [ {
						header : '공정코드',
						name : '공정코드',
					}, {
						header : '공정구분',
						name : '공정구분',
						
	                       ]
	                    }
	               }

					},
					{
						header : '공정명',
						name : '공정명',


					}, 
					
					{
						header : '설비코드',
						name : '설비코드',
					}, {
						header : '설비명',
						name : '설비명',
					},{
						header : '모델명',
						name : '모델명',
					},{
						header : '담당자',
						name : '담당자',
					},
					
					],
					rowHeaders : [
 				          {
 	   				        type: 'checkbox',
 	   				          },
   				        	{
   				            type: 'rowNum',

   				          }

   				          ],
					pageOptions : {
						useClient : true,
						perPage : 5
					}

				});
	   
				
	});
	

			
	</script>

</body>
</html>