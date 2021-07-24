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

//= require_tree .
/*global $*/

// トップページのお知らせ欄
var slider;
var sliderFlag = false;
var breakpoint = 768;//768px以下の場合

function sliderSet() {
        var windowWidth = window.innerWidth;
        if (windowWidth >= breakpoint && !sliderFlag) {//768px以上は1行でスライダー表示
            slider = $('.slider').bxSlider({
            touchEnabled:false,//リンクを有効にするためスライドをマウスでドラッグした際にスライドの切り替えを可能にする機能を無効化
			mode: 'vertical',//縦スライド指定
			controls: false,//前後のコントロールを表示させない。
			auto: 'true',//自動的にスライド
			pager: false,//ページ送り無効化
			speed: 550
		});
            sliderFlag = true;
        }
        else if (windowWidth < breakpoint && sliderFlag) {
            slider.destroySlider();//bxSliderのOptionであるdestroySliderを使用してスライダーの動きを除去
            sliderFlag = false;
        }
    }

$(window).on('load resize', function() {
        sliderSet();
});

// トップページのクロスフェード
$(function(){
// 設定
var $width =1280; // 横幅
var $height =640; // 高さ
var $interval = 3000; // 切り替わりの間隔（ミリ秒）
var $fade_speed = 1000; // フェード処理の早さ（ミリ秒）
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
  $('header').slideDown();
});