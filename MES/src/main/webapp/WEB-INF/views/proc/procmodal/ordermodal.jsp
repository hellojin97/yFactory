<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>

<div class="m-4">

	<!-- Modal HTML -->
	<div id="myModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">주문서 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="grid"></div>
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
<!-- 			<div id="ProcModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">상세 계획 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="pGrid"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" id="btnSav" class="btn btn-primary">Save
						changes</button>
					사용시 필히 onclick 이용 onclick="location.href='/board'" 
				</div>

		</div>
	</div>
</div> -->

<script>
$(function(){
	/* if($("#HNum").val() == 1){
	const url = "procOrderListAjax";
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
		           header: '주문상세코드',
		           name: '주문코드',
		      },
	         {
	           header: '주문일자',
	           name: '주문일자',
	         },
	         {
	             header: '업체명',
	             name: '업체명',
	           },
	           {
	               header: '납기일자',
	               name: '납기일자',
	             },
	             ],
	   					rowHeaders: ['rowNum'],
	                     pageOptions: {
	                         useClient: true,
	                         perPage: 5
	                    }
	     });
	   
	 }else{
	}  */
		const url = "procOrderListAjax";
		   $.ajax(url,{
			   dataType : "JSON",
			   method: "GET"
		   }).done(function(result){
			   
			   grid.resetData(result);
		   })
		   
			   
		   var grid = new tui.Grid({

		       el: document.getElementById('grid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [
		    	 {
			           header: '주문상세코드',
			           name: '주문코드',
			      },
		         {
		           header: '주문일자',
		           name: '주문일자',
		         },
		         {
		             header: '업체명',
		             name: '업체명',
		           },
		           {
		               header: '납기일자',
		               name: '납기일자',
		             },
		             {
		                 header: '주문수량',
		                 name: '주문수량',
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
              $('#myModal').modal('hide')
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
		grid.refreshLayout();
	},300);
	
	grid.on("dblclick",function(e) {
		//debugger
		let ordCd = grid.getValue(e.rowKey, '주문코드');
		 if(ordCd != null){
			  $('#myModal').modal('hide');
			 
 			  $.ajax({
					   url  : "procPlListAjax",
					   data : {
						   ordCd : ordCd
						   },
					   dataType : "JSON",
					   contentType : "application/json; charset = UTF-8;"
				   }).done(function(result){
							for (var i = 0; i < result.length; i++) {
								resultGrid.appendRow(result[i]);
							}
							//resultGrid.appendRow(result, {at : 0});  
								
			
				   })
		} 
		
		
	})
	


})
</script>
