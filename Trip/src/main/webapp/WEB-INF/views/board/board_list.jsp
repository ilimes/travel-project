<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/board/board_list.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<div class="titleDiv">
		<h3>${boardTitle }</h3>
	</div>
	<div>
		<table>
			<colgroup>
				<col width="10%">
				<col width="50%">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${topBoardList }" var="topBoard">
						<c:if test="${topBoard.isMain eq 'Y' }">
							<tr class="noticeTr">
								<td>[공지]</td>
								<td><a href="/board/boardDetail?menuCode=${boardVO.menuCode }&sideMenuCode=${boardVO.sideMenuCode }&boardNum=${topBoard.boardNum }">${topBoard.title }</a></td>
								<td>${topBoard.createDate }</td>
								<td>${topBoard.readCnt }</td>
							</tr>
						</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${empty boardList }">
						<tr>
							<c:choose>
								<c:when test="${boardVO.sideMenuCode eq 'SIDE_MENU_002' }">
									<td colspan="4">${message }</td>
								</c:when>
								<c:otherwise>
									<td colspan="4">게시글이 존재하지 않습니다.</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${boardList }" var="board" varStatus="vS">
							<tr>
								<td>${boardVO.totalCnt - vS.index - ((boardVO.nowPage - 1) * boardVO.displayCnt) }</td>
								<c:choose>
									<c:when test="${board.replyCnt gt 0 }">
										<td><a href="/board/boardDetail?menuCode=${boardVO.menuCode }&sideMenuCode=${boardVO.sideMenuCode }&boardNum=${board.boardNum }">${board.title }<span style="margin-left: 5px;"><b> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16">
											  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
											  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
											</svg> ${board.replyCnt }</b></span></a>
										</td>
									</c:when>
									<c:otherwise>
										<td><a href="/board/boardDetail?menuCode=${boardVO.menuCode }&sideMenuCode=${boardVO.sideMenuCode }&boardNum=${board.boardNum }">${board.title }</a></td>
									</c:otherwise>
								</c:choose>
								<td>${board.createDate }</td>
								<td>${board.readCnt }</td>
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
				<c:when test="${boardVO.prev }">
					<li class="page-item"><a class="page-link" href="/board/boardList?sideMenuCode=${boardVO.sideMenuCode }&nowPage=${boardVO.beginPage - 1 }&title=${boardVO.title}&content=${boardVO.content}<c:if test="${boardVO.sideMenuCode ne 'SIDE_MENU_002' }">&writer=${boardVO.writer}</c:if>">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
	      				<a class="page-link">&laquo;</a>
	   	 			</li>
				</c:otherwise>
			</c:choose>
		    <c:forEach begin="${boardVO.beginPage }" end="${boardVO.endPage }" var="pageIndex">
		    	 <li class="page-item <c:if test="${boardVO.nowPage eq pageIndex }">active</c:if>"><a class="page-link" href="/board/boardList?sideMenuCode=${boardVO.sideMenuCode }&nowPage=${pageIndex }&title=${boardVO.title}&content=${boardVO.content}<c:if test="${boardVO.sideMenuCode ne 'SIDE_MENU_002' }">&writer=${boardVO.writer}</c:if>">${pageIndex }</a></li>
		    </c:forEach>
		    <c:choose>
				<c:when test="${boardVO.next }">
					<li class="page-item"><a class="page-link" href="/board/boardList?sideMenuCode=${boardVO.sideMenuCode }&nowPage=${boardVO.endPage + 1 }&title=${boardVO.title}&content=${boardVO.content}<c:if test="${boardVO.sideMenuCode ne 'SIDE_MENU_002' }">&writer=${boardVO.writer}</c:if>">&raquo;</a></li>
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
	<c:if test="${boardVO.sideMenuCode eq 'SIDE_MENU_001' }">
		<div class="boardSearchDiv" style="text-align: right;">
			<select class="form-select" id="boardSearchSelect" style="display: inline-block; width: 120px;">
				<option	value="titleAndContent" <c:if test="${not empty boardVO.title and not empty boardVO.content }">selected</c:if>>제목+내용</option>
				<option value="title" <c:if test="${not empty boardVO.title and empty boardVO.content }">selected</c:if>>제목</option>
				<option value="content" <c:if test="${not empty boardVO.content and empty boardVO.title }">selected</c:if>>내용</option>
				<option value="writer" <c:if test="${not empty boardVO.writer }">selected</c:if>>작성자</option>
			</select> 
			<input type="text" class="form-control" id="searchInput" value="<c:if test="${not empty boardVO.title and not empty boardVO.content }">${boardVO.title }</c:if><c:if test="${not empty boardVO.title and empty boardVO.content }">${boardVO.title }</c:if><c:if test="${not empty boardVO.content and empty boardVO.title }">${boardVO.content }</c:if><c:if test="${not empty boardVO.writer }">${boardVO.writer }</c:if>" style="display: inline-block; width: 220px; " onkeydown="if (event.keyCode == 13) { boardSearch(); }"> 
			<input type="button" class="btn btn-secondary" value="검색" onclick="boardSearch();">
		</div>
	</c:if>
	<c:choose>
		<c:when test="${boardVO.sideMenuCode eq 'SIDE_MENU_001'}">
			<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}">
				<div class="btnDiv">
					<div class="btns" style="width: 130px;" onclick="location.href='/board/boardWriteForm?menuCode=${boardVO.menuCode }&sideMenuCode=${boardVO.sideMenuCode }';">글쓰기</div>
				</div>
			</c:if>
		</c:when>
		<c:otherwise>
		 	<c:if test="${not empty sessionScope.loginInfo }">
				<div class="btnDiv">
					<div class="btns" style="width: 130px;" onclick="location.href='/board/boardWriteForm?menuCode=${boardVO.menuCode }&sideMenuCode=${boardVO.sideMenuCode }';">글쓰기</div>
				</div>
			</c:if>
		</c:otherwise>
	</c:choose>
</div>
<script type="text/javascript">
function boardSearch(){
	var selectOption = document.getElementById('boardSearchSelect').value;
	
	//var searchText = selectedTag.previousElementSibling.value;
	var searchText = document.getElementById('searchInput').value;
	
	if(selectOption == 'titleAndContent'){
		location.href='/board/boardList?sideMenuCode=SIDE_MENU_001&title=' + searchText + '&content=' + searchText;
	}
	else if(selectOption == 'title'){
		location.href='/board/boardList?sideMenuCode=SIDE_MENU_001&title=' + searchText;
	}
	else if(selectOption == 'content'){
		location.href='/board/boardList?sideMenuCode=SIDE_MENU_001&content=' + searchText;
	}
	else if(selectOption == 'writer'){
		location.href='/board/boardList?sideMenuCode=SIDE_MENU_001&writer=' + searchText;
	}
	
}
</script>
</body>
</html>