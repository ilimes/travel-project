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
		<h3 style="display: inline-block;">베스트후기</h3> <span>(Top10)</span>
	</div>
	<div>
		<table>
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="7.5%">
				<col width="7.5%">
			</colgroup>
			<thead>
				<tr>
					<td>순위</td>
					<td>별점</td>
					<td>여행상품명</td>
					<td>제목</td>
					<td>작성자</td>
					<td>조회수</td>
					<td>추천수</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty reviewList }">
						<tr>
							<td colspan="6">베스트후기가 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${reviewList }" var="review" varStatus="vS">
								<tr>
									<td>${vS.index + 1  }위</td>
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
									<td>${review.likesCnt }</td>
								</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>