var timer = null;
var isRunning = false;
var isCertification = false;
var radio1 = document.getElementById('btnradio1');
var radio2 = document.getElementById('btnradio2');

$('#findPwForm').validate({
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
		memId:{
			required: true,
			email: true
		},
		memTell1:{
			required: true,
			tellCK: true
		},
		memTell2:{
			required: true,
			tell2CK: true
		}
	},
	//유효성 검사 실패 시 나타날 메세지 설정
	messages: {
		memName:{
			required: "한글 2~4자를 입력해주세요.",
			nameCk: "한글 2~4자를 입력해주세요."
		},
		memBirthday:{
			required: "생년월일을 입력해주세요.(예:19900101)",
			minlength: "생년월일을 입력해주세요.(예:19900101)",
			maxlength: "생년월일을 입력해주세요.(예:19900101)"
		},
		memId: { 
			required: "아이디를 이메일 주소 형식으로 입력해주세요.",
			email: "아이디를 이메일 주소 형식으로 입력해주세요."
		},
		memTell1:{
			required: "연락처 앞자리를 입력해주세요.",
			tellCK: "연락처 앞자리를 입력해주세요."
		},
		memTell2:{
			required: "연락처 뒷자리를 입력해주세요.",
			tell2CK: "연락처 뒷자리를 입력해주세요."
		}
	},
	//유효성 실패 시 추가할 태그(default:lable)
	errorElement: 'div',
	//유효성 검사 실패 시 메세지 출력 방식
	errorPlacement: function(error, element) {
		//element:유효성 검사 실패한 태그(input)
		//error:검사 실패 시 자동 추가되는 태그
		
		if($(element).attr('name') == 'memId'){
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
		var memName = document.getElementById('memName').value;
		var memGender = $('input[name="memGender"]:checked').val();
		var memBirthday = document.getElementById('memBirthday').value;
		var memTell = document.getElementById('inputState').value + '-' + document.getElementById('memTell1').value + '-' + document.getElementById('memTell2').value;
		var memId = document.getElementById('memId').value;
		var display = $('#timer');
		var leftSec = 180;
		$.ajax({
		    url: '/member/findId', //요청경로
		    type: 'post',
		    data:{'memName':memName, 'memGender':memGender, 'memBirthday':memBirthday, 'memTell':memTell}, //필요한 데이터 '데이터이름':값
		    success: function(result) {
		      //ajax 실행 성공 후 실행할 코드 작성
		        if (result == memId){
					if($('#sendNum').html() == "재요청"){
						$('#btnChk').attr("disabled",true);
						$('#memId').attr("readonly",false);
						$('#memBirthday').attr("readonly",false);
						$('#memName').attr("readonly",false);
						$("#inputState option").not(":selected").attr("disabled", false);
						$('#memTell1').attr("readonly",false);
						$('#memTell2').attr("readonly",false);
						radio1.setAttribute('onClick', 'return(true);');
						radio2.setAttribute('onClick', 'return(true);');
						clearInterval(timer);
						display.html("");
						$('#sendNum').html("인증번호 요청하기");
					}
					else{
					$('#sendNum').html("재요청");
					$('#btnChk').attr("disabled",false);
					$('#memId').attr("readonly",true);
					$('#memBirthday').attr("readonly",true);
					$('#memName').attr("readonly",true);
					$("#inputState option").not(":selected").attr("disabled", true);
					$('#memTell1').attr("readonly",true);
					$('#memTell2').attr("readonly",true);
					radio1.setAttribute('onClick', 'return(false);');
					radio2.setAttribute('onClick', 'return(false);');
					// 남은 시간
					// 이미 타이머가 작동중이면 중지
					if (isRunning){
						clearInterval(timer);
						display.html("");
						startTimer(leftSec, display);
					}else{
						startTimer(leftSec, display);
						
					}
					$('#btnChk').attr("disabled",false);
					$.ajax({
					    url: '/member/findPwSendMail', //요청경로
					    type: 'post',
					    data:{'memId':memId, 'memName':memName}, //필요한 데이터 '데이터이름':값
					    success: function(result) {
					      //ajax 실행 성공 후 실행할 코드 작성
					      $('#alertModal').modal('show');
					      document.getElementById('modalBody').innerText = '이메일로 인증번호가 전송되었습니다.';
					    },
					    error: function(){
					      //ajax 실행 실패 시 실행되는 구간
					       alert('실패');
					    }
					});
						
					}
				}else if(result == 'deactivate'){
					$('#alertModal').modal('show');
					document.getElementById('modalBody').innerText = "탈퇴한 회원입니다.";
				}
				else{
					$('#alertModal').modal('show');
					document.getElementById('modalBody').innerText = "입력하신 정보와 일치하는 아이디가 없습니다.";
				}
		    },
		    error: function(){
		      //ajax 실행 실패 시 실행되는 구간
		       alert('실패');
		    }
		});
		
	}
});

$('#findPwForm2').validate({
	//true : 유효성 검사 성공 시에도 submit이 되지 않음.
	debug: false,
	
	//유효성 검사 대상 설정
	rules: {
		
		memCertiNum:{
			required: true,
			certiNum: true
		}
	},
	//유효성 검사 실패 시 나타날 메세지 설정
	messages: {
		
		memCertiNum:{
			required: "인증번호(공백없이 8자리 영문대소문자, 숫자)를 입력하세요.",
			certiNum: "인증번호(공백없이 8자리 영문대소문자, 숫자)를 입력하세요."
		}
	},
	//유효성 실패 시 추가할 태그(default:lable)
	errorElement: 'div',
	//유효성 검사 실패 시 메세지 출력 방식
	errorPlacement: function(error, element) {
		//element:유효성 검사 실패한 태그(input)
		//error:검사 실패 시 자동 추가되는 태그
		error.insertAfter($(element).closest("div").next());
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
		var memCertiNum = document.getElementById('memCertiNum').value;
		$.ajax({
		    url: '/member/certification', //요청경로
		    type: 'post',
		    data:{'memCertiNum':memCertiNum}, //필요한 데이터 '데이터이름':값
		    success: function(result) {
		      //ajax 실행 성공 후 실행할 코드 작성
		      	$('#alertModal').modal('show');
			    if(result){
			    	document.getElementById('modalBody').innerText = '이메일 인증이 완료 되었습니다.';
			    	$('#btnChk').attr("disabled",true);
			    	$('#sendNum').attr("disabled",true);
			    	$('#timer').html("");
			    	isRunning = false;
			    	isCertification = true;
			    	clearInterval(timer);
				}
				else{
					document.getElementById('modalBody').innerText = '인증번호가 일치하지 않습니다. 다시 입력해주세요.';
				}
		    },
		    error: function(){
		      //ajax 실행 실패 시 실행되는 구간
		       alert('실패');
		    }
		});
	}
});

function startTimer(count, display) {
            
    		var minutes, seconds;
            timer = setInterval(function () {
            minutes = parseInt(count / 60, 10);
            seconds = parseInt(count % 60, 10);
     
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
     
            display.html("남은시간 " + minutes + ":" + seconds);
     
            // 타이머 끝
            if (--count < 0) {
    	     clearInterval(timer);
    	     display.html("시간초과");
    	     $('#alertModal').modal('show');
    	     document.getElementById('modalBody').innerText = "인증번호 입력시간이 초과 되었습니다. 인증요청을 다시 해주세요.";
    	     $('#sendNum').html("인증번호 요청하기");
    	     $('#btnChk').attr("disabled",true);
    	     isRunning = false;
            }
      		  }, 1000);
             isRunning = true;
}

function findPw() {
	var memTell = document.getElementById('inputState').value + '-' + document.getElementById('memTell1').value + '-' + document.getElementById('memTell2').value;
	if(isCertification == true){
		$('.removeParent1').unwrap();
		var str = '<form action="/member/resultFindPwForm" method="post" id="test">';
		$('.removeParent1').wrap(str);
		$('#memTell').attr("value", memTell);
		console.log(document.getElementById('memName').value);
		console.log($('input[name="memGender"]:checked').val());
		console.log(document.getElementById('memBirthday').value);
		console.log(document.getElementById('memTell').value);
		console.log(document.getElementById('memId').value);
		$('#inputState').attr("disabled", true);
		$('#memTell1').attr("disabled", true);
		$('#memTell2').attr("disabled", true);
		$('#test').submit();
	}
	else{
		$('#alertModal').modal('show');
		document.getElementById('modalBody').innerText = "인증을 받지 못했습니다. 인증을 해주세요.";
	}
}