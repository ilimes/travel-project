function cancelBook(node){
	
	var bookNum = node.parentNode.parentNode.firstElementChild.innerHTML;
	// 	boomNum = node.closest('tr').firstElementChild.innerHTML
	
	var itemName = node.parentNode.parentNode.childNodes[2].nextElementSibling.innerText;
	//  test = node.closest('tr').nextElementSibling.innerHTML;
	
	var memId = node.closest('tr').lastElementChild.innerHTML;
	

	
	
	
	var conf = confirm(itemName + ' 예약을 취소하시겠습니까?');
	if(conf){
		
	
	$.ajax({
   url: '/admin/bookCancel',
    type: 'post',
    data:{'bookNum':bookNum, 'memId':memId},
    success: function(result) {
      //ajax 실행 성공 후 실행할 코드 작성
      alert(itemName + ' 예약이 취소되었습니다.');
      
      location.href = '/admin/bookManage';
      
    },
    error: function(){
      //ajax 실행 실패 시 실행되는 구간
       alert('실패');
    }
});
	}
}
function pageInfo(pageInfo){
	
	location.href = '/admin/bookManage?nowPage=' + pageInfo;
}