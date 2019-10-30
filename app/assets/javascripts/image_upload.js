$(function(){
  let images = [];

  $(document).on("change", ".upload-image", function(){

    if(($(this).prop("files").length + images.length) <= 10){
      
      $.each($(this).prop("files"), function(index, file){
        let reader = new FileReader();

        let img = $(`<div class= "img_view"><img></div>`);
        reader.onload = function(e){
          img.find('img').attr({src: e.target.result})
        }
        reader.readAsDataURL(file);
        images.push(img);
        $(".upload-image").css("display","none");
        let new_image = `<input multiple= "multiple" name="images[img][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`

        if(images.length <= 3){
          $(".sale-page-box__upload-box__item1__preview1").append(img);
          $(".sale-page-box__upload-box__item1__dropzone1").append(new_image);
        }
        else if(images.length == 4){
          $(".sale-page-box__upload-box__item1__preview1").append(img);
          $(".sale-page-box__upload-box__item1__dropzone1").append(new_image);
          $(".sale-page-box__upload-box__item1__dropzone1").find('p').replaceWith('<p>クリック</p>')
        }
        else if(images.length == 5){
          $(".sale-page-box__upload-box__item1__dropzone1").css("display","none");
          $(".sale-page-box__upload-box__item2").css("display","block");
          $(".sale-page-box__upload-box__item2").css("display","flex");
          $(".sale-page-box__upload-box__item1__preview1").append(img);
          $(".sale-page-box__upload-box__item2__dropzone2").append(new_image);
        }
        else if(images.length == 9){
          $(".sale-page-box__upload-box__item2__preview2").append(img);
          $(".sale-page-box__upload-box__item2__dropzone2").append(new_image);
          $(".sale-page-box__upload-box__item2__dropzone2").find('p').replaceWith('<p>クリック</p>')
        }
        else if(images.length == 10){
          $(".sale-page-box__upload-box__item2__preview2").append(img);
          $(".sale-page-box__upload-box__item2__dropzone2").css("display","none");
        }
        else if(images.length >= 6){
          $(".sale-page-box__upload-box__item2__preview2").append(img);
          $(".sale-page-box__upload-box__item2__dropzone2").append(new_image);
        }
      })
    }
    else{
      alert("画像は10枚以下で選んでください。")
    }
  })
});