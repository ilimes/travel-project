<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
<tiles:insertAttribute name="title"/>
</title>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- common.css -->
<link href="/resources/css/common/common.css" rel="stylesheet">
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- jquery 사용을 위한 태그 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
body{
	width:100%;
	overflow-x:hidden;
}
.topBackground{
	position: absolute;
	top: 164px;
	background-image: linear-gradient(120deg, #7f69fa,#8e44ad,#725efe);
	width: 100%;
    height: 60px;
    z-index: -1;
}
</style>
</head>
<body>
<div class="header">
    <div class="progress-container">
        <div class="progress-bar"></div>
    </div>
</div>
<div class="topBackground"></div>
 
<div class="container-fluid content_obj">
	<div style="height: 10px;"></div>
	<div class="row">
		<div class="col">
			<tiles:insertAttribute name="menu"/>
		</div>
	</div>
	<div style="height: 20px;"></div>
	<div class="row" style="width: 1300px; margin: 0 auto; padding: 10px;">
		<div class="col-3">
			<tiles:insertAttribute name="side"/>
		</div>
		<div class="col-9">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
	<div style="height: 130px;"></div>
	<div class="row">
		<div class="col">
			<tiles:insertAttribute name="foot"/>
		</div>
	</div>
</div>
</body>
<script src="/resources/js/template/template.js" type="text/javascript"></script>
</html>