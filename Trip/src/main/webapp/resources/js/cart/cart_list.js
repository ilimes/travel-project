var travelers = document.getElementById('travelers');

travelers.addEventListener('change', setTotalPrice);
travelers.addEventListener('keyup', setTotalPrice);

function setTotalPrice(){
	if(travelers.value < 0 || travelers.value == ""){
		travelers.value = 1;
	}
}

//장바구니 상품 삭제
function deleteCart(tag){
	var result = confirm('정말 삭제할까요?');
	
	if(result){
		alert('삭제가 완료되었습니다.');
		tag.parentNode.submit();
	}
}


function updateItemCnt(selectedTag, itemCode, itemPrice){
	const travelers = selectedTag.previousElementSibling.value;
	
	$.ajax({
		url: '/cart/updateItemCnt', //요청경로
		type: 'post',
		data: {'itemCode':itemCode, 'travelers':travelers}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			//alert('인원수를 변경했습니다 :)');
			var modalTag = document.getElementById('updateModal');   
        	var myModal = new bootstrap.Modal(modalTag);
        	myModal.show();
			
			//총 가격 변경
			const totalPrice = (itemPrice * travelers).toLocaleString() + '원';
			//closest() : 선택한 태그 기준으로 가장 가까운 부모태그를 찾아감.
			selectedTag.closest('td').nextElementSibling.innerText = totalPrice;
			
			//구매가격 변경
			var buyPrice = 0;
			const totalPriceTds = document.getElementsByClassName('totalPriceTd');
			for(let i = 0 ; i < totalPriceTds.length ; i++){
				var originPrice = totalPriceTds[i].innerText;
				//substr(시작인덱스, 길이): 문자열 자르기 함수
				//originPrice.substr();
				var price = parseInt(originPrice.substr(0, originPrice.length - 1).replace(/,/g, ''));
				buyPrice += price;
			}
			
			document.getElementById('buyPriceTd').innerText = buyPrice.toLocaleString() + '원';
			
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}



//체크박스 전체선택(1)
function selectAll(selectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => { 
    checkbox.checked = selectAll.checked
  })
}

//체크박스 전체선택, 전체해제
function checkAll(){
	var isChecked = document.getElementById('check').checked;
	var checkboxes = document.getElementsByClassName('chk');
	
	//제목줄에 체크박스가 체크 되었을 때...
	if(isChecked){
		for(var i = 0 ; i < checkboxes.length ; i++){
			checkboxes[i].checked = true;
		}
	}
	else{
		for(var i = 0 ; i < checkboxes.length ; i++){
			checkboxes[i].checked = false;
		}
	}
	
}

//선택삭제
function deleteCarts(){
	//선택된 체크박스
	var chk = document.querySelectorAll('.chk:checked');
	//var modalBody = document.querySelector('#buyItemModal .modal-body');
	
	if(chk.length == 0){
		//alert('삭제할 상품을 선택해주세요.');
		//모달창을 띄우기
        var modalTag = document.getElementById('deleteCheckModal');   
        var myModal = new bootstrap.Modal(modalTag);
        myModal.show();
		return;
	}
	else{
		var modalTag = document.getElementById('deleteModal');   
   		var myModal = new bootstrap.Modal(modalTag);
    	myModal.show();
	}
}

function deleteCheckCarts(){
   	$('#deleteModal').modal('hide');
   	
	//선택된 체크박스
	var chk = document.querySelectorAll('.chk:checked');
	
	//선택한 상품코드를 저장할 배열을 생성
	var itemCodeArr = [];
	for(var i = 0 ; i < chk.length ; i++){
		itemCodeArr[i] = chk[i].value;
	}
	
	$.ajax({
		url: '/cart/deleteCarts', //요청경로
		type: 'post',
		data: {'data':JSON.stringify(itemCodeArr)}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			var modalTag = document.getElementById('deleteEndModal');   
   			var myModal = new bootstrap.Modal(modalTag);
    		myModal.show();
			//alert(result + '건의 상품이 삭제되었습니다.');
			//location.href='/cart/cartList';
						
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}

//삭제가 완료되었습니다 모달창이 닫히면 cartList로 이동
$(document).ready(function(){       
    $('#deleteEndModal').on('hidden.bs.modal', function () {
   		location.href='/cart/cartList';
    });
 
});
 

