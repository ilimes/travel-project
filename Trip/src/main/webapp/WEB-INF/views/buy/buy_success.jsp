<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/buy/buy_success.css" rel="stylesheet">
</head>
<body>
<div class="titleDiv">
	<h3>예약/결제</h3>
</div>
<div style="text-align: center; margin-top: 30px;"><h4>성공적으로 패키지 구매가 완료되었습니다. 이용해주셔서 감사합니다 :)</h4></div>
<div style="text-align: center;">구매 패키지 코드 : ${buyVO.itemCode }</div>
<div style="text-align: center;"><strong>예약번호 : ${buyVO.bookNum }</strong></div>
<div class="btnDiv">
	<c:if test="${buyVO.temp eq '0'}">
	<div class="btns" onclick="location.href='/member/myInfo';" style="margin-right: 30px;">마이 페이지로 이동</div>
	</c:if>
	<c:if test="${buyVO.temp eq '1'}">
	<div class="btns" onclick="location.href='/member/loginTempForm';" style="margin-right: 30px;">비회원 예약조회로 이동</div>
	</c:if>
	<div class="btns" onclick="location.href='/item/mainPage';">메인 페이지로 이동</div>
</div>
</body>
</html>