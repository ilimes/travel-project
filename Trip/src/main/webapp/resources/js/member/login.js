$('#loginForm').validate({
	//true : 유효성 검사 성공 시에도 submit이 되지 않음.
	debug:false,
	
	//유효성 검사 대상 설정
	rules: {
		memId: { //input 태그의 name 속성으로 검사 대상을 지정
			required: true,
			email: true
		},
		memPw:{
			required: true,
			passwordCk: true
		}
	},
	//유효성 검사 실패 시 나타날 메세지 설정
	messages: {
		memId: { //input 태그의 name 속성으로 검사 대상을 지정
			required: "아이디를 이메일 주소 형식으로 입력해주세요.",
			email: "아이디를 이메일 주소 형식으로 입력해주세요."
		},
		memPw:{
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
		var id = document.getElementById('memId').value;
		var pw = document.getElementById('memPw').value	;
		$.ajax({
			url: '/member/login', //요청경로
			type: 'post',
			data: {'memId':id, 'memPw':pw}, //필요한 데이터 '데이터이름':값
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				$('#alertModal').modal('show');
				if(result == 'deactivate'){
					document.getElementById('modalBody').innerText = '탈퇴한 회원입니다.';
				}else if(result != ''){
					document.getElementById('modalBody').innerText = result + '님 환영합니다.';
					//location.href = '/item/mainPage';
					document.getElementById('btnOk').setAttribute('onClick', "location.href = '/item/mainPage';");
				}
				else{
					document.getElementById('modalBody').innerText = '아이디 또는 비밀번호를 잘못 입력하셨습니다.';
				}
					
			},
			error: function() {
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	}
});

var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
$("input[name='memId']").val(userInputId);

if ($("input[name='memId']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
	// 아이디 저장하기 체크되어있을 시,
	$("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
}

$("#saveId").change(function() { // 체크박스에 변화가 발생시
	if ($("#saveId").is(":checked")) { // ID 저장하기 체크했을 때,
		var userInputId = $("input[name='memId']").val();
		setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	} else { // ID 저장하기 체크 해제 시,
		deleteCookie("userInputId");
	}
});

// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
$("input[name='memId']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
	if ($("#saveId").is(":checked")) { // ID 저장하기를 체크한 상태라면,
		var userInputId = $("input[name='memId']").val();
		setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	}
});

function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value)
		+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires="
		+ expireDate.toGMTString();
}

function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1)
			end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}

function checkCapsLock(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message").innerText = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message").innerText = ""
  }
}