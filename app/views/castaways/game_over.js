$(function(){
	console.log('in game_over.js');
	$('.container').replaceWith("<%= j(render partial: 'game_over', popular: @popular) %>");
});
