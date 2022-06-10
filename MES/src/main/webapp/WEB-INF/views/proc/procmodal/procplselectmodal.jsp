<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div class="m-4">

	<!-- Modal HTML -->
	<div id="myModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">제품목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="pGrid"></div>
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
		   grid.resetData(result);
	   })
	   
		   
	   var grid = new tui.Grid({

	       el: document.getElementById('pGrid'),
	       scrollX: false,
	       scrollY: false,
	       columns: [
	    	 {
		           header: '제품코드',
		           name: '완제품코드',
					className : 'fontClass',
					align: 'center',
		      },
	         {
	           header: '제품명',
	           name: '완제품명',
				className : 'fontClass',
	         },

	             ],
	   					rowHeaders: ['rowNum'],
	                     pageOptions: {
	                         useClient: true,
	                         perPage: 5
	                    }
	     
	     });
		setTimeout(function(){
			grid.refreshLayout();
		},300);
		//생산계획코드를 클릭했을시 ajax
		grid.on("click",function(e) {
			//debugger
			let ppCd = grid.getValue(e.rowKey, '완제품명');
			if(ppCd != null){
				  $('#myModal').modal('hide');
			console.log(ppCd);
			$("#PrdNm").val(ppCd);
			}
			}); 
		
		

});
</script>