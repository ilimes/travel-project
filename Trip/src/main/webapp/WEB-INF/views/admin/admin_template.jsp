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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/resources/css/common/common.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<div style="height: 10px;"></div>
	<div class="row">
		<div class="col">
			<tiles:insertAttribute name="menu"/>
		</div>
	</div>
	<div style="height: 20px;"></div>
	<div class="row" style="margin: 0 auto; padding: 10px;">
		<div class="col-2">
			<tiles:insertAttribute name="side"/>
		</div>
		<div class="col-10">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
	<div style="height: 105px;"></div>
</div>
</body>
</html>