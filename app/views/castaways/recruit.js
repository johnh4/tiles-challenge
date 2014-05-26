$(function(){
	console.log('recruit.js fired');
	console.log('<%= @team.castaways.count %>');
	<% if @recruited %>
		$('#'+'<%= @name %>' + '-tile').fadeTo(1000, 0);
	<% else %>
		$('#'+'<%= @name %>' + '-tile').addClass('rival');
	<% end  %>
});
