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

<section class="section">
      <div class="row">
        <div class="">

          <div class="card">
            <div class="card-body">
              <!-- Horizontal Form -->
              <form>
                <fieldset class="row mb-3">
                  <legend class="col-form-label col-md-2 pt-0">구분</legend>
                    <div class="form-check col-md-1">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                      <label class="form-check-label" for="gridRadios1">
                        진행
                      </label>
                    </div>
                    <div class="form-check col-md-1">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                      <label class="form-check-label" for="gridRadios2">
                        완료
                      </label>
                    </div>
                    <div class="form-check col-md-1">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3">
                      <label class="form-check-label" for="gridRadios3">
                        전체
                      </label>
                    </div>                  
                </fieldset>
                
                <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">제품명</label>
                  <div class="col-sm-10">
                    <input type="text" class="input-group form-control" style="width: 150px" id="pnm">                    
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">업체명</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" style="width: 150px" id="vnm">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputPassword3" class="col-md-2 col-form-label">주문일자</label>
                  <div class="col-md-2">
                    <input type="date" class="form-control" style="width: 150px" id="req1">
                  </div>
                  <div class="col-md-2">
                    <input type="date" class="form-control" style="width: 150px" id="req2">
                  </div>                  
                </div>
                <div class="row mb-3">
                  <label for="inputPassword3" class="col-md-2 col-form-label">납기일자</label>
                  <div class="col-md-2">
                    <input type="date" class="form-control" style="width: 150px" id="res1">
                  </div>
                  <div class="col-md-2">
                    <input type="date" class="form-control" style="width: 150px" id="res2">
                  </div>                  
                </div>             
                <div class="text-center">
                  <button type="button" id="search" class="btn btn-primary">검색</button>
                </div>
              </form><!-- End Horizontal Form -->
              <hr>
            <div id="ordeList"></div>
            </div>
          </div>          
        </div>
      </div>
      
    </section>   



   
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
   
   console.log(pnm + vnm + req1 + req2 + req1 + req2)
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