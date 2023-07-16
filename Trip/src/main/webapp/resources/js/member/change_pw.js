$('#changePwForm').validate({
	//true : 유효성 검사 성공 시에도 submit이 되지 않음.
	debug:false,
	
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
		var memId = document.getElementById('memId').value;
		var memNowPw = document.getElementById('memNowPw').value;
		var memNowPwChk = document.getElementById('memNowPwChk').value;
		var memPw = document.getElementById('memPw').value;
		$('#alertModal').modal('show');
		if(memNowPw == memNowPwChk){
			if(memNowPw == memPw){
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
						document.getElementById('btnOk').setAttribute('onClick', "location.href='/member/loginForm';");
				    },
				    error: function(){
				      //ajax 실행 실패 시 실행되는 구간
				       alert('실패');
				    }
				});
			}
		}
		else{
			document.getElementById('modalBody').innerText = "현재 비밀번호가 틀립니다. 비밀번호를 다시 입력해주세요.";
		}
	}
});
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
}function checkCapsLock3(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message3").innerText = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message3").innerText = ""
  }
}