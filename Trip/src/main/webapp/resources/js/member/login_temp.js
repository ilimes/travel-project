function loginTempSubmit(){
	if(tempEmail.value == "" || tempEmail.value == null){
		document.getElementById('modalBody').innerText = '이메일을 입력해주세요.';
		var modalTag = document.getElementById('alertModal');   
		var myModal = new bootstrap.Modal(modalTag);
		myModal.show();
		return;
	}
	if(bookNum.value == "" || bookNum.value == null){
		document.getElementById('modalBody').innerText = '예약번호를 입력해주세요.';
		var modalTag = document.getElementById('alertModal');   
		var myModal = new bootstrap.Modal(modalTag);
		myModal.show();
		return;
	}
	$.ajax({
		url: '/member/findTempMember', //요청경로
		type: 'post',
		data: {'tempEmail':tempEmail.value}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			if(result == 0){
				document.getElementById('modalBody').innerText = '입력하신 이메일이 존재하지 않습니다.';
				var modalTag = document.getElementById('alertModal');   
	   			var myModal = new bootstrap.Modal(modalTag);
	    		myModal.show();
	    		return;
			}
			else{
				$.ajax({
					url: '/buy/findBookInfo', //요청경로
					type: 'post',
					data: {'bookNum':bookNum.value,'tempEmail':tempEmail.value}, //필요한 데이터 '데이터이름':값
					success: function(result) {
						if(result == 0){
							document.getElementById('modalBody').innerText = '입력하신 예약번호가 존재하지 않거나 \n 예약번호와 이메일이 일치하지 않습니다.';
							var modalTag = document.getElementById('alertModal');   
				   			var myModal = new bootstrap.Modal(modalTag);
				    		myModal.show();
							return;				
						}
						else{
							loginTempForm.submit();
						}
						
					},
					error: function() {
						//ajax 실행 실패 시 실행되는 구간
						alert('실패');
					}
				});
			}
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
	
}