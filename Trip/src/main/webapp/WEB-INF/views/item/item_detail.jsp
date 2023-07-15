<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/item/item_detail.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid" id="detail">
<input type="hidden" id="latitude" value="${itemInfo.latitude }">
<input type="hidden" id="longitude" value="${itemInfo.longitude }">
<input type="hidden" id="tripAddr" value="${itemInfo.tripAddr }">
	<form action="" method="post" id="itemForm">
	<input type="hidden" id="itemCode" name="itemCode" value="${itemInfo.itemCode }">
	<input type="hidden" id="buyPrice" name="buyPrice" value="${itemInfo.itemPrice }">
	<div class="row justify-content-center">
		<div class="col-8">
			<div class="titleDiv">
				<h3>여행 상세 정보</h3>
			</div>
		</div>
		<div class="row g-2 justify-content-center">
			<div class="col-4" style="text-align: center;">
				<img alt="" src="/resources/images/${itemInfo.attachedImgName }" style="width: 100%; height: 300px; border-radius: 20px;" id="attachedImgName"><br>
			</div>
			<div class="col-4" style="padding-left: 20px;">
				<div id="itemName"><h4><strong>${itemInfo.itemName }</strong></h4></div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-range" viewBox="0 0 16 16">
					  <path d="M9 7a1 1 0 0 1 1-1h5v2h-5a1 1 0 0 1-1-1zM1 9h4a1 1 0 0 1 0 2H1V9z"/>
					  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
					</svg> ${itemInfo.tripDate } (<strong>${itemInfo.startDate } ~ ${itemInfo.endDate }</strong>)</div>
				<div style="font-size: 20px;">
					<span style="color: #725efe;">★</span> ${itemInfo.rateAvg }
				</div>
				<div>
					<span style="font-size: 12.5px; margin-left: 1px; padding: 5px; cursor: pointer; background-color: #DDD; border-radius: 8px;" id="mapModal" data-bs-toggle="modal" data-bs-target="#exampleModal"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
					  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
					  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
					</svg> 지도보기</span>
				</div>
				<div style="margin-top: 20px; line-height: 2.2em; text-align: right;">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check" viewBox="0 0 16 16">
					  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
					  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
					</svg> 성인 <input type="number" class="form-control" id="travelers" name="travelers" min="1" value="1" style="display:inline-block; width: 100px; height: 30px; text-align: center;"> 인<br>
					<span style="display: none;" id="buyPriceSpan" data-price="${itemInfo.itemPrice }">${itemInfo.itemPrice }</span>
					<div style="font-size: 28px; font-weight: bold; color: #111; margin-bottom: 10px;"><span id="totalbuyPriceSpan"><fmt:formatNumber pattern="#,###원">${itemInfo.itemPrice }</fmt:formatNumber></span></div>
				</div>
			</div>
			<div class="row justify-content-center" id="btnDiv">
				<input type="hidden" id="memId" value="${sessionScope.loginInfo.memId }">
				<div class="col-3">
					<div class="btns" onclick="buyItem();"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wallet" viewBox="0 0 16 16">
  <path d="M0 3a2 2 0 0 1 2-2h13.5a.5.5 0 0 1 0 1H15v2a1 1 0 0 1 1 1v8.5a1.5 1.5 0 0 1-1.5 1.5h-12A2.5 2.5 0 0 1 0 12.5V3zm1 1.732V12.5A1.5 1.5 0 0 0 2.5 14h12a.5.5 0 0 0 .5-.5V5H2a1.99 1.99 0 0 1-1-.268zM1 3a1 1 0 0 0 1 1h12V2H2a1 1 0 0 0-1 1z"/>
</svg> 구매하기</div>
				</div>
				<div class="col-3">
					<div class="btns" onclick="insertCart();"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-check" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
</svg> 장바구니 담기</div>
				</div>
			</div>
			<div class="col-8">
				<div class="titleDiv">
					<h3>여행 설명</h3>
				</div>
				<div style="margin-bottom: 40px;" id="itemDetail">${itemInfo.itemDetail }</div>
			</div>
			<div class="col-8">
				<div class="titleDiv">
					<h3>상세 이미지</h3>
				</div>
			</div>
			<div class="col-8" style="margin-bottom: 40px;">
				<%-- <c:forEach items="${itemInfo.imageList }" var="img">
					<c:if test="${img.isMain eq 'N' }">
						<img src="/resources/images/${img.attachedImgName }" width="100%">
					</c:if>
				</c:forEach> --%>
				
				<!-- 상세 이미지 슬라이더 만들 곳 -->
				<div id="slideShow">
					<ul class="slides">
					<c:forEach items="${itemInfo.imageList }" var="img">
						<c:if test="${img.isMain eq 'N' }">
							<li><img src="/resources/images/${img.attachedImgName }"></li>
						</c:if>
					</c:forEach>
					</ul>
					<p class="controller">
						<!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
						<span class="prev">&lang;</span> <span class="next">&rang;</span>
					</p>
				</div>
			</div>
			<div class="col-8">
				<div class="titleDiv">
					<h3>여행 후기</h3>
				</div>
			</div>
			<div class="col-8">
				<table>
					<c:forEach items="${reviewList }" var="review" varStatus="vS">
						<c:if test="${review.itemCode eq itemInfo.itemCode }">
							<tr>
								<td style="color: #725efe">
								<c:forEach begin="1" end="${review.itemRate }">
									★
								</c:forEach>
								</td>
								<td><div class="reviewTitle"><a href="/item/reviewDetail?menuCode=MENU_002&reviewNum=${review.reviewNum }">${review.title }</a></div></td>
								<td><div class="reviewWriter">${review.writer }</div></td>
								<td>${review.createDate }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</form>
</div>


<!-- /////////////////////지도보기 모달///////////////////// -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><strong>여행 상세 지도</strong></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div id="map" style="width:100%; height:500px;"></div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=667f5ed1f72a801ed09ae8d4668f32a8&libraries=services"></script>
<script src="/resources/js/item/slideImg.js" type="text/javascript"></script>
<script src="/resources/js/item/item_detail.js?ver=16" type="text/javascript"></script>
</body>
</html>