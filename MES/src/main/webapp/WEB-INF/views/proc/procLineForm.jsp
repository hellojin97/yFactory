<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>

</style>


<div class="procLineTitle">
	<h1>제품 공정 흐름도</h1>
</div>
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
<script>
/* ====================================== 제품 라인정보 그리드 ====================================== */
procLine = new tui.Grid({
		el : document.getElementById('procLine'),
		scrollX : false,
		bodyHeight : 250,
		columns : [ {
			header : '제품코드',
			name : '제품코드',
		}, {
			header : '제품명',
			name : '제품명',

		}, {
			header : '라인코드',
			name : '라인코드',
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
		}, {
			header : '공정명',
			name : '공정명',

		}, {
			header : '설비코드',
			name : '설비코드',
		},{
			header : '설비명',
			name : '설비명'
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
	
} // end of window.onload
</script>