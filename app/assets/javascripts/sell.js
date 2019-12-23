$(function(){
  $('form').on('change', 'input[type="file"]', function(e) {
    console.log(this)
    var file = e.target.files[0],
    reader = new FileReader(),
    $preview = $(".item-num-0");
    t = this;
    console.log(file)

    if(file.type.indexOf("image") < 0){
      return false;
    }

    var input_area = $('.sell-drop__box');
  
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  hight: "150px",
                  class: "preview",
                  title: file.name
              }));
      var i = 1;
      var number = 1;
      
      number ++;
        var new_input = $(`<input class="sell-drop__box__file" id="post_image_last" type="file" name="item[images_attributes][${number}][image]">`);
        console.log(number, new_input[0]);
        input_area.prepend(new_input);
        var num = $('.item-image').length + 1 + i
        fileReader.readAsDataURL(file);
        $('#image-box__container').attr('class', `item-num-${num}`)
        $(document).on('change', '#post__img,#post__img__last',function(event) {
          // 一番上のインプットだけ押せるように表示。
          $(sell-drop__box).children(":first").css({'display':'block'});
          // 選択したインプットは消す。
          $(this).css({'display':'none'});
        });

        
        // var new_preview = $preview.append($('<img>').attr({
        //   src: e.target.result,
        //   width: "150px",
        //   hight: "150px",
        //   class: "preview",
        //   title: file.name
        // }));
        // $preview.prepend(new_preview);
      };
    })(file);

    reader.readAsDataURL(file);
    
  });
  var item_price_field = $('.sell-right');
  var item_price;
  var item_fee;
  var item_benefit;

  function separate(num) {
    return String(num).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  }

  item_price_field.on('change', function () {
    if ($(this).children('input').length) {
      item_price = $(this).children('input').val();
    } else {
      item_price = $(this).children('.field_with_errors').children('input').val();
    }
    item_fee = Math.floor(item_price / 10);
    item_benefit = separate(item_price - item_fee);
    item_price_field.children('h9').text("¥" + item_fee);
    item_price_field.children('h10').text("¥" + item_benefit);
  });
});


