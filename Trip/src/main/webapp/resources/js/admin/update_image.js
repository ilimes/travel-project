//강력 새로고침
window.onload = function() {
    if(self.name != 'reload'){
		self.name = 'reload';
		self.location.reload(true);
	}
	else{
		self.name = '';
	}
}

//form 태그를 선택
$('#updateImgForm1').validate({
	//debug:true --> 유효성 검사 성공 시에도 submit이 되지 않음.
	//유효성 검사만 실행
	debug:false ,
	
     //유효성 검사 대상 설정
      rules: {
         updateImg: { //input 태그의 name 속성으로 검사 대상을 지정 
            required: true, //필수입력
         } ,
      } ,
      //유효성 검사 실패 시 나타낼 메시지 설정
      messages: {
         updateImg: { //input 태그의 name 속성으로 메시지 대상을 지정 
            required: "첨부파일을 등록해주세요." ,
         } ,
      }, 
      //유효성 실패 시 추가할 태그()
      errorElement:'div',
      errorPlacement: function (error, element){
		 //element:유효성 검사 실패한 태그 
		 //error:검사 실패 시 자동 추가되는 태그
         error.insertAfter($(element).closest("div"));
    	 error.css('font-size', '16px');
      },     
      //유효성 검사 성공 시 실행
      submitHandler: function(form) {
         form.submit();   //유효성 검사를 통과시 전송
      }
   });

//form 태그를 선택
$('#updateImgForm2').validate({
	//debug:true --> 유효성 검사 성공 시에도 submit이 되지 않음.
	//유효성 검사만 실행
	debug:false ,
	
     //유효성 검사 대상 설정
      rules: {
         updateImg: { //input 태그의 name 속성으로 검사 대상을 지정 
            required: true, //필수입력
         } ,
      } ,
      //유효성 검사 실패 시 나타낼 메시지 설정
      messages: {
         updateImg: { //input 태그의 name 속성으로 메시지 대상을 지정 
            required: "첨부파일을 등록해주세요." ,
         } ,
      }, 
      //유효성 실패 시 추가할 태그()
      errorElement:'div',
      errorPlacement: function (error, element){
		 //element:유효성 검사 실패한 태그
		 //error:검사 실패 시 자동 추가되는 태그
         error.insertAfter($(element).closest("div"));
    	 error.css('font-size', '16px');
      },     
      //유효성 검사 성공 시 실행
      submitHandler: function(form) {
         form.submit();   //유효성 검사를 통과시 전송
      }
   });
   
//form 태그를 선택
$('#updateImgForm3').validate({
	//debug:true --> 유효성 검사 성공 시에도 submit이 되지 않음.
	//유효성 검사만 실행
	debug:false ,
	
     //유효성 검사 대상 설정
      rules: {
         updateImg: { //input 태그의 name 속성으로 검사 대상을 지정 
            required: true, //필수입력
         } ,
      } ,
      //유효성 검사 실패 시 나타낼 메시지 설정
      messages: {
         updateImg: { //input 태그의 name 속성으로 메시지 대상을 지정 
            required: "첨부파일을 등록해주세요." ,
         } ,
      }, 
      //유효성 실패 시 추가할 태그()
      errorElement:'div',
      errorPlacement: function (error, element){
		 //element:유효성 검사 실패한 태그
		 //error:검사 실패 시 자동 추가되는 태그
         error.insertAfter($(element).closest("div"));
    	 error.css('font-size', '16px');
      },     
      //유효성 검사 성공 시 실행
      submitHandler: function(form) {
         form.submit();   //유효성 검사를 통과시 전송
      }
   });
   
//form 태그를 선택
$('#updateImgForm4').validate({
	//debug:true --> 유효성 검사 성공 시에도 submit이 되지 않음.
	//유효성 검사만 실행
	debug:false ,
	
     //유효성 검사 대상 설정
      rules: {
         updateImg: { //input 태그의 name 속성으로 검사 대상을 지정 
            required: true, //필수입력
         } ,
      } ,
      //유효성 검사 실패 시 나타낼 메시지 설정
      messages: {
         updateImg: { //input 태그의 name 속성으로 메시지 대상을 지정 
            required: "첨부파일을 등록해주세요." ,
         } ,
      }, 
      //유효성 실패 시 추가할 태그()
      errorElement:'div',
      errorPlacement: function (error, element){
		 //element:유효성 검사 실패한 태그 
		 //error:검사 실패 시 자동 추가되는 태그
         error.insertAfter($(element).closest("div"));
    	 error.css('font-size', '16px');
      },     
      //유효성 검사 성공 시 실행
      submitHandler: function(form) {
         form.submit();   //유효성 검사를 통과시 전송
      }
   });
