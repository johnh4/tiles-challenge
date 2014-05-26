class Team
  include Mongoid::Document
	include Mongoid::Timestamps

	embeds_many :castaways

	def is_full?
		castaways.count >= 2
	end

	def unapproached?(name)
		#!@team.castaways.map{|c| c.name}.include?(name)
		castaways.where(name: name).empty?
	end
end
