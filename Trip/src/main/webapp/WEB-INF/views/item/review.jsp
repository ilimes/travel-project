<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/item/review.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<div class="titleDiv">
		<h3>일반후기</h3>
	</div>
	<div>
		<table>
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<td>번호</td>
					<td>별점</td>
					<td>여행상품명</td>
					<td>제목</td>
					<td>작성자</td>
					<td>조회수</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty reviewList }">
						<tr>
							<td colspan="6">후기가 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${reviewList }" var="review" varStatus="vS">
								<tr>
									<td>${reviewVO.totalCnt - review.rowNum + 1  }</td>
									<td style="color: #725efe">
										<c:forEach begin="1" end="${review.itemRate }">
											★
										</c:forEach>
									</td>
									<td><div class="reviewTitle"><a href="/item/reviewDetail?menuCode=MENU_002&reviewNum=${review.reviewNum }">${review.itemVO.itemName }</a></div></td>
									<c:choose>
										<c:when test="${review.replyCnt gt 0 }">
											<td>
												<div class="reviewTitle">
													<a href="/item/reviewDetail?menuCode=MENU_002&reviewNum=${review.reviewNum }">${review.title }<span style="margin-left: 5px;"><b> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16">
													  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
													  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
													</svg> ${review.replyCnt }</b></span></a>
												</div>
											</td>
										</c:when>
										<c:otherwise>
											<td><div class="reviewTitle"><a href="/item/reviewDetail?menuCode=MENU_002&reviewNum=${review.reviewNum }">${review.title }</a></div></td>
										</c:otherwise>
									</c:choose>
									<td><div class="reviewWriter"><svg xmlns="http://www.w3.org/2000/svg" width="17" height="22" fill="currentColor" class="bi bi-person-circle" viewBox="0 2 16 16">
									  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
									  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
									</svg> ${review.memName }</div></td>
									<td>${review.readCnt }</td>
								</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div class="pageDiv">
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${reviewVO.prev }">
					<li class="page-item"><a class="page-link" href="/item/review?menuCode=MENU_002&nowPage=${reviewVO.beginPage - 1 }&title=${reviewVO.title}&content=${reviewVO.content}&writer=${reviewVO.writer}">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
	      				<a class="page-link">&laquo;</a>
	   	 			</li>
				</c:otherwise>
			</c:choose>
		    <c:forEach begin="${reviewVO.beginPage }" end="${reviewVO.endPage }" var="pageIndex">
		    	 <li class="page-item <c:if test="${pageVO.nowPage eq pageIndex }">active</c:if>"><a class="page-link" href="/item/review?menuCode=MENU_002&nowPage=${pageIndex }&title=${reviewVO.title}&content=${reviewVO.content}&writer=${reviewVO.writer}">${pageIndex }</a></li>
		    </c:forEach>
		    <c:choose>
				<c:when test="${reviewVO.next }">
					<li class="page-item"><a class="page-link" href="/item/review?menuCode=MENU_002&nowPage=${reviewVO.endPage + 1 }&title=${reviewVO.title}&content=${reviewVO.content}&writer=${reviewVO.writer}">&raquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
	      				<a class="page-link">&raquo;</a>
	   	 			</li>
				</c:otherwise>
			</c:choose>
		  </ul>
		</nav>
	</div>
	<div class="reviewSearchDiv" style="text-align: right;">
		<select class="form-select" id="reviewSearchSelect" style="display: inline-block; width: 120px;">
			<option	value="titleAndContent" <c:if test="${not empty reviewVO.title and not empty reviewVO.content }">selected</c:if>>제목+내용</option>
			<option value="title" <c:if test="${not empty reviewVO.title and empty reviewVO.content }">selected</c:if>>제목</option>
			<option value="content" <c:if test="${not empty reviewVO.content and empty reviewVO.title }">selected</c:if>>내용</option>
			<option value="writer" <c:if test="${not empty reviewVO.writer }">selected</c:if>>작성자</option>
		</select> 
		<input type="text" class="form-control" id="searchInput" value="<c:if test="${not empty reviewVO.title and not empty reviewVO.content }">${reviewVO.title }</c:if><c:if test="${not empty reviewVO.title and empty reviewVO.content }">${reviewVO.title }</c:if><c:if test="${not empty reviewVO.content and empty reviewVO.title }">${reviewVO.content }</c:if><c:if test="${not empty reviewVO.writer }">${reviewVO.writer }</c:if>" style="display: inline-block; width: 250px;" onkeydown="if (event.keyCode == 13) { reviewSearch(); }"> 
		<input type="button" class="btn btn-secondary" value="검색" onclick="reviewSearch();">
	</div>
 	<c:if test="${not empty sessionScope.loginInfo }">
		<div class="btnDiv">
			<div class="btns" style="width: 130px;" onclick="location.href='/item/reviewWriteForm?menuCode=MENU_002';">글쓰기</div>
		</div>
	</c:if>
</div>
<script src="/resources/js/item/review.js" type="text/javascript"></script>
</body>
</html>