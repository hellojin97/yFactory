<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 추가 CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></link>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<style>
.line-control{
margin:25px;
padding:15px 20px;
background-color:#555555;
color:white;
border-radius: 8px;
}
.line-control:hover{

background-color:white;
color:#555555;

}

label{
font-weight : bold;
}

input:checked + label {
  color: red;
}
/* button{
	margin:25px;
	padding:15px 20px;
	background-color:#555555;
	color:white;
	border-radius: 8px;
 } */
button {     
	color: black;
    text-align: center;
    border: solid 1px #2c3e50;
    margin: 3px;
    line-height: 25px;
    padding: 0px 15px 0px 15px;
    border-radius: 5px 5px 0px 0px;
		  }
button:hover {
	color: black;
	background-color: white;
}


</style>


</head>
<body>
		
		<div style="padding-bottom: 70px; ">
		<div class="mainTitle" style="padding-bottom:15px;">
			<h1>설비 실시간 상태</h1>
		</div>
		<div class="min2">
			<button type="button" class="btn2" id="refresh">새로고침</button>
		</div>
		<div class="min1">
		<div style="background-color:#e9ecef; padding: 8px;">
		<div class="mainTitle" style="padding-bottom: 15px; color:;">
			<h4>설비 실시간 온도</h4>
			<hr style="border: solid 1px gray;">
		</div>
		
		
	
		<div id="chart-area" align="center"></div>
		
		<div align="center">
				<span>
					<input type="radio" name="chk_line" class="line-control" value="L-PPR001" checked>
					<label>LINE01</label>
					<input type="radio" name="chk_line" class="line-control" value="L-PPR002">
					<label>LINE02</label>
					<input type="radio" name="chk_line" class="line-control" value="L-PPR003">
					<label>LINE03</label>
					<input type="radio" name="chk_line" class="line-control" value="L-PPR004">
					<label>LINE04</label>
				</span>
				
		</div>
		
		<hr style="border: solid 2px gray;" />
		<h4>설비 실시간 생산량</h4>
		<div id="chart-UphArea" align="center">
		 	<jsp:include page="uph.jsp" flush="false"/>
			</div>
		</div>
	</div>
</div>
<script>	

//[변수 선언부]
var minTemOne; // 첫번쨰 설비 최소온도
var maxTemOne;// 첫번쨰 설비 최대온도
var minTemTwo;// 두번쨰 설비 최소온도
var maxTemTwo;// 두번쨰 설비 최대온도
var minTemThre;// 세번쨰 설비 최소온도
var maxTemThre;// 세번쨰 설비 최대온도
var minTemFour; // 네번쨰 설비 최소온도
var maxTemFour;  // 네번쨰 설비 최대온도

var firstData;
var secData;
var thirdData;
var fourthData;

var lineCd;
	$(function(){

	    function getTime(){ // 현재시간 데이터 가져오기
	    	  var now = new Date();
	    	  var hours = now.getHours();
	    	  var minutes = now.getMinutes();
	    	  var seconds = now.getSeconds();
	    	  
	    	  return hours+':'+minutes+':'+seconds;
	    	  
	      };

		const el = document.getElementById('chart-area');
	      const data = {
	        categories: ['0','0','0','0','0','0','0','0','0','0'],
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
	              min: -200,
	              max: 200,
	              stepSize: 50,
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
	      
	      $("#refresh").on("click" , function(){
	    	  	location.reload();
	      });
		
	      $(".line-control").on("click" , function(ev){
	    	  	chart.destroy();
	    	  	
		    	lineCd = $("input[name='chk_line']:checked").val();
		    	console.log(lineCd);
		    	//console.log(ev.target.previousSibling.previousSibling.innerText);
		    	var pick = ev.target.previousSibling.previousSibling.innerText;
	      
	      $.ajax({
	    	  url : "getEqTemp",
	    	  method:"GET",
	    	  data : {lineCd : lineCd},
	    	  dataType:"JSON",
	    	  contentType:"application/json; charset=utf-8",
	    	  success : function(rs){
  		  		console.log(rs);
  		  			toastr.success('선택하신 ['+rs[0].라인코드+'] 라인을 줄력!');
  		  			} 
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
				minTemFour = res[3].최소온도;
				maxTemFour = res[3].최대온도;
				chart.addSeries(
						  {
						    name: res[i].설비코드,
							data: [0,0,0,0,0,0,0,0,0,0],
						  },
						  { chartType: 'line' }
						);

				}// END OF FOR SYNTAX
	      	});// END OF AJAX AFTER  
	     }); // END OF RADIO BOX CLICK EVENT
	      
	      const chart = toastui.Chart.lineChart({ el, data, options });

	      let index = 1;
	    	var intervalId = setInterval(() => {
	    		//if(minTemOne <= -1){ // 음수일경우
	    		//	var firstData = Math.floor( ( Math.random() * (maxTemOne + ( minTemOne ) ) ) + minTemOne);
	    		//}else if (minTemOne >= 0){
	    			var firstData = Math.floor( ( Math.random() * (maxTemOne - ( minTemOne ) ) ) + minTemOne);		
	    		//}
	        	//if(minTemTwo <= -1){ //음수일경우
	        	//	var secData = Math.floor((Math.random() * (maxTemTwo + ( minTemTwo ) ) ) + minTemTwo);	
	        	//}else if(minTemTwo >= 0){
	        		var secData = Math.floor((Math.random() * (maxTemTwo - ( minTemTwo ) ) ) + minTemTwo);
	        	//}
	        	//if(minTemThre <=-1){ // 음수일경우
	        	//	var thirdData = Math.floor((Math.random() * (maxTemThre + ( minTemThre ) ) ) + minTemThre);
	        	//}else if(minTemThre >=0){
	        		var thirdData = Math.floor((Math.random() * (maxTemThre - ( minTemThre ) ) ) + minTemThre); 		
	        	//}
	        	// if(minTemFour <=-1){ // 음수일경우
	        	//	var fourthData = Math.floor((Math.random() * (maxTemFour + ( minTemFour ) ) ) + minTemFour);
	        	//}else if(minTemFour >=0){
	        		var fourthData = Math.floor((Math.random() * (maxTemFour - ( minTemFour ) ) ) + minTemFour);
	        	//} 
	       
	    //	var fourthData = Math.floor((Math.random() * (maxTemFour - ( minTemFour ) ) ) + minTemFour);
	        chart.addData([firstData, secData ,thirdData, fourthData], getTime()); // 각 데이터의 Y값(온도)을 업데이트 , 하단X값의 업데이트 되는 항목들
	       
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