<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/buy/buy_form_from_cart.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<div class="titleDiv">
		<h3>예약/결제</h3>
	</div>
	<div style="text-align: center; margin-top: 30px;"><h5>예약정보를 정확히 확인하시고, 결제를 진행해주세요.</h5></div>
	<div class="titleDiv">
		<h4>상품정보</h4>
	</div>
	<input type="hidden" id="buyPrice" value="${buyPrice }">
	<c:forEach items="${itemInfo}" var="item" varStatus="status">
		<input type="hidden" class="itemCodes" value="${item.itemCode }">
		<input type="hidden" class="travelers" value="${travelers[status.index] }">
	</c:forEach>

	<c:forEach items="${itemInfo}" var="item" varStatus="status">
	<table>
		<tr>
			<td>상품명</td>
			<td>${item.itemName }</td>
		</tr>	
		<tr>
			<td>상품코드</td>
			<td>${item.itemCode} <span style="font-size: 12.5px; margin-left: 5px; padding: 4px; cursor: pointer; background-color: #DDD; border-radius: 8px;" onclick="location.href='/item/itemDetail?itemCode=${item.itemCode}';">상품보기</span></td>
		</tr>	
		<tr>
			<td>여행기간</td>
			<td>${item.startDate} ~ ${item.endDate} <strong>(${item.tripDate})</strong></td>
		</tr>	
		<tr>
			<td>상품가격</td>
			<td><fmt:formatNumber value="${item.itemPrice }" pattern="#,###원"/></td>
		</tr>	
		<tr>
			<td>예약현황</td>
			<td>이 상품을 예약한 다른 회원 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg> <strong>${bookItemCnt[status.index] }</strong>명
			</td>
		</tr>	
	</table>
	</c:forEach>
	<div class="titleDiv">
		<h4>예약자정보</h4>
	</div>
	<input type="hidden" name="memAddr" id="memAddr" value="${memberInfo.memAddr}">
	<input type="hidden" name="memAddrDetail" id="memAddrDetail" value="${memberInfo.memAddrDetail}">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" class="form-control" name="memName" id="memName" value="${memberInfo.memName }" readonly></td>
			<td>생년월일</td>
			<td style="width: 250px;"><input type="date" class="form-control" name="memBirthday" id="memBirthday" value="${memberInfo.memBirthday }" readonly></td>
			<td>성별</td>
			<td style="width: 220px; text-align: center;">
				<input type="radio" name="memGender" id="memGender" value="남" class="form-check-input" onclick="return(false);"><span style="margin: 0 30px 0 0;"> 남</span> 
				<input type="radio" name="memGender" value="여" class="form-check-input" onclick="return(false);" readonly> 여 
			</td>
		</tr>
		<tr>
			<td>이메일주소</td>
			<td colspan="5"><input type="text" class="form-control" name="memId" id="memId" value="${memberInfo.memId }" readonly></td>
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
	<div class="titleDiv">
		<h4>총 결제 예상금액</h4>
	</div>
	<c:forEach items="${itemInfo }" var="item" varStatus="status">
		<input type="hidden" name="itemCode" id="itemCode" value="${item.itemCode}">
		<input type="hidden" name="itemName" id="itemName${status.index }" value="${item.itemName}">
		<input type="hidden" name="travelers" id="travelers" value="${travelers[status.index] }">
		<input type="hidden" name="cnt" id="cnt" value="${itemInfo.size()-1}">
			<div style="text-align: center; margin-top: 20px;"><span style="font-size: 25px;"><span style="margin-right: 40px;">상품명 : ${item.itemName } </span> <fmt:formatNumber value="${item.itemPrice }" pattern="#,###원"/> X ${travelers[status.index]}명</span> <span style="font-size: 32px; font-weight: bold;">= 
				<c:choose>
					<c:when test="${memberInfo.memRank eq '일반' }">
						<fmt:formatNumber value="${item.itemPrice * travelers[status.index] }" pattern="#,###원"/>
					</c:when>
					<c:when test="${memberInfo.memRank eq '우수' }">
						<fmt:formatNumber value="${item.itemPrice * travelers[status.index] * 0.95 }" pattern="#,###원"/>
					</c:when>
					<c:otherwise>
						<fmt:formatNumber value="${item.itemPrice * travelers[status.index] * 0.9 }" pattern="#,###원"/>
					</c:otherwise>
				</c:choose>
				</span>
			</div>
			<div style="text-align: center; margin-bottom: 20px;">(할인 금액 : 
				<c:choose>
					<c:when test="${memberInfo.memRank eq '일반' }">
						0원
					</c:when>
					<c:when test="${memberInfo.memRank eq '우수' }">
						<fmt:formatNumber value="${item.itemPrice * travelers[status.index] * 0.05 }" pattern="#,###원"/>
					</c:when>
					<c:otherwise>
						<fmt:formatNumber value="${item.itemPrice * travelers[status.index] * 0.1 }" pattern="#,###원"/>
					</c:otherwise>
				</c:choose>, 적립 포인트 : <fmt:formatNumber value="${item.itemPrice * travelers[status.index] * 0.05 }" pattern="#,###원"/> 적립예정)
			</div>
	</c:forEach>
	<div style="text-align: center; margin-top: 20px;">
		<span style="font-size: 25px;">
			<span style="margin-right: 40px;">총 금액 : </span>
		</span>
		<span style="font-size: 32px; font-weight: bold;"><fmt:formatNumber value="${buyPrice }" pattern="#,###원"/></span>
	</div>
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
	
	var memName = document.getElementById('memName').value;
	var memTell = document.getElementById('memTell').value;
	var memAddr = document.getElementById('memAddr').value;
	var memAddrDetail = document.getElementById('memAddrDetail').value;
	var memId = document.getElementById('memId').value;
	var itemName = document.getElementById('itemName0').value + ' 그 외 ' + document.getElementById('cnt').value + '건';
	var buyPrice = document.getElementById('buyPrice').value;
	
	
	var itemCodeTags = document.getElementsByClassName('itemCodes');
	var travelersTags = document.getElementsByClassName('travelers');
	var objArr = [];
	for(var i = 0 ; i < itemCodeTags.length ; i++){
		var obj = new Object();
		obj.itemCode = itemCodeTags[i].value;
		obj.travelers = travelersTags[i].value;
		objArr[i] = obj;
	}
	 console.log(JSON.stringify(objArr));
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
	    buyer_addr : memAddr + memAddrDetail,
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {  
    	$.ajax({
	    		url: '/buy/buyItems', //요청경로
	    		type: 'post',
	    		data: {'data':JSON.stringify(objArr)}, //필요한 데이터 '데이터이름':값
	    		success: function(result) {
	    			//ajax 실행 성공 후 실행할 코드 작성
	    			console.log(result);
			    	location.href='/buy/buySuccessFromCart?itemCode=' + result[0].itemCode + '&size=' + result.length;
	    		},
	    		error: function() {
	    			//ajax 실행 실패 시 실행되는 구간
	    			alert('실패');
	    		}
	    	}); 
	      } else {
	    	location.href='/buy/buyFail?errorMsg=' + rsp.error_msg;
	    }
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

$.fn.radioSelect = function(val) {
	this.each(function() {
	var $this = $(this);
	if($this.val() == val)
	$this.attr('checked', true);
	});
	return this;
	};

	var radioVal = document.getElementById('memGender').value;
	$(":radio[name='memGender']").radioSelect(radioVal);
</script>
</html>