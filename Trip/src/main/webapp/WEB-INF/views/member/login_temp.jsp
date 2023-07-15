<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/member/login_temp.css" rel="stylesheet">
</head>
<body>
<div class="loginForm">
	<h2>Login</h2>
	<div class="isMember">
		<div class="left" onclick="location.href='/member/loginForm';">회원 로그인</div>
		<div class="right">비회원 예약조회</div>
	</div>
	<form action="/member/loginTemp" method="post" id="loginTempForm">
		<div class="txt">
			<input type="text" id="tempEmail" name="tempEmail" placeholder="이메일" onkeydown="if (event.keyCode == 13) { loginTempSubmit(); }">
		</div>
		<div class="nameNull" id="nameNull" style="color: red;"></div>
		<div class="txt">
			<input type="text" id="bookNum" name="bookNum" placeholder="예약번호" onkeydown="if (event.keyCode == 13) { loginTempSubmit(); }">
		</div>
		<div class="numNull	" id="numNull" style="color: red"></div>
		<div class="d-grid gap-2 col-12 mx-auto">
		  <button class="btns btn-primary" type="button" onclick="loginTempSubmit();">예약조회</button>
		</div>
	</form>
</div>
<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="modalBody"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" data-bs-dismiss="modal" id="btnOk" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">확인</button>
      </div>
    </div>
  </div>
</div>
<script src="/resources/js/member/login_temp.js" type="text/javascript"></script>
</body>
</html>