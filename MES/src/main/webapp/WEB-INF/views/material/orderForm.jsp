<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-chart.css" />

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>

	<div class="container">
	<div class="mainTitle" style="padding-bottom:15px; color: ;">
		<h1>발주 관리/등록</h1>
	</div>
	
	<div class="code-html contents">
	<div class="btn-wrapper" style="padding-bottom:7px;">
		<button  class="btn btn-primary btn-sm">관리</button>
		<button class="btn btn-primary btn-sm">등록</button>
	</div>
	<h4>미지시 생산계획조회</h4>
	<div id="unorder" ></div>
	</div>
		<div class="mainTitle">
		<h4>생산계획별 자재 재고</h4>
	</div>	

	<div id="grid1"></div>
</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>

<script>
	
const unorder = new tui.Grid({
    el: document.getElementById('unorder'),
    url: ,
    data: ,
    columns: [
      {
        header: '생산계획코드',
        name: 'ppCd'
      },
      {
        header: '생산계획명',
        name: 'ppNm'
      },
      {
        header: '계획등록일자',
        name: 'ppDt'
      },
      {
        header: '총 수량',
        name: 'pdQty'
      }
      
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 3
    }
  });

  const grid1 = new tui.Grid({
    el: document.getElementById('grid1'),
    data: gridData,
    columns: [
      {
        header: '완제품목코드',
        name: 'name'
      },
      {
        header: '완제품목명',
        name: 'artist'
      },
      {
        header: '계획일자',
        name: 'type'
      },
      {
        header: '소모품목 코드',
        name: 'release'
      },
      {
          header: '소모품목명',
          name: 'release'
        },
      {
          header: '재고 구분',
          name: 'release'
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

  
</script>

</html>