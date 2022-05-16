<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
	<a href="${pageContext.request.contextPath}/calendar">calendar</a>
	<a href="${pageContext.request.contextPath}/modal">modal</a>
	<a href="${pageContext.request.contextPath}/alert">alert</a>
	<div class="code-html contents">
		<div class="btn-wrapper">
			
			<button id="appendBtn">appendBtn</button>
			<button id="prependBtn">prependBtn</button>
		</div>
		<div id="grid"></div>
		<div id="grid1"></div>
		
		<!-- <div id="chart-area"></div> -->
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>
  const grid = new tui.Grid({
    el: document.getElementById('grid'),
    data: gridData,
    columns: [
      {
        header: 'Name',
        name: 'name'
      },
      {
        header: 'Artist',
        name: 'artist'
      },
      {
        header: 'Type',
        name: 'type'
      },
      {
        header: 'Release',
        name: 'release'
      },
      {
        header: 'Genre',
        name: 'genre'
      }
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 5
    }
  });
  const grid1 = new tui.Grid({
	    el: document.getElementById('grid1'),
	    data: gridData,
	    columns: [
	      {
	        header: 'Name',
	        name: 'name'
	      },
	      {
	        header: 'Artist',
	        name: 'artist'
	      },
	      {
	        header: 'Type',
	        name: 'type'
	      },
	      {
	        header: 'Release',
	        name: 'release'
	      },
	      {
	        header: 'Genre',
	        name: 'genre'
	      }
	    ],
	    rowHeaders: ['rowNum'],
	    pageOptions: {
	      useClient: true,
	      perPage: 5
	    }
	  });
  const appendBtn = document.getElementById('appendBtn');
  const prependBtn = document.getElementById('prependBtn');

  const appendedData = {
    name: 'Music',
    artist: 'Lee',
    type: 'Deluxe',
    release: '2019.09.09',
    genre: 'Pop'
  };

  appendBtn.addEventListener('click', () => {
    grid.appendRow(appendedData);
  });

  prependBtn.addEventListener('click', () => {
    grid.prependRow(appendedData);
  });
</script>
<script>
const el = document.getElementById('chart-area');
const data = {
  categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
  series: [
    {
      name: 'A',
      data: [10, 100, 50, 40, 70, 55, 33, 70, 90, 110],
    },
    {
      name: 'B',
      data: [60, 40, 10, 33, 70, 90, 100, 17, 40, 80],
    },
  ],
};
const options = {
  chart: { title: '24-hr Average Temperature', width: 1000, height: 500 },
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

const chart = toastui.Chart.lineChart({ el, data, options });

let index = 11;
const intervalId = setInterval(() => {
  const random = Math.round(Math.random() * 100);
  const random2 = Math.round(Math.random() * 100);
  chart.addData([random, random2], index.toString());
  index += 1;
  if (index === 30) {
    clearInterval(intervalId);
  }
}, 1500);
    </script>
</html>