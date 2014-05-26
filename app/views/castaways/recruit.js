$(function(){
	console.log('recruit.js fired');
	console.log('<%= @team.castaways %>');
	<% if @recruited %>
		$('#'+'<%= @castaway.name %>' + '-tile').fadeTo(1000, 0);
	<% else %>
		$('#'+'<%= @castaway.name %>' + '-tile').addClass('rival');
	<% end  %>
});
