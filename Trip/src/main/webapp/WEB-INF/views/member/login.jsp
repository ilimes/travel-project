<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/member/login.css" rel="stylesheet">
</head>
<body>
<div class="loginForm">                               
	<h2>Login</h2>
	<div class="isMember">
		<div class="left">회원 로그인</div>
		<div class="right" onclick="location.href='/member/loginTempForm';">비회원 예약조회</div>
	</div>
	<form action="/member/login" method="post" id="loginForm" onsubmit="return false">
		<div class="txt">
			<input type="text" id="memId" name="memId" placeholder="아이디(이메일)">
		</div>
		<div class="txt">
			<input type="password" id="memPw" name="memPw" placeholder="비밀번호" onkeyup="checkCapsLock(event)">
		</div>
		<div id='message' style="color: red"></div>	
		<div class="form-check form-switch">
		  <input class="form-check-input" type="checkbox" role="switch" name="saveId" id="saveId" checked>
		  <label class="form-check-label" for="flexSwitchCheckChecked">아이디 저장</label>
		</div>
		<div class="d-grid gap-2 col-12 mx-auto">
		  <button class="btns btn-primary" type="submit" id="btnLogin" style="padding: 0;" >로그인</button>
		</div>
	</form>
	<div class="bottomDiv">
		<a href="/member/findIdForm">아이디 찾기</a>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dot" viewBox="0 0 16 16">
			<path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
		</svg>
		<a href="/member/findPwForm">비밀번호 찾기</a>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dot" viewBox="0 0 16 16">
  			<path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
		</svg>
		<a href="/member/certiJoinForm">회원가입</a>
	</div>
</div>
<div class="modal fade" id="alertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="/resources/js/member/validate_common.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/member/login.js?ver=4"></script>
</body>
</html>