$(function(){

  function appendOption(category){
    let html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML){
    let childSelectHtml = '';
    childSelectHtml = `<select class="sale-page-box__pul__right__category__child" name="product[detail_attributes][medium_category]">
                          <option value="">--</option>
                          ${insertHTML}
                        </select>`;
    $('.sale-page-box__pul__right__category').append(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<select class="sale-page-box__pul__right__category__grandchild" name="product[detail_attributes][small_category]">
                                <option value="">--</option>
                                ${insertHTML}
                            </select>`;
    $('.sale-page-box__pul__right__category').append(grandchildSelectHtml);
  }

  $('.sale-page-box__pul__right__category__parent').on('change', function(){

    let parentCategory = $(this).val();

    if (parentCategory != ""){
      $.ajax({
        url: '/products/get_category_children',
        type: 'get',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })

      .done(function(children){
        $('.sale-page-box__pul__right__category__child').remove();
        $('.sale-page-box__pul__right__category__grandchild').remove();
        let insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })

      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
    else{
      $('.sale-page-box__pul__right__category__child').remove();
      $('.sale-page-box__pul__right__category__grandchild').remove();
    }
  });

  $(document).on('change', ".sale-page-box__pul__right__category__child", function(){

    let childCategory = $(this).val();

    if (childCategory != ""){
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'get',
        data: { child_name: childCategory },
        dataType: 'json'
      })

      .done(function(grandchildren){
        if (grandchildren.length != 0){
          $('.sale-page-box__pul__right__category__grandchild').remove();
          let insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })

      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
    else{
      $('.sale-page-box__pul__right__category__grandchild').remove();
    }
  });

});