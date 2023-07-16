isChk = false;
$('#selectEmail').change(function(){
	 $("#selectEmail option:selected").each(function () {
		 if($(this).val()== '1'){
			 	$("#memEmail").val('');
			 	$("#memEmail").attr("readonly",false);
		 }else{ 
				$("#memEmail").val($(this).text());
				$("#memEmail").attr("readonly",true);
		 }
  }); 
});

$('#joinForm').validate({
	//true : 유효성 검사 성공 시에도 submit이 되지 않음.
	debug: false,
	
	//유효성 검사 대상 설정
	rules: {
		memId: { //input 태그의 name 속성으로 검사 대상을 지정
			required: true,
			idCk: true
		},
		memPw:{
			required: true,
			passwordCk: true
		},
		memPwChk:{
			required: true,
			equalTo: '#memPw',
			passwordCk: true
		},
		memName:{
			required: true,
			nameCk: true
		},
		memBirthday:{
			required: true,
			minlength: 8,
			maxlength: 8
		},
		memAddr:{
			required: true
		},
		memAddrDetail:{
			required: true
		},
		memTell2:{
			required: true
		},
		memTell1:{
			required: true
		}
	},
	//유효성 검사 실패 시 나타날 메세지 설정
	messages: {
		memId: { //input 태그의 name 속성으로 검사 대상을 지정
			required: "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.",
			idCk: "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다."
		},
		memPw:{
			required: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요.",
			passwordCk: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요."
		},
		memPwChk:{
			required: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요.",
			equalTo: '입력하신 비밀번호가 일치하지 않습니다.',
			passwordCk: "8~16자 영문 대소문자, 숫자, 특수문자를 최소 1개 이상 사용하세요."
		},
		memName:{
			required: "한글 2 ~ 4자를 입력해주세요.",
			nameCk: "한글 2 ~ 4자를 입력해주세요."
		},
		memBirthday:{
			required: "생년월일을 입력해주세요.(예:19900101)",
			minlength: "생년월일을 입력해주세요.(예:19900101)",
			maxlength: "생년월일을 입력해주세요.(예:19900101)"
		},
		memAddr:{
			required: "주소를 입력해주세요."
		},
		memAddrDetail:{
			required: "상세주소를 입력해주세요."
		},
		memTell2:{
			required: "연락처 뒷자리를 입력해주세요."
		},
		memTell1:{
			required: "연락처 앞자리를 입력해주세요."
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
		$('#memId').attr('name', 'memIds');
		$('#memTell1').attr('name', 'memTells');
		$('#memTell2').attr('name', 'memTells');
		if(isChk){
			form.submit();   //유효성 검사를 통과시 전송
		}else{
			$('#alertModal').modal('show');
			document.getElementById('modalBody').innerText = '연락처 중복확인이 되지 않습니다. 중복확인을 해주세요.';
		}
	}
});

function sample4_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  var roadAddr = data.roadAddress; // 도로명 주소 변수
				  document.getElementById("memZipcode").value = data.zonecode;
                  document.getElementById("memAddr").value = roadAddr;
                  
              }
          }).open();
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


function checkCapsLock1(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message1").innerText = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message1").innerText = ""
  }
}function checkCapsLock2(event)  {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("message2").innerText = "Caps Lock이 켜져 있습니다."
  }else {
    document.getElementById("message2").innerText = ""
  }
}
function tellChk1()  {
		var tell = document.getElementById('inputState').value + '-' + document.getElementById('memTell1').value + '-' + document.getElementById('memTell2').value;
		$.ajax({
			url: '/member/selectTell', //요청경로
			type: 'post',
			data: {'memTell':tell}, //필요한 데이터 '데이터이름':값
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				$('#alertModal').modal('show');
				if(result){
					document.getElementById('modalBody').innerText = '중복된 연락처입니다. 다른 연락처를 입력하세요.';
				}
				else{
					document.getElementById('modalBody').innerText = '회원가입 가능한 연락처입니다.';
					isChk = true;					
				}
					
			},
			error: function() {
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
}
function tellChkReset1()  {
		isChk = false;
}