<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.sideMenuDiv{
	padding: 20px 0px 20px 0px;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}
.sideMenuDiv div{
	font-size: 18px;
	line-height: 40px;
}
.sideMenuDiv div:hover{
	font-weight: bold;
}
</style>
</head>
<body>
<div><h2><strong>고객센터</strong></h2></div>
<div class="sideMenuDiv">
	<c:forEach items="${sideMenuList }" var="sideMenu">
		<div <c:if test="${sideMenu.sideMenuCode eq selectedSideMenu }">style="font-weight: bold;"</c:if>><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dot" viewBox="0 0 16 16">
  			<path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"></path>
		</svg> <a href="/board/${sideMenu.sideMenuUri }?menuCode=${sideMenu.menuCode }&sideMenuCode=${sideMenu.sideMenuCode}">${sideMenu.sideMenuName }</a></div>
	</c:forEach>
</div>
</body>
</html>