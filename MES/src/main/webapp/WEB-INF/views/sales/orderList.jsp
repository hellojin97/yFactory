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
		<h1>주문서 조회</h1>
	</div>
	


	<div id="ordeList"></div>
</div>


<script type="text/javascript">
window.onload = function(){
   const url = "order";
   $.ajax(url,{
	   dataType : "JSON",
	   method: "GET"
   }).done(function(result){
	   grid.resetData(result);
	  console.log(result);
   })

   var grid = new tui.Grid({
       el: document.getElementById('ordeList'),
       scrollX: false,
       scrollY: false,
       columns: [
         {
           header: '주문코드',
           name: '주문코드',
         },
         {
             header: '업체명',
             name: '업체명',
           },
           {
               header: '주문일자',
               name: '주문일자',
             },
             {
                 header: '납기일자',
                 name: '납기일자',
               },
             {
                 header: '제품코드',
                 name: '완제품코드',
               },
               {
                   header: '제품명',
                   name: '완제품명',
                 },
                 {
                     header: '수량',
                     name: '주문수량',
                   },
                   {
                       header: '진행상황',
                       name: '진행상황',
                     }],
   					rowHeaders: ['rowNum'],
                     pageOptions: {
                         useClient: true,
                         perPage: 5
                    }
     });
}
  </script>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>



</html>