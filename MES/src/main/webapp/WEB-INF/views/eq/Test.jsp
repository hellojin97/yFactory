<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<style type="text/css">
button {
size : 30px;
}

</style>


</head>
<body>

<div class="timepicker"></div>
<input type="button" value="팝업테스트" onclick="goPopUp()">

</body>
<script >
$('.timepicker').timepicker({
    timeFormat: 'h:mm p',
    interval: 60,
    minTime: '10',
    maxTime: '6:00pm',
    defaultTime: '11',
    startTime: '10:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});

function goPopUp(){
	window.open("popup", "a", "left=100, top=50");
}



</script>
</html>

