$(function(){

	var admin = $("#manager_no").val();
	
	if(admin == "관리자"){
		$(".btnGroup").show();
	}else{
		$(".btnGroup").hide();	
	}
	
});