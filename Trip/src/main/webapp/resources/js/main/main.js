function mainSearch(){
	var searchMainText = document.getElementById('searchMainText').value;
	var searchMainDate = document.getElementById('searchMainDate').value;
	
	location.href='/item/itemList?itemName=' + searchMainText + '&startDate=' + searchMainDate;
}