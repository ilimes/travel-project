function search(){
	var searchText = document.getElementById('searchText').value;
	
	location.href='/item/itemList?itemName=' + searchText;
}

var clickIndex = 0;

$(document).on('click', '.menu01', function() {
	if (!$(this).hasClass('menu01')) {
		return;
    }
	if(clickIndex == 0){
	    $('.subMenu01').slideDown(300);
	    clickIndex = 1;
	}
	else{
        $('.subMenu01').slideUp(300);
        clickIndex = 0;
	}
});

/*$(document).on('mouseover', '.menu01', function() {
    $('.dept01').slideDown(200);
});
$(document).on('mouseout', '.dept01', function () {
    if (!$(this).hasClass('topMenu')) {
        $('.dept01').slideUp(200);
    }
});*/
