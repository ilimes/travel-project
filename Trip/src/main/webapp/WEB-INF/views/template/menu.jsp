<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.topDiv{
	width: 1300px; margin: 0 auto; padding-left: 20px; padding-right: 20px;
}
.topDiv > div:first-child {
	text-align: right;
	margin-top: 5px;
}
.logo{
	font-size: 30px;
}
.searchDiv{
	display: inline-block; margin-left: 50px; border: 2px solid #DDDDDD; border-radius: 48px; width: 450px; height: 45px; text-align: center;
}
.searchDiv input[type="text"]{
	width: 350px; height: 40px; vertical-align: middle; border: none; outline: 0;
}
.firstTopMenu{
	height: 53px;
}
.firstTopMenu > div:first-child{
	width: 1300px; margin: 0 auto; vertical-align: middle; font-size: 20px; font-weight: bold; padding-top: 15px; padding-left: 20px; padding-right: 20px;
}
.secondTopMenu{
	/* template에 배경 있음 */
	background-image: linear-gradient(120deg, #7f69fa,#8e44ad,#725efe); height: 60px;
}
.secondTopMenu > div:first-child{
	width: 1300px; margin: 0 auto; color: white; line-height: 60px; vertical-align: middle; font-size: 18px; padding-left: 20px; padding-right: 20px;
}
.secondTopMenu a{
	color: white;
}
.firstTopMenu ul, .secondTopMenu ul, .topDiv > div:first-child ul{
	list-style: none;
	padding: 0;
	margin: 0;
}
.firstTopMenu li, .secondTopMenu li{
	margin-right: 9px;
	display: inline-block;
}
.secondTopMenu li{
	height: 60px;
	font-size: 16.5px;
}
.secondTopMenu li:hover{
	border-bottom: 3px solid white;
}
.topDiv > div:first-child li {
	margin-right: 5px;
	font-size: 14px;
	display: inline;
}
.selectedMenu{
	border-bottom: 4px solid #333;
}
.selectedSubMenu{
	border-bottom: 3px solid white;
}
.firstTopMenu li:hover{
	border-bottom: 4px solid #DDDDDD;	
}

.menu01:hover{
	cursor: pointer;
}
.subMenu01 {position: absolute; top: 164.2px; display: none; width: 1300px; height: 300px;  padding: 20px 0 0 15px; border: 1px solid #ccc; background: #fff; z-index: 999;  }
#nop {float: none; }

</style>
<link href="/resources/css/menu/rollingNotice.css" rel="stylesheet">
</head>
<body>
<div class="topDiv">
	<div>
		<ul>
			<li>
				<c:choose>
					<c:when test="${not empty sessionScope.loginInfo }">
						<span style="font-weight: bold; margin-right: 15px; ">${sessionScope.loginInfo.memName }님 환영합니다</span>  
						<a href="/member/logout">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="/member/loginForm">로그인</a>
					</c:otherwise>
				</c:choose>
			</li>
			<li>
				<c:choose>
					<c:when test="${not empty sessionScope.loginInfo }">
						<a href="/member/myInfo">마이페이지</a>
					</c:when>
					<c:otherwise>
						<a href="/member/certiJoinForm">회원가입</a>
					</c:otherwise>
				</c:choose>
			</li>
			<li><a href="/board/boardList?menuCode=SERVICE">고객센터</a></li>
			<li><a href="/cart/cartList">찜한 목록 보기</a></li>
			<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
				<li><a href="/admin/itemManage">관리자메뉴</a></li>
			</c:if>
		</ul>
	</div>
	<span class="logo">
		<a href="/item/mainPage">
			<img alt="로고이미지" src="/resources/images/logo.png">
		</a>
	</span>
	<div class="searchDiv">
		<span>
			<input type="text" id="searchText" name="searchText" placeholder="어디로 떠나고 싶으세요?" onkeydown="if (event.keyCode == 13) { search(); }"> 
			<span onclick="search();" style="cursor: pointer;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	 			 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg></span>
		</span>
	</div>
	<div class="noticeDiv">
		<div class="notice">
			<ul class="rolling">
				<c:forEach items="${noticeList }" var="notice">
						<li style="list-style: none;"><a href="/board/boardDetail?menuCode=SERVICE&sideMenuCode=SIDE_MENU_001&boardNum=${notice.boardNum }"><span style="color:#5e2bb8; font-weight: bold;">[공지]</span> ${notice.title }</a></li>
				</c:forEach>
			</ul>
		</div> 
	</div>
</div>
<div class="firstTopMenu">
	<div>
		<ul>
			<li class="menu01">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
		  			<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
				</svg> 전체메뉴
				<div class="subMenu01">
					<div id="nop">
						<div style="display: inline-block; width: 150px; vertical-align: top; margin-right: 20px;">
							<div style="border-bottom: 2px solid #111; padding-bottom: 7px;">국내/제주</div>
							<div style="font-size: 15px; font-weight: normal; padding-top: 7px;">
							<c:forEach items="${itemCateList }" var="itemCate">
								<div onclick="location.href='/item/itemList?cateCode=${itemCate.cateCode }';">${itemCate.cateName }</div>
							</c:forEach>
							</div>
						</div>
						<div style="display: inline-block; width: 150px; vertical-align: top; margin-right: 20px;">
							<div style="border-bottom: 2px solid #111; padding-bottom: 7px;">여행후기</div>
							<div style="font-size: 15px; font-weight: normal; padding-top: 7px;">
								<div onclick="location.href='/item/bestReview?menuCode=MENU_002';">베스트후기</div>
								<div onclick="location.href='/item/review?menuCode=MENU_002';">일반후기</div>
							</div>
						</div>
						<div style="display: inline-block; width: 150px; vertical-align: top; margin-right: 20px;">
							<div style="border-bottom: 2px solid #111; padding-bottom: 7px;">부가기능</div>
							<div style="font-size: 15px; font-weight: normal; padding-top: 7px;">
								<div onclick="location.href='/item/weather?menuCode=MENU_003';">날씨정보</div>
								<div onclick="location.href='/item/chatting?menuCode=MENU_003';">오픈채팅</div>
								<div onclick="location.href='/item/mapRoute?menuCode=MENU_003';">경로찾기</div>
							</div>
						</div>
						<div style="display: inline-block; width: 150px; vertical-align: top; margin-right: 20px;">
							<div style="border-bottom: 2px solid #111; padding-bottom: 7px;">고객센터</div>
							<div style="font-size: 15px; font-weight: normal; padding-top: 7px;">
								<div onclick="location.href='/board/notice?menuCode=SERVICE&sideMenuCode=SIDE_MENU_001';">공지사항</div>
								<div onclick="location.href='/board/question?menuCode=SERVICE&sideMenuCode=SIDE_MENU_002';">1:1문의</div>
							</div>
						</div>
					</div>
				</div>
			</li>
			<c:forEach items="${menuList }" var="menu">
				<li <c:if test="${selectedMenu eq menu.menuCode }">class="selectedMenu"</c:if>><a href="/item/${menu.menuUri }?menuCode=${menu.menuCode}">${menu.menuName }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="secondTopMenu">
	<div>
		<ul>
		<c:choose>
			<c:when test="${selectedMenu eq 'MENU_001' }">
				 <c:forEach items="${itemCateList }" var="itemCate">
					<li><a href="/item/itemList?cateCode=${itemCate.cateCode }">${itemCate.cateName }</a></li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach items="${subMenuList }" var="subMenu">
					<li><a href="/item/${subMenu.subMenuUri }?menuCode=${subMenu.menuCode }">${subMenu.subMenuName }</a></li>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</ul>
	</div>
</div>
<script src="/resources/js/menu/menu.js" type="text/javascript"></script>
<script src="/resources/js/menu/rollingNotice.js" type="text/javascript"></script>
</body>
</html>