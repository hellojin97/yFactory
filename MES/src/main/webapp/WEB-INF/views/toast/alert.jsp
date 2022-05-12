<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10" ></script>
<title>Insert a here</title>
</head>
<body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<button id="alertSuccess">AlertSuccess 실행</button>
<button id="alertFail">AlertFail 실행</button>
<button id="confirmStart">confirm 실행</button>
<script>
$().ready(function () {
    $("#confirmStart").click(function () {
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
        	console.log(result.isConfirmed); // 승인시 FALSE / 취소시 TRUE
            if (result.isConfirmed) {
                Swal.fire(
                    '승인이 완료되었습니다.',
                    '화끈하시네요~!',
                    'success'
                )
                
            }else{
            	Swal.fire(
                        '승인이 취소되었습니다.',
                        '섹시하시네요~!',
                        'error'
                    )
            }
        })
    });
        $("#alertSuccess").click(function () {
            Swal.fire({
                icon: 'success',
                title: 'Alert가 실행되었습니다.',
                text: '이곳은 내용이 나타나는 곳입니다.',
            });
        });
        $("#alertFail").click(function () {
            Swal.fire({
                icon: 'error',
                title: 'Alert가 취소되었습니다.',
                text: '이곳은 내용이 나타나는 곳입니다.',
            });
        });
        

});
</script>
</body>
</html>