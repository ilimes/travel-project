<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/item/item_list.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col">
			<div class="titleDiv">
				<h3>여행 목록 (${itemList.size() }건)</h3>
			</div>
			<c:choose>
				<c:when test="${empty itemList }">
					<div style="text-align: center; font-size: 24px;"><svg xmlns="http://www.w3.org/2000/svg" width="37" height="37" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 19 19">
						  <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
						  <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
						</svg> <strong>여행 목록이 존재하지 않습니다.</strong>
					</div>
					<div style="text-align: center; font-size: 14px; margin-top: 20px; color: #888">
						<div>현재 해당 카테고리에 준비된 상품이 존재하지 않습니다.</div>
						<div>검색하신 경우 다른 검색어로 다시 검색해주시거나, 단어의 철자가 정확한지 확인해주세요.</div>
					</div>
					<div style="margin-top: 30px; display: flex; justify-content: center;">
						<div class="btnBlack" style="width: 170px; font-size: 14.5px;" onclick="location.href='/item/mainPage'">메인으로 이동</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${itemList }" var="item">
						<div class="itemListDiv">
							<div class="row">
								<div class="col-md-4" style="text-align: center;">
									<div class="card-imageDiv" onclick="location.href='/item/itemDetail?cateCode=${item.cateCode }&itemCode=${item.itemCode}';" style="border-radius: 20px;">
										<img alt="" src="/resources/images/${item.attachedImgName }" class="card-img-top" style="width: 378px; height: 270px;">
									</div>
								</div>
								<div class="col-md-8" style="padding-left: 30px;">
									<div>패키지 > 국내 > ${item.itemCateVO.cateName }</div>
									<div><h4><strong>${item.itemName }</strong></h4></div>
									<div class="detailDiv">${item.itemDetail }</div>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-range" viewBox="0 0 16 16">
										  <path d="M9 7a1 1 0 0 1 1-1h5v2h-5a1 1 0 0 1-1-1zM1 9h4a1 1 0 0 1 0 2H1V9z"/>
										  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
										</svg> ${item.tripDate } (<strong>${item.startDate } ~ ${item.endDate }</strong>)
									</div>
									<div style="font-size: 20px;">
										<span style="color: #725efe;">★</span> ${item.rateAvg }</div>
									<div class="btnDiv">
										<div style="display: flex; justify-content: flex-end;">
											<div style="font-size: 28px; font-weight: bold; color: #111; margin-bottom: 10px;"><fmt:formatNumber pattern="#,###원">${item.itemPrice }</fmt:formatNumber></div>
										</div>
										<div style="display: flex; justify-content: flex-end;">
											<div class="btns" style="width: 200px;" onclick="location.href='/item/itemDetail?cateCode=${item.cateCode }&itemCode=${item.itemCode}';">자세히보기</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
</body>
</html>