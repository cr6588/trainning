/**
 * 
 */
$(function (){
    var prev = null;
    $(".dl a").click(function (){
        $(this).parents("dd").css("background-color","#D2E4FF");
        if(prev != null){
            $(prev).parents("dd").css("background-color", "#F0F0F0");
        }
        prev = $(this);
    });
});