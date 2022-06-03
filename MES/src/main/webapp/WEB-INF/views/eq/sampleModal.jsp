<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</script>
</head>
<body>
<div class="m-4">
    <!-- Button HTML (to Trigger Modal) -->
    <button type="button" id="myBtn" class="btn btn-lg btn-primary">Go to The HOME</button>

    <!-- Modal HTML -->
    <div id="myModal" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">HOME INCOMING</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                <button id="appendBtn">appendBtn</button>
				<button id="prependBtn">prependBtn</button>
				<div id="grid"></div>   
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" id = "btnSav" class="btn btn-primary" >Save changes</button>	 <!-- 사용시 필히 onclick 이용 onclick="location.href='/board'"  -->
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
  const grid = new tui.Grid({
    el: document.getElementById('grid'),
    data: gridData,
    columns: [
      {
        header: 'Name',
        name: 'name'
      },
      {
        header: 'Artist',
        name: 'artist'
      },
      {
        header: 'Type',
        name: 'type'
      },
      {
        header: 'Release',
        name: 'release'
      },
      {
        header: 'Genre',
        name: 'genre'
      }
    ],
    rowHeaders: ['rowNum'],
    pageOptions: {
      useClient: true,
      perPage: 5
    }
  });

  const appendBtn = document.getElementById('appendBtn');
  const prependBtn = document.getElementById('prependBtn');

  const appendedData = {
    name: 'Music',
    artist: 'Lee',
    type: 'Deluxe',
    release: '2019.09.09',
    genre: 'Pop'
  };

  appendBtn.addEventListener('click', () => {
    grid.appendRow(appendedData);
  });

  prependBtn.addEventListener('click', () => {
    grid.prependRow(appendedData);
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
  $("#myBtn").click(function(){
      $("#myModal").modal("show");

  });
  $('body').css("overflow", "hidden");		

  
  var myModal = document.getElementById('myModal')


  myModal.addEventListener('shown.bs.modal', function () {
	  //ajax 호출
	  //grid.resetData(data)
	
      grid.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
  })
  
  
</script>

</html>