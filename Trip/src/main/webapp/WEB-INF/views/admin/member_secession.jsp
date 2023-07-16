<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/member_secession.css" rel="stylesheet">
</head>
<body>
<div class="titleDiv">
		<h3>회원탈퇴 신청목록</h3>
</div>
<div class="row">
<div class="row" style="margin: 0 auto;">
	<div class="row mt-2">
		<form method="post" id="secessionForm">
			<table class="table table-hover">
			<thead class="table-light">
				<tr>
					<td><input type="checkbox" name="checkAll" value='checkAll' onclick="selectAll(this);"></td>
					<td>회원ID</td>
					<td>이름</td>
					<td>연락처</td>
					<td>회원가입일</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${memSecession }" var="member" >
				<tr>
					<td><input type="checkbox" name="check" value="${member.memId }" onclick="checkSelectAll();"></td>
					<td>${member.memId }</td>
					<td>${member.memName }</td>
					<td>${member.memTell }</td>
					<td>${member.joinDate }</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</form>
	</div>
	<div>
		<button class="btn btn-secondary" style="text-align: right;" onclick="secession();">탈퇴</button>
	</div>
</div>
</div>
<script type="text/javascript" src="/resources/js/admin/member_secession.js?ver=0"></script>
</body>
</html>