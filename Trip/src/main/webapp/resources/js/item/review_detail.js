function modifyReviewForm(){
	var titleTd = document.getElementById('title');
	var contentTd = document.getElementById('content');
	var modifyTag = document.getElementById('modify');
	
	document.getElementById('back').style = 'width: 130px; display:none';
	document.getElementById('delete').style = 'width: 130px; display:none';
	document.getElementById('modify').innerText = '완료';
	
	var titleText = titleTd.innerText;
	titleTd.innerHTML = '<input class="form-control" type="text" id="titleInput" value="' + titleText + '" style="width: 100%; height: 40px;"></input>';
	
	var contentHTML = contentTd.innerHTML;
	
	contentTd.innerHTML = '<textarea class="form-control" name="contentInput" id="contentInput" style="width: 100%; height: 250px; resize: none;"></textarea>'
	ck = CKEDITOR.replace("contentInput");
	CKEDITOR.instances.contentInput.setData(contentHTML);
	//onclick 속성 변경
	modifyTag.setAttribute('onClick', 'modifyReview();');
}

function deleteReview(reviewNum){
	const menuCode = document.getElementById('menuCode').value;
	
	location.href='/item/deleteReview?menuCode=' + menuCode + '&reviewNum=' + reviewNum;
}

function modifyReview(){
	var titleTd = document.getElementById('title');
	var contentTd = document.getElementById('content');
	var modifyTag = document.getElementById('modify');
	
	const reviewNum = document.getElementById('reviewNum').value;
	var title = document.getElementById('titleInput').value;
	var content = CKEDITOR.instances.contentInput.getData();
	
	$.ajax({
	   url: '/item/updateReview', //요청경로
	    type: 'post',
	    data:{'reviewNum':reviewNum, 'title':title, 'content':content}, //필요한 데이터 '데이터이름':값
	    success: function(result) {
	      //ajax 실행 성공 후 실행할 코드 작성
	      titleTd.innerText = result.title;
	      contentTd.innerHTML = result.content;
	      document.getElementById('back').style = 'width: 130px; display:block';
		  document.getElementById('delete').style = 'width: 130px; display:block';
	   	  document.getElementById('modify').innerText = '수정';
	      modifyTag.setAttribute('onClick', 'modifyReviewForm();');
	      document.getElementById('modalBody').innerText = '게시글이 수정되었습니다.';
          var modalTag = document.getElementById('alertModal');   
          var myModal = new bootstrap.Modal(modalTag);
          myModal.show();
	    },
	    error: function(){
	      //ajax 실행 실패 시 실행되는 구간
	       alert('실패');
	    }
	});
}

function insertReviewReply(){
	var replyContent = document.getElementById('replyContent').value;
	var insertReviewReplyForm = document.getElementById('insertReviewReplyForm');
	
	if(replyContent == ''){
		//모달창을 띄우기
		document.getElementById('modalBody').innerText = '댓글 내용을 입력해주세요.';
        var modalTag = document.getElementById('alertModal');   
        var myModal = new bootstrap.Modal(modalTag);
        myModal.show();
		return;
	}
	
	insertReviewReplyForm.submit();
	
}

function deleteReviewReply(selectedTag){
	var result = confirm('정말 삭제하시겠습니까?');
	if(result){
		selectedTag.closest('#replyFormTag').action = '/item/deleteReviewReply';
		selectedTag.closest('#replyFormTag').submit();
		alert('삭제가 완료되었습니다.');
	}
}

function modifyPopup(selectedTag){
	window.open('/item/popUp?reviewNum=' + selectedTag.parentNode.previousElementSibling.value + '&replyNum=' + selectedTag.parentNode.previousElementSibling.previousElementSibling.value + '&content=' + selectedTag.parentNode.nextElementSibling.innerText, '댓글 수정', "width=500,height=500,toolbar=no, status=no,location=no,scrollbars=no,menubar=no,resizable=no,left=50,top=50");
	
}

