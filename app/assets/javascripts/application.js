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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.turbolinks
//= require bootstrap
//= require_tree .


$(document).ready(function(){
	
	var activeWindow;
	var flasher = document.getElementById('bright');
	function closeModal() {
    	$('.window').fadeOut(500, function(){ $(this).css('top', '-1000px').css('left', '-1000px'); });
    	$('#blind').fadeOut(500, function(){ $(this).remove(); });
	};

	function closeList(){
		$('.window_pane')

		.animate({marginLeft: "-40%",
			marginTop: "-35%"}, {duration: 1000, 
				specialEasing:{
					marginLeft: "linear",
					marginTop: "linear"
				}});
		$('#blind').fadeOut(1000, function(){$(this).remove(); });
	};

	if (flasher.childNodes[1].innerHTML !== "") {$('#bright').show().hide(3000);};
	

	$('#termie').on('click', function(e){
		e.preventDefault();
		activeWindow = $('.window')
			.css('background-color', '#B7B9B5')
			.css('top','41%')
			.css('left', '57%')
			.css('opacity', 0)
			.css('display', 'block')
			.fadeTo(500, 0.8);

		$('#boxing').css('display', 'block');
		$('body').append('<div id="blind"></div>');
		$('#blind').attr('position', 'fixed');
		$('#modal')
		        .find('#blind')
		        .css('opacity', '0')
		        .fadeTo(500, 0.8)
		        .on('click', function(){
		            closeModal();
		     });
	});

	$('.close').on('click', function(e){
		e.preventDefault();
		closeModal();
	});

	$('#g_cal').on('click', function(e){
		e.preventDefault();
		calendar_window = $('.window_pane')
		.attr('position', 'absolute')
		.css('z-index', 10000)
		.animate(
			{marginLeft: "+1%",marginTop: "+0.5%"},
			{duration: 1500,
				specialEasing:{
					marginLeft: "easeOutBounce",
					marginTop: "easeOutBounce"
				}}
		)
		.removeAttr('top')
		.removeAttr('left');
		

		$('body').append('<div id="blind"></div>');
	});

	$('.close_side').on('click', function(e){
		e.preventDefault();
		closeList();
	});

	var progress = document.getElementsByClassName('progress');

	for (var i = progress.length - 1; i >= 0; i--) {
		progress[i].style = "margin: 25px;"
	};


});

function closeList(){
		$('.window_pane')

		.animate({marginLeft: "-40%",
			marginTop: "-35%"}, {duration: 1000, 
				specialEasing:{
					marginLeft: "linear",
					marginTop: "linear"
				}});
		$('#blind').fadeOut(1000, function(){$(this).remove(); });
	};

	var list = {

		order: function(){
			var student = document.getElementsByClassName('form-control')[0].id;
			$.ajax({
				url: "http://localhost:3005/scholarships_students/".concat(student),
				type: "GET",
				dataType: "script",
				cache: true,
				success: function(){

					$('.new_close_side').on('click', function(e){
						e.preventDefault();
						closeList();
					});},
			})
		}
	}


// $('#form').on('change', function(){
// 	console.log('show meeeee pleaseeeeee');
// 	alert('this function actually has worked!');
// 	$.ajax({
// 		url: "<%= j(scholarships_students/index(params[@student.id])) %>",
// 		type: "GET",
// 		success: function(){alert('success!')}
// 	});
// });
