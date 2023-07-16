<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/item/review_write_form.css" rel="stylesheet">
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    window.onload = function(){
       ck = CKEDITOR.replace("content");
    };
</script>
</head>
<body>
<div class="titleDiv">
	<h3>후기글 작성</h3>
</div>
<div class="row">
	<form action="/item/insertReview" method="post" id="reviewWriteForm">
	<div class="col-12">
		<table class="table regTable">
			<tr>
				<td>제목</td>
				<td colspan="1"><input class="form-control" type="text" name="title" id="title" style="width: 100%;" required></td>
				<td>별점</td>
				<td>
					<select class="form-select" name="itemRate" id="itemRate" style="width: 100%;">
						<option value="5">★★★★★</option>
						<option value="4">★★★★</option>
						<option value="3">★★★</option>
						<option value="2">★★</option>
						<option value="1">★</option>
					</select>
				</td>
				<td>패키지명</td>
				<td>
					<select class="form-select" name="itemCode" id="itemCode" style="width: 300px;">
					<c:if test="${empty bookList }">
					<option value="none">예약된 패키지 없음</option>
					</c:if>
					<c:forEach items="${bookList }" var="book">
						<option value="${book.itemCode }">${book.itemName }</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5">
					<!-- <textarea class="form-control" name="content" id="content" style="width: 100%; height: 200px;" required></textarea> -->
					<textarea class="form-control" name="content" id="content" required></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="btnDiv">
				<div class="btnBlack" onclick="reviewWrite();" style="width: 130px;">등록하기</div>
			</div>
		</div>
	</div>
	</form>
</div>

<div class="modal fade" id="titleCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div>제목은 필수입력입니다.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" data-bs-dismiss="modal" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="itemCodeCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div>후기 작성은 패키지 예약 후 가능합니다.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" data-bs-dismiss="modal" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="contentCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div>내용을 입력해주세요.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" data-bs-dismiss="modal" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="completeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div>후기가 정상적으로 등록되었습니다.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" data-bs-dismiss="modal" onclick="reviewWriteForm.submit();" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);" >확인</button>
      </div>
    </div>
  </div>
</div>

<script src="/resources/js/item/review_write_form.js" type="text/javascript"></script>
</body>
</html>