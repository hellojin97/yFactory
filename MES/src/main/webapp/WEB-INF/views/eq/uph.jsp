<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPH PAGE</title>
</head>
<body>



<script>
$(function(){
    function getTime(){ // 현재시간 데이터 가져오기
    	  var now = new Date();
    	  var hours = now.getHours();
    	  var minutes = now.getMinutes();
    	  var seconds = now.getSeconds();
    	  
    	  return hours+':'+minutes+':'+seconds;
    	  
      };
	
     /*  function firstTemp(){  	
    	  return setInterval( (Math.floor(Math.random() * (110-30) )+30) , 2000);	};
      function secTemp(){
    	  return setInterval( (Math.floor( Math.random() * (110-40) )+40) , 2000); }; */
    	  
	const el = document.getElementById('chart-UphArea');
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
        chart: { title: 'RealTime PRODUCTION', width: 1000, height: 300 },
       
        xAxis: {
          title: 'CurrentTime',
       
        },
        yAxis: {
          title: 'Production Volume',
          scale: {
              min: 3,
              max: 20,
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
        const firstData = Math.floor(Math.random() * (20-3) )+3;
        //console.log("firstData:"+firstData);
        
        const secData = Math.round(Math.random() * (20-3))+3;
        //console.log("secData:"+secData);
       
        chart.addData([firstData, secData], getTime()); // 각 데이터의 Y값(온도)을 업데이트 , 하단X값의 업데이트 되는 항목들
       
        index += 1;
       
        if (index === 50) {
          clearInterval(intervalId);
        }
      }, 1500); 

});
</script>


</body>
</html>