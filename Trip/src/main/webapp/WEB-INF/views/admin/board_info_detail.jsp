<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/member_detail.css" rel="stylesheet">
</head>
<body>
<div class="row">
	<form action="/admin/updateBoardInfo" method="post" id="updateBoardInfo" >
		<div class="col-12">
			<input type="text" name="boardCode" value="${boardInfo.boardCode }" style="display: none;">
			<table class="memTable">
				<tr>
					<td>게시판 코드</td>
					<td>${boardInfo.boardCode }</td>
					<td>타이틀</td>
					<td><input type="text" name="title" value="${boardInfo.title }" style="text-align: center;"></td>
				</tr>
				<tr>
					<td>사이드 메뉴 코드</td>
					<td>${boardInfo.sideMenuCode }</td>
					<td>Display Cnt</td>
					<td><input type="number" name="displayCnt" min="1" value="${boardInfo.displayCnt }" style="text-align: center;"></td>
				</tr>
			</table>
		</div>
		<div class="col-12" style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 10px;">
			<button class="btn btn-secondary" onclick="location.href='/admin/boardManage?adminMenuCode=MENU_004'">뒤로가기</button>
			<button class="btn btn-primary" onclick="submit();">저장하기</button>
		</div>
	</form>
</div>
</body>
</html>