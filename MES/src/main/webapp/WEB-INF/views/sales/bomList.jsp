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
<div style="padding-bottom:15px; color: ;">
		<h1>설비 비가동 관리</h1>
	</div>
	<div class="min1">
	
	
	<h4>완제품 선택</h4>
	
     <!-- 완제품 목록 -->         
	<div id="prodGrid"></div>
	
	<hr style="border: solid 1px gray;">

	<h4>BOM</h4>
	<div>
	<form>				
	<div class="col-md-12" style="padding-bottom: 10px;">

			
			<!-- 인풋 태그 -->
			<div class="col-md-6" style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">완제품</label>
						<div class="col-sm-3"> 
						<input type="text" class="form-control" id="pnm" disabled>
						</div>
						<div class="col-sm-3">						
						<input type="text" id="pcd" class="form-control" disabled>&nbsp;&nbsp;&nbsp;&nbsp;
						</div>						
					</div>
				</div>
	</div>
				</form>
				</div>
	<!-- BOM 목록 -->
	<div id="bomGrid"></div>
	</div>
	
		
		


	<script type="text/javascript">
			
		   
	$.ajax({
		url : "prodModalList",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			prodGrid.resetData(result);
		}
	});
	
	var prodGrid = new tui.Grid({
		       el: document.getElementById('prodGrid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [		         
		           {
		               header: '제품명',
		               name: '제품명',
		             },
		             {
		                 header: '제품코드',
		                 name: '제품코드',
		               }],
		   					rowHeaders: ['rowNum']
		     });
	
	
	$.ajax({
		url : "",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			bomGrid.resetData(result);
		}
	});
	
	var bomGrid = new tui.Grid({
	       el: document.getElementById('bomGrid'),
	       scrollX: false,
	       scrollY: false,
	       columns: [		         
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
	
	prodGrid.on("click", function(e){
		var key = prodGrid.getValue(e.rowKey, "제품코드");
		var pnm = prodGrid.getValue(e.rowKey, "제품명");
		$("#pcd").val(key);
		$("#pnm").val(pnm);
		
		$.ajax({
			   url : "bomListAjax",
			   data : { "key" : key }
		   }).done(function(result){
			   bomGrid.resetData(result);
		   })
			
		   
	})   
		
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