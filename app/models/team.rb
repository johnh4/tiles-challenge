class Team
  include Mongoid::Document
	include Mongoid::Timestamps

	embeds_many :castaways
end
