$(document).on('turbolinks:load', function () { 
  $("sell-drop__box__file").on('change', 'input[type="file"]', function(e) {
    console.log("test")
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".sell-drop__box");
        t = this;

    if(file.type.indexOf("image") < 0){

      return false;
    }

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);
    image_file.on('change', image_file.children('input[name="item[image][image][' + image_count + ']"]'), function (e) {
      var file = e.target.files[0];
      var file_reader = new FileReader();

      file_reader.onload = (function () {
        return function (e) {
          image_tag = build_image_tag(image_count, e.target.result);
          $('.image-preview').append(image_tag);
          image_count += 1;
          file_tag = build_file_tag(image_count);
          image_file.append(file_tag);
        };
      })(file);
    
        file_reader.readAsDataURL(file);
    });
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
  })
})