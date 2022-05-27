<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mainTitle" style="padding-bottom: 15px;">
		<h1>품질검사관리</h1>
	</div>

	<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">

			<!-- grid 테이블 출력 div -->
			<div id="qaRequestMgr"></div>
			<div id="err"></div>

			<div class="col-md-5" style="padding-bottom: 10px;">
				<div class="input-group">
					<div style="padding-right: 10px;">
						<button type="button" id="update" class="btn1" onclick="update">완료</button>							
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

	<script>
	
	$.ajax({
		url : "selectMtCheckMgr",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			defaultMt.resetData(result);
		}
	});

	const defaultMt = new tui.Grid({
		el : document.getElementById('qaRequestMgr'),
		columns : [ {
			header: '발주코드',
			name: '발주코드'
		}, {
			header: '발주상세코드',
			name: '발주상세코드'
		}, {
			header: '품질검사코드',
			name: '품질검사코드'
		},{
			header: '자재코드',
			name: '자재코드'
		}, {
			header: '자재명',
			name: '자재명'
		}, {
			header: '담당인',
			name: '담당인'
		}, {
			header: '발주량',
			name: '발주량'
		}, {
			header: '합격량',
			name: '합격량',
			editor : "text"
		}, {
			header: '불량량',
			name: '불량량'
		}, {
			header: '불량코드',
			name: '불량코드'
		}, {
			header: '불량명',
			name: '불량명'
		}, {
			header: '상태',
			name: '상태'
		} ],
		rowHeaders : [ 'checkbox' ],
		pageOptions : {
			useClient : true,
			perPage : 10
		}
	});
	defaultMt.on("click", function(e) {
		let erqt = defaultMt.getValue(e.rowKey, '불량량');
		// 불량량이 0일 경우 모달창을 띄우지 않는다.
		if( erqt != 0 ) {
		let err = defaultMt.getFocusedCell('불량코드');
		//console.log(err);
			if(err.columnName == '불량코드') {
				if(err.value == null) {
					$("#err").load("errModal", function() {
						const errModal = new bootstrap.Modal("#errModal");
						errModal.show();
					})
				}
			}
		} else {
			alert("불량량이 없습니다");
		}
	})

  defaultMt.on('afterChange', (ev) => {
    orgin: 'cell'; 
    let evn = ev.changes;
    let a = defaultMt.getValue(evn[0].rowKey, '발주량');
    let b = defaultMt.getValue(evn[0].rowKey, '합격량');
    let sum = a - b;
    defaultMt.setValue(evn[0].rowKey, '불량량', sum);
  });
	
	//완료 버튼 클릭시 실행
	update.addEventListener("click", function() {
		let checkedAry = [];
		let art = [];
		let checkList = defaultMt.getCheckedRows();
		for (var i = 0; i < checkList.length; i++) {
			checkedAry.push(checkList[i]);
		}
		console.log(checkedAry);
		var podtlcd = checkedAry[0].발주상세코드;
		var mtnm = checkedAry[0].자재명;
		var passqty = checkedAry[0].합격량;
		var errqty = checkedAry[0].불량량;
		var errcd = checkedAry[0].불량코드;
		
		$.ajax({
			url:"resMtQuality",
			method:"GET",
			data : {
				podtlcd : podtlcd,
				mtnm : mtnm,
				passqty : passqty,
				errqty : errqty,
				errcd : errcd
			},
			dataType : "JSON",
			contentType : "application/json; charset=utf-8"
		}).done(function(result) {
			alert("품질검사가 완료되었습니다.");
			defaultMt.removeCheckedRows(false);
		}).fail(function() {
			alert("품질검사 중 오류가 발생하엿습니다.");
		})
	})
	</script>
</body>
</html>