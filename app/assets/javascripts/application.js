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
//= require_tree .
$(function(){
	function playIntro(){
		console.log('playing intro.');
		var duration = 700;
		var multiplier = .5;
		$('#intro-1').fadeIn(duration, function(){
			$('#intro-1').fadeOut(duration, function(){
				$('#intro-2').fadeIn(duration * multiplier, function(){
					$('#intro-2').fadeOut(duration * multiplier, function(){
						$('#intro-3').fadeIn(duration * multiplier, function(){
							$('#intro-3').fadeOut(duration * multiplier, function(){
								$('#intro-4').fadeIn(duration, function(){
									$('#intro-4').fadeOut(duration, function(){
										$('#intro-5').fadeIn(duration, function(){
											$('#intro-5').fadeOut(duration, function(){
												$('#intro-6').fadeIn(duration, function(){
													$('#intro-6').fadeOut(duration, function(){
														$('#intro-7').fadeIn(duration, function(){
															$('#intro-7').fadeOut(duration, function(){
																$('#intro-8').fadeIn(duration, function(){
																	$('#intro-8').fadeOut(duration, function(){
																		$('#intro-9').fadeIn(duration, function(){
																			$('#intro-9').fadeOut(duration, function(){
																				$('#intro-10').fadeIn(duration, function(){
																					$('#intro-10').fadeOut(duration, function(){
																					});	
																				});	
																			});	
																		});	
																	});	
																});	
															});	
														});	
													});	
												});	
											});	
										});	
									});	
								});	
							});	
						});	
					});	
				});
			});	
		});
	}
	playIntro();
});
