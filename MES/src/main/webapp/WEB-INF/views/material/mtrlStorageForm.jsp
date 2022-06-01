<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고조회</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />


</head>
<body onkeyup="on_key_up()">

	<h1>원자재 재고조회</h1>
	<form>
		<div style="background-color: #e9ecef; padding: 8px;">
			<div class="mainTitle" style="padding: 15px;">
				<!-- 자재명 -->

				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">

						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">자재명</label> <input type="text"
							class="form-control" style="width: 50px" id="mtNminput"
							placeholder="자재명"> <a
							class="nav-link nav-icon search-bar-toggle " id="myBtn"
							onclick="myBtn"> <i class="bi bi-search"
							style="color: #2c3e50"></i>
						</a> <input type="text" class="form-control" id="mtCdinput"
							readonly="readonly">
					</div>
				</div>
				<!-- 업체명 -->
				<div class="col-md-6 " style="padding: 0px 20px 10px 0px">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label"
							style="padding-right: 27px;">업체명</label> <input type="text"
							class="form-control" style="width: 50px" id="vdrNminput"
							placeholder="업체명"> <a
							class="nav-link nav-icon search-bar-toggle " id="vdr"
							onclick="vdr"> <i class="bi bi-search" style="color: #2c3e50"></i>
						</a> <input type="text" class="form-control" id="vdrCdinput"
							readonly="readonly">
						<div style="padding-right: 10px;">
							<button class="btn1" type="button" id="search">조회</button>
						</div>
						<div>
							<button class="btn1" type="reset" id="reset">초기화</button>
						</div>
					</div>
				</div>


			</div>
			<hr style="border: solid 1px gray;">

			<!-- 테이블 -->
			<div class="code-html contents" style="padding-bottom: 10px;">
				<div id="mtrlStorageGrid"></div>
				<div id="test"></div>
			</div>
			<div>
				<button type="button" class="btn1" id="excel">Excel</button>
				<button class="btn1" id="mtrlcancel">발주서인쇄</button>
			</div>
		</div>
	</form>


</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>
	myBtn.addEventListener("click", function(){
	$("#test").load("mtcdModal", function(){
		const myModal = new bootstrap.Modal('#myModal');
		myModal.show();
	})
	});

	vdr.addEventListener("click", function(){
		$("#test").load("vdrModal", function(){
			const myModal = new bootstrap.Modal('#myModal');
			myModal.show();
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
	
	

	//원자재 전체조회
	$.ajax({
		url : "mtrlStorageList",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			mtrlStorageTable.resetData(result);
			setTimeout(mtrlColor, 10);
			
		}
	});

	var mtrlStorageTable = new tui.Grid({
		el : document.getElementById('mtrlStorageGrid'),
		columns : [ {
			header : '원자재코드',
			name : '원자재코드',
			align: 'center',
		}, {
			header : '원자재명',
			name : '원자재명'
		}, {
			header : '업체명',
			name : '업체명'
		}, {
			header : '수량',
			name : '수량',
			align: 'right',
		    
		}, {
			header : '안전재고',
			name : '안전재고',
			align: 'right',
		}
		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 10
		}
	});

  // 원자재 검색
  $("#search").on("click", function() {
   console.log("click!")
   var mtNminput = $("#mtNminput").val();
   var vdrNminput = $("#vdrNminput").val();
   $.ajax({
      url : "mtrlStorageSearch",
      data : {
    	  m1 : mtNminput,
    	  m2 : vdrNminput,
      },
      method : 'get',
      dataType: 'JSON',
      contentType : "application/json; charset=utf-8"
   }).done(function(result){
	   mtrlStorageTable.resetData(result);
       console.log(result);
       
   }).fail(function(result){
	   console.log(result);
   });
})

/* 검색 결과 초기화  */
$('#reset').on('click',function(){
	const url = "mtrlStorageList";
	   $.ajax(url,{
	      dataType : "JSON",
	      method: "GET"
	   }).done(function(result){
		   mtrlStorageTable.resetData(result);
	     console.log(result);
	   });
})
//그리드 색상변경
function mtrlColor(){
	$("#mtrlStorageGrid").find(".tui-grid-body-area tbody tr").each(function(){
		var data1 =parseInt($(this).find("[data-column-name = '수량']").find("div").text());
		var data2 =parseInt($(this).find("[data-column-name = '안전재고']").find("div").text());
		console.log(data1);
		console.log(data2);
	    if(data1 < data2){
	    	$(this).find("[data-column-name = '수량']").css("background-color", "pink");
	    } 
	});
}
//excel호출  
$('#excel').on('click',function(){
	const options = {
		includeHiddenColumns: true,
		onlySelected: true,
		fileName: '원자재 재고조회',
		};
	mtrlStorageTable.export('xlsx',options);
})

 </script>
</html>