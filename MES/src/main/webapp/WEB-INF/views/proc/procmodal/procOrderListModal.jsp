<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div class="m-4">

	<!-- Modal HTML -->
			<div id="ProcOrderListModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">생산 지시 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
				<div class="col-md-12" style="padding-bottom: 10px;">
				<div class="input-group">
					<div class="col-sm-3" style="padding-right: 10px;">
						<input type="date" class="form-control" id="dateA">
					</div>
					<button id="dateSearch" class="btn1">검색</button>
				</div>
			
		</div>
					<div id="procOrderListGrid"></div>
				</div>



		</div>
	</div>
</div> 
</div>
<script>
//날짜
 document.getElementById('dateA').value = new Date().toISOString().substring(0, 10);

 $(function(){
	   const url = "procOrderList";
	   let date1 = '';
		var data = {
	   	date1 : date1
	   }

	   $.ajax(url,{
	      dataType : "JSON",
	      data : JSON.stringify(data),
	      type : "POST",
	      contentType : "application/json; charset=utf-8"
	   }).done(function(result){
		   procOrderListGrid.resetData(result);
	   })
	   
	   var procOrderListGrid = new tui.Grid({
	       el: document.getElementById('procOrderListGrid'),
	       scrollX: false,
	       scrollY: false,
	       columns: [
	         {

	           header: '생산지시코드',
	           name: '생산지시코드',
	         },
	           {
	               header: '제품명',
	               name: '제품명',
	             },
	             {
	                 header: '생산수량',
	                 name: '생산수량',
	               },
	               {
		                 header: '생산지시일자',
		                 name: '생산지시일자',
		               }
	             ],
	                  rowHeaders: ['rowNum'],
	                     pageOptions: {
	                         useClient: true,
	                         perPage: 5
	                    }
	     });


	   $("#dateSearch").on("click", function() { 

			 date1 = $("#dateA").val();
			   	var data = {
			        	date1 : date1,
			        }
		    $.ajax({
		        url : "procOrderList",
		        data : JSON.stringify(data),
		        dataType: 'JSON',
		        type : 'POST',
		        contentType : "application/json; charset=utf-8"
		     }).done(function(result){
		    	 procOrderListGrid.resetData(result);
		         //console.log(result);
		         
		     });
		    

		   
		});
	   
	   procOrderListGrid.on("click",function(e){
			let dtlCd = procOrderListGrid.getValue(e.rowKey, '생산지시코드');
			 if(dtlCd != null){
				  $('#ProcOrderListModal').modal('hide');
				 
				  $.ajax({
						   url  : "procOrderCdSelectOne",
						   data : {
							   dtlCd : dtlCd
							   },
						   dataType : "JSON",
						   contentType : "application/json; charset = UTF-8;"
					   }).done(function(result){
								resultGrid.resetData(result);

								let line = result[0].라인코드
									console.log(line);
								 if(line != null){
									 
									  $.ajax({
											   url  : "procOrderLineSelectOne",
											   data : {line : line},
											   dataType : "JSON",
											   contentType : "application/json; charset = UTF-8;"
										   }).done(function(result){
											   		releaseList.resetData(result);

										   })
										   
									   
									  
								}  
					   })
					
					   //let line = resultGrid.getValue(e.rowKey, '라인코드');
					  
					 
			} 
			 

			 
	   });

		setTimeout(function(){
			
			procOrderListGrid.refreshLayout();
		},300);

//$('#ProcOrderListModal').modal('hide')
	});
</script>
