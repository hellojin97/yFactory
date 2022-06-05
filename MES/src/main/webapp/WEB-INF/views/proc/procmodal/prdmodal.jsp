<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="m-4">

	<!-- Modal HTML -->
	<div id="prdModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">제품 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="prdGrid"></div>
				</div>


			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	
	const url = "prdSelect";
	   $.ajax(url,{
		   dataType : "JSON",
		   method: "GET"
	   }).done(function(result){
		   prdGrid.resetData(result);
	   })
	   
		   
	   var prdGrid = new tui.Grid({

	       el: document.getElementById('prdGrid'),
	       scrollX: false,
	       scrollY: false,
	       columns: [
	    	 {
		           header: '제품코드',
		           name: '완제품코드',
		      },
	         {
	           header: '제품명',
	           name: '완제품명',
	         }],
	        
	   					rowHeaders: ['rowNum'],
	                     pageOptions: {
	                         useClient: true,
	                         perPage: 5
	                    }
	     });
	   


  


  
  setTimeout(function(){
	  prdGrid.refreshLayout();
	},300);
	
  prdGrid.on("dblclick",function(e) {
		//debugger
		let prodCd = prdGrid.getValue(e.rowKey, '완제품코드');
		 if(prodCd != null){
			  $('#prdModal').modal('hide');
			 
			  $.ajax({
					   url  : "prdSelectOne",
					   data : {
						   prodCd : prodCd
						   },
					   dataType : "JSON",
					   contentType : "application/json; charset = UTF-8;"
				   }).done(function(result){
					  		let prd = resultGrid.getFocusedCell('완제품코드');
					  		console.log(prd);
							 for (var i = 0; i < result.length; i++) {
								 resultGrid.setRow(prd.rowKey,result[i]);
							} 
								
			
				   })
		} 
		
		
	})
	


})
</script>
