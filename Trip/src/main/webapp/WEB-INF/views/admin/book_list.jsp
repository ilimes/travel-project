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
		<h3>예약 관리</h3>
</div>
<div class="row">
	<table class="table table-hover bookTable">
		<thead class="table-light">
			<tr>
				<td>예약번호</td>
				<td>패키지명</td>
				<td>예약자</td>
				<td>여행인원</td>
				<td>가격</td>
				<td>연락처</td>
				<td>예약일</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty bookList }">
					<tr>
						<td colspan="8">예약된 상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${bookList }" var="book">
						<tr>
							<td>${book.bookNum }</td>
							<td><div class="item">${book.itemName }</div></td>
							<td><div class="name">${book.memName }</div></td>
							<td>${book.travelers }명</td>
							<td><fmt:formatNumber pattern="#,###원" value="${book.buyPrice }"/></td>
							<td>${book.memTell }</td>
							<td>${book.bookDate }</td>
							<td><button class="btn btn-secondary" onclick="cancelBook(this);">예약취소</button></td>
							<td style="display: none;">${book.memId }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div>
		<ul class="pagination justify-content-center">
			<li class="page-item <c:if test="${!bookViewVO.prev }"> disabled </c:if>">
			<a class="page-link" href="javascript:pageInfo(${bookViewVO.beginPage - 1 })">이전</a></li>
			<c:forEach begin="${bookViewVO.beginPage }" end="${bookViewVO.endPage }" var="pageIndex">
				<li class="page-item <c:if test="${bookViewVO.nowPage eq pageIndex}"> active </c:if>" >
				<a class="page-link" href="javascript:pageInfo(${pageIndex });" >${pageIndex }</a></li>
			</c:forEach>
			<li class="page-item <c:if test="${!bookViewVO.next }"> disabled</c:if>">
			<a class="page-link" href="javascript:pageInfo(${bookViewVO.endPage + 1 })">다음</a></li>
		</ul>
	</div>
</div>
<script type="text/javascript" src="/resources/js/admin/book_list.js?ver=8"></script>
</body>
</html>