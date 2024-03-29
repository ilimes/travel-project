<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/css/admin/map_route.css" rel="stylesheet" />
<title>Insert title here</title>
<style type="text/css">
.titleDiv{
	border-bottom: 2px solid #cccccc;
	margin-bottom: 10px;
}
h3{
	font-weight: bold;
	line-height: 1.3em;
}
@keyframes fadeInDown {
    0% {
        opacity: 0;
        transform: translate3d(0, -100%, 0);
    }
    to {
        opacity: 1;
        transform: translateZ(0);
    }
}
.testDiv > div {
    position: relative;
    animation: fadeInDown 0.5s;
}
.resultDiv > div {
    position: relative;
    animation: fadeInDown 0.5s;
}
.testDiv div{
	border: 1px solid #888;
	border-radius: 8px;
	padding: 8px;
	/*line-height: 2.8em;*/
	margin-bottom: 10px;
}
.resultDiv > div{
	border: 1px solid #888;
	border-radius: 8px;
	padding: 8px;
	margin-right: 10px;
	margin-bottom: 10px;
}
.resultDiv svg{
	margin-right: 7px;
}	
</style>
</head>
<body>
<div class="container-fluid">
	<div class="titleDiv">
		<h3>경로찾기</h3>
	</div>
	<div style="text-align: center; font-size: 14px; margin-top: 20px; margin-bottom: 20px; color: #888">
		<div style="color: #333;"><strong>"추천 경로를 만들어드립니다!"</strong></div>
		<div>1. 키워드 입력 후 검색버튼을 눌러주세요.</div>
		<div>2. 장소를 여러 곳 선택하고 찾기 버튼을 눌러주세요.</div>
	</div>
	<div style="display: flex; column-gap: 25px;">
		<div style="width: 70%;">
			<div class="map_wrap">
				<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form class="form">
								키워드 : <input type="text" value="" id="keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
		</div>
		<div style="width: 29%;">
			<div class="titleDiv">
				<h5 style="font-weight: bold;">선택한 장소</h5>
			</div>
			<div class="testDiv" id="testDiv"></div>
			<div class="btns" onclick="distanceRoot();" style="margin: 20px 0 20px 0;">
				찾기
			</div>
			<div class="titleDiv">
				<h5 style="font-weight: bold;">추천경로</h5>
			</div>
			<div class="resultDiv" id="resultDiv"></div>
		</div>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9dff8063ba2a732b36c1eea435641f48&libraries=services"></script>
<script type="text/javascript" src="/resources/js/admin/map_route.js?ver=3"></script>
</body>
</html>