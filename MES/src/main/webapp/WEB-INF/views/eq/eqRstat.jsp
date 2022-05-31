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
		<div id="chart-area2"></div>
	</div>
	
	<script>	
	$(function(){
	  const el = document.getElementById('chart-area');
      const data = {
        categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
        series: [
          {
            name: 'EQ220525001', // 반죽기
            data: [10, 100, 50, 40, 70, 55, 33, 70, 90, 110],
          },
          {
            name: 'EQ220525002', // 성형기
            data: [60, 40, 10, 33, 70, 90, 100, 17, 40, 80],
          },
          {
            name: 'EQ220525003', // 가열기
            data: [10, 100, 50, 40, 70, 55, 33, 70, 90, 110],
          },
          
          {
           name: 'EQ220525005', // 초코프레스
           data: [30, 60, 10, 99, 100, 60, 99, 13, 60, 80],
          }, 
          {
            name: 'EQ220525006', // 냉각기
            data: [40, 40, 30, 99, 70, 60, 100, 17, 40, 80],
          },  
        ],
      };
      const options = {
        chart: { title: '실시간 설비 온도', width: 1000, height: 300 },
        xAxis: {
          title: '온도',
        },
        yAxis: {
          title: '시간',
        },
        tooltip: {
          formatter: (value) => `${value}°C`,
        },
        legend: {
          align: 'bottom',
        },
        series: {
          shift: true,
        },
        
      };

      const chart = toastui.Chart.lineChart({ el, data, options });

      let index = 11;
      const intervalId = setInterval(() => {
        const random = Math.round(Math.random() * 100);
        const random2 = Math.round(Math.random() * 100);
        chart.addData([random, random2], index.toString());
        index += 1;
        if (index === 50) {
          clearInterval(intervalId);
        }
      }, 1500);
      
      
      
      
      // ------------------------------------------------
		/* const el2 = document.getElementById('chart-area2');
      const data2 = {
        categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
        series: [
          {
            name: 'C',
            data: [10, 100, 50, 40, 70, 55, 33, 70, 90, 110],
          },
          {
            name: 'D',
            data: [60, 40, 10, 33, 70, 90, 100, 17, 40, 80],
          },
        ],
      };
      const options2 = {
        chart: { title: '실시간 설비 생산량', width: 1000, height: 500 },
        xAxis: {
          title: 'Month',
        },
        yAxis: {
          title: 'Amount',
        },
        tooltip: {
          formatter: (value) => `${value}°C`,
        },
        legend: {
          align: 'bottom',
        },
        series: {
          shift: true,
        },
      };

      const chart2 = toastui.Chart.lineChart({ el2, data2, options2 });

      let index2 = 11;
      const intervalId2 = setInterval(() => {
        const random3 = Math.round(Math.random() * 100);
        const random4 = Math.round(Math.random() * 100);
        chart2.addData([random3, random4], index2.toString());
        index2 += 1;
        if (index2 === 30) {
          clearInterval(intervalId2);
        }
      }, 1500);
       */
	});
	</script>
	
</body>
</html>