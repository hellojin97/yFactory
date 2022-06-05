<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>

   .mouseOver {
      cursor:pointer;
      
   } 
   .blue {
   	background: #F7F8E0 ;
   }
</style>


<div class="procLineTitle">
	<h1>제품 공정 흐름도</h1>
</div>
<div class="min1">
	<div class="LineA">
		<div class="procLineInfo" style="margin-top: 2em; margin-bottom: 2em;">
			<h3>제품 라인정보</h3>
			<hr>
			<div id="procLine"></div>
		</div>
	</div>
	<div class="LineB">
		<div class="procLineEditor" >
			<h3>제품 라인정보 관리</h3>
			<hr style="margin-top: auto;">
			<button type="button" class="btn1" style="float: right; margin-bottom: 1em;">변경정보 수정</button>
			<button type="button" class="btn1" style="float: right;">행삭제</button>
			<button type="button" class="btn1" style="float: right;">행추가</button>
		</div>
			<div id="procLineEditor" ></div>
			<hr>
	</div>
</div>
<script>
/* ====================================== 제품 라인정보 그리드 ====================================== */
procLine = new tui.Grid({
		el : document.getElementById('procLine'),
		scrollX : false,
		bodyHeight : 250,
		columns : [ {
			header : '제품코드',
			name : '제품코드',
			className : 'fontClass'
		}, {
			header : '제품명',
			name : '제품명',
			className : 'fontClass'

		}, {
			header : '라인코드',
			name : '라인코드',
			className : 'fontClass'
		}	],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			type: 'scroll',
			perPage : 5
		}

	});
/* ====================================== 제품 라인정보 ====================================== */
/* ====================================== 라인정보 수정 그리드 ====================================== */
procLineEdit = new tui.Grid({
		el : document.getElementById('procLineEditor'),
		scrollX : false,
		bodyHeight : 300,
		columns : [ {
			header : '공정코드',
			name : '공정코드',
			className : 'fontClass'
		}, {
			header : '공정명',
			name : '공정명',
			className : 'fontClass'

		}, {
			header : '설비코드',
			name : '설비코드',
			className : 'fontClass'
		},{
			header : '설비명',
			name : '설비명',
			className : 'blue fontClass',
		}	],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			type: 'scroll',
			perPage : 5
		}

	});
/* ====================================== 라인정보 수정 ====================================== */
 
/* ====================================== Window.onload ====================================== */ 
 
 window.onload = function(){
	$.ajax({	// 라인정보 Ajax
		url : 'procLineAjax',
		dataType : 'JSON',
		method : 'GET'
	}) // end of $.ajax
	.done(function(LineData){
		
		for (var i = 0; i < LineData.length; i++) {
			procLine.appendRow(LineData[i]); // 라인정보 최신화
		} // end of for
		
	}) // end of done
	.fail(function(error){
		console.log(error);
	}); // end of fail
	
/* ====================================== Mouseover Event ====================================== */
	procLine.on('mouseover', function(e){
		   orgin: 'cell';
		   var cn = e.columnName;
		   var tt = e.targetType;
		      if(cn == '라인코드' && tt == 'cell' ){         
		         $('#procLine').attr("class", "mouseOver");
		      }else{
		         $('#procLine').removeClass();               
		      }
		}); 
/* ====================================== End Line ====================================== */
	procLine.on('dblclick',function(e){
		var lineCd = procLine.getValue(e.rowKey,'라인코드');
		
		$.ajax({
			url : 'procLineEdit',
			data : {"lineCd" : lineCd},
			method : 'GET',
			dataType : 'JSON'
		}) // end of ajax
		.done(function(procData){

					procLineEdit.resetData(procData);
				
			
		}) // end of done
		.fail(function(err){
			console.log(err);
		}) // end of fail
		
	}) // end of procLine DblClick
	
	
} // end of window.onload
</script>