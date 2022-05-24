<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="m-4">

	<!-- Modal HTML -->
	<div id="procDtPlanModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">미지시 계획 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="NoPlanSelectGrid"></div>
					<!-- <div id="procDtPMGrid"></div> -->
				</div>


			</div>
		</div>
		</div>
		
			<div id="needMtrlModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">자재 LOT 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
				<div class="col-md-12" style="padding-bottom: 10px;">
				<div class="input-group">
					<label for="inputText" class="col-form-label"
						style="padding-right: 40px;">자재명 : </label>
				<input type="text" id="ppCdText">
					<label for="inputText" class="col-form-label"
						style="padding-right: 40px;">필요수량 : </label>
				<input type="text" id="pdQtyText">
				<input type="hidden" id="mtNmText">
				</div>
					<div id="needMtrlLOTGrid"></div>
					<button id="dateSearch" class="btn1">확인</button>
				</div>
			</div>
		</div>
		</div>
		
		</div>
		</div>
<script>
$(function(){

	
	if($("#modalState").val() == 1){
	const url = "NoPlanSelect";
	   $.ajax(url,{
		   dataType : "JSON",
		   method: "GET"
	   }).done(function(result){
		   
		   NoPlanSelectGrid.resetData(result);
	   })
	   
		   
	   var NoPlanSelectGrid = new tui.Grid({

	       el: document.getElementById('NoPlanSelectGrid'),
	       scrollX: false,
	       scrollY: false,
	       columns: [
	    	 {
		           header: '생산계획코드',
		           name: '생산계획코드',
		      },
	         {
	           header: '계획명',
	           name: '계획명',
	         },
	         {
	             header: '생산계획상세코드',
	             name: '생산계획상세코드',
	           },
	           {
	               header: '완제품',
	               name: '완제품명',
	             },
	             ],
	   					rowHeaders: ['rowNum'],
	                     pageOptions: {
	                         useClient: true,
	                         perPage: 5
	                    }
	     });
		//미지시계획조회 버튼 클릭했을시 ajax
		NoPlanSelectGrid.on("dblclick",function(e) {
			
			//debugger
			let ppCd = NoPlanSelectGrid.getValue(e.rowKey, '생산계획상세코드');
			let prodNm = NoPlanSelectGrid.getValue(e.rowKey, '완제품명');
		    var data= {prodNm : prodNm};
			if(ppCd != null){
				 
			
			//ajax 실행
				 	  $.ajax({
					   url  : "procDtPlanSelect",
						 data : {
						   ppCd : ppCd
						   }, 
					   dataType : "JSON",
					   contentType : "application/json; charset = UTF-8;"
				   }).done(function(result){
					   //procDtPlan.appendRow(result);
					   //console.log(result)
							for (var i = 0; i < result.length; i++) {
								procDtPlan.appendRow(result[i]);
							}
			
				   })
				   //라인코드 넣는 ajax

				    $.ajax({
					   url  : "procLineSelect",
					   data :  JSON.stringify(data), 
					   dataType : "JSON",
					   type : "POST",
					   contentType : "application/json; charset = UTF-8;"
				   }).done(function(result){
							 for (var i = 0; i < result.length; i++) {
								 procOrder.appendRow(result[i]);
								 $('#procDtPlanModal').modal('hide')
							} 
					   

			
				   }) 
				   
			}
			})
		     setTimeout(function(){
					
		    	 NoPlanSelectGrid.refreshLayout();
			},300);
	}else if($("#modalState").val() == 2){
		$('#needMtrlLOTGrid').empty(); 
	
	   //필요자재클릭시 자재 LOT 목록 모달 ajax
	     /* else if($("#modalState").val() == 2)  {  */
	 	  let mtNm = $("#mtNmText").val();
	 	  console.log($("#mtNmText").val());
            var data = {mtNm : mtNm};
            
		  const url1 = "procNeedMtrlLOT";
		   $.ajax(url1,{
			   type : "POST",
			   data : JSON.stringify(data),
			   dataType : "JSON",
			   contentType : "application/json; charset = UTF-8;"
		   }).done(function(result){
			   needMtrlLOTGrid.resetData(result);
			   console.log(result);
		   })
	
	 	  
		   var needMtrlLOTGrid = new tui.Grid({
				
		       el: document.getElementById('needMtrlLOTGrid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [
		    	 {
			           header: '자재LOT번호',
			           name: '자재LOT번호',
			      },
		         {
		           header: '현재고',
		           name: '현재고',
		         },
		         {
		             header: '사용수량',
		             name: '사용수량',
		           },
		           {
		               header: '유통기한',
		               name: '유통기한',
		             },
		             ],
		   					rowHeaders: [
		   				        {
		   				            type: 'rowNum',

		   				          },
		   				          {
		   				            type: 'checkbox',
		   				          }
		   				          ],
		                     pageOptions: {
		                         useClient: true,
		                         perPage: 5
		                    }
		     });  
		   
			setTimeout(function(){
				
				 needMtrlLOTGrid.refreshLayout();
			},300);
	     }

})
</script>