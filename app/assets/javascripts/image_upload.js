$(function(){

  // $('input[type= "file"].sale-page-box__upload-box__item__img').on('change', function(){
  //   let file = $(this).prop('files')[0];
  //   let reader = new FileReader();
  //   console.log(reader.readyState)
  //   inputs.push($(this));
  //   let img = $(`<div class= "img_view"><img></div>`);

  //   reader.onload = function(e){
  //     console.log(e)
  //   }



    // reader.readAsDataURL(file);
    // images.push(img);

    // if(images.length >= 5) {
    //   dropzone2.css({
    //     'display': 'block'
    //   })
    //   dropzone.css({
    //     'display': 'none'
    //   })
    //   $.each(images, function(index, image) {
    //     image.attr('data-image', index);
    //     preview2.append(image);
    //     dropzone2.css({
    //       'width': `calc(100% - (135px * ${images.length - 5}))`
    //     })
    //   })
    //   if(images.length == 9) {
    //     dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
    //   }
    // } else {
    //     $('#preview').empty();
    //     $.each(images, function(index, image) {
    //       image.attr('data-image', index);
    //       preview.append(image);
    //     })
    //     dropzone.css({
    //       'width': `calc(100% - (135px * ${images.length}))`
    //     })
    //   }
    //   if(images.length == 4) {
    //     dropzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
    //   }
    // if(images.length == 10) {
    //   dropzone2.css({
    //     'display': 'none'
    //   })
    //   return;
    // }
    // var new_image = $(`<input multiple= "multiple" name="product_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    // input_area.prepend(new_image);
  // });


  // $(document).on('click', '.delete', function() {
  //   var target_image = $(this).parent().parent();
  //   $.each(inputs, function(index, input){
  //     if ($(this).data('image') == target_image.data('image')){
  //       $(this).remove();
  //       target_image.remove();
  //       var num = $(this).data('image');
  //       images.splice(num, 1);
  //       inputs.splice(num, 1);
  //       if(inputs.length == 0) {
  //         $('input[type= "file"].upload-image').attr({
  //           'data-image': 0
  //         })
  //       }
  //     }
  //   })
  //   $('input[type= "file"].upload-image:first').attr({
  //     'data-image': inputs.length
  //   })
  //   $.each(inputs, function(index, input) {
  //     var input = $(this)
  //     input.attr({
  //       'data-image': index
  //     })
  //     $('input[type= "file"].upload-image:first').after(input)
  //   })
  //   if (images.length >= 5) {
  //     dropzone2.css({
  //       'display': 'block'
  //     })
  //     $.each(images, function(index, image) {
  //       image.attr('data-image', index);
  //       preview2.append(image);
  //     })
  //     dropzone2.css({
  //       'width': `calc(100% - (135px * ${images.length - 5}))`
  //     })
  //     if(images.length == 9) {
  //       dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
  //     }
  //     if(images.length == 8) {
  //       dropzone2.find('i').replaceWith('<p>ココをクリックしてください</p>')
  //     }
  //   } else {
  //     dropzone.css({
  //       'display': 'block'
  //     })
  //     $.each(images, function(index, image) {
  //       image.attr('data-image', index);
  //       preview.append(image);
  //     })
  //     dropzone.css({
  //       'width': `calc(100% - (135px * ${images.length}))`
  //     })
  //   }
  //   if(images.length == 4) {
  //     dropzone2.css({
  //       'display': 'none'
  //     })
  //   }
  //   if(images.length == 3) {
  //     dropzone.find('i').replaceWith('<p>ココをクリックしてください</p>')
  //   }
  // })
});