$(function(){
	console.log('recruit.js fired');
	console.log('<%= @team.castaways.count %>');
	<% if @recruited %>
		$('#'+'<%= @name %>' + '-tile').addClass('joined');
		$('#'+'<%= @name %>' + '-tile').fadeTo(1000, 0);
		$('#notification').html("<%= @name %>" + " has joined your group!");
	<% else %>
		$('#'+'<%= @name %>' + '-tile').addClass('rival');
		$('#notification').html("Something went wrong. " + "<%= @name %>" + " has joined a different group. Watch your back.");
	<% end  %>
});
