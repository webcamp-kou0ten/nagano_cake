// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require autonumeric

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
/*global $*/

// トップページのお知らせ欄
$(document).on('turbolinks:load', function() {
  var slider;
  var sliderFlag = false;
  var breakpoint = 768;

  function sliderSet() {
          var windowWidth = window.innerWidth;
          if (windowWidth >= breakpoint && !sliderFlag) {
              slider = $('.slider').bxSlider({
              touchEnabled:false,
  			mode: 'vertical',//縦スライド指定
  			controls: false,//前後のコントロールを表示させない。
  			auto: 'true',//自動的にスライド
  			pager: false,//ページ送り無効化
  			speed: 550
  		});
              sliderFlag = true;
          }
          else if (windowWidth < breakpoint && sliderFlag) {
              slider.destroySlider();
              sliderFlag = false;
          }
      }

  $(window).on('load resize', function() {
          sliderSet();
  });

  // トップページのクロスフェード
  $(function(){
  var $width =1280;
  var $height =640;
  var $interval = 3000;
  var $fade_speed = 1000;
  $("#main-visual ul li").css({"position":"relative","overflow":"hidden","width":$width,"height":$height});
  $("#main-visual ul li").hide().css({"position":"absolute","top":0,"left":0});
  $("#main-visual ul li:first").addClass("active").show();
  setInterval(function(){
  var $active = $("#main-visual ul li.active");
  var $next = $active.next("li").length?$active.next("li"):$("#main-visual ul li:first");
  $active.fadeOut($fade_speed).removeClass("active");
  $next.fadeIn($fade_speed).addClass("active");
  },$interval);
  });

  $(function(){
    $('header').slideDown('slow');
  });
});

// 郵便番号から住所出力
$(function() {
  $('#zip').jpostal({
    postcode : [
      '#zip'
    ],
    address: {
      "#address": "%3%4%5"
    }
  });
});