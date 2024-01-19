<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/item/weather.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<%--아이콘 --%>
	<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
		<div class="titleDiv" style="display: flex;">
			<h3>날씨정보</h3>
			<div style="margin-left: auto; display: flex; align-items: center; font-size: 13.5px; color: #888;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16" style="margin-right: 5px;">
					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					<path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
				</svg>
				우리나라 각 지역의 날씨 정보를 제공해드립니다. 내 지역 날씨 혹은 특정 지역 날씨를 확인할 수도 있습니다.
			</div>
		</div>
		<div class="weatherDiv" style="text-align: center;">
			<div style="height: 40px;"></div>
			<div id="weather-spinner" class="spinner-border" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
			<div id="weather" style="display:none; justify-content: space-between; flex-wrap: wrap; width: 100%; font-size: 20px; line-height: 1.8em;"></div>
			<div style="margin-top: 20px; border-bottom: 1px solid #cccccc"></div>
			<div style="width: 600px; margin: 0 auto;">
				<div style="float: left;">
					<button type="button" class="btn btn-secondary" id="myWeatherButton" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="클릭 시 날씨 정보가 나와요." onclick="myRegionWeather();" style="margin-top: 40px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brightness-high" viewBox="0 0 16 16" style="padding-bottom: 2px;">
							<path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
						</svg> 내 지역 날씨 보기
					</button>
					<div style="width: 155px;">
						<div id="my-weather-spinner" class="spinner-border" role="status" style="display: none; margin: 0 auto; margin-top: 70px;">
							<span class="visually-hidden">Loading...</span>
						</div>
					</div>
					<div id="myWeatherDiv" style="text-align: center; margin-top: 37.5px;"></div>
				</div>
				<div style="float: right;">
					<div id="searchBox" style="margin-top: 40px; margin-bottom: 40px;">
						<input class="form-control" id="weatherSearchText" type="text" placeholder="도시 입력(영어로)" onkeydown="if (event.keyCode == 13) { searchWeather(); }" style="display: inline-block; width: 200px;">
						<button class="btn btn-secondary" id="btnSearch" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="도시명은 영어로 입력해주세요." onclick="searchWeather();" style="width: 100px;">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="padding-bottom: 3px;">
								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg> 검색
						</button>
					</div>
					<div id="testSearch" style="text-align: center;"></div>
				</div>
			</div>
		</div>
</div>
<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="modalBody"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" data-bs-dismiss="modal" id="btnOk" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">확인</button>
      </div>
    </div>
  </div>
</div>
<script src="/resources/js/item/weather.js" type="text/javascript"></script>
</body>
</html>