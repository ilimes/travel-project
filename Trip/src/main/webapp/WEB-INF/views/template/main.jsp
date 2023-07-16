<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/typeit@8.3.3/dist/index.umd.js"></script>
<title>Insert title here</title>
<link href="/resources/css/main/main.css" rel="stylesheet">
<style type="text/css">
	:root {
		--ti-cursor-margin-left: 0.1em;
		--ti-cursor-color: black;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
			<div>
				<div style="height: 70px;">
					<h4 id="titleH4">고객님,<br><strong>어떤 여행을 꿈꾸시나요? </strong></h4>
				</div>
				<script>
					document.addEventListener('DOMContentLoaded', () => {
						new TypeIt('#titleH4')
							.pause(1000)
							.go();
					});
				</script>
				<div class="row upDiv">
					<div class="col-md-12">
						<input name="whereTrip" id="searchMainText" type="text" class="form-control"
							placeholder="어디로 떠나세요?" onkeydown="if (event.keyCode == 13) { mainSearch(); }" style="height: 41px;">
					</div>
					<div class="col-md-12">
						<span style="font-size: 18px; margin: 0 10px 0 10px;">출발일</span> <input name="whenTrip" id="searchMainDate" type="date" class="form-control datepicker"
							onkeydown="if (event.keyCode == 13) { mainSearch(); }" style="display: inline-block; width: 316.3px;">
					</div>
					<div class="col-md-12" style="margin-bottom: 20px;">
						<div>
							<button type="button" class="btnBlack" onclick="mainSearch();"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="padding-bottom: 2px;">
								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg> 검색</button>
						</div>
					</div>
					<div class="col-md-12">
						<div>
							<h4>
								<strong>베스트후기</strong><span style="font-size: 12.5px; float: right; padding: 4px; cursor: pointer; color: #472954; font-weight: bold; border-radius: 8px;" onclick="location.href='/item/bestReview?menuCode=MENU_002';">more</span>
							</h4>
						</div>
						<div>
							<table>
								<colgroup>
									<col width="20%">
									<col width="50%">
									<col width="30%">
								</colgroup>
								<thead>
									<tr>
										<td>순위</td>
										<td>제목</td>
										<td>추천수</td>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty reviewList }">
											<tr>
												<td colspan="6" style="line-height: 2.8em;">베스트후기가 존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${reviewList }" var="review" varStatus="vS">
													<tr>
														<td>${vS.index + 1  }위</td>
														<td><div class="reviewTitle"><a href="/item/reviewDetail?menuCode=MENU_002&reviewNum=${review.reviewNum }">${review.title }</a></div></td>
														<td>${review.likesCnt }</td>
													</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-8 imageSlide upDiv">
			<section class="carousel" aria-label="Gallery">
				<ol class="carousel__viewport">
					<li id="carousel__slide1" tabindex="0" class="carousel__slide">
						<div class="carousel__snapper">
							<a href="#carousel__slide4" class="carousel__prev">Go to
								last slide</a> <a href="#carousel__slide2" class="carousel__next">Go
								to next slide</a>
						</div>
					</li>
					<li id="carousel__slide2" tabindex="0" class="carousel__slide">
						<div class="carousel__snapper"></div> <a href="#carousel__slide1"
						class="carousel__prev">Go to previous slide</a> <a
						href="#carousel__slide3" class="carousel__next">Go to next
							slide</a>
					</li>
					<li id="carousel__slide3" tabindex="0" class="carousel__slide">
						<div class="carousel__snapper"></div> <a href="#carousel__slide2"
						class="carousel__prev">Go to previous slide</a> <a
						href="#carousel__slide4" class="carousel__next">Go to next
							slide</a>
					</li>
					<li id="carousel__slide4" tabindex="0" class="carousel__slide">
						<div class="carousel__snapper"></div> <a href="#carousel__slide3"
						class="carousel__prev">Go to previous slide</a> <a
						href="#carousel__slide1" class="carousel__next">Go to first
							slide</a>
					</li>
				</ol>
				<aside class="carousel__navigation">
					<ol class="carousel__navigation-list">
						<li class="carousel__navigation-item"><a
							href="#carousel__slide1" class="carousel__navigation-button">Go
								to slide 1</a></li>
						<li class="carousel__navigation-item"><a
							href="#carousel__slide2" class="carousel__navigation-button">Go
								to slide 2</a></li>
						<li class="carousel__navigation-item"><a
							href="#carousel__slide3" class="carousel__navigation-button">Go
								to slide 3</a></li>
						<li class="carousel__navigation-item"><a
							href="#carousel__slide4" class="carousel__navigation-button">Go
								to slide 4</a></li>
					</ol>
				</aside>
			</section>
		</div>
	</div>
</div>
<script src="/resources/js/main/main.js?ver=2" type="text/javascript"></script>
</body>
</html>