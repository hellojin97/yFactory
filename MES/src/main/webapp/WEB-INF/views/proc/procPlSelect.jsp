<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="mainTitle" style="padding-bottom: 15px; color:;">
		<h1>생산계획조회</h1>
	</div>

	<fieldset class="col-md-5" style="padding-bottom: 10px;">
		<div class="input-group">
			<p style="padding-right: 30px;">진행구분</p>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="radios" id="radioA"
					value="전체" checked> <label class="form-check-label"
					for="gridRadios1" style="padding-right: 10px;"> 전체 </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="radios" id="radioB"
					value="진행"> <label class="form-check-label"
					for="gridRadios2" style="padding-right: 10px;"> 진행 </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="radios" id="radioC"
					value="완료"> <label class="form-check-label"
					for="gridRadios3" style="padding-right: 10px;"> 완료 </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="radios" id="radioD"
					value="취소"> <label class="form-check-label"
					for="gridRadios3" style="padding-right: 10px;"> 취소 </label>
			</div>
		</div>
	</fieldset>
	<!-- 생산계획명 -->
	<div id="PNM">
		<div class="col-md-3 " style="padding-bottom: 10px;">
			<div class="input-group  " style="padding-bottom: 10px;">
				<label for="inputText" class="col-form-label">제품명</label> <input
					type="text" id="PrdNm" class="form-control" placeholder="생산계획명"
					style="left: 65px; width: 100px">
			</div>
		</div>
	</div>
	<!-- 생산 계획 일자 -->
	<div class="input-group" style="padding-bottom: 15px">
		<label for="inputText" class="col-form-label"
			style="padding-right: 40px;">생성 계획 일자</label>
		<div style="padding-right: 10px;">
			<input type="date" class="form-control" id="dateA">
		</div>
		<label for="inputText" class="col-form-label"
			style="padding-right: 10px;">~</label>

		<div style="padding-right: 10px;">
			<input type="date" class="form-control" id="dateB">
		</div>
		<button id="dateSearch" class="btn1">검색</button>
		<button id="dateClear" class="btn1">초기화</button>
	




</div>
	<div id="procGrid"></div>
	<div id="testGrid"></div>

	<script>
	 /* document.getElementById('dateA').value = new Date().toISOString().substring(0, 10);
	 document.getElementById('dateB').value = new Date().toISOString().substring(0, 10); 
 */	// * 자식그리드에서 부모그리드를 사용하려면 전역변수로 지정되어있어야한다 *
	var resultGrid
	$(function(){
	resultGrid = new tui.Grid({
		el : document.getElementById('testGrid'),
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '생산계획코드',
			name : '생산계획코드',
			className : 'fontClass',
		}, {
			header : '계획명',
			name : '계획명',
			className : 'fontClass',
		}, {
			header : '생산계획상세코드',
			name : '생산계획상세코드',
			className : 'fontClass',
		}, {
			header : '제품명',
			name : '완제품명',
			className : 'fontClass',

		}, {
			header : '계획량',
			name : '계획량',
			className : 'fontClass',
		}, {
			header : '작업우선순위',
			name : '작업우선순위',
			className : 'fontClass',
		},
		 {
			header : '생산일수',
			name : '생산일수',
			className : 'fontClass',
		},
		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 5
		}

	});


	 //생산계획코드를 클릭했을시 ajax
	$("#dateSearch").click(function () {
		//$("input[name='radios']:radio").change(function () {
		//debugger
		 let prdNm = $("#PrdNm").val();
		 let date1 = $("#dateA").val();
		 let date2 = $("#dateB").val();
		 let state = $("input[name=radios]:checked").val();
		// console.log(prdNm +' ');
		 //console.log('제품명' +prdNm + 'startdate :' + date1 + 'enddate :' + date2 + 'state :' + state);
		 if(prdNm != null){
		 
			 var data= {
					 prdNm : prdNm,
					   date1 : date1,
					   date2 : date2,
					   state : state
			 }
		 
			  $.ajax({
					   url  : "procPlanSelectState",
					   data : JSON.stringify(data),
					   type : "POST",
				   dataType : "JSON",
	     		   contentType : "application/json; charset = UTF-8;"
				   }).done(function(result){
					   console.log(result);
					   resultGrid.resetData(result);
/*
						for (var i = 0; i < result.length; i++) {
							
						} */
			
				   })
		}  
		});

	 });
	
	 $("#PrdNm").click(function () {
			$("#procGrid").load("procplselectmodal", function() {

				const ProcPlModal = new bootstrap.Modal('#myModal');
				ProcPlModal.show();
	 });
	$("#dateClear").click(function() {
	 
		 $('#PrdNm').val('');
		 resultGrid.clear();
	 });
	
	
	
		

	});
	
	</script>

</body>

</html>