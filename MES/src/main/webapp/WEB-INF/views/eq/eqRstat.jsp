<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>설비 실시간 상태</h1>
		<div id="in/out"></div>
		<div style="background-color: #e0e0e0; padding: 8px;">
		<div class="mainTitle" style="padding-bottom: 15px; color:;">
			<h4>설비 실시간 온도</h4>
			<hr style="border: solid 1px gray;">
		</div>
		<div id="chart-area" align="center"></div>
		
		<hr style="border: solid 2px gray;" />
		<h4>설비 실시간 생산량</h4>
		<div id="chart-UphArea" align="center">
		 <jsp:include page="uph.jsp" flush="false"/>
		</div>
	</div>
	
<script>	
	$(function(){
		
		var minTemOne; // 첫번쨰 설비 최소온도
		var maxTemOne;// 첫번쨰 설비 최대온도
		var minTemTwo;// 두번쨰 설비 최소온도
		var maxTemTwo;// 두번쨰 설비 최대온도
		var minTemThre;// 세번쨰 설비 최소온도
		var maxTemThre;// 세번쨰 설비 최대온도
		/* var minTemFour; // 네번쨰 설비 최소온도
		var maxTemFour;  // 네번쨰 설비 최대온도 */
		
		
	    function getTime(){ // 현재시간 데이터 가져오기
	    	  var now = new Date();
	    	  var hours = now.getHours();
	    	  var minutes = now.getMinutes();
	    	  var seconds = now.getSeconds();
	    	  
	    	  return hours+':'+minutes+':'+seconds;
	    	  
	      };

		const el = document.getElementById('chart-area');
	      const data = {
	        categories: ['0','0','0','0','0','0','0','0','0','0','0','0','0','0'],
	        series: [
	         /*  {
	            name: 'A',
	          	data: [0,0,0,0,0],
	          
	          },
	          {
	            name: 'B',
	        	data: [0,0,0,0,0],
	          
	           
	        },
	        {
		            name: 'C',
		        	data: [0,0,0,0,0],
		          
		           
		    }, */
	        ],
	      };
	      const options = {
	        chart: { title: 'RealTime Temperature', width: 1000, height: 300 },
	        xAxis: {
	          title: 'CurrentTime',
	       
	        },
	        yAxis: {
	          title: 'Temperature',
	          scale: {
	              min: -30,
	              max: 200,
	              stepSize: 20,
	            },
	        },
	        
	        legend: {
	          align: 'top',
	        },
	        series: { 
	        	shift: true,
	        	spline:true,
	        	
	        },
	  
	      };

	      $.ajax({
	    	  url : "getEqTemp",
	    	  method:"GET",
	    	  contentType:"application/json; charset=utf-8"
	      }).done(function(res){
	    	  //console.log(res);
	    	for (var i = 0; i < res.length; i++) {
				//console.log(res[i].설비코드);
				minTemOne = res[0].최소온도;
				maxTemOne = res[0].최대온도;
				minTemTwo = res[1].최소온도;
				maxTemTwo = res[1].최대온도;
				minTemThre = res[2].최소온도;
				maxTemThre = res[2].최대온도;
				/* minTemFour = res[3].최소온도;
				maxTemFour = res[3].최대온도; */
				chart.addSeries(
						  {
						    name: res[i].설비코드,
							data: [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  },
						  { chartType: 'line' }
						);
			/* 	console.log(res[0].최소온도);
				console.log(res[0].최고온도);
				console.log(res[1].최소온도);
				console.log(res[1].최고온도);
				console.log(res[2].최소온도);
				console.log(res[2].최고온도); */
				
			}
	      })
	  
	      
	      const chart = toastui.Chart.lineChart({ el, data, options });

	      let index = 1;
	    	var intervalId = setInterval(() => {
	    		if(minTemOne <= -1){ // 음수일경우
	    			var firstData = Math.floor( ( Math.random() * (maxTemOne + ( minTemOne ) ) ) + minTemOne);
	    		}else if (minTemOne >= 0){
	    			var firstData = Math.floor( ( Math.random() * (maxTemOne - ( minTemOne ) ) ) + minTemOne);		
	    		}
	        	if(minTemTwo <= -1){ //음수일경우
	        		var secData = Math.floor((Math.random() * (maxTemTwo + ( minTemTwo ) ) ) + minTemTwo);	
	        	}else if(minTemTwo >= 0){
	        		var secData = Math.floor((Math.random() * (maxTemTwo - ( minTemTwo ) ) ) + minTemTwo);
	        	}
	        	if(minTemThre <=-1){ // 음수일경우
	        		var thirdData = Math.floor((Math.random() * (maxTemThre + ( minTemThre ) ) ) + minTemThre);
	        	}else if(minTemThre >=0){
	        		var thirdData = Math.floor((Math.random() * (maxTemThre - ( minTemThre ) ) ) + minTemThre); 		
	        	}
	        	/* if(minTemFour <=-1){ // 음수일경우
	        		var fourthData = Math.floor((Math.random() * (maxTemFour + ( minTemFour ) ) ) + minTemFour);
	        	}else if(minTemFour >=0){
	        		var fourthData = Math.floor((Math.random() * (maxTemFour - ( minTemFour ) ) ) + minTemFour);
	        	} */
	       
	    //	var fourthData = Math.floor((Math.random() * (maxTemFour - ( minTemFour ) ) ) + minTemFour);
	        chart.addData([firstData, secData ,thirdData], getTime()); // 각 데이터의 Y값(온도)을 업데이트 , 하단X값의 업데이트 되는 항목들
	       
	        index += 1;
	       //console.log(index);
	        /* if (index === 100) {
	          clearInterval(intervalId);
	        } */
	      }, 1500); 
	     
	     
	     //---------------▲실시간 설비 온도▲----------------//
	     
	   

   //    $.ajax({
    //	  url : "get",
    	//  method : "POST",
    	  //data : ,
    	  // dataType : "JSON",
    	  //contentType : "application/json; charset=utf-8"
      //}).done(function(rs){
    	  
      //});
  
      
	});
	</script>
	
</body>
</html>