var isCertification = false;
function checkCapsLock1(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message1").innerText = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message1").innerText = ""
  }
}
function checkCapsLock2(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message2").innerText = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message2").innerText = ""
  }
}
function checkCapsLock3(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message3").innerText = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message3").innerText = ""
  }
}
function checkCapsLock4(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message4").innerText = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message4").innerText = ""
  }
}
function checkCapsLock5(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message5").innerText = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message5").innerText = ""
  }
}

function sample4_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  var roadAddr = data.roadAddress; // 도로명 주소 변수
				  document.getElementById("memZipcode").value = data.zonecode;
                  document.getElementById("memAddr").value = roadAddr;
                  
              }
          }).open();
}
function tellChk2()  {
		var tell = document.getElementById('inputState').value + '-' + document.getElementById('memTell1').value + '-' + document.getElementById('memTell2').value;
		$.ajax({
			url: '/member/selectTell', //요청경로
			type: 'post',
			data: {'memTell':tell}, //필요한 데이터 '데이터이름':값
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				$('#alertModal').modal('show');
				if(result == tell){
					document.getElementById('modalBody').innerText = '현재 연락처와 같은 연락처입니다.';
					isCertification = true;
				}else if(result != ''){
					document.getElementById('modalBody').innerText = '중복된 연락처입니다. 다른 연락처를 입력하세요.';
					isCertification = false;
				}
				else{
					document.getElementById('modalBody').innerText = '등록 가능한 연락처입니다.';
					isCertification = true;
				}
					
			},
			error: function() {
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
}
function tellChkReset2()  {
		isCertification = false;
}

$.fn.radioSelect = function(val) {
this.each(function() {
var $this = $(this);
if($this.val() == val)
$this.attr('checked', true);
});
return this;
};

var radioVal = document.getElementById('memGender').value;
$(":radio[name='memGender']").radioSelect(radioVal);

selectReadonly = function(val) {
	$("select[name='memTells'] option").each(function(index, element){
		if($(element).val() == val){
			$(element).attr('selected', true);	
		}
			return;
	});
}
var selectVal = document.getElementById('memTell0').value;

selectReadonly(selectVal);

$('#changeMemberInfoForm').validate({
	//true : 유효성 검사 성공 시에도 submit이 되지 않음.
	debug: false,
	
	//유효성 검사 대상 설정
	rules: {
		memName:{
			required: true,
			nameCk: true
		},
		memBirthday:{
			required: true,
			minlength: 8,
			maxlength: 8
		},
		memZipcode:{
			required: true
		},
		memAddrs:{
			required: true
		},
		memAddrDetail:{
			required: true
		},
		memTell1:{
			required: true
		},
		memTell2:{
			required: true
		}
	},
	//유효성 검사 실패 시 나타날 메세지 설정
	messages: {
		memName:{
			required: "이름을 입력해주세요.",
			nameCk: "한글 2 ~ 4자를 입력해주세요."
		},
		memBirthday:{
			required: "생년월일을 입력해주세요.(예:19900101)",
			minlength: "생년월일을 입력해주세요.(예:19900101)",
			maxlength: "생년월일을 입력해주세요.(예:19900101)"
		},
		memZipcode:{
			required: "우편번호를 입력해주세요."
		},
		memAddr:{
			required: "주소를 입력해주세요."
		},
		memAddrDetail:{
			required: "상세주소를 입력해주세요."
		},
		memTell1:{
			required: "연락처1을 입력해주세요."
		},
		memTell2:{
			required: "연락처2를 입력해주세요."
		}
	},
	//유효성 실패 시 추가할 태그(default:lable)
	errorElement: 'div',
	//유효성 검사 실패 시 메세지 출력 방식
	errorPlacement: function(error, element) {
		//element:유효성 검사 실패한 태그(input)
		//error:검사 실패 시 자동 추가되는 태그
		if($(element).attr('name') == 'memZipcode'){
			error.insertAfter($(element).closest("div").next());
		}
		else{
			error.insertAfter($(element).closest("div"));
		}
		error.css('color', 'red');
		//error.css('font-size', '12px');
	},
	//유효성 검사 실패 시 디자인
	highlight: function ( element, errorClass, validClass ) {
      $(element).addClass('is-invalid').removeClass('is-valid');
   },
   //유효성 검사 성공 시 디자인
   unhighlight: function (element, errorClass, validClass) {
      $(element).addClass('is-valid').removeClass('is-invalid');
   },
	//유효성 검사 성공 시 실행
	submitHandler: function(form) {
		//선택한 태그의 name 속성을 memTells로 변경
		if(isCertification == true){
			document.getElementById('memPwChgMemberInfo').value = '';
			$('#chgMemberInfoModal').modal('show');
		}else{
			$('#alertModal').modal('show');
			document.getElementById('modalBody').innerText = '중복확인을 해주세요.';
		}
		
	}
});

$('#chgMemberInfoPwForm').validate({
	//true : 유효성 검사 성공 시에도 submit이 되지 않음.
	debug: false,
	
	//유효성 검사 대상 설정
	rules: {
		memPwChgMemberInfo:{
			required: true,
			passwordCk: true
		}
	},
	//유효성 검사 실패 시 나타날 메세지 설정
	messages: {
		memPwChgMemberInfo:{
			required: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요.",
			passwordCk: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요."
		}
	},
	//유효성 실패 시 추가할 태그(default:lable)
	errorElement: 'div',
	//유효성 검사 실패 시 메세지 출력 방식
	errorPlacement: function(error, element) {
		//element:유효성 검사 실패한 태그(input)
		//error:검사 실패 시 자동 추가되는 태그
		error.insertAfter($(element).closest("div"));
		error.css('color', 'red');
		//error.css('font-size', '12px');
	},
	//유효성 검사 실패 시 디자인
	highlight: function ( element, errorClass, validClass ) {
      $(element).addClass('is-invalid').removeClass('is-valid');
   },
   //유효성 검사 성공 시 디자인
   unhighlight: function (element, errorClass, validClass) {
      $(element).addClass('is-valid').removeClass('is-invalid');
   },
	//유효성 검사 성공 시 실행
	submitHandler: function(form) {
		//선택한 태그의 name 속성을 memTells로 변경
		var memId = document.getElementById('memId').value + '@' + document.getElementById('memEmail').value;
		var memPw = document.getElementById('memPwChgMemberInfo').value;
		var memPwChk = document.getElementById('memNowPwChk').value;
		var memName = document.getElementById('memName').value;
		var memGender = $('input[name="memGender"]:checked').val();
		var memBirthday = document.getElementById('memBirthday').value;
		var memZipcode = document.getElementById('memZipcode').value;
		var memAddr = document.getElementById('memAddr').value;
		var memAddrDetail = document.getElementById('memAddrDetail').value;
		var memTell = document.getElementById('inputState').value + '-' + document.getElementById('memTell1').value + '-' +document.getElementById('memTell2').value;
      	
		$('#chgMemberInfoModal').modal('hide');
		
		if(memPw == memPwChk){
			$.ajax({
			    url: '/member/changeMemberInfo', //요청경로
			    type: 'post',
			    data:{'memId':memId, 'memPw':memPw, 'memName':memName, 'memGender':memGender, 'memBirthday':memBirthday, 'memZipcode':memZipcode, 'memAddr':memAddr, 'memAddrDetail': memAddrDetail, 'memTell': memTell}, //필요한 데이터 '데이터이름':값
			    success: function(result) {
			      //ajax 실행 성공 후 실행할 코드 작성
					$('#alertModal').modal('show');
					document.getElementById('modalBody').innerText = '회원정보가 변경되었습니다.';
					document.getElementById('btnOk').setAttribute('onClick', "location.href='/member/changeMemberInfoForm';");
			    },
			    error: function(){
			      //ajax 실행 실패 시 실행되는 구간
			       alert('실패');
			    }
			});
		}else{
			$('#alertModal').modal('show');
			document.getElementById('modalBody').innerText = '비밀번호가 일치하지 않습니다. 비밀번호를 다시 입력해주세요.';
			
		}
		
	}
});
$('#chgPwForm').validate({
	//true : 유효성 검사 성공 시에도 submit이 되지 않음.
	debug: false,
	
	//유효성 검사 대상 설정
	rules: {
		memNowPw:{
			required: true,
		},
		memPw:{
			required: true,
			passwordCk: true
		},
		memPwChk:{
			required: true,
			equalTo: '#memPw',
			passwordCk: true
		}
	},
	//유효성 검사 실패 시 나타날 메세지 설정
	messages: {
		memNowPw:{
			required: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요.",
		},
		memPw:{
			required: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요.",
			passwordCk: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요."
		},
		memPwChk:{
			required: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요.",
			equalTo: '입력하신 새 비밀번호가 일치하지 않습니다.',
			passwordCk: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요."
		}
	},
	//유효성 실패 시 추가할 태그(default:lable)
	errorElement: 'div',
	//유효성 검사 실패 시 메세지 출력 방식
	errorPlacement: function(error, element) {
		//element:유효성 검사 실패한 태그(input)
		//error:검사 실패 시 자동 추가되는 태그
		error.insertAfter($(element).closest("div"));
		error.css('color', 'red');
		//error.css('font-size', '12px');
	},
	//유효성 검사 실패 시 디자인
	highlight: function ( element, errorClass, validClass ) {
      $(element).addClass('is-invalid').removeClass('is-valid');
   },
   //유효성 검사 성공 시 디자인
   unhighlight: function (element, errorClass, validClass) {
      $(element).addClass('is-valid').removeClass('is-invalid');
   },
	//유효성 검사 성공 시 실행
	submitHandler: function(form) {
		//선택한 태그의 name 속성을 memTells로 변경
		var memId = document.getElementById('memId').value + '@' + document.getElementById('memEmail').value;
		var memNowPw = document.getElementById('memNowPw').value;
		var memPwChk = document.getElementById('memNowPwChk').value;
		var memPw = document.getElementById('memPw').value;
		
		$('#chgPwModal').modal('hide');
		if(memNowPw == memPwChk){
			if(memNowPw == memPw){
					$('#alertModal').modal('show');
					document.getElementById('modalBody').innerText = '현재 비밀번호와 새 비밀번호가 같습니다. 새 비밀번호를 다시 입력해주세요.';			
			}else{
					$.ajax({
					    url: '/member/changePw', //요청경로
					    type: 'post',
					    data:{'memId':memId, 'memPw':memPw}, //필요한 데이터 '데이터이름':값
					    success: function(result) {
					      //ajax 실행 성공 후 실행할 코드 작성
					      	$('#alertModal').modal('show');
							document.getElementById('modalBody').innerText = '비밀번호가 변경되었습니다.';
							document.getElementById('btnOk').setAttribute('onClick', "location.href='/member/changeMemberInfoForm';");
					    },
					    error: function(){
					      //ajax 실행 실패 시 실행되는 구간
					       alert('실패');
					    }
					});
				}
			}
			else{
				$('#alertModal').modal('show');
				document.getElementById('modalBody').innerText = '현재 비밀번호가 틀립니다. 비밀번호를 다시 입력해주세요.';			
			}
		
	}
});
$('#deactivateMemberPwForm').validate({
	//true : 유효성 검사 성공 시에도 submit이 되지 않음.
	debug: false,
	
	//유효성 검사 대상 설정
	rules: {
		memPwDeactivate:{
			required: true,
			passwordCk: true
		}
	},
	//유효성 검사 실패 시 나타날 메세지 설정
	messages: {
		memPwDeactivate:{
			required: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요.",
			passwordCk: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요."
		}
	},
	//유효성 실패 시 추가할 태그(default:lable)
	errorElement: 'div',
	//유효성 검사 실패 시 메세지 출력 방식
	errorPlacement: function(error, element) {
		//element:유효성 검사 실패한 태그(input)
		//error:검사 실패 시 자동 추가되는 태그
		error.insertAfter($(element).closest("div"));
		error.css('color', 'red');
		//error.css('font-size', '12px');
	},
	//유효성 검사 실패 시 디자인
	highlight: function ( element, errorClass, validClass ) {
      $(element).addClass('is-invalid').removeClass('is-valid');
   },
   //유효성 검사 성공 시 디자인
   unhighlight: function (element, errorClass, validClass) {
      $(element).addClass('is-valid').removeClass('is-invalid');
   },
	//유효성 검사 성공 시 실행
	submitHandler: function(form) {
		//선택한 태그의 name 속성을 memTells로 변경
		var memId = document.getElementById('memId').value + '@' + document.getElementById('memEmail').value;
		var memPw = document.getElementById('memPwDeactivate').value;
		var memPwChk = document.getElementById('memNowPwChk').value;
		$('#deactivateMemberModal').modal('hide');
		if(memPw == memPwChk){
			$.ajax({
			    url: '/member/deactivateMember', //요청경로
			    type: 'post',
			    data:{'memId':memId}, //필요한 데이터 '데이터이름':값
			    success: function(result) {
			      //ajax 실행 성공 후 실행할 코드 작성
					document.getElementById('modalBody').innerText = '회원탈퇴를 완료되었습니다.';
					document.getElementById('btnOk').setAttribute('onClick', "location.href='/item/mainPage';");
					document.getElementById('btnOk').value = '메인';
			      	$('#alertModal').modal('show');
			    },
			    error: function(){
			      //ajax 실행 실패 시 실행되는 구간
			       alert('실패');
			    }
			});
		}else{
			document.getElementById('modalBody').innerText = '비밀번호가 일치하지 않습니다. 비밀번호를 다시 입력해주세요.';
			$('#alertModal').modal('show');
		}
		
	}
});

function chgPwModal(){
	document.getElementById('memNowPw').value = '';
	document.getElementById('memPwChk').value = '';
	document.getElementById('memPw').value = '';
	$('#chgPwModal').modal('show');
}

function deactivateMemberModal(){
	document.getElementById('memPwDeactivate').value = '';
	$('#deactivateMemberModal').modal('show');
}