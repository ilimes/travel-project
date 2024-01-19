<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/member/join.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="titleDiv" style="display: flex;">
				<h3 style="display: inline-block;">회원가입</h3>
				<div style="margin-left: auto; display: flex; align-items: center; font-size: 13.5px; color: #888;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16" style="margin-right: 5px;">
					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					<path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
				</svg>
				아래의 추가 정보를 입력해주세요.
			</div>
			</div>
			<form class="row g-3" action="/member/join" method="post" id="joinForm">
				<input type="hidden" id="memGender" value="${joinInfo.memGender }">
			   <div class="col-12">
			   	  <div><label for="inputEmail4" class="form-label">아이디</label></div>
				   <div class="row">
					   <div class="col-5">
						   <input type="text" class="form-control" name="memId" id="memId" value="${fn:split(joinInfo.memId, '@')[0] }" readonly>
					   </div>
					   <div class="col-1" style="display: flex; justify-content: center; align-items: center;">@</div>
					   <div class="col-6">
						   <input type="text" class="form-control" name="memIds" id="memEmail" readonly value="${fn:split(joinInfo.memId, '@')[1] }" >
					   </div>
				   </div>
			   </div>
			   <div class="col-12">
			      <label for="inputEmail4" class="form-label">비밀번호</label>
			      <div>
				      <input type="password" class="form-control" name="memPw" id="memPw" placeholder="비밀번호" onkeyup="checkCapsLock1(event)">
				      <div id='message1'style="color: red"></div>	
			      </div>
			   </div>
			   <div class="col-12">
			      <label for="inputEmail4" class="form-label">비밀번호 확인</label>
			   	  <div>
				      <input type="password" class="form-control" name="memPwChk" id="memPwChk" placeholder="비밀번호를 확인하기 위해 다시 입력해 주세요." onkeyup="checkCapsLock2(event)">
				      <div id='message2'style="color: red"></div>	
			      </div>
			   </div>
			   <div class="col-12">
			   	  <div><label for="inputEmail4" class="form-label">이름</label></div>
			     <div id="a1313">
					 <div>
						 ${joinInfo.memName }
					 </div>
				      <input type="text" class="form-control" name="memName" value="${joinInfo.memName }" readonly style="display: none;">
<%--				      <label for="inputCity" class="form-label">&nbsp;</label>--%>
				      <div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="width: 200px; display: none;">
						  <input type="radio" class="btn-check" name="memGender" id="btnradio1" autocomplete="off" value="남" onclick="return(false);" >
						  <label class="btn btn-outline-primary" for="btnradio1" style="padding: 0.275rem .75rem 0 0.85rem;" >남</label>
						  <input type="radio" class="btn-check" name="memGender" id="btnradio2" autocomplete="off" value="여" onclick="return(false);">
						  <label class="btn btn-outline-primary" for="btnradio2" style="padding: 0.275rem .75rem 0 0.85rem;" >여</label>
			     	  </div>
				</div>
			   </div>
				<div class="col-12">
					<label for="inputEmail4" class="form-label">성별</label>
					<div>
						${joinInfo.memGender }
					</div>
				</div>
			   <div class="col-12">
			      <label for="inputEmail4" class="form-label">생년월일</label>
				   <div>
					   ${joinInfo.memBirthday }
				   </div>
			      <div>
				      <input type="text" class="form-control" name="memBirthday" value="${joinInfo.memBirthday }" readonly style="display: none;">
			      </div>
			   </div>
			   <div class="col-9">
			      <label for="addr" class="form-label">주소</label>
			      <input type="text" class="form-control" name="memZipcode" id="memZipcode" onclick="sample4_execDaumPostcode();" placeholder="우편번호">
			   </div>
			   <div class="col-3 d-grid">
			      <label for="inputEmail5" class="form-label">&nbsp;</label>
			      <button type="button" class="btn btn-secondary" id="inputEmail5" onclick="sample4_execDaumPostcode();">우편번호 찾기</button>
			   </div>
			   <div class="col-12">
			      <input type="text" class="form-control" name="memAddr" id="memAddr" onclick="sample4_execDaumPostcode();" placeholder="주소">
			   </div>
			   <div class="col-12">
			      <input type="text" class="form-control" name="memAddrDetail" id="memAddrDetail" placeholder="상세주소를 입력하세요.">
			   </div>
			   <div class="col-12">
			   	  <div><label for="inputState" class="form-label">연락처</label></div>
			   	  <div>
				      <select id="inputState" class="form-select" name="memTells" style="display:inline-block; width:150px;" onchange="tellChkReset1();">
				         <option selected value="010">010</option>
				         <option value="011">011</option>
				      </select>
				      <input type="text" class="form-control" name="memTell1" id="memTell1" style="display:inline-block; width:140px;" onchange="tellChkReset1();">
				      <input type="text" class="form-control" name="memTell2" id="memTell2" style="display:inline-block; width:140px;" onchange="tellChkReset1();">
			   	  	  <button type="button" class="btn btn-secondary" id="tellChk" onclick="tellChk1();" style="width: 136px; height:38px;float: right;" >중복확인</button>
			   	  </div>
			   </div>
			   <div class="col-12 d-grid gap-2">
			      <button type="submit" class="btns" id="btnReg" style="margin-top: 30px; height: 50px;">회원가입</button>
			   </div>
			</form>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="/resources/js/member/validate_common.js" type="text/javascript"></script>
<script src="/resources/js/member/join.js?ver=5" type="text/javascript"></script>
</body>
</html>