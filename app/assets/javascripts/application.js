// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.turbolinks
//= require bootstrap
//= require_tree .


$(document).ready(function(){

	var activeWindow;

	function closeModal() {
    	$('.window').fadeOut(500, function(){ $(this).css('top', '-1000px').css('left', '-1000px'); });
    	$('#blind').fadeOut(500, function(){ $(this).remove(); });
	}

	flasher = document.getElementById('bright');
	$(flasher).show().hide(3000);

	$('#termie').on('click', function(e){
		e.preventDefault();
		acitveWindow = $('.window')
		.css('top','41%')
		.css('left', '57%')
		.css('opacity', 0)
		.css('display', 'block')
		.fadeTo(500, 0.8);
		$('#boxing').css('display', 'block');
		$('body').append('<div id="blind"></div>');
		$('#blind').css('position', 'fixed')
		$('#modal')
		        .find('#blind')
		        .css('opacity', '0')
		        .fadeTo(500, 0.8)
		        .on('click', function(){
		            closeModal();
		     });
	});

	$('introduction').css('')
	$('.close').on('click', function(e){
		e.preventDefault();
		closeModal();
	});
});
