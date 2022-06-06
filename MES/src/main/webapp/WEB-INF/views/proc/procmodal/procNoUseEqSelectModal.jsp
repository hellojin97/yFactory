<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="m-4">

	<!-- Modal HTML -->
	<div id="NoUseEqSelectModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">미사용 설비 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="NoUseEqSelectGrid"></div>
				</div>

			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	
	const url = "procNoUseEqSelect";
	  eqCd = '';
	   $.ajax(url,{
		   dataType : "JSON",
		   method: "GET",
		   data : {
			   eqCd : eqCd
			   },
	   }).done(function(result){
		   NoUseEqSelectGrid.resetData(result);
	   })
	   
		   
	   var NoUseEqSelectGrid = new tui.Grid({

	       el: document.getElementById('NoUseEqSelectGrid'),
	       scrollX: false,
	       scrollY: false,
	       columns: [
	    	 {
		           header: '설비코드',
		           name: '설비코드',
		      },
	         {
	           header: '설비명',
	           name: '설비명',
	         }
		      ,
		         {
		           header: '모델명',
		           name: '모델명',
		         }
		      ,
		         {
		           header: '관리자',
		           name: '관리자',
		         }
		      ],
	        
	   					rowHeaders: ['rowNum'],
	                     pageOptions: {
	                         useClient: true,
	                         perPage: 5
	                    }
	     });
	   
	   setTimeout(function(){
			NoUseEqSelectGrid.refreshLayout();
			},300);
	   
	   NoUseEqSelectGrid.on("dblclick",function(e) {
			//debugger
			let eqCd = NoUseEqSelectGrid.getValue(e.rowKey, '설비코드');
			console.log(eqCd);
			 if(eqCd != null){
				  $('#NoUseEqSelectModal').modal('hide');
				 
				  $.ajax({
						   url  : "procNoUseEqSelect",
						   data : {
							   eqCd : eqCd
							   },
						   dataType : "JSON",
						   contentType : "application/json; charset = UTF-8;"
					   }).done(function(result){
						  		let eq = procProcessCtlGrid.getFocusedCell('설비코드');
								 for (var i = 0; i < result.length; i++) {
									 procProcessCtlGrid.setValue(eq.rowKey,'설비코드',result[i].설비코드);
									 procProcessCtlGrid.setValue(eq.rowKey,'설비명',result[i].설비명);
									 procProcessCtlGrid.setValue(eq.rowKey,'모델명',result[i].모델명);
									 procProcessCtlGrid.setValue(eq.rowKey,'관리자',result[i].관리자);
								} 
									
				
					   })
			}
			
			
		}) 
	   
  });

  

	
   
	



</script>
