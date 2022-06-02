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
			<h4>설비 상태</h4>
			<hr style="border: solid 1px gray;">
		</div>
		<div id="chart-area" align="center"></div>
		
		<hr style="border: solid 2px gray;" />
		
		<div id="chart-UphArea" align="center">
		 <jsp:include page="uph.jsp" flush="false"/>
		</div>
	</div>
	
<script>	
	$(function(){
	    function getTime(){ // 현재시간 데이터 가져오기
	    	  var now = new Date();
	    	  var hours = now.getHours();
	    	  var minutes = now.getMinutes();
	    	  var seconds = now.getSeconds();
	    	  
	    	  return hours+':'+minutes+':'+seconds;
	    	  
	      };
		
	    /*   function firstTemp(){  	
	    	  return setInterval( (Math.floor(Math.random() * (110-30) )+30) , 2000);	};
	      function secTemp(){
	    	  return setInterval( (Math.floor( Math.random() * (110-40) )+40) , 2000); };
	    	   */
		const el = document.getElementById('chart-area');
	      const data = {
	        categories: ['0','0','0','0','0','0','0','0','0','0'],
	        series: [
	          {
	            name: 'A',
	          	data: [0,0,0,0,0,0,0,0,0,0],
	          
	          },
	          {
	            name: 'B',
	        	data: [0,0,0,0,0,0,0,0,0,0],
	          
	           
	          },
	        
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
	              min: 88,
	              max: 98,
	              stepSize: 3,
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

	      
	  
	      
	      const chart = toastui.Chart.lineChart({ el, data, options });

	      let index = 1;
	     const intervalId = setInterval(() => {
	        const firstData = Math.floor(Math.random() * 100 );
	        
	        if(firstData == 0){
	        	firstData + 80;
	        }
	        console.log("firstData:"+firstData);
	        //const secData = Math.round(Math.random() * 100);
	        const secData = Math.floor(Math.random() * 100);
	        if(secData == 0){
	        	secData + 90;
	        }
	        console.log("secData:"+secData);
	       
	        chart.addData([firstData, secData], getTime()); // 각 데이터의 Y값(온도)을 업데이트 , 하단X값의 업데이트 되는 항목들
	       
	        index += 1;
	       
	        if (index === 50) {
	          clearInterval(intervalId);
	        }
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