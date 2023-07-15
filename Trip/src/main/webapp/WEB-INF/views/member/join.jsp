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
		<div class="col-md-9">
			<div class="titleDiv">
				<h3>회원가입</h3>
			</div>
			<form class="row g-3" action="/member/join" method="post" id="joinForm">
				<input type="hidden" id="memGender" value="${joinInfo.memGender }">
			   <div class="col-10">
			   	  <div><label for="inputEmail4" class="form-label">아이디</label></div>
			   	  <div>
				      <input type="text" class="form-control" name="memId" id="memId" style="display:inline-block; width:230px;" value="${fn:split(joinInfo.memId, '@')[0] }" readonly>
				       <span style="margin: 0 10px 0 10px;">@</span>
				      	<input type="text" class="form-control" name="memIds" id="memEmail" readonly value="${fn:split(joinInfo.memId, '@')[1] }" style="display:inline-block; width:215px; margin-right: 15px;">
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
				      <input type="text" class="form-control" name="memName" value="${joinInfo.memName }" readonly style="display:inline-block; width:687px;">
				      <label for="inputCity" class="form-label">&nbsp;</label>
				      <div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="width: 200px;">
						  <input type="radio" class="btn-check" name="memGender" id="btnradio1" autocomplete="off" value="남" onclick="return(false);" >
						  <label class="btn btn-outline-primary" for="btnradio1" style="padding: 0.275rem .75rem 0 0.85rem;" >남</label>
						  <input type="radio" class="btn-check" name="memGender" id="btnradio2" autocomplete="off" value="여" onclick="return(false);">
						  <label class="btn btn-outline-primary" for="btnradio2" style="padding: 0.275rem .75rem 0 0.85rem;" >여</label>
			     	  </div>
				</div>
			   </div>
			   <div class="col-12">
			      <label for="inputEmail4" class="form-label">생년월일</label>
			      <div>
				      <input type="text" class="form-control" name="memBirthday" value="${joinInfo.memBirthday }" readonly>
			      </div>
			   </div>
			   <div class="col-3">
			      <label for="addr" class="form-label">주소</label>
			      <input type="text" class="form-control" name="memZipcode" id="memZipcode" onclick="sample4_execDaumPostcode();" placeholder="우편번호">
			   </div>
			   <div class="col-2 d-grid">
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
				      <select id="inputState" class="form-select" name="memTells" style="display:inline-block; width:241px;" onchange="tellChkReset1();">
				         <option selected value="010">010</option>
				         <option value="011">011</option>
				      </select>
				      <input type="text" class="form-control" name="memTell1" id="memTell1" style="display:inline-block; width:250px;" onchange="tellChkReset1();">
				      <input type="text" class="form-control" name="memTell2" id="memTell2" style="display:inline-block; width:250px;" onchange="tellChkReset1();">
			   	  	  <button type="button" class="btn btn-secondary" id="tellChk" onclick="tellChk1();" style="width: 150px; height:38px;float: right;" >중복확인</button>
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