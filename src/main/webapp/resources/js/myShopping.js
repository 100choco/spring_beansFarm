$(function(){
	
	$(".mycoco").click(function(){ 
		$(".mycoco").css({"background-color" : "#FBDEDC", "font-weight": "bold", "font-size" : "1.5rem"}) 
		$(".myShoppingList").css({"background-color" : "white", "font-weight": "nomal", "font-size" : "medium"})
	
		alert("!!");
	
		
	});
	
	$(".myShoppingList").click(function(){ 
		$(".myShoppingList").css({"background-color" : "#FBDEDC", "font-weight": "bold",	"font-size" : "1.5em" })
		$(".mycoco").css({"background-color" : "white", "font-weight": "nomal", "font-size" : "medium"})
	
	
	
	
	});
	
	
	$("#search").click(function() {
	    $("#popup").fadeIn();
	    $(".realSearch").focus();
    });

	$("#popup").click(function() {
		$("#popup").fadeOut();
    });

	$(".iBar").click(function() {
		alert("!!");
	});
	
	$(".iBar").click(function() {
		alert("!!");
	});

	
	$("#reviewBtn").click(function(){
		
		alert("!!");
	});


	$("#reviewDeleteBtn").click(function(){
		alert("!!");
	   
		
	});


	


});