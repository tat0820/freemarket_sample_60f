$(function(){
$(".chosen-dot").mouseover(function(){
    var chosen_dot_child = $(this).children("div")
    var chosen_dot_childchild = chosen_dot_child.children("img")
    var ImgSrc = chosen_dot_childchild.attr("src");
    $("img#MainPhoto").attr({src:ImgSrc});
    $("img#MainPhoto").hide();
    $("img#MainPhoto").fadeIn();
    return false;
});
});

