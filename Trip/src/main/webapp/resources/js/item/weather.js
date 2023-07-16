
let weatherIcon = {
	'01' : 'fas fa-sun',
	'02' : 'fas fa-cloud-sun',
	'03' : 'fas fa-cloud',
	'04' : 'fas fa-cloud-meatball',
	'09' : 'fas fa-cloud-sun-rain',
	'10' : 'fas fa-cloud-showers-heavy',
	'11' : 'fas fa-poo-storm',
	'13' : 'far fa-snowflake',
	'50' : 'fas fa-smog'
};

const API_KEY = 'eddf9f32bdb74f026a2ee796f033b789';

function onGeoOk(position){
	$('#myWeatherButton').remove();
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;

	//https://openweathermap.org/current 날씨 api 사용
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`;
    fetch(url).then((response) => response.json())
    .then((data) =>{
		var icon = (data.weather[0].icon).substr(0,2);
        var originTemp = data.main.temp * 10;
        var changeTemp = Math.round(originTemp);
        var result = changeTemp / 10;
        $('#myWeatherDiv').append(`<div class="myWeatherDivs" style="font-size: 60px;"><i class="` + weatherIcon[icon] + `"></i></div>`);
        $('#myWeatherDiv').append(`<div class="myWeatherDivs" style="font-weight: bold; font-size: 20px;">현재 위치(` + data.name + `)</div>`);
        $('#myWeatherDiv').append(`<div class="myWeatherDivs" style="font-size: 40px;">${result}°C</div>`);
    });
};

function onGeoError(){
    alert("위치정보를 확인할 수 없어 현재 위치의 날씨 확인이 불가합니다!")
};

// 유저의 위치를 반환
// 두가지 매개변수를 줘야함. 잘되었을때, 오류났을때
function myRegionWeather(){
	navigator.geolocation.getCurrentPosition(onGeoOk,onGeoError);
}

for(var i = 0 ; i < 11 ; i++){
	showWeather(i);
}

function showWeather(i){
	let lats = {
		'0' : '37.5666791',
		'1' : '37.456',
		'2' : '37.2752',
		'3' : '37.885',
		'4' : '36.6357',
		'5' : '36.6593',
		'6' : '35.8198999',
		'7' : '34.8159',
		'8' : '35.2382',
		'9' : '36.5754',
		'10' : '33.3939924'
	};	
	
	let lons = {
		'0' : '126.9782914',
		'1' : '126.7052',
		'2' : '127.0095',
		'3' : '127.7297',
		'4' : '127.4915',
		'5' : '126.6729',
		'6' : '127.109',
		'7' : '126.4629',
		'8' : '128.6925',
		'9' : '128.5058',
		'10' : '126.5626653'
	};
	
	let region = {
		'0' : '서울',
		'1' : '인천',
		'2' : '경기도',
		'3' : '강원도',
		'4' : '충청북도',
		'5' : '충청남도',
		'6' : '전라북도',
		'7' : '전라남도',
		'8' : '경상남도',
		'9' : '경상북도',
		'10' : '제주도'
	};		
	
	const lat = lats[i];
    const lon = lons[i];
	const API_KEY = 'eddf9f32bdb74f026a2ee796f033b789';
	
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`;
    fetch(url).then((response) => response.json())
    .then((data) =>{
		var icon = (data.weather[0].icon).substr(0,2);
		var originTemp = data.main.temp * 10;
        var changeTemp = Math.round(originTemp);
        var result = changeTemp / 10;
        $('#test').append('<i class="' + weatherIcon[icon] +'" style="margin-left: 40px; margin-right: 10px;"></i> ');
        $('#test').append('<span style="margin-right: 10px; padding-bottom: 12px;"><strong>' + region[i] + '</strong> </span>');
        $('#test').append(`<span style="margin-right: 10px;">${result}°C </span>`);
    });
}


//fetch url을 불러옴
// fetch() 함수는 첫번째 인자로 URL, 두번째 인자로 옵션 객체를 받고, Promise 타입의 객체를 반환
// 반환된 객체는, API 호출이 성공했을 경우에는 응답(response) 객체를 resolve하고, 실패했을 경우에는 예외(error) 객체를 reject

/*    var korea = [ {'region' : '서울','nx' : 60,'ny' : 127},  37.5666791, 126.9782914
        {'region' : '인천','nx' : 55,'ny' : 124},  37.456, 126.7052
        {'region' : '경기도','nx' : 60,'ny' : 121}, 37.2752, 127.0095
        {'region' : '강원도','nx' : 92,'ny' : 131},  37.885, 127.7297
        {'region' : '충청북도','nx' : 69,'ny' : 106}, 36.6357, 127.4915
        {'region' : '충청남도','nx' : 68,'ny' : 100}, 36.6593, 126.6729
        {'region' : '전라북도','nx' : 63,'ny' : 89}, 35.8198999, 127.109
        {'region' : '전라남도','nx' : 50,'ny' : 67}, 34.8159, 126.4629
        {'region' : '경상남도','nx' : 90,'ny' : 77},  35.2382, 128.6925
        {'region' : '경상북도','nx' : 91,'ny' : 106}, 36.5754, 128.5058
        {'region' : '제주도','nx' : 52,'ny' : 38} ]; 33.3939924, 126.5626653   */


/* 아래는 검색기능 */
 
function searchWeather(){
var city = document.getElementById('weatherSearchText').value;
	const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${API_KEY}&units=metric`;
	fetch(url).then((response) => response.json())
    .then((data) =>{
		if(data.weather === undefined){
			document.getElementById('modalBody').innerText = '도시 이름을 찾을 수 없습니다. \n반드시 영어로 입력해주세요.';
			var modalTag = document.getElementById('alertModal');   
   			var myModal = new bootstrap.Modal(modalTag);
    		myModal.show();
    		return;
		}
	
		var icon = (data.weather[0].icon).substr(0,2);
        var originTemp = data.main.temp * 10;
        var changeTemp = Math.round(originTemp);
        var result = changeTemp / 10;
        $('#testSearch').empty();
        $('#testSearch').append(`<div class="hi" style="font-weight: bold;">검색하신 위치(` + data.name + `)</div>`);
        $('#testSearch').append('<div class="hi" style="font-size: 60px;"><i class="' + weatherIcon[icon] +'"></i></div>');
        $('#testSearch').append(`<div class="hi" style="font-size: 40px;">${result}°C</div>`);
    });
}
