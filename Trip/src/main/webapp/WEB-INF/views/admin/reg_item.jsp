<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin/reg_item.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div class="titleDiv">
		<h3>상품 등록</h3>
</div>
<div class="row">
	<form action="/admin/regItem" method="post" id="itemRegForm" enctype="multipart/form-data" >
	<div class="col-12">
		<table class="table regTable">
			<tr>
				<td>패키지명</td>
				<td><input type="text" class="form-control" name="itemName" id="itemName" style="width: 100%;" required></td>
				<td>가격</td>
				<td><input type="text" class="form-control" name="itemPrice" id="itemPrice" style="width: 100%;" required></td>
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
							<input type="date" class="datepicker" id="startDate" name="startDate" value="${bookSearchVO.searchFromDate }" readonly >
						</div>
						<div class="col-2">
							<span style="margin: 0 10px 0 10px;">~</span>
						</div>
						<div class="col-5">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
						  <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
						  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
						</svg>
							<input type="date" class="datepicker" id="endDate" name="endDate" value="${bookSearchVO.searchToDate }"  readonly >
						</div>
					</div>
				</td>
				<td>지역</td>
				<td>
					<select name="cateCode" class="form-select" id="categorySelector" style="width: 100%; text-align: center;">
						<option value="1">지역선택</option>
						<c:forEach items="${areaList}" var="area">
						<option value="${area.cateCode }">${area.cateName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td colspan="3">
					<div class="row">
						<div class="col-12">
							<input type="text" class="form-control" id="keyword" name="tripAddr" style="display: inline-block; width: 79.6%;">
						<button type="button" class="btn btn-secondary" style="width: 20%;" onclick="searchPlaces();">검색하기</button>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>상세정보</td>
				<td colspan="3">
					<textarea name="itemDetail" class="form-control" rows="4" cols="" style="width: 100%;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="1">
					<label for="img" class="form-label">메인이미지</label>
				</td>
				<td colspan="3">
			    	<input class="form-control" type="file" name="mainImg" id="img">
				</td>
			</tr>
			<tr>
				<td colspan="1">
					<label for="subImg" class="form-label">상세이미지</label>
				</td>
				<td colspan="3">
			    	<input class="form-control" type="file" name="subImg" id="subImg" multiple>
				</td>
			</tr>
		</table>
	</div>
	<div class="col-12">
		<div id="map" style="width:100%;height:400px;"></div>
	</div>
	<div class="hAddr">
        <span class="title"></span>
        <span id="centerAddr"></span>
    </div>
	<div class="row">
		<div class="col-12">
			<div class="btnDiv">
				<div class="btnBlack" onclick="regItem();" style="width: 130px;">등록하기</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="latitude" name="latitude">
	<input type="hidden" id="longitude" name="longitude">
	</form>
</div>

<!-- 카카오맵 테스트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9dff8063ba2a732b36c1eea435641f48&libraries=services"></script>
<script type="text/javascript" src="/resources/js/admin/reg_item.js?ver=11"></script>
</body>
</html>