<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/admin/update_item.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div class="row">
	<form action="/admin/updateItem" method="post" id="itemUpdateForm" >
	<input type="hidden" value="${itemInfo.cateCode }" name="cateCode">
	<input type="hidden" value="${itemInfo.itemCode }" name="itemCode">
	<div class="col-12">
		<table class="table regTable">
			<tr>
				<td>패키지명</td>
				<td><input type="text" class="form-control" name="itemName" id="itemName" style="width: 100%;" value="${itemInfo.itemName }" readonly></td>
				<td>가격</td>
				<td><input type="text" class="form-control" name="itemPrice" id="itemPrice" style="width: 100%;" value="${itemInfo.itemPrice }" required></td>
			</tr>
			<tr>
				<td>여행기간</td>
				<td>
					<div class="row">
						<div class="col-5">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
						  <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
						  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
						</svg>
							<input type="date" class="datepicker" id="startDate" name="startDate" value="${itemInfo.startDate }" readonly >
						</div>
						<div class="col-2">
							<span style="margin: 0 10px 0 10px;">~</span>
						</div>
						<div class="col-5">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
						  <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
						  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
						</svg>
							<input type="date" class="datepicker" id="endDate" name="endDate" value="${itemInfo.endDate }"  readonly >
						</div>
					</div>
				</td>
				<td>지역</td>
				<td>
					<input type="text" value="${itemInfo.tripArea }" readonly class="form-control">
				</td>
			</tr>
			<tr>
				<td>상세정보</td>
				<td colspan="3">
					<textarea name="itemDetail" class="form-control" rows="4" cols="" style="width: 100%;">${itemInfo.itemDetail }</textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="btnDiv">
				<div class="btnBlack" onclick="updateItem();" style="width: 130px;">수정하기</div>
			</div>
		</div>
	</div>
	</form>
</div>
<script type="text/javascript" src="/resources/js/admin/update_item.js?ver=3"></script>
</body>
</html>