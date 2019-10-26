$(function(){
    $(".chosen-dot").mouseover(function(){
        var chosen_dot_child = $(this).children("img");
        var ImgSrc = chosen_dot_child.attr("src");
        $("img#MainPhoto").attr({src:ImgSrc});
        $("img#MainPhoto").css("display","0");
        $("img#MainPhoto").css("opacity","1");
        return false;
    });

    function money2(fee){
        var html = `<span class="fee">
                        ¥${fee}
                    </span>`
        $(".sale-page-box__price__right__fee").append(html);
    }

    function money3(profit){
        var html = `<span class="profit">
                        ¥${profit}
                    </span>`
        $(".sale-page-box__price__right__profit").append(html);
    }

    $(".sale-page-box__price__right__value").keyup(function(){
        var input_number = $(this).val();
        $(".minus").remove();
        if(input_number >= 300 && input_number <= 9999999)
        {
            var fee = Math.floor(input_number * 0.1);
            var profit = Math.floor(input_number * 0.9);
            $(".fee").remove();
            money2(fee);
            $(".profit").remove();
            money3(profit);
        }
        else
        {
            var aaa = `<div class="minus">ー</div>`;
            $(".fee").remove();
            $(".profit").remove();
            $(".sale-page-box__price__right__fee").append(aaa);
            $(".sale-page-box__price__right__profit").append(aaa);
        }
    });
});

