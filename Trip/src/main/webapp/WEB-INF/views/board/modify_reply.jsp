<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<link href="/resources/css/board/modify_reply.css" rel="stylesheet">
</head>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- common.css -->
<link href="/resources/css/common/common.css" rel="stylesheet">
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- jquery 사용을 위한 태그 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<body>
<div class="replyDiv">
	<form action="" method="post" id="modifyForm">
		<input type="hidden" name="boardNum" value="${boardReplyVO.boardNum }">
		<input type="hidden" name="replyNum" value="${boardReplyVO.replyNum }">
		<input type="hidden" name="writer" value="${boardReplyVO.writer }">
		<div class="titleDiv">
			<h3><strong>댓글 수정</strong></h3>
		</div>
		<div>글 번호 : ${boardReplyVO.boardNum }</div>
		<div>댓글 번호 : ${boardReplyVO.replyNum }</div>
		<div style="margin-bottom: 30px;">작성자 : ${boardReplyVO.writer }</div>
		<textarea class="form-control" name="content" onkeydown="if (event.keyCode == 13) { modifyGo(); }" style="resize: none; height: 200px;">${boardReplyVO.content }</textarea><br><br>
	</form>
	<div class="btnDiv">
		<input class="btn btn-secondary" type="button" value="수정하기" onclick="modifyGo();">
		<input class="btn btn-danger" type="button" value="창닫기" onclick="closeThis();">
	</div>
</div>
</body>
<script type="text/javascript">
function closeThis(){
	self.close();
}
function modifyGo(){
	document.getElementById('modifyForm').action ="/board/modifyBoardReply";
	document.getElementById('modifyForm').submit();
	setTimeout(function() {   
	opener.location.reload();
    }, 10);
	opener.location.reload();
	setTimeout(function() {
        window.close();
    }, 10);
}	
</script>
</html>