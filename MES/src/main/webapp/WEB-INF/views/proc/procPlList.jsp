<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<div class="mainTitle" style="padding-bottom:15px; color: ;">
		<h1>주문서 조회</h1>
	</div>
	<button id="btnModal">주문서등록</button>
	<div id="orderList"></div>
	<div id="test"></div>
</div>

<script>
btnModal.addEventListener("click", function(){
	$("#test").load("ordermodal", function(){
		const myModal = new bootstrap.Modal('#myModal');
		myModal.show();
	})
});

window.onload = function(){
   const url = "salesOrder";
   $.ajax(url,{
	   dataType : "JSON",
	   method: "GET"
   }).done(function(result){
	   grid.resetData(result);
	  console.log(result);
   })

   var grid = new tui.Grid({
       el: document.getElementById('orderList'),
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

</html>