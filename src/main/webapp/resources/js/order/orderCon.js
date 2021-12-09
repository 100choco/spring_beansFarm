$(function(){

    $("input:radio[id=passBookchk]").click(function(){
        document.getElementById("passBook").style.display = "block";
    });
    
    $("input:radio[id=cardChk]").click(function(){
        document.getElementById("passBook").style.display = "none";
        
    })

});