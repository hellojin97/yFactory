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
<style type="text/css">
.clickB { color: black;
		  font-weight: bold;
		  background: white;
		  border: solid 1px gray;
		  line-height: 30px;
		  margin: 3px;
		    }


</style>
</head>


<body>

		<h1>제품 입/출고 조회</h1>
		<div id="in/out">		
		</div>
		<div>
		<button type="button" id="inBtn" class="btn1">입고</button>
		<button type="button" id="outBtn" class="clickB">출고</button>
		</div>

		<div style="background-color: #e0e0e0; padding: 8px;">
			<div class="mainTitle" style="padding: 15px;">
				<form>
				<!-- 제품명 -->
				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">제품명</label>
						<input type="text" id="pnm" class="form-control" style="width: 50px" placeholder="제품명">
						<a class="nav-link nav-icon search-bar-toggle " id="myBtn" onclick="myBtn">
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>
						<input type="text" id="pcd" class="form-control" readonly="readonly">
					</div>
				</div>				

				<!-- 날짜 -->
				<div class="col-md-12">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 10px;">제조날짜</label>
						<div class="col-sm-2">
							<input type="date" id="fdt1" class="form-control">
						</div>

						<div style="padding: 0px 15px 0px 15px;">
							<p>~</p>
						</div>
						<div class="col-sm-2" style="padding-right: 20px;">
							<input type="date" id="fdt2" class="form-control">
						</div>

						<div style="padding-right: 10px;">
							<button type="button" id="search" class="inSearch btn1">조회</button>
						</div>

						<div>
							<button type="reset" class="btn1">초기화</button>
						</div>
					</div>
				</div>
				</form>
			</div>
			<hr style="border: solid 1px gray;">

			<!-- 테이블 -->
			<div class="code-html contents" style="padding-bottom: 10px;">
				<div id="prodWrnoteList"></div>
				<div id="test"></div>
			</div>

		</div>

	

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
	$("#test").load("prodModal", function(){
		const myModal = new bootstrap.Modal('#myModal');
		myModal.show();
	})
	});

	// 페이지 onload = 입고
		$.ajax({
			url : "prodWrnoteIn",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				listWrnIn.resetData(result);			
			}
		});
		

	var listWrnIn = new tui.Grid({
		el : document.getElementById('prodWrnoteList'),
		columns : [ {
			header : '완제품LOT',
			name : '완제품LOT'
		}, {
			header : '제품코드',
			name : '제품코드'
		}, {
			header : '제품명',
			name : '제품명'
		}, {
			header : '입고량',
			name : '입고량'
		}, {
			header : '입고일자',
			name : '입고일자'
		}, {
			header : '유통기한',
			name : '유통기한'
		}

		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 10
		}
	});

	//입고 버튼
	$('#inBtn').on('click', function(){
		
		$('#outBtn').removeClass();
		$('#outBtn').attr("class", "clickB");
		$('#inBtn').removeClass();
		$('#inBtn').attr("class", "btn1");
		$('#search').removeClass();
		$('#search').attr("class", "inSearch btn1");
		
		
		
		$('#prodWrnoteList').empty();
		$.ajax({
			url : "prodWrnoteIn",
			method : "GET",
			dataType : "JSON",
			success : function(result) {
				listWrnIn.resetData(result);			
			}
		});
		
		var listWrnIn = new tui.Grid({
				el : document.getElementById('prodWrnoteList'),
				columns : [{
							header : '완제품LOT',
							name : '완제품LOT'
						}, {
							header : '제품코드',
							name : '제품코드'
						}, {
							header : '제품명',
							name : '제품명'
						}, {
							header : '입고량',
							name : '입고량'
						}, {
							header : '입고일자',
							name : '입고일자'
						}, {
							header : '유통기한',
							name : '유통기한'
						}],
						
				rowHeaders : [ 'rowNum' ],
				pageOptions : {
					useClient : true,
					perPage : 10
				}		
			})
		})
	
	//출고 버튼
	$("#outBtn").on("click", function(){
		$('#prodWrnoteList').empty();
		$('#inBtn').removeClass();
		$('#inBtn').attr("class", "clickB");
		$('#outBtn').removeClass();
		$('#outBtn').attr("class", "btn1");
		$('#search').removeClass();
		$('#search').attr("class", "outSearch btn1");
		
		$.ajax({
			url : "prodWrnoteOut",
			method : "GET",
			dataType : "JSON",
			success : function(result) {				
				listWrnOut.resetData(result);			
			}
		});
		
		var listWrnOut = new tui.Grid({
			el : document.getElementById('prodWrnoteList'),
			columns : [ {
				header : '완제품LOT',
				name : '완제품LOT'
			}, {
				header : '제품코드',
				name : '제품코드'
			}, {
				header : '제품명',
				name : '제품명'
			}, {
				header : '출고량',
				name : '출고량'
			}, {
				header : '출고일자',
				name : '출고일자'
			}, {
				header : '유통기한',
				name : '유통기한'
			}

			],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 10
			}
		});
	})

	
  /* 입/출고 검색 */
  $("#search").on("click", function() {     
     var pnm = $("#pnm").val();
     var pcd = $("#pcd").val();
     var fdt1 = $("#fdt1").val();
     var fdt2 = $("#fdt2").val();     
     if($("#search").hasClass("inSearch btn1")){
    	 $('#prodWrnoteList').empty();
    	 var listWrnIn = new tui.Grid({
    			el : document.getElementById('prodWrnoteList'),
    			columns : [ {
    				header : '완제품LOT',
    				name : '완제품LOT'
    			}, {
    				header : '제품코드',
    				name : '제품코드'
    			}, {
    				header : '제품명',
    				name : '제품명'
    			}, {
    				header : '입고량',
    				name : '입고량'
    			}, {
    				header : '입고일자',
    				name : '입고일자'
    			}, {
    				header : '유통기한',
    				name : '유통기한'
    			}

    			],
    			rowHeaders : [ 'rowNum' ],
    			pageOptions : {
    				useClient : true,
    				perPage : 10
    			}
    		});
		     $.ajax({
		        url : "searchWrnIn",
		        data : {
		              pnm : pnm,  
		              pcd : pcd,
		              fdt1 : fdt1,
		              fdt2 : fdt2              
		        },
		        dataType: 'JSON',
		        contentType : "application/json; charset=utf-8"
		     }).done(function(result){         
		    	 console.log(result);
		    	 listWrnIn.resetData(result);          
		     });
	 }
     if($("#search").hasClass("outSearch btn1")){
    	 $('#prodWrnoteList').empty();
    	 var listWrnOut = new tui.Grid({
 			el : document.getElementById('prodWrnoteList'),
 			columns : [ {
 				header : '완제품LOT',
 				name : '완제품LOT'
 			}, {
 				header : '제품코드',
 				name : '제품코드'
 			}, {
 				header : '제품명',
 				name : '제품명'
 			}, {
 				header : '출고량',
 				name : '출고량'
 			}, {
 				header : '출고일자',
 				name : '출고일자'
 			}, {
 				header : '유통기한',
 				name : '유통기한'
 			}

 			],
 			rowHeaders : [ 'rowNum' ],
 			pageOptions : {
 				useClient : true,
 				perPage : 10
 			}
 		});
			 $.ajax({
			        url : "searchWrnOut",
			        data : {
			              pnm : pnm,  
			              pcd : pcd,
			              fdt1 : fdt1,
			              fdt2 : fdt2
			        },
			        dataType: 'JSON',
			        contentType : "application/json; charset=utf-8"
			     }).done(function(result){
			    	 console.log(result);
			    	 listWrnOut.resetData(result);          
			     });
     }
  })
  
  /* 출고 검색
  $(".outSearch").on("click", function() {     
     var pnm = $("#pnm").val();
     var pcd = $("#pcd").val();
     var fdt1 = $("#fdt1").val();
     var fdt2 = $("#fdt2").val();     
     $.ajax({
        url : "searchWrnOut",
        data : {
              pnm : pnm,  
              pcd : pcd,
              fdt1 : fdt1,
              fdt2 : fdt2
        },
        dataType: 'JSON',
        contentType : "application/json; charset=utf-8"
     }).done(function(result){         
    	 listWrnOut.resetData(result);          
     });
  })*/
  

 </script>

</html>