<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/buy/buy_form.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<div class="titleDiv">
		<h3>예약/결제</h3>
	</div>
	<div style="text-align: center; margin-top: 30px;"><h5>예약정보를 정확히 입력해주시고, 결제를 진행해주세요.</h5></div>
	<div class="titleDiv">
		<h4>상품정보</h4>
	</div>
	<table>
		<tr>
			<td>상품명</td>
			<td>${itemInfo.itemName }</td>
		</tr>	
		<tr>
			<td>상품코드</td>
			<td>${itemInfo.itemCode} <span style="font-size: 12.5px; margin-left: 5px; padding: 4px; cursor: pointer; background-color: #DDD; border-radius: 8px;" onclick="location.href='/item/itemDetail?itemCode=${itemInfo.itemCode}';">상품보기</span></td>
		</tr>	
		<tr>
			<td>여행기간</td>
			<td>${itemInfo.startDate} ~ ${itemInfo.endDate} <strong>(${itemInfo.tripDate})</strong></td>
		</tr>	
		<tr>
			<td>상품가격</td>
			<td><fmt:formatNumber value="${itemInfo.itemPrice }" pattern="#,###원"/></td>
		</tr>	
		<tr>
			<td>예약현황</td>
			<td>이 상품을 예약한 다른 회원 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg> <strong>${bookItemCnt }</strong>명
			</td>
		</tr>	
	</table>
	<div class="titleDiv">
		<h4>예약자정보</h4>
	</div>
	<c:choose>
		<c:when test="${not empty sessionScope.loginInfo }">
	<input type="hidden" name="memAddr" id="memAddr" value="${memberInfo.memAddr}">
	<input type="hidden" name="memAddrDetail" id="memAddrDetail" value="${memberInfo.memAddrDetail}">
	<input type="hidden" id="temp" value="0">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" class="form-control" name="memName" id="memName" value="${memberInfo.memName }" readonly></td>
			<td>생년월일</td>
			<td style="width: 250px;"><input type="date" class="form-control" name="memBirthday" id="memBirthday" value="${memberInfo.memBirthday }" readonly></td>
			<td>성별</td>
			<td style="width: 220px; text-align: center;">
			<c:if test="${memberInfo.memGender eq '남'}">
				<input type="radio" name="memGender" id="memGender" value="남" class="form-check-input" checked><span style="margin: 0 30px 0 0;"> 남</span>  
			</c:if>
			<c:if test="${memberInfo.memGender eq '여'}">
				<input type="radio" name="memGender" id="memGender" value="여" class="form-check-input" checked><span style="margin: 0 30px 0 0;"> 여</span> 
			</c:if>
			</td>
		</tr>
		<tr>
			<td>이메일주소</td>
			<td colspan="5"><input type="text" class="form-control" name="memName" id="memId" value="${memberInfo.memId }" readonly></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td colspan="5"><input type="text" class="form-control" name="memTell" id="memTell" value="${memberInfo.memTell }" readonly></td>
		</tr>
	</table>
	<div class="titleDiv">
		<h4>할인 및 포인트</h4>
	</div>
	<table>
		<tr>
			<td>회원 등급</td>
			<td>${memberInfo.memRank }</td>
		</tr>
		<tr>
			<td>할인 금액</td>
			<td>
				<c:choose>
					<c:when test="${memberInfo.memRank eq '일반' }">
						할인 없음
					</c:when>
					<c:when test="${memberInfo.memRank eq '우수' }">
						<fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers * 0.05 }" pattern="#,###원"/>
					</c:when>
					<c:otherwise>
						<fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers * 0.1 }" pattern="#,###원"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>포인트</td>
			<td><strong><fmt:formatNumber value="${memberInfo.memPoint }" pattern="#,###"/></strong>원 사용가능</td>
		</tr>
	</table>
	</c:when>
		<c:otherwise>
		<form action="/buy/buyItem" method="post" id="tempMemberForm">
		<input type="hidden" value="${itemInfo.itemCode }" name="itemCode">
		<input type="hidden" name="buyPrice" id="buyPrice" value="${itemInfo.itemPrice * buyVO.travelers }">
		<input type="hidden" value="${buyVO.travelers }" name="travelers">
		<input type="hidden" id="temp" value="1">
		<table>
		<tr>
			<td>이름</td>
			<td style="width: 300px;"><input type="text" class="form-control" name="tempName" id="memName"  placeholder="이름을 입력해주세요."></td>
			<td>생년월일</td>
			<td><input type="date" class="form-control" name="tempBirthday" id="memBirthday"  placeholder="예시) 19120303" max="9999-12-31"></td>
			<td style="background-color: white;">
				<div class="row">
					<div class="col-6">
						<input type="radio" name="tempGender"  value="남" checked> 남
					</div>
					<div class="col-6">
						<input type="radio" name="tempGender"  value="여"> 여
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>이메일주소</td>
			<td colspan="4"><input type="email" class="form-control" name="tempEmail" id="memId"  placeholder="이메일을 입력해주세요."></td>
		</tr>
		<tr>
			<td>주소</td>
				<td colspan="2"><input type="text" class="form-control" name="tempAddr" id="memAddr"  placeholder="주소" onclick="sample4_execDaumPostcode();" readonly>
			</td>
			<td style="background-color: white; padding: 0 0 0 0;">
				<input type="text" class="form-control" name="tempZipcode" id="memZipcode" placeholder="우편번호" style="width: 100%;" readonly>
			</td>
			<td style="text-align: center;">
				<label for="inputEmail5" class="form-label" >&nbsp;</label>
				<button type="button" class="btn btn-secondary" id="inputEmail5" onclick="sample4_execDaumPostcode();" style="width: 160px;">우편번호 찾기</button>
			</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td colspan="4">
				<input type="text" class="form-control" name="tempAddrDetail" id="memAddrDetail" placeholder="상세주소를 입력해주세요.">
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td colspan="4">
				<div class="row">
					<div class="col-4">
						<select id="memTell1" class="form-select" name="tempTells" >
							<option selected value="010">010</option>
							<option value="011">011</option>
							<option value="012">012</option>
			      		</select>
					</div>
					<div class="col-4">
						<input type="text" class="form-control" name="tempTells" id="memTell2" maxlength="4">
					</div>
					<div class="col-4">
						<input type="text" class="form-control" name="tempTells" id="memTell3" maxlength="4" >
					</div>
				</div>
			</td>
		</tr>
	</table>
	</form>
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="itemCode" id="itemCode" value="${buyVO.itemCode}">
	<input type="hidden" name="itemName" id="itemName" value="${itemInfo.itemName }">
	<input type="hidden" name="travelers" id="travelers" value="${buyVO.travelers }">
	<c:if test="${not empty sessionScope.loginInfo }">
	<c:choose>
		<c:when test="${memberInfo.memRank eq '일반' }">
			<input type="hidden" name="buyPrice" id="buyPrice" value="${buyVO.buyPrice * buyVO.travelers }">
		</c:when>
		<c:when test="${memberInfo.memRank eq '우수' }">
			<input type="hidden" name="buyPrice" id="buyPrice" value="<fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers * 0.95 }" pattern="####"/>">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="buyPrice" id="buyPrice" value="<fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers * 0.9 }" pattern="####"/>">
		</c:otherwise>
	</c:choose>
	</c:if>
	<div class="titleDiv">
		<h4>총 결제 예상금액</h4>
	</div>
	<c:choose>
		<c:when test="${not empty sessionScope.loginInfo }">
			<div style="text-align: center; margin-top: 20px;"><span style="font-size: 25px;"><span style="margin-right: 40px;">성인</span> <fmt:formatNumber value="${buyVO.buyPrice }" pattern="#,###원"/> X ${buyVO.travelers}명</span> <span style="font-size: 32px; font-weight: bold;">= 
				<c:choose>
					<c:when test="${memberInfo.memRank eq '일반' }">
						<fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers }" pattern="#,###원"/>
					</c:when>
					<c:when test="${memberInfo.memRank eq '우수' }">
						<fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers * 0.95 }" pattern="#,###원"/>
					</c:when>
					<c:otherwise>
						<fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers * 0.9 }" pattern="#,###원"/>
					</c:otherwise>
				</c:choose>
				</span>
			</div>
			<c:if test="${not empty sessionScope.loginInfo }">
			<div style="text-align: center; margin-bottom: 20px;">(할인 금액 : 
				<c:choose>
					<c:when test="${memberInfo.memRank eq '일반' }">
						0원
					</c:when>
					<c:when test="${memberInfo.memRank eq '우수' }">
						<fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers * 0.05 }" pattern="#,###원"/>
					</c:when>
					<c:otherwise>
						<fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers * 0.1 }" pattern="#,###원"/>
					</c:otherwise>
				</c:choose>, 적립 포인트 : <fmt:formatNumber value="${buyVO.buyPrice * buyVO.travelers * 0.05 }" pattern="#,###원"/> 적립예정)
			</div>
			</c:if>
		</c:when>
		<c:otherwise>
			<div style="text-align: center; margin-top: 20px;"><span style="font-size: 25px;"><span style="margin-right: 40px;">성인</span> <fmt:formatNumber value="${itemInfo.itemPrice }" pattern="#,###원"/>
			 X ${buyVO.travelers}명<span style="font-size: 32px; font-weight: bold;">= <fmt:formatNumber value="${itemInfo.itemPrice * buyVO.travelers}" pattern="#,###원"/></span>
			</span></div>
		</c:otherwise>
	</c:choose>
	<br>
	<div class="titleDiv">
		<h4>결제방식</h4>
	</div>
	<div><input type="radio" class="form-check-input" checked>일반/간편결제</div>
	<br>
	<div class="form-check" style="display:flex; justify-content: right;">
		<input class="form-check-input" type="checkbox" value="" id="confirmCheck">
		<label class="form-check-label" for="defaultCheck1" style="margin-left: 5px;">
		  주문서 내역 확인 및 개인정보 제공 동의
		</label>
	</div>
	<br>
	<div class="btnDiv">
		<div class="btns" style="width: 200px;" id="check_module" onclick="iamport();">결제하기</div>
	</div>
</div>
</body>

<!-- 수정 Modal -->
<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div>주문서 내역 확인 및 개인정보 제공 동의를 체크해주세요.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btns" data-bs-dismiss="modal" style="display: inline-block; width: 90px; padding: 0; background: #ddd; color: black; box-shadow: 0px 1px 5px 0px #333, 5px 5px 15px 5px rgb(0 0 0 / 0%);">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- 비회원 구매 주소 검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function iamport(){
	if(!confirmCheck.checked){
		 //모달창을 띄우기
        var modalTag = document.getElementById('confirmModal');   
        var myModal = new bootstrap.Modal(modalTag);
        myModal.show();
		return;
	}
	
	if(document.getElementById('temp').value == '0'){
		var memTell = document.getElementById('memTell').value;
		var zipcode = '1';
	}
	else{
		var tell1 = document.getElementById('memTell1').value;
		var tell2 = document.getElementById('memTell2').value;
		var tell3 = document.getElementById('memTell3').value;
		var memTell = tell1 + '-' + tell2 + '-'  + tell3;
		var zipcode = document.getElementById('memZipcode').value;
		
		
		var genderList = document.getElementsByName('tempGender');
		for(var i = 0 ; i < genderList.length ; i++){
			if(genderList[i].checked){
				var gender = genderList[i].value;
			}
		}
	
	}
	
	var memName = document.getElementById('memName').value;
	var memAddr = document.getElementById('memAddr').value;
	var memAddrDetail = document.getElementById('memAddrDetail').value;
	var memId = document.getElementById('memId').value;
	var itemCode = document.getElementById('itemCode').value;
	var itemName = document.getElementById('itemName').value;
	var buyPrice = document.getElementById('buyPrice').value;
	var travelers = document.getElementById('travelers').value;
	var birthday = document.getElementById('memBirthday').value;
	
	
	console.log(memName);
	console.log(memTell);
	console.log(memAddr);
	console.log(memAddrDetail);
	console.log(birthday);
	console.log(zipcode);
	console.log(gender);

	//가맹점 식별코드
	IMP.init('imp23834522');
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : itemName, //결제창에서 보여질 이름
	    amount : buyPrice, //실제 결제되는 가격
	    buyer_email : memId,
	    buyer_name : memName,
	    buyer_tel : memTell,
	    buyer_addr : memAddr + ' ' + memAddrDetail,
	    //buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	$.ajax({
	    		url: '/buy/buyItem', //요청경로
	    		type: 'post',
	    		data: {'itemCode':itemCode, 'travelers':travelers
	    			, 'tempName':memName, 'tempTell':memTell, 'tempAddr':memAddr, 'tempAddrDetail':memAddrDetail
	    			, 'tempBirthday':birthday, 'tempZipcode':zipcode, 'tempEmail':memId, 'buyPrice':buyPrice, 'tempGender':gender}, //필요한 데이터 '데이터이름':값
	    		success: function(result) {
	    			//ajax 실행 성공 후 실행할 코드 작성
			    	location.href='/buy/buySuccess?itemCode=' + result.itemCode + '&temp=' + result.temp + '&bookNum=' + result.bookNum;
	    		},
	    		error: function() {
	    			//ajax 실행 실패 시 실행되는 구간
	    			alert('실패');
	    		}
	    	});
	    	
	    	//var msg = '결제가 완료되었습니다.\n';
	        //msg += '고유ID : ' + rsp.imp_uid;
	        //msg += '상점 거래ID : ' + rsp.merchant_uid;
	        //msg += '결제 금액 : ' + rsp.paid_amount;
	        //msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	location.href='/buy/buyFail?errorMsg=' + rsp.error_msg;
	    	//var msg = '결제에 실패하였습니다.\n';
	        //msg += '에러내용 : ' + rsp.error_msg;
	    }
	    //alert(msg);
	});
}
</script>
<script type="text/javascript">
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            document.getElementById("memZipcode").value = data.zonecode;
            document.getElementById("memAddr").value = roadAddr;
            
        }
    }).open();
}
</script>

</html>