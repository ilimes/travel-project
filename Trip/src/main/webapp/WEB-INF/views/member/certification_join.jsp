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
	<h3>회원가입을 위해 본인인증을 해 주세요.</h3>
	<form action="" method="post" id="certiJoinForm" onsubmit="return false;">
		<div class="col-12 removeParent">
			<div class="col-12">
				   	  <div><label for="inputEmail4" class="form-label">이름</label></div>
				     <div>
					      <input type="text" class="form-control" name="memName" id="memName" placeholder="이름을 입력해주세요." style="display:inline-block; width:335px;">
					      <label for="inputCity" class="form-label">&nbsp;</label> 
					      <span class="btn-group" role="group" aria-label="Basic radio toggle button group" style="width: 150px; height: 38px;">
							  <input type="radio" class="btn-check" name="memGender" id="btnradio1" autocomplete="off" value="남" checked>
							  <label class="btn btn-outline-primary" for="btnradio1" style="padding: 0.275rem .75rem 0 0.85rem;">남</label>
							  <input type="radio" class="btn-check" name="memGender" id="btnradio2" autocomplete="off" value="여">
							  <label class="btn btn-outline-primary" for="btnradio2" style="padding: 0.275rem .75rem 0 0.85rem;">여</label>
				     	  </span>
					</div>
		   </div>
		   <div class="col-12" >
				<label for="inputEmail4" class="form-label">생년월일</label> 
				<input type="text" class="form-control" name="memBirthday" id="memBirthday" placeholder="생년월일을 입력해주세요.(예:19900101)">
			</div>
			<div class="col-12">
				<div style="display: inline-block;"><label for="inputEmail4" class="form-label">이메일(아이디)</label></div> 
				<div>
				      <input type="text" class="form-control" name="memId" id="memId" style="display:inline-block; width:184px;" onkeyup="idChkReset();" placeholder="이메일을 입력해주세요.">
				       <span style="margin: 0 10px 0 10px;">@</span>
				      	<input type="text" class="form-control" name="memEmail" id="memEmail" readonly value="naver.com" style="display:inline-block; width:115px; margin-right: 15px;" onkeyup="idChkReset();">
				      <select style="width:130px; height: 36px; margin-right:10px; " name="selectEmail" id="selectEmail" onchange="idChkReset();">
				       	<option value="naver.com" selected>naver.com</option>
				       	<option value="hanmail.net">hanmail.net</option>
				       	<option value="nate.com">nate.com</option>
				       	<option value="gmail.com">gmail.com</option>
				       	<option value="1">직접입력</option> 
				      </select>
			   	 </div>
				<div style="display: block;">
					<button type="submit" class="btn btn-secondary" id="idChkBtn" style="margin-top: 15px; width: 155px; height:38px;">중복확인</button>
		       		<button type="button" class="btn btn-secondary" id="sendNum" onclick="sendNum1();" style="width: 155px; height:38px; margin-top: 15px; float: right;" disabled>인증번호 요청하기</button>
				</div>
				
			</div>
		</div>
		</form>
		<form action="" id="certiJoinForm2" style="margin-top:50px;">
		<div class="col-12">
			<div><label for="inputEmail4" class="form-label">인증번호</label></div>
			<div style="position:relative; display: inline-block; width: 335px; height: 38px;" >
				<input type="text" class="form-control" name="memCertiNum" id="memCertiNum" placeholder="인증번호를 입력해 주세요." style="width: 100%; height:100%; font-size:1em;">
				<span id="timer" style="position:relative; width: 100px; height:38px; left:60%; top:-80%;" ></span>
			</div>
			<div style="display: inline-block; float: right;">
	       		<button type="submit" class="btn btn-secondary" id="btnChk"  style="width: 155px; height:38px;	 position: relative;" disabled>인증하기</button>
			</div>
		</div>
		</form>
		<div class="bottomDiv">
			<div class="d-grid gap-2 col-12 mx-auto">
			  <button class="btns" type="button" id="certiJoin" onclick="certiJoin();" >다음</button>
			</div>
		</div>
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
        <button type="button" class="btns" data-bs-dismiss="modal" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">확인</button>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="/resources/js/member/validate_common.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/member/certification_join.js?ver=2"></script>
</body>
</html>