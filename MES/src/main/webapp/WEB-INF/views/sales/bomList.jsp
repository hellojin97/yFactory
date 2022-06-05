<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.smMouseOver {
		cursor:pointer;
	}
</style>
</head>
<body>
<div style="padding-bottom:15px; color: ;">
		<h1>BOM 관리</h1>
	</div>
	<div class="min1">
	
	
	<h4>완제품 선택</h4>
	
     <!-- 완제품 목록 -->         
	<div id="prodGrid"></div>
	
	<hr style="border: solid 1px gray;">

	<h4>BOM</h4>
	<div>
	<form>				
	<div class="col-md-12" style="padding-bottom: 10px;">

			
			<!-- 인풋 태그 -->
			<div class="col-md-6">
					<div class="input-group">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">완제품</label>
						<div class="col-sm-3" style="padding-right: 27px;"> 
						<input type="text" class="form-control" id="pnm" disabled>
						</div>
						<div class="col-sm-3">						
						<input type="text" id="pcd" class="form-control" disabled>&nbsp;&nbsp;&nbsp;&nbsp;
						</div>						
					</div>
				</div>
	</div>
				</form>
				</div>
	<!-- BOM 목록 -->
	<div id="bomGrid"></div>
	<br>
	<div>
		<button type="button" class="btn1" id="excel">Excel</button>
	</div>
	</div>
	<input type="hidden" id="num">
		
		


	<script type="text/javascript">
			
		   
	$.ajax({
		url : "prodModalList",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			prodGrid.resetData(result);
		}
	});
	
	var prodGrid = new tui.Grid({
		       el: document.getElementById('prodGrid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [		         
		           {
		               header: '제품명',
		               name: '제품명',
		             },
		             {
		                 header: '제품코드',
		                 name: '제품코드',
		                 align: 'center'
		               }],
		   					rowHeaders: ['rowNum'],
		   					pageOptions: {
	    	                    type: 'scroll', 
	    	                    perPage: 5 
	    	                  }
		     });
	
	
	$.ajax({
		url : "",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			bomGrid.resetData(result);
		}
	});
	
	var bomGrid = new tui.Grid({
	       el: document.getElementById('bomGrid'),
	       scrollX: false,	       
	       bodyHeight: 200,
	       columns: [		         
	    	   		{
	                 header: 'BOM 코드',
	                 name: 'BOM 코드',
	                 align: 'center'
	               },{
	                 header: '원자재 코드',
	                 name: '원자재 코드',
	                 align: 'center'
	               },{
	               header: '원자재명',
	               name: '원자재명',
	             },{
		               header: '단위',
		               name: '단위',
		               align: 'center'
		             },
	             {
	                 header: '소요량',
	                 name: '소요량',
	                 editor: 'text',
	                 align: 'right'
	               }],
	   					rowHeaders: ['rowNum'],
	   					pageOptions: {
    	                    type: 'scroll', 
    	                    perPage: 10 
    	                  }
	     });
	
	prodGrid.on("click", function(e){
		var key = prodGrid.getValue(e.rowKey, "제품코드");
		var pnm = prodGrid.getValue(e.rowKey, "제품명");		
		$("#pcd").val(key);
		$("#pnm").val(pnm);
		
		$.ajax({
			   url : "bomListAjax",
			   data : { "key" : key }
		   }).done(function(result){
			   bomGrid.resetData(result);
		   })
			
		   
	})
	
	bomGrid.on("click", function(e){
		var num = bomGrid.getValue(e.rowKey, "소요량");		
		$("#num").val(num);		
	})
	
	bomGrid.on("afterChange", ev =>{
		orgin: 'cell';               
    	var evn = ev.changes;
    	var bom = bomGrid.getValue(evn[0].rowKey, "BOM 코드");
    	var mcd = bomGrid.getValue(evn[0].rowKey, "원자재 코드");
    	var mNum = bomGrid.getValue(evn[0].rowKey, "소요량");
    	Swal.fire({
            title: 'BOM 변경을 완료하시겠습니까?',
            text: "다시 되돌릴 수 없습니다. 신중하세요.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소'
        }).then((result) => {
        	if (result.isConfirmed) {
    	    $.ajax({
    		url : "updateBom",
    		data : {
    				bom : bom,
    				mcd : mcd,
    				mNum : mNum
    				},
    		method : "POST"
    	}).done(function(a){
    		Swal.fire(
                    '승인이 완료되었습니다.',
                    '변경이 완료되었습니다.',
                    'success'
                ).then(function(){
              	  location.reload(true);	  
            	  });
    	});
        }else{
        	var num = $("#num").val();
            bomGrid.setValue(evn[0].rowKey, "소요량", num);
          	Swal.fire(
                    '승인이 취소되었습니다.',
                    '섹시하시네요~!',
                    'error'
                )
        }
       })        
	});
	
	//excel호출
	$('#excel').on('click',function(){
		const options = {
				  includeHiddenColumns: true,
				  onlySelected: true,
				  fileName: 'BOM조회',
				};
		bomGrid.export('xlsx', options);
	});
	
	//마우스 커서 올리면
	prodGrid.on('mouseover', function(e){
		var tt = e.targetType;
			if(tt == 'cell' ){			
				$('#prodGrid').attr("class", "smMouseOver");
			}else{
				$('#prodGrid').removeClass();
			}
	});
	
	bomGrid.on('mouseover', function(e){
		var cn = e.columnName;
		var tt = e.targetType;
			if(cn == '소요량' && tt == 'cell'){			
				$('#bomGrid').attr("class", "smMouseOver");
			}else{
				$('#bomGrid').removeClass();
			}
	});
  </script>

</body>



</html>