<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="m-4">

	<!-- Modal HTML -->
	<div id="procCdModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">공정 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="procCdModalGrid"></div>
				</div>

			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	let prCd = '';
 	const url = "procCdList";
	   $.ajax(url,{
		   dataType : "JSON",
		   method: "GET",
		   data : {
			   prCd : prCd
			   },
		   contentType : "application/json; charset = UTF-8;"
	   }).done(function(result){
		   console.log(result);
		   procCdModalGrid.resetData(result);
	   }) 
	   
		   
	   var procCdModalGrid = new tui.Grid({

	       el: document.getElementById('procCdModalGrid'),
	       scrollX: false,
	       scrollY: false,
	       columns: [
	    	 {
		           header: '공정코드',
		           name: '공정코드',
		   			className : 'fontClass',
					align : 'center',
		      },
	         {
	           header: '공정명',
	           name: '공정명',
	   			className : 'fontClass',
				align : 'center',
	         }
		      ,
		         {
		           header: '설비코드',
		           name: '설비코드',
		   			className : 'fontClass',
					align : 'center',
		         }
		      ,
		         {
		           header: '설비명',
		           name: '설비명',
		   			className : 'fontClass',
					align : 'center',

		         }
		      ],
	        
	   					rowHeaders: ['rowNum'],
	                     pageOptions: {
	                         useClient: true,
	                         perPage: 5
	                    }
	      });
	   
	   setTimeout(function(){
		   procCdModalGrid.refreshLayout();
			},300);
	   
	 	    procCdModalGrid.on("dblclick",function(e) {
			//debugger
			let prCd = procCdModalGrid.getValue(e.rowKey, '공정코드');
			console.log(prCd);
			 if(prCd != null){
				  $('#procCdModal').modal('hide');
				 
				   $.ajax({
						   url  : "procCdList",
						   data : {
							   prCd : prCd
							   },
						   dataType : "JSON",
						   contentType : "application/json; charset = UTF-8;"
					   }).done(function(result){
						  		let prCdRow = procLineEdit.getFocusedCell('공정코드');
								 for (var i = 0; i < result.length; i++) {
									 procLineEdit.setValue(prCdRow.rowKey,'공정코드',result[i].공정코드);
									 procLineEdit.setValue(prCdRow.rowKey,'공정명',result[i].공정명);
									 procLineEdit.setValue(prCdRow.rowKey,'설비코드',result[i].설비코드);
									 procLineEdit.setValue(prCdRow.rowKey,'설비명',result[i].설비명);
								} 
									
				
					   }) 
			}
			
			
		})   
	   
  });

  

	
   
	



</script>
