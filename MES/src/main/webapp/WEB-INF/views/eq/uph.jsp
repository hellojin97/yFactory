<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEMPERATURE / UPH CHART PAGE</title>
<style>


</style>


</head>
<body>




<script>

$(function(){
	// 공정 하나하나 지정할 전역변수 정의
	var uphOne;
	var uphTwo;
	var uphThre;
	var uphFour;
	var uphLineCd;
	
	
	
    function getTime(){ // 현재시간 데이터 가져오기
    	  var now = new Date();
    	  var hours = now.getHours();
    	  var minutes = now.getMinutes();
    	  var seconds = now.getSeconds();
    	  
    	  return hours+':'+minutes+':'+seconds;
    	  
      };
	
  
    	  
	const el = document.getElementById('chart-UphArea');
      const data = {
        categories: ['0','0','0','0','0','0','0','0','0','0'],
        series: [
        	
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
              min: 0,
              max: 500,
              stepSize: 100,
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

       // step  :  input 에서 출력할 라인을 가져온다 > 가져온 라인cd를 가지고 ajax처리를 한다 > 변수에 담아서 또는 배열로 담아서 addData 또는 addSeries 한다
       
     var resArr = [];
      
      var chart2 = toastui.Chart.lineChart({ el, data, options });
      uphLineCd =  $("input[name='chk_line2']:checked").val();
      $("input[name='chk_line2']").on("click", function(e){
		  resArr=[];
		  uphLineCd =  $("input[name='chk_line2']:checked").val();
		
      $.ajax({
    	  url : "getEqUph",
    	  data : {lineCd : uphLineCd},
    	  method:"GET",
    	  contentType:"application/json; charset=utf-8",
    	  error : function(){
    		  toastr.error('-');
    	  }
      }).done(function(res){
    	  
    	  chart2.destroy();
		  chart2 = toastui.Chart.lineChart({ el, data, options });
    	  
    	  for (var i = 0; i < res.length; i++) {
			resArr.push(res[i].설비코드);			
		}
    	  for(var i = 0; i < resArr.length; i++){
    		  chart2.addSeries(
    				  {
    				    name: resArr[i],
    					data: [0,0,0,0,0,0,0,0,0,0],
    				  },
    				  { chartType: 'line' }
    				);    		  
    	  }
      
      });
      });
      let index = 1;
      //$(".line-control").on("click" , function(ev){ // 라인클릭시 ajax후 인터벌 메서드를 호출하여 값을 뿌려본다
     const intervalId = setInterval(() => {
      //uphLineCd =  $("input[name='chk_line2']:checked").val();
      
      
	    $.ajax({
	    	  url : "getEqUph",
	    	  data : {lineCd : uphLineCd},
	    	  method:"GET",
	    	  contentType:"application/json; charset=utf-8",
	    	  error : function(){
	    		  toastr.error('라인이 비가동중이에요!');
	    	  }
	      }).done(function(res){
	    	  console.log(res);
	    	 	
				//console.log(res[i].설비코드);
				uphOne = res[0].합격량;
				
				uphTwo = res[1].합격량;
				
				uphThre = res[2].합격량;

				uphFour = res[3].합격량;
				
				console.log(uphOne);
				console.log(uphTwo);
				chart2.addData([uphOne, uphTwo , uphThre ,uphFour], getTime()); 
			 
	      })
	    
	    // [] 은 각 데이터의 Y값(온도)을 업데이트 , getTime()은 하단X값의 업데이트 되는 항목들
     
       
        index += 1;
       
       /*  if (index === 100) {
          clearInterval(intervalId);
        } */
      }, 1500);
     
     
      //});// END OF 
});
</script>


</body>
</html>