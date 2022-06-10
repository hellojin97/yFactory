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
				<input type="hidden" id="dtlCdText">
				</div>
					<div id="needMtrlLOTGrid"></div>
					<button id="btnCheck" class="btn1">확인</button>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
<script>
$(function(){
	var sum;
	
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
		   			className : 'fontClass',
					align : 'center',
		      },
	         {
	           header: '계획명',
	           name: '계획명',
	   			className : 'fontClass',

	         },
	         {
	             header: '계획등록일자',
	             name: '계획등록일자',
		   			className : 'fontClass',
					align : 'center',
	           },
	           {
	               header: '상태',
	               name: '상태',
	               
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
			let ppCd = NoPlanSelectGrid.getValue(e.rowKey, '생산계획코드');
			
		    var data= {"ppCd" : ppCd};
			if(ppCd != null){
				 
			
			//ajax 실행
				 	  $.ajax({
					   url  : "procDtPlanSelect",
						 data : data,
					   	method    : 'GET',
					   	dataType : 'JSON'
				   }).done(function(result){
					   		console.log(result);
				   
							for (var i = 0; i < result.length; i++) {
								procDtPlan.appendRow(result[i]);
								
								   //라인코드 넣는 ajax

							    $.ajax({
								   url  : "procLineSelect",
								   data :  {"prodNm" : result[i].완제품명}, 
								   dataType : "JSON",
								   type : "GET"
							   }).done(function(data){
										 for (var i = 0; i < data.length; i++) {
											 procOrder.appendRow(data[i]);
										} 
							   }) 
								
							};
							
							
							
							
							$('#procDtPlanModal').modal('hide');
				   });
			
			
			

				   
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
	 	  let dtlCd = $("#dtlCdText").val();
	 	  //console.log($("#mtNmText").val());
            var data = {
            		mtNm : mtNm,
            		dtlCd : dtlCd
            		}
            
            
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
			   			className : 'fontClass',
						align : 'center',
			      },
		         {
		           header: '현재고',
		           name: '현재고',
		   			className : 'fontClass',
					align: 'right',
					formatter(myNum) {                
						               return myNum.value.toString()
						               .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						         		}
		         },
		         {
		             header: '사용수량',
		             name: '사용수량',
		             editor : "text",
				   	className : 'fontClass',
					align: 'right',
		           },
		           {
		               header: '유통기한',
		               name: '유통기한',
			   			className : 'fontClass',
						align: 'center',
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
 				          
 				summary: {
 				        height: 40,
 				        position: 'bottom', // or 'top'
 				        columnContent: {
	 				       사용수량: {
	 				            template: function(valueMap) {
	 				              Sum = valueMap.sum;
	 				              return `TOTAL: \${valueMap.sum}`;
	  				 			
	 				            }
	 				          }
 				        }
 				      },

                   pageOptions: {
                       useClient: true,
                       perPage: 5
                  }
		     });  
		   

		    $('#btnCheck').off('click');
		
			$('#btnCheck').on('click',function(){
				toastr.options = {
                        closeButton: true,
                        progressBar: true,
                        //positionClass: "toast-bottom-right",
                        timeOut: 1500
                       };
			
	 		if($("#pdQtyText").val() == Sum){
	 			toastr.success('수량이 일치합니다.');
	 		
			let checkedAry = [];
			let rowindex = [];
			let prd = needMtrlLOTGrid.getCheckedRows();
			console.log(prd);
			 for (var i = 0; i < prd.length; i++) {
				 
			 		//console.log(prd[i]);
					//checkedAry.push({}); 
					//rowindex.push((prd[i].rowKey)); 
					needMtrlLOT.appendRow({'자재LOT번호':prd[i].자재LOT번호,
						'사용수량':prd[i].사용수량,
						'유통기한':prd[i].유통기한,
						'자재명': prd[i].자재명,
						'지시디테일코드' : prd[i].지시디테일코드
					});
					
				} 
			 $('#needMtrlModal').modal('hide');
	 		}else{
	 			toastr.error('수량이 불일치합니다.');
	 		}
			});
			

			needMtrlLOTGrid.on('afterChange', (ev) => {
				orgin: 'cell';
				selectedRowKey = ev.changes;
				needMtrlLOTGrid.check(selectedRowKey[0].rowKey);
				let qty = needMtrlLOTGrid.getValue(selectedRowKey[0].rowKey, '현재고');
				let needQty = needMtrlLOTGrid.getValue(selectedRowKey[0].rowKey, '사용수량');
								
				console.log(test);
				if (qty <  needQty){
					toastr.error('필요용량을 넘어섯습니다!');
					needMtrlLOTGrid.setValue(selectedRowKey[0].rowKey, '사용수량','');
					needMtrlLOTGrid.uncheck(selectedRowKey[0].rowKey);
				}

				
				
			});
			
			
			
			setTimeout(function(){
				
				 needMtrlLOTGrid.refreshLayout();
			},300);
	     }

})
</script>