// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}

$(document).ready(function() {
    $("#btn1").click(function(event) {
        $(".viewPic").addClass("hidden");
        $("#pic1").removeClass("hidden");
        $(".btn-info").removeClass("active");
        $("#btn1").addClass("active");
    });
    $("#btn2").click(function(event) {
        $(".viewPic").addClass("hidden");
        $("#pic2").removeClass("hidden");
        $(".btn-info").removeClass("active");
        $("#btn2").addClass("active");
    });
    $("#btn3").click(function(event) {
        $(".viewPic").addClass("hidden");
        $("#pic3").removeClass("hidden");
        $(".btn-info").removeClass("active");
        $("#btn3").addClass("active");
    });
    $("#btn4").click(function(event) {
        $(".viewPic").addClass("hidden");
        $("#pic4").removeClass("hidden");
        $(".btn-info").removeClass("active");
        $("#btn4").addClass("active");
    });
    $("#btn5").click(function(event) {
        $(".viewPic").addClass("hidden");
        $("#pic5").removeClass("hidden");
        $(".btn-info").removeClass("active");
        $("#btn5").addClass("active");
    });
});