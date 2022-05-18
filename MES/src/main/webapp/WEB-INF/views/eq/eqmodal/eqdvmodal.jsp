<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/toast/data/dummy.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


</head>
<body>
<div class="m-4">
   

    <!-- Modal HTML -->
    <div id="myModal" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">설비 구분</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                
                <div class="modal-body">
					<div id="grid"></div>
				   
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
$(function(){
	const url = "/getEqDivList";
	$.ajax(url , {
		 dataType : "JSON",
		success:function(){ alert("데이터 접속 성공!"); }
		
	}).done(function(rs){
		grid.resultData(rs);
		console.log(rs);
	})
	
  const grid = new tui.Grid({
    el: document.getElementById('grid'),
	scrollX: false,
    scrollY: false,
    data: gridData,
    columns: [
      
    	{
        header: '설비코드',
        name: 'eq_cd'
      },
      
      {
        header: '설비명',
        name: 'eq_nm'
      }
      
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 5
    }
  });

  
  
  setTimeout(function(){
		grid.refreshLayout();
	},300)
   
})
</script>

</html>