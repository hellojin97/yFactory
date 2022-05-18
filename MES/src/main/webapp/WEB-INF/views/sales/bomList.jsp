<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>

		<div class="mainTitle" style="padding-bottom: 15px; color:;">
			<h1>BOM 조회</h1>
		</div>



		<div id="grid"></div>


	<script type="text/javascript">
	window.onload = function(){
		   const url = "bomListAjax";
		   $.ajax(url,{
			   dataType : "JSON",
			   method: "GET"
		   }).done(function(result){
			   grid.resetData(result);
			  console.log(result);
		   })
			
		   var grid = new tui.Grid({
		       el: document.getElementById('grid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [
		         {
		           header: '완제품명',
		           name: '완제품명',
		         },
		         {
		             header: '완제품코드',
		             name: '완제품코드',
		           },
		           {
		               header: '원자재명',
		               name: '원자재명',
		             },
		             {
		                 header: '원자재 코드',
		                 name: '원자재 코드',
		               },
		             {
		                 header: '소요량',
		                 name: '소요량',
		               }],
		   					rowHeaders: ['rowNum'],
		                     pageOptions: {
		                         useClient: true,
		                         perPage: 15
		                    }
		     });
		}
  </script>

</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>



</html>