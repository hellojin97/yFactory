<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicons -->
<link href="${pageContext.request.contextPath}/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Allan&display=swap"
	rel="stylesheet">

<!-- CSS -->
<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">
<!-- Toast UI AND Modal -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-grid.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/toast/css/tui-pagination.css" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script
	src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.js"></script>
<script
	src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>


<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">

<!-- END CSS -->

<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>

</head>
<body>


	<!-- 채팅모달  -->
	<div id="myModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">Chat</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="container">
						<h1 class="page-header">Chat</h1>

						<table class="table table-bordered">
							<tr>
								<td><input type="text" name="user" id="user"
									class="form-control" placeholder="유저명"></td>
								<td>
									<button type="button" class="btn btn-default" id="btnConnect">연결</button>
									<button type="button" class="btn btn-default"
										id="btnDisconnect" disabled>종료</button>
								</td>
							</tr>
							<tr>
								<td colspan="2"><div id="list" style="height: 300px;"></div></td>
							</tr>
							<tr>
								<td colspan="2"><input type="text" name="msg" id="msg"
									placeholder="대화 내용을 입력하세요." class="form-control" disabled></td>
							</tr>
						</table>

					</div>
				</div>
				<!-- 내용끝 -->

			</div>
		</div>
	</div>



</body>
<script>
	//채팅 서버 주소
	let url = "ws://192.168.0.20/mes/chatserver";

	// 웹 소켓
	let ws;

	// 연결하기
	$('#btnConnect').click(function() {

		// 유저명 확인
		if ($('#user').val().trim() != '') {
			// 연결
			ws = new WebSocket(url);

			// 소켓 이벤트 매핑
			ws.onopen = function(evt) {
				// console.log('서버 연결 성공');
				print($('#user').val(), '입장했습니다.');

				// 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
				// -> 1#유저명
				ws.send('1#' + $('#user').val() + '#');

				$('#user').attr('readonly', true);
				$('#btnConnect').attr('disabled', true);
				$('#btnDisconnect').attr('disabled', false);
				$('#msg').attr('disabled', false);
				$('#msg').focus();
			};

			ws.onmessage = function(evt) {
				// print('', evt.data);
				let index = evt.data.indexOf("#", 2);
				let no = evt.data.substring(0, 1);
				let user = evt.data.substring(2, index);
				let txt = evt.data.substring(index + 1);

				if (no == '1') {
					print2(user);
				} else if (no == '2') {
					print(user, txt);
				} else if (no == '3') {
					print3(user);
				}
				$('#list').scrollTop($('#list').prop('scrollHeight'));
			};

			ws.onclose = function(evt) {
				console.log('소켓이 닫힙니다.');
			};

			ws.onerror = function(evt) {
				console.log(evt.data);
			};
		} else {
			alert('유저명을 입력하세요.');
			$('#user').focus();
		}
	});

	// 메세지 전송 및 아이디
	function print(user, txt) {
		let temp = '';
		temp += '<div style="margin-bottom:3px;">';
		temp += '[' + user + ']  >    ';
		temp += txt;
		temp += ' <span style="font-size:11px;color:#777;">'
				+ new Date().toLocaleTimeString() + '</span>';
		temp += '</div>';

		$('#list').append(temp);
	}

	// 다른 client 접속		
	function print2(user) {
		let temp = '';
		temp += '<div style="margin-bottom:3px;">';
		temp += "'" + user + "' 이(가) 접속했습니다.";
		temp += ' <span style="font-size:11px;color:#777;">'
				+ new Date().toLocaleTimeString() + '</span>';
		temp += '</div>';

		$('#list').append(temp);
	}

	// client 접속 종료
	function print3(user) {
		let temp = '';
		temp += '<div style="margin-bottom:3px;">';
		temp += "'" + user + "' 이(가) 종료했습니다.";
		temp += ' <span style="font-size:11px;color:#777;">'
				+ new Date().toLocaleTimeString() + '</span>';
		temp += '</div>';

		$('#list').append(temp);
	}

	$('#user').keydown(function() {
		if (event.keyCode == 13) {
			$('#btnConnect').click();
		}
	});

	$('#msg').keydown(function() {
		if (event.keyCode == 13) {

			//서버에게 메시지 전달
			//2#유저명#메시지
			ws.send('2#' + $('#user').val() + '#' + $(this).val());
			//서버에게
			print($('#user').val(), $(this).val());
			//본인 대화창에

			$('#msg').val('');
			$('#msg').focus();

		}
	});

	$('#btnDisconnect').click(function() {
		ws.send('3#' + $('#user').val() + '#');
		ws.close();

		$('#user').attr('readonly', false);
		$('#user').val('');

		$('#btnConnect').attr('disabled', false);
		$('#btnDisconnect').attr('disabled', true);

		$('#msg').val('');
		$('#msg').attr('disabled', true);
	});
	

</script>

<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</html>