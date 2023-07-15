<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<link href="/resources/css/board/board_detail.css" rel="stylesheet">
</head>
<body>
<input type="hidden" name="sideMenuCode" id="sideMenuCode" value="${sideMenuVO.sideMenuCode }">
<input type="hidden" name="menuCode" id="menuCode" value="${sideMenuVO.menuCode }">
<input type="hidden" id="boardNum" name="boardNum" value="${boardInfo.boardNum }">
<div>
	<div class="titleDiv">
		<h3>${boardTitle }</h3>
	</div>
	<div>
		<table>
			<colgroup>
				<col width="13.6%">
				<col width="27.6%">
				<col width="13.6%">
				<col width="18%">
				<col width="13.6%">
				<col width="13.6%">
			</colgroup>
			<tbody>
				<tr>
					<td>작성자</td>
					<td id="writer">${boardInfo.memName }</td>
					<td>작성일</td>
					<td id="createDate">${boardInfo.createDate }</td>
					<td>조회수</td>
					<td id="readCnt">${boardInfo.readCnt }</td>
				</tr>
				<tr>
					<td style="padding-top: 15px; vertical-align: top;">제목</td>
					<td id="title" colspan="7" style="text-align: left; padding: 15px; vertical-align: top;">${boardInfo.title }</td>
				</tr>
				<tr>
					<td style="height: 270px; padding-top: 5px; vertical-align: top;">내용</td>
					<td id="content" colspan="7" style="text-align: left; padding: 15px; vertical-align: top; line-height: 1.0em;"><div>${boardInfo.content }</div></td>
				</tr>
				<tr id="isMainTr">
				</tr>
			</tbody>
		</table>
	</div>
	<c:if test="${sideMenuVO.sideMenuCode eq 'SIDE_MENU_001' or sideMenuVO.sideMenuCode eq 'SIDE_MENU_002' }">
		<div class="btnDiv">
			<div class="btns" id="back" style="width: 130px;" onclick="history.back();">뒤로가기</div>
			<c:choose>
				<c:when test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
					<div class="btns" id="modify" style="width: 130px;" onclick="modifyBoardForm('${boardInfo.isMain}');">수정</div>
					<div class="btns" id="delete" data-bs-toggle="modal" data-bs-target="#deleteModal" style="width: 130px;" onclick="">삭제</div>
				</c:when>
				<c:otherwise>
					<c:if test="${sessionScope.loginInfo.memId eq boardInfo.writer }">
						<div class="btns" id="modify" style="width: 130px;" onclick="modifyBoardForm();">수정</div>
						<div class="btns" id="delete" data-bs-toggle="modal" data-bs-target="#deleteModal" style="width: 130px;" onclick="">삭제</div>
					</c:if>			
				</c:otherwise>
			</c:choose>
		</div>
	</c:if>
	<c:if test="${sideMenuVO.sideMenuCode eq 'SIDE_MENU_002' or sideMenuVO.sideMenuCode eq 'SIDE_MENU_401' }">
		<div class="replyDiv">
			<h5 style="margin-top: 15px; margin-bottom: 30px;"><strong>댓글 ${boardReplyList.size() }</strong></h5>
			<c:if test="${sessionScope.loginInfo.memId eq boardInfo.writer and boardReplyList.size() gt 0 }">
				<div style="margin-bottom: 30px;">
				<form action="/board/insertBoardReply" method="post" id="insertBoardReply">
					<input type="hidden" name="boardNum" value="${boardInfo.boardNum }">
					<textarea class="form-control" name="content" rows="" cols="" style="width: 100%; height: 110px; margin-bottom: 10px; resize: none;" placeholder="추가 의견이 있으시다면 답글을 달아주세요."></textarea>
					<button type="button" class="btn btn-secondary" style="width: 100%; height: 50px;" onclick="insertBoardReply.submit();">등록</button>
				</form>
				</div>
			</c:if>
			<c:if test="${boardReplyList.size() eq 0 }">
				<div style="text-align: center;">현재 답변이 존재하지 않습니다. 관리자 확인 후 답변해드리도록 하겠습니다.</div>
			</c:if>
			<div>
				<c:forEach items="${boardReplyList }" var="reply" varStatus="vS">
				<form action="" method="post" id="replyFormTag">
					<div style="margin-bottom: 20px;">
						<input type="hidden" value="${reply.replyNum }" name="replyNum">
						<input type="hidden" value="${reply.boardNum }" name="boardNum">
						<div><svg xmlns="http://www.w3.org/2000/svg" width="17" height="22" fill="currentColor" class="bi bi-person-circle" viewBox="0 2 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
						</svg> ${reply.memName } / ${reply.createDate } 
							<c:if test="${sessionScope.loginInfo.memId eq reply.writer }">
								<span style="font-size: 12.5px; margin-left: 1px; padding: 5px; cursor: pointer; background-color: #DDD; border-radius: 8px;" onclick="modifyPopup(this);"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
								  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
								  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg> 수정하기</span> 
								<span style="font-size: 12.5px; margin-left: 1px; padding: 5px; cursor: pointer; background-color: #DDD; border-radius: 8px;" onclick="deleteBoardReply(this);"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
								  <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
								</svg> 삭제하기</span>
							</c:if>
						</div>
						<div style="font-size: 18px;">${reply.content }</div>
					</div>
				</form>
				</c:forEach>
			</div>
		</div>
	</c:if>
</div>

<!-- 삭제 Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">경고</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div>정말 삭제하시겠습니까?</div>
        <div>삭제한 게시물은 되돌릴 수 없습니다.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" onclick="deleteBoard(${boardInfo.boardNum});" style="display: inline-block; width: 90px; padding: 0; background: #D82148; box-shadow: 0px 1px 5px 0px #d82148, 5px 5px 15px 5px rgb(0 0 0 / 0%);">삭제</button>
        <button type="button" class="btns" data-bs-dismiss="modal" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 수정 Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div>게시글이 수정되었습니다.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" data-bs-dismiss="modal" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">확인</button>
      </div>
    </div>
  </div>
</div>

<script src="/resources/js/board/board_detail.js?ver=2" type="text/javascript"></script>
</body>
</html>