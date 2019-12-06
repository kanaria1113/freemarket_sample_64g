$(document).on('turbolinks:load', function(){
  $('.slick').slick({
    autoplay: true,
    autoplaySpeed: 5000,
    dots:true,
  });
});

$(function(){
  $("#slider").slick({
    prevArrow: '<img src="前への矢印画像のパス" class="slide-arrow prev-arrow">',
    nextArrow: '<img src="次への矢印画像のパス" class="slide-arrow next-arrow">'
  });
});