<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/enquiry_detail.css" rel="stylesheet">
</head>
<body>
<div class="row">
	<div class="col-12">
		<jsp:include page="/WEB-INF/views/board/board_detail.jsp"></jsp:include>
	</div>
	<div>
	</div>
	<form action="/admin/boardReply" method="post" id="boardReplyForm">
		<input type="hidden" name="boardNum" value="${boardInfo.boardNum }">
		<div class="row mt-3 replyDiv">
			<div class="col-12">
				<textarea rows="6" cols="" class="reply" maxlength="200" name="content" placeholder="답글을 입력하세요." style="width: 100%;" required></textarea>
			</div>
			<div class="col-12">
				<button class="btn btn-primary" style="width: 100%; height: 45px;" onclick="boardReply();">등록하기</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/resources/js/admin/enquiry_detail.js?ver=1"></script>
</body>
</html>