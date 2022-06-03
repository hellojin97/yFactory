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
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" id="btnSav" class="btn btn-primary">Save
						changes</button>
					<!-- 사용시 필히 onclick 이용 onclick="location.href='/board'"  -->
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
	   


  
  $("#btnSav").click(function () {
      Swal.fire({
          title: '정말로 그렇게 하시겠습니까?',
          text: "다시 되돌릴 수 없습니다. 신중하세요.",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '승인',
          cancelButtonText: '취소'
      }).then((result) => {
      	console.log(result);
      	console.log(result.isDismissed); // 승인시 FALSE / 취소시 TRUE
          if (result.isConfirmed) {
              Swal.fire(
                  '승인이 완료되었습니다.',
                  '화끈하시네요~!',
                  'success'
              )
              $('#prdModal').modal('hide')
          }else{
          	Swal.fire(
                      '승인이 취소되었습니다.',
                      '섹시하시네요~!',
                      'error'
                  )
          }
      })
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
