$(function(){

  $(".top-category__kind__name-1").on("click", function(){
    $("html,body").animate({scrollTop:$('.top-products__title-1').offset().top});
  });

  $(".top-category__kind__name-2").on("click", function(){
    $("html,body").animate({scrollTop:$('.top-products__title-2').offset().top});
  });

  $(".top-category__kind__name-3").on("click", function(){
    $("html,body").animate({scrollTop:$('.top-products__title-3').offset().top});
  });

  $(".top-category__kind__name-4").on("click", function(){
    $("html,body").animate({scrollTop:$('.top-products__title-4').offset().top});
  });

  $(window).scroll(function (){
    $('.top-products__items__item').each(function(){
      let elemPos = $(this).offset().top,
          scroll = $(window).scrollTop(),
          windowHeight = $(window).height();
      if (scroll > elemPos - windowHeight + 100){
        $(this).addClass('scrollin');
      }
      else{
        $(this).removeClass('scrollin');
      }
    });
  });

  $('.top-products__items__item').each(function(){
    let elemPos = $(this).offset().top,
        windowHeight = $(window).height();
    if (windowHeight > elemPos + 30){
      $(this).addClass('scrollin');
    }
  });
});