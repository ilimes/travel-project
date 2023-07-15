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
		<div class="titleDiv">
			<h3>날씨정보</h3>
		</div>
		<div class="weatherDiv" style="text-align: center;">
			<input type="button" class="btn btn-secondary" id="myWeatherButton" value="내 지역 날씨 보기" onclick="myRegionWeather();" style="margin-top: 40px;">
			<div id="myWeatherDiv" style="text-align: center;"></div>
			<div style="height: 40px;"></div>
			<div id="test" style="display:flex; justify-content: space-between; flex-wrap: wrap; width: 100%; font-size: 20px; line-height: 1.8em;"></div>
			<div style="margin-top: 20px; border-bottom: 1px solid #cccccc"></div>
			<div id="searchBox" style="margin-top: 40px; margin-bottom: 40px;">
			    <input class="form-control" id="weatherSearchText" type="text" placeholder="도시 입력(영어로)" onkeydown="if (event.keyCode == 13) { searchWeather(); }" style="display: inline-block; width: 200px;">
			    <button class="btn btn-secondary" id="btnSearch" onclick="searchWeather();">검색</button>
			</div>
			<div id="testSearch" style="text-align: center;"></div>
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