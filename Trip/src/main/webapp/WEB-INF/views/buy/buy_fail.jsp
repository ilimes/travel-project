<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/buy/buy_fail.css" rel="stylesheet">
</head>
<body>
<div class="titleDiv">
	<h3>예약/결제</h3>
</div>
<div style="margin-top: 30px; text-align: center;">
	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
	</svg>
</div>
<div style="text-align: center; margin-top: 30px;"><h4>구매에 실패하였습니다.</h4></div>
<div style="text-align: center;">사유 : ${errorMsg }</div>
</body>
</html>