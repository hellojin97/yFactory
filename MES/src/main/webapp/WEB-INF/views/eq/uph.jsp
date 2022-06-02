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
	var uphOne;
	var uphTwo;
	var uphThre;
	//var uphFour;
	
	
	
	
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
        categories: ['0','0','0','0','0','0','0','0','0','0','0','0','0','0'],
        series: [
        /*   {
            name: 'A',
          	data: [0],
          
          },
          {
            name: 'B',
        	data: [0],
          
           
          }, */
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
              max: 10,
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

      
      $.ajax({
    	  url : "getEqTemp",
    	  method:"GET",
    	  contentType:"application/json; charset=utf-8"
      }).done(function(res){
    	  //console.log(res);
    	for (var i = 0; i < res.length; i++) {
			//console.log(res[i].설비코드);
			uphOne = res[0].초당생산량;
			
			uphTwo = res[1].초당생산량;
			
			uphThre = res[2].초당생산량;
		
			/* 
			uphFour = res[3].초당생산량; */
			chart.addSeries(
					  {
					    name: res[i].설비코드,
						data: [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					  },
					  { chartType: 'line' }
					);
		
			
		}
      })
      
      const chart = toastui.Chart.lineChart({ el, data, options });

      let index = 1;
     const intervalId = setInterval(() => {
    	 // DB에서 생산되는 누적 수량만 가져와야합니다
    	 var firstData = Math.round(   Math.random() * (uphOne / 3600)  );
	     var secData = Math.round(    Math.random() * (uphTwo / 3600)   );
	     var thirdData = Math.round(  Math.random() * (uphThre / 3600)  );
	    //	var fourthData = Math.floor((Math.random() * (uphFour - 10)) + 10);
       
	    if(firstData == 0){
	    	firstData = 3;
	    }
	    if(secData == 0){
	    	secData = 3;
	    }
	    if(thirdData == 0){
	    	thirdData = 3;
	    }
	    
	    
	    
        chart.addData([firstData, secData , thirdData], getTime()); // 각 데이터의 Y값(온도)을 업데이트 , 하단X값의 업데이트 되는 항목들
       
        index += 1;
       
       /*  if (index === 100) {
          clearInterval(intervalId);
        } */
      }, 1500); 

});
</script>


</body>
</html>