//------------------------- 수량 변경 시 이벤트 진행 코드 -------------------------------//
//여행자 input 태그 들고옴
var travelers = document.getElementById('travelers');

travelers.addEventListener('change', setTotalPrice);
travelers.addEventListener('keyup', setTotalPrice);

function setTotalPrice(){
	if(travelers.value < 0 || travelers.value == ""){
		travelers.value = 1;
	}
	else if(travelers.value > 50){
		travelers.value = 1;
	}
	
	//개당 가격 정보
	var price = document.getElementById('buyPriceSpan').dataset.price;
	//수량
	var cnt = travelers.value;
	
	//var totalPrice = (price * cnt).toLocaleString("ko-KR", { style: 'currency', currency: 'KRW' }); // <- 원화표시 앞에 붙이기
	var totalPrice = (price * cnt).toLocaleString() + '원';
	
	document.getElementById('totalbuyPriceSpan').innerText = totalPrice;
}

// ------------------  구매하기 ------------------ //


function buyItem(){
	
	var itemCode = document.getElementById('itemCode').value;
	var travelers = document.getElementById('travelers').value;
	var memId = document.getElementById('memId').value;
	
	
	if(memId == null || memId == ""){
		var result = confirm('로그인 상태가 아닙니다. \n비회원 구매 페이지로 이동하시겠습니까?');
		if(result){
			location.href='/buy/buyForm?itemCode=' + itemCode + '&travelers=' + travelers;
		}
	}
	
	else {
		buyForm();
	}
}

// ----------------------------------- //

function buyForm(){
	document.getElementById('itemForm').action = '/buy/buyForm';
	itemForm.submit();
}

/*function bookItem(itemCode, travelers){
	$.ajax({
    url: '/buy/buyItem', //요청경로
    type: 'post',
    data:{'itemCode':itemCode, 'travelers':travelers}, //필요한 데이터 '데이터이름':값
    success: function(result) {
      //ajax 실행 성공 후 실행할 코드 작성
      var conf = confirm('패키지 예약이 완료되었습니다.');
      
    },
    error: function(){
      //ajax 실행 실패 시 실행되는 구간
       alert('실패');
    }
	});
}*/

// ----------------- 장바구니 코드 ---------------- //

function insertCart(){
/*	var formTag = document.getElementById('itemForm');
	formTag.action = '/cart/insertCart';
	formTag.submit();*/
	var itemCode = document.getElementById('itemCode').value;
	var travelers = document.getElementById('travelers').value;
	var memId = document.getElementById('memId').value;
	
	if(memId == null || memId == ""){
		var result = confirm('로그인 상태가 아닙니다. \n비회원 구매 페이지로 이동하시겠습니까?');
		if(result){
			location.href='/buy/buyForm?itemCode=' + itemCode + '&travelers=' + travelers;
		}
	}
	else{
		insertCartGo();
	}
	
	
}

function insertCartGo(){
	var itemCode = document.getElementById('itemCode').value;
	var travelers = document.getElementById('travelers').value;
	
	$.ajax({
    url: '/cart/insertCart', //요청경로
    type: 'post',
    data:{'itemCode':itemCode, 'travelers':travelers}, //필요한 데이터 '데이터이름':값
    success: function(result) {
      //ajax 실행 성공 후 실행할 코드 작성
      var result = confirm('여행 상품을 장바구니에 등록했습니다. \n장바구니로 이동하시겠습니까?');
      
      if(result){
		location.href='/cart/cartList';
	  }
      
    },
    error: function(){
      //ajax 실행 실패 시 실행되는 구간
       alert('실패');
    }
	});
}



//-----------------------------지도, 모달---------------------------//
var itemName = document.getElementById('itemName');
var mainImage = document.getElementById('attachedImgName');
var latitude = document.getElementById('latitude');
var longitude = document.getElementById('longitude');
var tripAddr = document.getElementById('tripAddr');

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(latitude.value - -0.00273891683815, longitude.value - +0.0045877), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var locPosition = new kakao.maps.LatLng(latitude.value, longitude.value); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다


// 지도에 마커를 표시합니다 
var marker = new kakao.maps.Marker({
    map: map, 
    position: new kakao.maps.LatLng(latitude.value, longitude.value)
});
    
// 커스텀 오버레이에 표시할 컨텐츠 입니다
// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// 별도의 이벤트 메소드를 제공하지 않습니다 
var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '          상세위치정보' + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src=" '+ mainImage.src +'" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">'+ itemName.innerText  +'</div>' + 
            '                <div class="jibun ellipsis">'+ tripAddr.value  +'</div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

// 마커 위에 커스텀오버레이를 표시합니다
// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new kakao.maps.CustomOverlay({
    content: content,
    map: map,
    position: marker.getPosition()       
});

// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker, 'click', function() {
    overlay.setMap(map);
});

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
    overlay.setMap(null);     
}




function resizeMap() {
    var mapContainer = document.getElementById('map');
    mapContainer.style.width = '650px';
    mapContainer.style.height = '650px'; 
}

function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}    

$(document).ready(function(){       
    $('#exampleModal').on('shown.bs.modal', function () {
   		relayout();
   		displayMarker(locPosition, message);
    });
 
});

