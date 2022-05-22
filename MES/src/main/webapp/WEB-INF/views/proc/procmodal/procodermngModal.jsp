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
		
		</div>
<script>
$(function(){
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
	   
		setTimeout(function(){
			NoPlanSelectGrid.refreshLayout();
		},300);
		//생산계획코드를 클릭했을시 ajax
 		NoPlanSelectGrid.on("click",function(e) {
			//debugger
			let ppCd = NoPlanSelectGrid.getValue(e.rowKey, '생산계획상세코드');
			console.log(ppCd);
			if(ppCd != null){
				  $('#procDtPlanSelect').modal('hide');
			
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
					   console.log(result)
							for (var i = 0; i < result.length; i++) {
								procDtPlan.appendRow(result[i]);
							}
					   

			
				   })
				   //라인코드 넣는 ajax
				  /*  $.ajax({
					   url  : "procDtPlanSelect",
						 data : {
						   ppCd : ppCd
						   }, 
					   dataType : "JSON",
					   contentType : "application/json; charset = UTF-8;"
				   }).done(function(result){
					   //procDtPlan.appendRow(result);
					   console.log(result)
							for (var i = 0; i < result.length; i++) {
								procDtPlan.appendRow(result[i]);
							}
					   

			
				   }) 
				   */
			}
			});  

		

});
</script>