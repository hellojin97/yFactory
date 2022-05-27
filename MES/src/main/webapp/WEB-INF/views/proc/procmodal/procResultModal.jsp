<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
//생산 지시 목록
$.ajax({
	url: "",
	method : "GET",
	dataType : "JSON",
	success : function(result){
		procOrderList.resetData(result);
	}
});

var procOrderList = new tui.Grid({
el: document.getElementById('procOrderList'),
columns: [
  {
    header: '생산지시코드',
    name: '생산지시코드'
  },
  {
    header: '제품명',
    name: '제품명'
  },
  {
    header: '생산수량',
    name: '생산수량'
  },
  {
    header: '지시일자',
    name: '지시일자'
  }
],
rowHeaders : [ 'rowNum' ]

});
</script>
</body>
</html>