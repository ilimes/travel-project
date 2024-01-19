<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/book_list.css" rel="stylesheet">
</head>
<body>
<div class="titleDiv">
		<h3>게시판 관리</h3>
</div>
<div style="margin-bottom: 10px;">게시판 정보를 수정하시려면 항목을 클릭하세요.</div>
<div class="row">
	<table class="table table-hover bookTable">
		<thead class="table-light">
			<tr>
				<td>게시판 코드</td>
				<td>사이드 메뉴 코드</td>
				<td>타이틀</td>
				<td>Display Cnt</td>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty boardInfoList }">
					<tr>
						<td colspan="8">게시판 정보가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardInfoList }" var="boardInfo">
						<tr onclick="location.href='/admin/boardInfoDetail?sideMenuCode=${boardInfo.sideMenuCode }'" style="cursor: pointer;">
							<td>${boardInfo.boardCode }</td>
							<td><div class="item">${boardInfo.sideMenuCode }</div></td>
							<td><div class="name">${boardInfo.title }</div></td>
							<td>${boardInfo.displayCnt }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div>
		<ul class="pagination justify-content-center">
			<li class="page-item <c:if test="${!boardInfoVO.prev }"> disabled </c:if>">
			<a class="page-link" href="javascript:pageInfo(${boardInfoVO.beginPage - 1 })">이전</a></li>
			<c:forEach begin="${boardInfoVO.beginPage }" end="${boardInfoVO.endPage }" var="pageIndex">
				<li class="page-item <c:if test="${boardInfoVO.nowPage eq pageIndex}"> active </c:if>" >
				<a class="page-link" href="javascript:pageInfo(${pageIndex });" >${pageIndex }</a></li>
			</c:forEach>
			<li class="page-item <c:if test="${!boardInfoVO.next }"> disabled</c:if>">
			<a class="page-link" href="javascript:pageInfo(${boardInfoVO.endPage + 1 })">다음</a></li>
		</ul>
	</div>
</div>
<script type="text/javascript" src="/resources/js/admin/book_list.js?ver=8"></script>
</body>
</html>