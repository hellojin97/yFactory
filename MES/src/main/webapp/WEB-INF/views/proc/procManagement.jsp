<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주관리</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
	<div style="padding-bottom:15px; color: ;">
		<h3>생산 관리</h3>
		<button id="btnProcOrderList" class="btn1">생산지시목록</button>
	</div>
	<div class="min1">
	
	
	<h4>진행생산지시</h4>
	<div id="ordDtpList"></div>
	
	<hr style="border: solid 1px gray;">

	<h4>공정목록</h4>
	<div id="releaseList" style="padding-bottom:15px;"></div>
	<h4>공정상세상황</h4>
	<button id="btnProcStart" class="btn1">생산시작</button>
	<button id="btnProcStop" class="btn1">긴급중지</button>
	<button id="btnProcRestart" class="btn1">재시작</button>
	
	</div>
	<button id="btnProcMoveTable" class="btn1">공정이동표</button>
		
		
	
	
	
	
<div id="procOrderListModalGrid"></div>
<input type="hidden" id="ordTL"> 
<input type="hidden" id="ordNum">
<input type="hidden" id="prodCd">
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>

// 주문 상세 리스트
resultGrid = new tui.Grid({
			el : document.getElementById('ordDtpList'),
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '생산지시상세코드',
				name : '생산지시상세코드',
			}, 
			 {
				header : '생산지시코드',
				name : '생산지시코드',
			},
			 {
				header : '제품명',
				name : '제품명',
			}, {
				header : '제품코드',
				name : '제품코드',
			}, {
				header : '생산수량',
				name : '생산수량',

			}, {
				header : '라인코드',
				name : '라인코드',
			}, 
			],
			rowHeaders : [ 'rowNum' ],
			pageOptions : {
				useClient : true,
				perPage : 5
			}

		});

  var releaseList = new tui.Grid({
    el: document.getElementById('releaseList'),
    columns: [
      {
        header: '진행공정코드',
        name: '진행공정코드'
      },
      {
        header: '공정코드',
        name: '공정코드',
        width: 120

      },
      {
        header: '공정명',
        name: '공정명'
      },
      {
        header: '설비코드',
        name: '설비코드'
      },
      {
          header: '설비명',
          name: '설비명'
        },
        {
            header: '담당자',
            name: '담당자'
          },
      {
          header: '투입량',
          name: '투입량',

        },
        {
            header: '불량량',
            name: '불량량',

          },
          {
              header: '생산량',
              name: '생산량',

            },
            {
                header: '작업시작시간',
                name: '작업시작시간',

              },
              {
                  header: '작업종료시간',
                  name: '작업종료시간',

                },
                {
                    header: '상태',
                    name: '상태',

                  },
    ],
    rowHeaders : [ 'rowNum' ]
    
  });
	
  	//완제품 lot 모달 호출
  /* ordDtpList.on("dblclick", function(e) {
	  let ordtl = ordDtpList.getValue(e.rowKey,"주문상세코드");
	  let ordNum = ordDtpList.getValue(e.rowKey, "주문수량");
	  let prodCd = ordDtpList.getValue(e.rowKey, "완제품코드");
	  $("#ordTL").val(ordtl);
	  $("#ordNum").val(ordNum);
	  $("#prodCd").val(prodCd);
	  
  	$("#test").load("releaseModal", function() {
			const ProdModal = new bootstrap.Modal('#myModal');
			ProdModal.show();
			}); 
  });	 */
  
  	//초기화 버튼


      $("#btnProcOrderList").on("click", function(){
    	  	$("#procOrderListModalGrid").load("procOrderListModal", function() {
    			const ProcOrderListModal = new bootstrap.Modal('#ProcOrderListModal');
    			ProcOrderListModal.show();
    			}); 
      });
  		
  	  $("#btnProcStart").on("click",function(){
  		
  		//var curDate = new Date();
  		//let startTime = curDate.getHours() + ":" + curDate.getMinutes() + ":" + curDate.getSeconds();
		  		
  		let insQty = resultGrid.getValue(0,"생산수량");
  		//공정행 갯수
  		let procRow = releaseList.getRowCount();
  		for (var i = 0; i < procRow; i++) {
  	  		releaseList.setValue(i,"투입량",insQty);
		}
	  		releaseList.setValue(0,"시작시간",dpTime());
  		
  		//console.log(insQty);
  		//console.log(procRow);
  		 var data= {
  				insQty : insQty,
  				procRow : procRow,
  				startTime : dpTime()
  				 };
  			
  			console.log(insQty);
	    $.ajax({
			   url  : "procLogic",
			   data :  JSON.stringify(data), 
			   dataType : "JSON",
			   type : "POST",
			   contentType : "application/json; charset = UTF-8;"
		   }).done(function(result){
					 /* for (var i = 0; i < result.length; i++) {
						 procOrder.appendRow(result[i]);
					} */ 
					console.log(result);
					//releaseList.setValue(0,"생산량",result.sum)
		   }) 
		/*    timer = setInterval( function () {
  		}, 1000); */
  	  });
  	  
  	  
	//시간계산
  	    function dpTime(){
  	       var now = new Date();
  	        hours = now.getHours();
  	        minutes = now.getMinutes();
  	        seconds = now.getSeconds();
  	 

  	        if (hours < 10){
  	            hours = "0" + hours;
  	        }
  	        if (minutes < 10){
  	            minutes = "0" + minutes;
  	        }
  	        if (seconds < 10){
  	            seconds = "0" + seconds;
  	        }
  	        return startTime = hours + ':' + minutes + ':' + seconds;
	}
  
</script>

</html>