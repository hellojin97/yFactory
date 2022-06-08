<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.smMouseOver {
		cursor:pointer;
	}
</style>
</head>
<body>

   <div style="padding-bottom:15px; color: ;">
      <h1>주문서 조회</h1>
   </div>
   
   <div class="min1">
			<div class="mainTitle" style="padding: 15px;">
				<!-- 구분 -->				
				<fieldset class="col-md-5" style="padding-bottom: 10px;">				
                  	<div class="input-group">
                  		<p style="padding-right: 30px;">진행상황 구분</p>
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
                <form>
                                
				<!-- 업체명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">업체명</label>
						<input type="text" class="form-control" style="width: 50px" placeholder="업체명" id="vnm">
						<a class="nav-link nav-icon search-bar-toggle" id="venderBtn" onclick="venderBtn"> 
							<i class="bi bi-search smMouseOver" style="color: #2c3e50"></i>
						</a>
						<input type="text" id="vcd" class="form-control" readonly="readonly">
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
							<button type="reset" id="reset" class="btn1">초기화</button>
						</div>
					</div>
				</div>
					</form>

			</div>
			<hr style="border: solid 1px gray;">

			<!-- 테이블 -->
			<div id="ordeList"></div>
			<div id="prodModal"></div>
			<div id="venderModal"></div>
			<div id="ordtlList"></div>
			<div>
				<button type="button" class="btn1" id="excel">Excel</button>
			</div>
            </div>
<input type="hidden" id="hdOrdtlCd">

<script type="text/javascript">


//업체명 modal
venderBtn.addEventListener("click", function(){
		$("#venderModal").load("salesVenderModal", function(){
			const venModal = new bootstrap.Modal('#venModal');
			venModal.show();
		})
		});

/* 주문서 전체 조회 */
window.onload = function (){
   const url = "salesOrder";
   $.ajax(url,{
      dataType : "JSON",
      method: "GET"
   }).done(function(result){
	   ordeList.resetData(result);
   })
   
   var ordeList = new tui.Grid({
       el: document.getElementById('ordeList'),
       scrollX: false,
       scrollY: false,
       columns: [
         {
           header: '주문코드',
           name: '주문코드',
           className : 'fontClass',
           align: 'center'
         },
         {
             header: '업체명',
             name: '업체명',
             className : 'fontClass',
           },
           {
               header: '주문일자',
               name: '주문일자',
               className : 'fontClass',
               align: 'center'
             },
             {
                 header: '납기일자',
                 name: '납기일자',
                 className : 'fontClass',
                 align: 'center'
               },             
                 {
                     header: '주문수량',
                     name: '주문수량',
                     className : 'fontClass',
                     align: 'right'
                   },
                   {
                       header: '진행상황',
                       name: '진행상황',
                       className : 'fontClass',
                     }],
                  rowHeaders: ['rowNum'],
                     pageOptions: {
                         useClient: true,
                         perPage: 5
                    }
     });


/* 주문서 단건 조회 */
$("#search").on("click", function() {   
   
   var vnm = $("#vnm").val();
   var vcd = $("#vcd").val();
   var req1 = $("#req1").val();
   var req2 = $("#req2").val();
   var res1 = $("#res1").val();
   var res2 = $("#res2").val();
   var radio = $('input[name="radios"]:checked').val();   
   
   $.ajax({
      url : "searchOrderList",
      data : {
            vnm : vnm,
            vcd : vcd,
            req1 : req1,
            req2 : req2,
            res1 : res1,
            res2 : res2,
            key : radio
      },
      dataType: 'JSON',
      contentType : "application/json; charset=utf-8"
   }).done(function(result){
	   ordeList.resetData(result);
        
   });
})


$('#reset').on('click',function(){
	const url = "salesOrder";
	   $.ajax(url,{
	      dataType : "JSON",
	      method: "GET"
	   }).done(function(result){
		   ordeList.resetData(result);
	   });
})
ordeList.on("dblclick", function(e){
	let odClick = ordeList.getFocusedCell();
	let odc = ordeList.getValue(e.rowKey, "주문코드");
	$("#hdOrdtlCd").val(odc);
	if(odClick.columnName == "주문코드"){
		$("#ordtlList").load("ordtlModal", function() {
			const ordtlModal = new bootstrap.Modal('#ordtlModal');
			ordtlModal.show();
			});
	}
});
//excel호출
$('#excel').on('click',function(){
	const options = {
			  includeHiddenColumns: true,
			  onlySelected: true,
			  fileName: '주문서조회',
			};
	ordeList.export('xlsx', options);
})


//마우스 커서 올리면
ordeList.on('mouseover', function(e){
	var cn = e.columnName;
	var tt = e.targetType;
		if(cn == '주문코드' && tt == 'cell' ){			
			$('#ordeList').attr("class", "smMouseOver");
		}else{
			$('#ordeList').removeClass();					
		}
});

}
  </script>

</body>

</html>