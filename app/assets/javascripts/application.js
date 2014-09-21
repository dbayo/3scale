// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .


function setLoading(className) {
	$(className).css("opacity",.5);
	$(className).html('<div id="loadingSpinner" style="text-align: center; padding-top: 20px;"><i class="fa fa-spinner fa-spin fa-4x enable"></i></div>');
}

function removeLoading(className) {
	$(className).css("opacity",1);
	$(className+" .loadingSpinner").html('<div id="loadingSpinner" style="text-align: center; padding-top: 20px;"><i class="fa fa-spinner fa-spin fa-4x enable"></i></div>');
}