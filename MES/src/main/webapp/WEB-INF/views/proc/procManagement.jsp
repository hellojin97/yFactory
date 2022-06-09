<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주관리</title>


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

<script>

// 주문 상세 리스트
resultGrid = new tui.Grid({
			el : document.getElementById('ordDtpList'),
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '생산지시상세코드',
				name : '생산지시상세코드',
				className : 'fontClass',
			}, 
			 {
				header : '생산지시코드',
				name : '생산지시코드',
				className : 'fontClass',
			},
			 {
				header : '제품명',
				name : '제품명',
				className : 'fontClass',
			}, {
				header : '제품코드',
				name : '제품코드',
				className : 'fontClass',
			}, {
				header : '생산수량',
				name : '생산수량',
				className : 'fontClass',

			}, {
				header : '라인코드',
				name : '라인코드',
				className : 'fontClass',
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
        name: '진행공정코드',
        className : 'fontClass',
      },
      {
        header: '순번',
        name: '순번',
        className : 'fontClass',
        width: 20
      },
      {
        header: '공정코드',
        name: '공정코드',
        className : 'fontClass',
        width: 120

      },
      {
        header: '공정명',
        name: '공정명',
        className : 'fontClass',
      },
      {
        header: '설비코드',
        name: '설비코드',
        className : 'fontClass',
      },
      {
          header: '설비명',
          name: '설비명',
          className : 'fontClass',
        },
        {
            header: '담당자',
            name: '담당자',
            className : 'fontClass',
          },
      {
          header: '투입량',
          name: '투입량',
          className : 'fontClass',

        },

          {
              header: '합격량',
              name: '합격량',
              className : 'fontClass',

            },
            {
                header: '불량량',
                name: '불량량',
                className : 'fontClass',

              },
          {
              header: '생산량',
              name: '생산량',
              className : 'fontClass',

            },
            {
                header: '작업시작시간',
                name: '작업시작시간',
                className : 'fontClass',

              },
              {
                  header: '작업종료시간',
                  name: '작업종료시간',
                  className : 'fontClass',

                },
                {
                    header: '상태',
                    name: '상태',
                    className : 'fontClass',

                  },
    ],
    rowHeaders : [ 'rowNum' ]
    
  });
	

  
  	//초기화 버튼


      $("#btnProcOrderList").on("click", function(){
    	  	$("#procOrderListModalGrid").load("procOrderListModal", function() {
    			const ProcOrderListModal = new bootstrap.Modal('#ProcOrderListModal');
    			ProcOrderListModal.show();
    			}); 
      });
  		
  	  $("#btnProcStart").on("click",function(){
  		let lineTurn = releaseList.getValue(0,"순번");
  		let procPrcd = releaseList.getValue(0,"진행공정코드");
  		let num = releaseList.getRowCount();
  		let state = releaseList.getValue(num-1, "상태");
  		let line  = resultGrid.getValue(0, "라인코드");
  		 var data= {
   				lineTurn : lineTurn,
   				procPrcd : procPrcd
   				 };
  		$.ajax({
			   url  : "procStartLogic",
			   data :  JSON.stringify(data), 
			   dataType : "JSON",
			   type : "POST",
			   contentType : "application/json; charset = UTF-8;"
		   }).done(function(result){
		   }) 

  		
  		 
  		var interval = setInterval(function() {
  		  if (state != '완료') {
  			$.ajax({
				   url  : "procOrderLineSelectOne",
				   data : {line : line},
				   dataType : "JSON",
				   contentType : "application/json; charset = UTF-8;"
			   }).done(function(result){
				   		releaseList.resetData(result);

			   })
  		    
  			  
  			  
  			state = releaseList.getValue(num-1, "상태");
  		  } else {
  		    console.log("stopped")
  		    clearInterval(interval) 
  		    // 밖에서 선언한 interval을 안에서 중지시킬 수 있음
  		  }
  		}, 500)
  		

	    
  		
  	  }); 
  	$("#btnProcStop").on("click",function(){
  		let idx = releaseList.getRowCount();
  		let eqArr = [];
  		var data = {};
  		for (var i = 0; i < idx; i++) {
  				  if(releaseList.getValue(i, '작업종료시간') == null && releaseList.getValue(i, '상태') == '진행'){	
		  		  data= {
		  				eqCd : releaseList.getRow(i).설비코드,
		  				procPrcd : releaseList.getRow(i).진행공정코드,
		  				lineTurn : releaseList.getRow(i).순번
	   				 };
		  		eqArr.push(data);	
  				  }
		}

   		$.ajax({
			   url  : "procStopLogic",
			   data :  JSON.stringify(eqArr), 
			   dataType : "JSON",
			   type : "POST",
			   contentType : "application/json; charset = UTF-8;"
		   }).done(function(result){
		   })  
		   
	});
  	$("#btnProcRestart").on("click",function(){
  		let idx = releaseList.getRowCount();
  		let eqArr = [];
  		var data = {};
  		for (var i = 0; i < idx; i++) {
  				  if(releaseList.getValue(i, '작업종료시간') == null && releaseList.getValue(i, '상태') == '긴급정지'){	
		  		  data= {
		  				eqCd : releaseList.getRow(i).설비코드,
		  				procPrcd : releaseList.getRow(i).진행공정코드,
		  				lineTurn : releaseList.getRow(i).순번
	   				 };
		  		eqArr.push(data);	
  				  }
		}

   		$.ajax({
			   url  : "procRestartLogic",
			   data :  JSON.stringify(eqArr), 
			   dataType : "JSON",
			   type : "POST",
			   contentType : "application/json; charset = UTF-8;"
		   }).done(function(result){
		   })  
		   
	});
  	/* ===============자동 옵션 ================ */
  	setInterval(function(){ // set interval
  	var grid_data = resultGrid.getData(); 
  	if(grid_data != null){	// start of Auto
  		let lineTurn = releaseList.getValue(0,"순번");
  		let procPrcd = releaseList.getValue(0,"진행공정코드");
  		let num = releaseList.getRowCount();
  		let state = releaseList.getValue(num-1, "상태");
  		let line  = resultGrid.getValue(0, "라인코드");
  		 
  		var interval = setInterval(function() {
  		  if (state != '완료') {
  			$.ajax({
				   url  : "procOrderLineSelectOne",
				   data : {line : line},
				   dataType : "JSON",
				   contentType : "application/json; charset = UTF-8;"
			   }).done(function(result){
				   		releaseList.resetData(result);

			   })
  		    
  			  
  			  
  			state = releaseList.getValue(num-1, "상태");
  		  } else {
  		    console.log("stopped")
  		    clearInterval(interval) 
  		    // 밖에서 선언한 interval을 안에서 중지시킬 수 있음
  		  }
  		}, 5000)
  		

	    
  	}	// end of Auto
  	},5000);
  	
  	
  	$('#btnProcMoveTable').on('click', function(){
  		let line  = resultGrid.getValue(0, "라인코드");
  		let procPrcd = releaseList.getValue(0,"진행공정코드");
  		window.open('procMoveDialog?line_cd=' + line+ '&proc_prcd=' + procPrcd, '공정이동표.PDF', 'width=1500, height=1500');
  	})
  	
  	
</script>

</html>