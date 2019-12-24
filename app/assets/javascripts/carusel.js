$(document).on('turbolinks:load', function(){
  $('.slick').slick({
    autoplay: true,
    autoplaySpeed: 5000,
    dots:true,
  });

  $(function(){
    $("#slider").slick({
      prevArrow: '<img src="前への矢印画像のパス" class="slide-arrow prev-arrow">',
      nextArrow: '<img src="次への矢印画像のパス" class="slide-arrow next-arrow">'
    });
  });

  $(function() {
    $('.thumb-item').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.thumb-item-nav' //サムネイルのクラス名
    });
    $('.thumb-item-nav').slick({
        infinite: true,
        autoplay: true,
        autoplaySpeed: 5000,    
        slidesToShow: 5,
        slidesToScroll: 1,
        asNavFor: '.thumb-item', //スライダー本体のクラス名
        focusOnSelect: true,
    });
  });
});
