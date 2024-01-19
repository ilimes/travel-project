<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/enquiry_list.css" rel="stylesheet">
</head>
<body>
<div class="row">
	<div class="col-12" id="enquDiv">
		<table class="table">
			<colgroup>
					<col width="10%">
					<col width="50%">
					<col width="20%">
					<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<td>글 번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${enquiryList }" var="enqu" varStatus="status">
					<tr>
						<td>${enqu.boardNum }</td>
						<td><a href="/admin/enquDetail?adminMenuCode=${selectedAdminMenu }&sideMenuCode=${selectedSideMenu }&boardNum=${enqu.boardNum }"${enqu.boardNum }>${enqu.title }</a></td>
						<td>${enqu.writer }</td>
						<td>${enqu.createDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>


<script type="text/javascript" src="/resources/js/admin/enquiry_list.js?ver=3"></script>
</body>
</html>