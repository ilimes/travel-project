// 마커를 담을 배열입니다
var markers = [];
let presentPosition;
 
/////////////////지도의 중심을 현재 위치로 변경///////////////////////
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.53500422503438, 129.31028385893904), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨 
    }; 
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon) // geolocation으로 얻어온 좌표
        presentPosition=locPosition;
 
        map.setCenter(locPosition);   
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 
    
    var locPosition = new kakao.maps.LatLng(37.566826, 126.9786567)
    alert('현재 위치를 찾을 수 없습니다!');
}
 
////////////////////장소 검색/////////////////////////////
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  
 
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
 
const searchForm = document.querySelector('.form');
searchForm.addEventListener('submit', function(e){
    e.preventDefault();
    // 키워드로 장소를 검색합니다
    searchPlaces();
})
 
 
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
 
    var keyword = document.getElementById('keyword').value;
 
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
 
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}
 
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
 
        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);
 
        // 페이지 번호를 표출합니다
        displayPagination(pagination);
 
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
 
        alert('검색 결과가 존재하지 않습니다.');
        return;
 
    } else if (status === kakao.maps.services.Status.ERROR) {
 
        alert('검색 결과 중 오류가 발생했습니다.');
        return;
 
    }
}
 
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
 
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    
   
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);
 
    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
 
        const lon = places[i].x;
        const lat = places[i].y;
 
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
 
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
 
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });
 
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
 
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };
 
            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);
        
 
        // 마커와 검색 결과를 클릭했을때 좌표를 가져온다 
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'click', function() {
                searchDetailAddrFromCoords(marker.getPosition(), function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
                        
                        $('.testDiv').append('<div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">\n' +
                            '  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>\n' +
                            '  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>\n' +
                            '</svg> ' + detailAddr +   title  + ' </div>');
                        $('.testDiv').append('<input name="lng" type="hidden" value=" ' + marker.getPosition().getLng()  +'">' ); 
                        $('.testDiv').append('<input name="lat" type="hidden" value=" ' + marker.getPosition().getLat()  +'">' ); 
}                                       
                });
            })
 
            itemEl.onclick =  function () {
                searchDetailAddrFromCoords(marker.getPosition(), function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
                          
                        $('.testDiv').append('<div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">\n' +
                            '  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>\n' +
                            '  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>\n' +
                            '</svg> ' + detailAddr + title + ' </div>');
                        $('.testDiv').append('<input name="lng" type="hidden" value=" ' + marker.getPosition().getLng()  +'">' ); 
                        $('.testDiv').append('<input name="lat" type="hidden" value=" ' + marker.getPosition().getLat()  +'">' );          
                    }   
                });
            };
        })(marker, places[i].place_name);
 
        fragment.appendChild(itemEl);
    }
 
    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
 
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
    
   

}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
 
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';
 
    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           
 
    el.innerHTML = itemStr;
    el.className = 'item';
 
    return el;
}
 

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });
 
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
 
    return marker;
}
 
// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
 
// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 
 
    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }
 
    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;
 
        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }
        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}
 
// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
 
    infowindow.setContent(content);
    infowindow.open(map, marker);
}
 
 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
// 좌표 -> 주소
var geocoder = new kakao.maps.services.Geocoder();
function searchDetailAddrFromCoords(coords, callback) {
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}








function distanceRoot(){
	
	var test = document.getElementById('testDiv');
	$('#resultDiv').empty();
	
	if(test.innerText != ''){
		
	
	var lng = document.getElementsByName('lng');
	var lat = document.getElementsByName('lat');
	var lnglat = [];
	for(var i = 0 ; i < lng.length ; i++){
		var obj = new Object();
		
		obj.lng = lng[i].value;
		obj.lat = lat[i].value;
		
		
		
		lnglat[i] = obj;
		
	}
	}
	else {
		alert('검색할 장소를 지정해주세요.');
		return;
	}
	
	$.ajax({
		url: '/admin/calculation', //요청경로
		type: 'post',
		data: {'data':JSON.stringify(lnglat)}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			//root(result);
			var lnglat1 = result;
			var drawingFlag = true;
//var drawingFlag; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var drawLine;
var drawLineTest = [];
var positions = [];
console.log(drawLineTest);	

	$('#testDiv').empty();
	var geocoder = new kakao.maps.services.Geocoder();

    let resultIdx = 1;
	var nextIndex = 0;
	for(var i = 0 ; i < lnglat1.length ; i ++){
		var lng = lnglat1[i].lng;
		var lat = lnglat1[i].lat;
		
		positions[i] = new daum.maps.LatLng(lat, lng);
		
		
		 var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[i], // 마커를 표시할 위치
        // 마커 이미지 
        });
		position1 = positions[i];

		searchDetailAddrFromCoords(position1, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            

           $('#resultDiv').append('<div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">\n' +
               '  <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>\n' +
               '</svg>' + resultIdx++ + '번째 👉 ' + result[0].address.address_name + '</div>');
           if(nextIndex++ != lnglat.length - 1){
           // $('#resultDiv').append('<svg xmlns="http://www.w3.org/2000/svg" width="15" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="2 0 16 16"><path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/></svg>');
         }
        }
        else{
	
} 
    
	});
	}

	var linePath;
    var lineLine = new daum.maps.Polyline();
    var distance;
 	
 	
    for (var i = 0; i < positions.length; i++) {
        if (i != 0) {
            linePath = [ positions[i - 1], positions[i] ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
        }
        ;
        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
	    
 		
        var drawLine = new daum.maps.Polyline({
            map : map, // 선을 표시할 지도입니다 
            path : linePath,
            strokeWeight : 3, // 선의 두께입니다 
            strokeColor : '#db4040', // 선의 색깔입니다
            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
        });
 
        distance = Math.round(lineLine.getLength());
        
        
	    drawLine.setMap(map);
        displayCircleDot(positions[i], distance);
        drawLineTest[i] = drawLine;
    }
    

    function displayCircleDot(position, distance) {
        if (distance > 0) {
            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			

            var distanceOverlay = new daum.maps.CustomOverlay(
                    {
                        content : '<div class="dotOverlay">거리 <span class="number">'
                                + distance + '</span>m</div>',
                        position : position,
                        yAnchor : 1,
                        zIndex : 2
                    });
 
            // 지도에 표시합니다
            
            distanceOverlay.setMap(map);
        }
    }
	kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	
	
	});


		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
	
}