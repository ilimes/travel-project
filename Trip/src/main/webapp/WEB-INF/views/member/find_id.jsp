<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/member/find_id.css" rel="stylesheet">
</head>
<body>
<div class="loginForm">
	<h3>아이디/비밀번호를 잊어버리셨나요?</h3>
	<div class="isMember">
		<div class="left">아이디 찾기</div>
		<div class="right" onclick="location.href='/member/findPwForm';">비밀번호 찾기</div>
	</div>
	<form action="/member/findId" method="post" id="findIdForm">
		<div class="col-12">
		   	 <div><label for="inputEmail4" class="form-label">이름</label></div>
		     <div>
			      <input type="text" class="form-control" name="memName" id="memName" placeholder="이름을 입력해 주세요." style="display:inline-block; width:335px;">
			      <label for="inputCity" class="form-label">&nbsp;</label> 
			      <span class="btn-group" role="group" aria-label="Basic radio toggle button group" style="width: 150px;">
					  <input type="radio" class="btn-check" name="memGender" id="btnradio1" autocomplete="off" value="남" checked>
					  <label class="btn btn-outline-primary" for="btnradio1" style="padding: 0.275rem .75rem 0 0.85rem;">남</label>
					  <input type="radio" class="btn-check" name="memGender" id="btnradio2" autocomplete="off" value="여">
					  <label class="btn btn-outline-primary" for="btnradio2" style="padding: 0.275rem .75rem 0 0.85rem;">여</label>
		     	  </span>
			</div>
	   </div>
		<div class="col-12" >
			<label for="inputEmail4" class="form-label">생년월일</label> 
			<input type="text" class="form-control" name="memBirthday" id="memBirthday" placeholder="생년월일을 입력해 주세요.(예:19900101)">
		</div>
		<div class="col-12">
		   	  <div><label for="inputState" class="form-label">연락처</label></div>
		   	  <div>
			      <select id="inputState" class="form-select" name="memTells" style="display:inline-block; width:131px;">
			         <option selected value="010">010</option>
			         <option value="011">011</option>
			      </select>
			      <input type="text" class="form-control" name="memTell1" id="memTell1" style="display:inline-block; width:180px;">
			      <input type="text" class="form-control" name="memTell2" id="memTell2" style="display:inline-block; width:180px;">
		   	  </div>
	    </div>
		<div class="bottomDiv">
			<div class="d-grid gap-2 col-12 mx-auto">
			  <button class="btns" type="submit" style="margin-bottom: 30px;" >아이디 찾기</button>
			</div>
		</div>
	</form>
	<div style="color: red;" id="result_not"></div>
	<div id="result"></div>
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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="/resources/js/member/validate_common.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/member/find_id.js?ver=4"></script>
</body>
</html>