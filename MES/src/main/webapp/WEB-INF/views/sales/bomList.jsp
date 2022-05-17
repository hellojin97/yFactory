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

	<div class="container">
		<div class="mainTitle" style="padding-bottom: 15px; color:;">
			<h1>bom 조회</h1>
		</div>



		<div id="grid"></div>
	</div>


	<script type="text/javascript">
window.onload = function (){
	var resultDt = [];
const url = "bomListAjax";
$.ajax(url,{
	   dataType : "JSON",
	   method: "GET"
}).done(function(result){
	console.log(result);
	for(var i in result){
	resultDt.push( {
				   				완제품명 : result[i].완제품명,
				  				 _attributes: {expanded: true },
				   				 _children: [ { 완제품명 : result[i].원자재명 }]
						  });
	}
	console.log(resultDt);
	
	
	const grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: resultDt,
	      rowHeaders: ['checkbox'],
	      bodyHeight: 500,
	      treeColumnOptions: {
	        name: '완제품명',
	        useCascadingCheckbox: true
	      },
	      columns: [
	        {
	          header: '완제품명',
	          name: '완제품명',
	          width: 300,
	          _children:
		      {
		    	  header : '원자재명',
	        	  name : '원자재명'
		      }
	        }
	          
			    ,
	          ]
	      });
	grid.on('expand', (ev) => {
		  const {rowKey} = ev;
		  const descendantRows = grid.getDescendantRows(rowKey);

		  console.log('rowKey: ' + rowKey);
		  console.log('descendantRows: ' + descendantRows);
		});
	        
})
}
;
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