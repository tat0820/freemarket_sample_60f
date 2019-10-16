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

// {/* <div class="wrap">
// <p><img src="img/01.jpg" width="400" height="400" alt="下筌ダム" id="MainPhoto"></p>
// <ul>
// <li><img src="img/01.jpg" width="72" alt="下筌ダム" class="ChangePhoto"></li>
// <li><img src="img/02.jpg" width="72" alt="石打ダム" class="ChangePhoto"></li>
// <li><img src="img/03.jpg" width="72" alt="船津ダム" class="ChangePhoto"></li>
// <li><img src="img/04.jpg" width="72" alt="緑川ダム" class="ChangePhoto"></li>
// <li><img src="img/05.jpg" width="72" alt="荒瀬ダム" class="ChangePhoto"></li>
// </ul>
// </div> */}

// $(function() {
//   $('.slide-box').on("mouseover",function(){
//     var image = $(this).attr("src");
//     $('#main-box').attr('src',image);
//     $(this).css('opacity', '1.0')
//   })
//   $('.slide-box').on('mouseout', function(){
//         $(this).css('opacity', '0.5')
//   });
// });