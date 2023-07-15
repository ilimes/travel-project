<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<link href="/resources/css/item/review_detail.css" rel="stylesheet">
</head>
<body>
<div>
	<div class="titleDiv">
		<h3>후기 상세보기</h3>
	</div>
	<input type="hidden" name="reviewNum" id="reviewNum" value="${reviewInfo.reviewNum }">
	<input type="hidden" name="menuCode" id="menuCode" value="${menuVO.menuCode }">
	<div>
		<table class="reviewTable">
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
					<td id="writer">${reviewInfo.memName }</td>
					<td>작성일</td>
					<td id="createDate">${reviewInfo.createDate }</td>
					<td>조회수</td>
					<td id="readCnt">${reviewInfo.readCnt }</td>
				</tr>
				<tr>
					<td style="padding-top: 15px; vertical-align: top;">여행명</td>
					<td id="itemTitle" colspan="7" style="text-align: left; padding: 15px; vertical-align: top;">${reviewInfo.itemVO.itemName }</td>
				</tr>
				<tr>
					<td style="padding-top: 15px; vertical-align: top;">제목</td>
					<td id="title" colspan="7" style="text-align: left; padding: 15px; vertical-align: top;">${reviewInfo.title }</td>
				</tr>
				<tr>
					<td style="height: 270px; padding-top: 5px; vertical-align: top;">내용</td>
					<td id="content" colspan="7" style="text-align: left; padding: 15px; vertical-align: top; line-height: 1.0em;">${reviewInfo.content }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<c:if test="${not empty sessionScope.loginInfo }">
		<c:choose>
			<c:when test="${myReviewLikeCnt eq 0 }">
				<form action="/item/insertMyReviewLike" method="post" id="insertLikeForm">
					<input type="hidden" name="memId" value="${sessionScope.loginInfo.memId }">
					<input type="hidden" name="reviewNum" value="${reviewInfo.reviewNum }">
					<div style="text-align: center; margin: 0 auto; margin-top: 15px; border: 1px solid #DDDDDD; border-radius: 15px; width: 100px; font-weight: bold; color: black; cursor: pointer;" onclick="insertLikeForm.submit();">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
							<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
						</svg> ${reviewInfo.likesCnt }
					</div>
				</form>	
			</c:when>
			<c:otherwise>
				<form action="/item/deleteMyReviewLike" method="post" id="deleteLikeForm">
					<input type="hidden" name="memId" value="${sessionScope.loginInfo.memId }">
					<input type="hidden" name="reviewNum" value="${reviewInfo.reviewNum }">
					<div style="text-align: center; margin: 0 auto; margin-top: 15px; border: 1px solid #DDDDDD; border-radius: 15px; width: 100px; font-weight: bold; color: red; cursor: pointer;" onclick="deleteLikeForm.submit();">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
						  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
						</svg> ${reviewInfo.likesCnt }
					</div>
				</form>			
			</c:otherwise>
		</c:choose>
	</c:if>
	<div class="btnDiv">
		<div class="btns" id="back" style="width: 130px;" onclick="location.href='/item/review?menuCode=MENU_002&selectedMenu=MENU_002';">목록으로</div>
		<c:choose>
			<c:when test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
				<div class="btns" id="modify" style="width: 130px;" onclick="modifyReviewForm();">수정</div>
				<div class="btns" id="delete" data-bs-toggle="modal" data-bs-target="#deleteModal" style="width: 130px;" onclick="">삭제</div>
			</c:when>
			<c:otherwise>
				<c:if test="${sessionScope.loginInfo.memId eq reviewInfo.writer }">
					<div class="btns" id="modify" style="width: 130px;" onclick="modifyReviewForm();">수정</div>
					<div class="btns" id="delete" data-bs-toggle="modal" data-bs-target="#deleteModal" style="width: 130px;" onclick="">삭제</div>
				</c:if>			
			</c:otherwise>
		</c:choose>
	</div>
	<div class="replyDiv">
		<h5 style="margin-top: 15px; margin-bottom: 30px;"><strong>댓글 ${reviewReplyList.size() }</strong></h5>
		<c:if test="${not empty sessionScope.loginInfo }">
			<div style="margin-bottom: 30px;">
			<form action="/item/insertReviewReply" method="post" id="insertReviewReplyForm">
				<input type="hidden" name="reviewNum" value="${reviewInfo.reviewNum }">
				<textarea class="form-control" name="content" id="replyContent" rows="" cols="" style="width: 100%; height: 110px; margin-bottom: 10px; resize: none;" placeholder="여러분의 소중한 댓글을 달아주세요."></textarea>
				<button type="button" class="btnBlack" style="width: 100%; height: 50px; padding: 0;" onclick="insertReviewReply();">등록</button>
			</form>
			</div>
		</c:if>
		<c:if test="${reviewReplyList.size() eq 0 }">
			<div style="text-align: center;">댓글이 존재하지 않습니다.</div>
		</c:if>
		<div>
			<c:forEach items="${reviewReplyList }" var="reply" varStatus="vS">
			<form action="" method="post" id="replyFormTag">
				<div style="margin-bottom: 20px;">
					<input type="hidden" value="${reply.replyNum }" name="replyNum">
					<input type="hidden" value="${reply.reviewNum }" name="reviewNum">
					<div><svg xmlns="http://www.w3.org/2000/svg" width="17" height="22" fill="currentColor" class="bi bi-person-circle" viewBox="0 2 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
						</svg> ${reply.memName } / ${reply.createDate } 
						<c:if test="${sessionScope.loginInfo.memId eq reply.writer }">
							<span style="font-size: 12.5px; margin-left: 1px; padding: 5px; cursor: pointer; background-color: #DDD; border-radius: 8px;" onclick="modifyPopup(this);"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
							  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
							  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
							</svg> 수정하기</span> 
							<span style="font-size: 12.5px; margin-left: 1px; padding: 5px; cursor: pointer; background-color: #DDD; border-radius: 8px;" onclick="deleteReviewReply(this);"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
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
        <div>삭제한 후기글은 되돌릴 수 없습니다.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" onclick="deleteReview(${reviewInfo.reviewNum });" style="display: inline-block; width: 90px; padding: 0; background: #D82148; box-shadow: 0px 1px 5px 0px #d82148, 5px 5px 15px 5px rgb(0 0 0 / 0%);">삭제</button>
        <button type="button" class="btns" data-bs-dismiss="modal" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 알림 Modal -->
<div class="modal fade" id="alertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
      </div>
      <div class="modal-body">
        <div id="modalBody"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" data-bs-dismiss="modal" id="btnOk" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">확인</button>
      </div>
    </div>
  </div>
</div>

<script src="/resources/js/item/review_detail.js?ver=2" type="text/javascript"></script>
</body>
</html>