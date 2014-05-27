class Team
  include Mongoid::Document
	include Mongoid::Timestamps

	embeds_many :castaways

	def is_full?
		castaways.count >= 63
	end

	def unapproached?(name)
		castaways.where(name: name).empty?
	end

	#see how many of the 10 most popular castaways didn't join your team
	#you win if the number is less than 4
	def won?
		allies = castaways.where(rival: false)
		popular = $history.reload.most_popular
		popular_names = popular.map { |p| p[0] }
		ally_names = allies.map { |a| a.name }
		missing_names = popular_names - ally_names
		missing_names.length < 4
	end
end
