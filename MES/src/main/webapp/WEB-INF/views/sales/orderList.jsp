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
   
   <div style="background-color: #e0e0e0; padding: 8px;">
			<div class="mainTitle" style="padding: 15px;">
				<!-- 구분 -->				
				<fieldset class="col-md-5" style="padding-bottom: 10px;">				
                  	<div class="input-group">
                  		<p style="padding-right: 30px;">구분</p>
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="radios" id="1" value="1" checked>
	                      <label class="form-check-label" for="gridRadios1" style="padding-right: 10px;">
	                        진행
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="radios" id="2" value="2">
	                      <label class="form-check-label" for="gridRadios2" style="padding-right: 10px;">
	                        완료
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="radios" id="3" value="3">
	                      <label class="form-check-label" for="gridRadios3" style="padding-right: 10px;">
	                        전체
	                      </label>
	                    </div>        
                    </div>                              
                </fieldset>
                
                <!-- 제품명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">제품명</label> 
							<input type="text" class="form-control" style="width: 50px" placeholder="제품명" id="pnm">
						<a class="nav-link nav-icon search-bar-toggle " href="#"> <i
							class="bi bi-search" style="color: #2c3e50"></i>
						</a>
					</div>
				</div>
                
				<!-- 업체명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">업체명</label>
						<input type="text" class="form-control" style="width: 50px" placeholder="업체명" id="vnm">
						<a class="nav-link nav-icon search-bar-toggle " href="#"> 
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>
					</div>
				</div>
				
				<!-- 주문일자 -->
				<div class="col-md-12" style="padding-bottom: 10px;">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 10px;">주문일자</label>
						<div class="col-sm-2">
							<input type="date" class="form-control" id="req1">
						</div>

						<div style="padding: 0px 15px 0px 15px;">
							<p>~</p>
						</div>
						<div class="col-sm-2" style="padding-right: 20px;">
							<input type="date" class="form-control" id="req2">
						</div>
					</div>
				</div>

				<!-- 납품일자 -->
				<div class="col-md-12">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 10px;">납품일자</label>
						<div class="col-sm-2">
							<input type="date" class="form-control" id="res1">
						</div>

						<div style="padding: 0px 15px 0px 15px;">
							<p>~</p>
						</div>
						<div class="col-sm-2" style="padding-right: 20px;">
							<input type="date" class="form-control" id="res2">
						</div>

						<div style="padding-right: 10px;">
							<button type="button" id="search" class="btn1">검색</button>							
						</div>

						<div>
							<button type="reset" class="btn1">초기화</button>
						</div>
					</div>
				</div>

			</div>
			<hr style="border: solid 1px gray;">

			<!-- 테이블 -->
			<div id="ordeList"></div>
            </div>
		</div>


<script type="text/javascript">
/* 주문서 전체 조회 */
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
                         perPage: 3
                    }
     });


/* 주문서 단건 조회 */
$("#search").on("click", function() {
   console.log("click!")
   var pnm = $("#pnm").val();
   var vnm = $("#vnm").val();
   var req1 = $("#req1").val();
   var req2 = $("#req2").val();
   var res1 = $("#res1").val();
   var res2 = $("#res2").val();
   var radio = $('input[name="radios"]:checked').val();
   console.log(radio);
   
   $.ajax({
      url : "searchOrderList",
      data : {
            pnm : pnm,
            vnm : vnm,
            req1 : req1,
            req2 : req2,
            res1 : res1,
            res2 : res2
      },
      dataType: 'JSON',
      contentType : "application/json; charset=utf-8"
   }).done(function(result){
       grid.resetData(result);
        
   });
})
}
  </script>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-pagination.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-grid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/js/tui-chart.js"></script>



</html>