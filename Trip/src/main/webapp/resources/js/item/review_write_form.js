function reviewWrite(){
	
	var title = document.getElementById('title').value;
	
	if(title == ''){
		var modalTag = document.getElementById('titleCheckModal');   
        var myModal = new bootstrap.Modal(modalTag);
        myModal.show();
		return;
	}
	
	if(CKEDITOR.instances.content.getData() =='' 
	        || CKEDITOR.instances.content.getData().length ==0){
		var modalTag = document.getElementById('contentCheckModal');   
        var myModal = new bootstrap.Modal(modalTag);
        myModal.show();
	    $("#content").focus();
	    return false;
	}
	
	var itemCode = document.getElementById('itemCode').value;
	
	if(itemCode == 'none'){
		var modalTag = document.getElementById('itemCodeCheckModal');   
        var myModal = new bootstrap.Modal(modalTag);
        myModal.show();
		return;
	}
	
	var reviewWriteForm = document.getElementById('reviewWriteForm');
	var modalTag = document.getElementById('completeModal');   
    var myModal = new bootstrap.Modal(modalTag);
    myModal.show();
    return;
	
}

$(document).ready(function(){       
    $('#completeModal').on('hidden.bs.modal', function () {
   		reviewWriteForm.submit();
    });
 
});
